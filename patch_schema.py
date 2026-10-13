"""
EN: Patches postgres/structure.sql and clickhouse/structure.sql with the
    schema fixes that the public database-csv is missing.
ES: Parchea postgres/structure.sql y clickhouse/structure.sql con los
    arreglos de schema que le faltan al database-csv publico.
"""

import re
from pathlib import Path

POSTGRES_PATCH = r"""
--
-- ==== gge-tracker fork: schema drift fixes ====
-- Adds the columns and tables the backend/scraper code expects but the
-- public database-csv does not ship. Idempotent so re-running the
-- migration is safe.
--

ALTER TABLE public.alliances ADD COLUMN IF NOT EXISTS is_searching_alliance boolean DEFAULT false;
ALTER TABLE public.alliances ADD COLUMN IF NOT EXISTS auto_join_enabled boolean DEFAULT false;
ALTER TABLE public.alliances ADD COLUMN IF NOT EXISTS is_island_king boolean DEFAULT false;
ALTER TABLE public.alliances ADD COLUMN IF NOT EXISTS language varchar(10);
ALTER TABLE public.alliances ADD COLUMN IF NOT EXISTS description text;

ALTER TABLE public.players ADD COLUMN IF NOT EXISTS alliance_rank smallint;

-- player_alliance_update: the scraper logs the alliance names alongside
-- their ids, so the history rows carry both. The public schema only
-- ships the ids.
ALTER TABLE public.player_alliance_update ADD COLUMN IF NOT EXISTS old_alliance_name varchar(255);
ALTER TABLE public.player_alliance_update ADD COLUMN IF NOT EXISTS new_alliance_name varchar(255);

ALTER TABLE public.dungeons ADD COLUMN IF NOT EXISTS global_available_at timestamptz DEFAULT NOW();
ALTER TABLE public.dungeons ADD COLUMN IF NOT EXISTS player_available_at timestamptz;
ALTER TABLE public.dungeons ALTER COLUMN total_attack_count SET DEFAULT 0;
ALTER TABLE public.dungeons ADD COLUMN IF NOT EXISTS attacked_at timestamptz;

CREATE TABLE IF NOT EXISTS public.alliance_description_history (
  id serial PRIMARY KEY,
  alliance_id integer NOT NULL REFERENCES public.alliances(id),
  old_description text,
  new_description text,
  created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_alliance_description_history_alliance_id
  ON public.alliance_description_history(alliance_id);

CREATE TABLE IF NOT EXISTS public.dungeons_history (
  id serial PRIMARY KEY,
  kid smallint NOT NULL,
  position_x smallint NOT NULL,
  position_y smallint NOT NULL,
  player_id integer NOT NULL REFERENCES public.players(id),
  attacked_at timestamptz DEFAULT NOW(),
  created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_dungeons_history_attacked_at ON public.dungeons_history(attacked_at);
CREATE INDEX IF NOT EXISTS idx_dungeons_history_created_at ON public.dungeons_history(created_at);
CREATE INDEX IF NOT EXISTS idx_dungeons_history_player_id ON public.dungeons_history(player_id);

CREATE TABLE IF NOT EXISTS public.dungeon_player_cooldowns (
  kid smallint NOT NULL,
  position_x smallint NOT NULL,
  position_y smallint NOT NULL,
  player_id integer NOT NULL,
  available_at timestamptz NOT NULL,
  PRIMARY KEY (kid, position_x, position_y, player_id)
);
CREATE INDEX IF NOT EXISTS idx_dungeon_player_cooldowns_available_at
  ON public.dungeon_player_cooldowns(available_at);

CREATE TABLE IF NOT EXISTS public.storm_meta (
  id boolean PRIMARY KEY DEFAULT TRUE,
  season_started_at timestamptz,
  season_checked_at timestamptz,
  scan_radius smallint,
  last_scan_at timestamptz,
  own_isle_object_id integer,
  own_isle_x smallint,
  own_isle_y smallint,
  CONSTRAINT storm_meta_single_row CHECK (id = TRUE)
);
INSERT INTO public.storm_meta (id) VALUES (TRUE) ON CONFLICT (id) DO NOTHING;

CREATE TABLE IF NOT EXISTS public.storm_forts (
  position_x smallint NOT NULL,
  position_y smallint NOT NULL,
  isle_id smallint NOT NULL,
  victory_count smallint NOT NULL DEFAULT 0,
  is_visible boolean NOT NULL DEFAULT TRUE,
  available_at timestamptz NOT NULL DEFAULT NOW(),
  updated_at timestamptz NOT NULL DEFAULT NOW(),
  PRIMARY KEY (position_x, position_y)
);
CREATE INDEX IF NOT EXISTS idx_storm_forts_available_at ON public.storm_forts(available_at);
CREATE INDEX IF NOT EXISTS idx_storm_forts_isle_id ON public.storm_forts(isle_id);

CREATE TABLE IF NOT EXISTS public.storm_isles (
  position_x smallint NOT NULL,
  position_y smallint NOT NULL,
  object_id integer NOT NULL,
  isle_id smallint NOT NULL,
  occupier_id integer,
  state smallint NOT NULL DEFAULT 0,
  available_at timestamptz NOT NULL DEFAULT NOW(),
  updated_at timestamptz NOT NULL DEFAULT NOW(),
  PRIMARY KEY (position_x, position_y)
);
CREATE INDEX IF NOT EXISTS idx_storm_isles_state ON public.storm_isles(state);
CREATE INDEX IF NOT EXISTS idx_storm_isles_occupier ON public.storm_isles(occupier_id);

--
-- ==== Event history: Outer Realms + Beyond the Horizon ====
-- Used by executeCustomEventHistory in the internal-scraping package.
-- Two tables per event: a header (event_num, FR, IGH, top1) and a detail
-- (one row per ranked player).
--

CREATE TABLE IF NOT EXISTS public.outer_realms_event (
  event_num INTEGER PRIMARY KEY,
  collect_date TIMESTAMPTZ DEFAULT NOW(),
  fr TEXT,
  igh TEXT,
  top1_player_id BIGINT,
  top1_player_score BIGINT
);

CREATE TABLE IF NOT EXISTS public.outer_realms_ranking (
  id BIGSERIAL PRIMARY KEY,
  event_num INTEGER NOT NULL,
  player_id BIGINT,
  server VARCHAR(20),
  level INTEGER,
  legendary_level INTEGER,
  point BIGINT,
  rank INTEGER,
  player_name VARCHAR(255),
  alliance_name VARCHAR(255)
);
CREATE INDEX IF NOT EXISTS idx_outer_realms_ranking_event_num ON public.outer_realms_ranking(event_num);
CREATE INDEX IF NOT EXISTS idx_outer_realms_ranking_player_id ON public.outer_realms_ranking(player_id);

CREATE TABLE IF NOT EXISTS public.beyond_the_horizon_event (
  event_num INTEGER PRIMARY KEY,
  collect_date TIMESTAMPTZ DEFAULT NOW(),
  fr TEXT,
  igh TEXT,
  top1_player_id BIGINT,
  top1_player_score BIGINT
);

CREATE TABLE IF NOT EXISTS public.beyond_the_horizon_ranking (
  id BIGSERIAL PRIMARY KEY,
  event_num INTEGER NOT NULL,
  player_id BIGINT,
  server VARCHAR(20),
  level INTEGER,
  legendary_level INTEGER,
  point BIGINT,
  rank INTEGER,
  player_name VARCHAR(255),
  alliance_name VARCHAR(255)
);
CREATE INDEX IF NOT EXISTS idx_beyond_the_horizon_ranking_event_num ON public.beyond_the_horizon_ranking(event_num);
CREATE INDEX IF NOT EXISTS idx_beyond_the_horizon_ranking_player_id ON public.beyond_the_horizon_ranking(player_id);

--
-- ==== Grand Tournament ====
-- Used by the /grand-tournament endpoints in the backend, filled by
-- fillGrandTournamentResults in the internal-scraping package.
-- The raw table carries one row per (event, division, subdivision,
-- alliance); the matview collapses them into hour buckets the API reads.
--

CREATE TABLE IF NOT EXISTS public.grand_tournament (
  id BIGSERIAL PRIMARY KEY,
  game VARCHAR(10) NOT NULL,
  server_id INTEGER NOT NULL,
  alliance_name VARCHAR(255) NOT NULL,
  subdivision_id INTEGER NOT NULL,
  division_id INTEGER NOT NULL,
  alliance_id INTEGER NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  rank INTEGER NOT NULL,
  score BIGINT NOT NULL,
  event_id INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_grand_tournament_event
  ON public.grand_tournament(event_id, division_id, subdivision_id);
CREATE INDEX IF NOT EXISTS idx_grand_tournament_alliance
  ON public.grand_tournament(alliance_id);
CREATE INDEX IF NOT EXISTS idx_grand_tournament_window
  ON public.grand_tournament(game, created_at);

CREATE MATERIALIZED VIEW IF NOT EXISTS public.grand_tournament_hours_mv AS
SELECT
  event_id,
  DATE_TRUNC('hour', created_at) AS hour,
  game
FROM public.grand_tournament
GROUP BY event_id, DATE_TRUNC('hour', created_at), game
ORDER BY event_id, hour;

CREATE UNIQUE INDEX IF NOT EXISTS idx_grand_tournament_hours_mv_pk
  ON public.grand_tournament_hours_mv(event_id, hour, game);

--
-- ==== Global ranking (materialized view) ====
-- Read by /statistics/ranking/player/:id. The upstream builds it with
-- map_global_ranking.sh from cross-server data; a single-server fork
-- builds it from this DB's own players. The region literal below must
-- match the <global-name> of the server in servers.xml.
--

CREATE MATERIALIZED VIEW IF NOT EXISTS public.global_ranking AS
SELECT
  p.id,
  'his1'::text AS region,
  RANK() OVER (ORDER BY p.current_fame DESC) AS global_rank
FROM public.players p
WHERE p.castles IS NOT NULL
  AND p.castles <> '[]';

CREATE UNIQUE INDEX IF NOT EXISTS idx_global_ranking_id_region
  ON public.global_ranking(id, region);

"""

CLICKHOUSE_PER_DB_PATCH = r"""
-- gge-tracker fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS {db}.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;

-- Wheel of Unimaginable Affluence (LT=72)
-- Written by fetch-and-save-wheel-affluence.ts (insertWheelOfUnimaginableAffluenceData)
CREATE TABLE IF NOT EXISTS {db}.wheel_unimaginable_affluence (
  player_id UInt32,
  point Int64,
  created_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(created_at)
ORDER BY (player_id, created_at)
SETTINGS index_granularity = 8192;

-- Outer Realms live ranking (token-scrapper)
-- Written by storeOuterRealmsEntries in the internal-scraping package.
-- Distinct from the Postgres outer_realms_ranking, which keeps event history.
CREATE TABLE IF NOT EXISTS {db}.outer_realms_ranking (
  player_id UInt32,
  player_name String,
  server String,
  score Int64,
  rank UInt32,
  level UInt16,
  legendary_level UInt16,
  might Int64,
  castle_position_x Int32,
  castle_position_y Int32,
  fetch_date DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(fetch_date)
ORDER BY (fetch_date, rank)
SETTINGS index_granularity = 8192;

-- Marker table for the last Outer Realms sweep
CREATE TABLE IF NOT EXISTS {db}.latest_fetch_date (
  fetch_date DateTime
) ENGINE = MergeTree
ORDER BY fetch_date
SETTINGS index_granularity = 8192;

"""

CLICKHOUSE_GLOBAL_DB = r"""
-- Shared global database (cross-server boards).
-- Read by the backend for /events (live Outer Realms), /rift-raid, and the
-- global ranking endpoints. A single-server fork writes its own data here.
CREATE DATABASE IF NOT EXISTS ggetracker_global;

CREATE TABLE IF NOT EXISTS ggetracker_global.outer_realms_ranking (
  player_id UInt32,
  player_name String,
  server String,
  score Int64,
  rank UInt32,
  level UInt16,
  legendary_level UInt16,
  might Int64,
  castle_position_x Int32,
  castle_position_y Int32,
  fetch_date DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(fetch_date)
ORDER BY (fetch_date, rank)
SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS ggetracker_global.latest_fetch_date (
  fetch_date DateTime
) ENGINE = MergeTree
ORDER BY fetch_date
SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS ggetracker_global.rift_raid_ranking (
  server_id UInt32,
  division_id UInt16,
  subdivision_id UInt16,
  alliance_id UInt32,
  alliance_name String,
  rank UInt32,
  score String
) ENGINE = MergeTree
ORDER BY (division_id, subdivision_id, rank)
SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS ggetracker_global.rift_raid_hours (
  event_id UInt32,
  hour DateTime,
  game String,
  created_at DateTime DEFAULT now()
) ENGINE = MergeTree
ORDER BY (game, hour, event_id)
SETTINGS index_granularity = 8192;

"""

CLICKHOUSE_LOGS_DB = r"""
-- Shared logs database (audit + scrapes)
CREATE DATABASE IF NOT EXISTS logs;

CREATE TABLE IF NOT EXISTS logs.scrapes (
  server String,
  timestamp DateTime,
  durationMs UInt32,
  playersCreated UInt32,
  alliancesCreated UInt32,
  playersAllianceUpdated UInt32,
  alliancesUpdated UInt32,
  criticalErrors UInt32,
  playerCount UInt32,
  allianceCount UInt32
) ENGINE = MergeTree
ORDER BY (server, timestamp)
SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS logs.logs (
  timestamp DateTime DEFAULT now(),
  level String,
  service String,
  message String,
  metadata String
) ENGINE = MergeTree
ORDER BY (service, timestamp)
SETTINGS index_granularity = 8192;

"""


def patch_postgres(path: Path) -> None:
    content = path.read_text()
    parts = re.split(r'(CREATE DATABASE "empire-ranking[^"]*";)', content)
    if len(parts) < 3:
        raise SystemExit(f"No CREATE DATABASE markers found in {path}")

    new_parts = [parts[0]]
    for i in range(1, len(parts), 2):
        marker = parts[i]
        body = parts[i + 1] if i + 1 < len(parts) else ''
        new_parts.append(marker)
        new_parts.append(body + POSTGRES_PATCH)

    path.write_text(''.join(new_parts))
    print(f"[OK] Patched {path} ({len(parts)//2} DBs)")


def patch_clickhouse(path: Path) -> None:
    content = path.read_text()

    def _replace_create_db(match: re.Match) -> str:
        db_name = match.group(1)
        return match.group(0) + CLICKHOUSE_PER_DB_PATCH.format(db=db_name)

    content = re.sub(
        r'CREATE DATABASE (?:IF NOT EXISTS )?(empire_ranking[_a-zA-Z0-9]*);',
        _replace_create_db,
        content,
    )

    if 'CREATE DATABASE IF NOT EXISTS logs;' not in content:
        content += '\n' + CLICKHOUSE_LOGS_DB

    if 'CREATE DATABASE IF NOT EXISTS ggetracker_global;' not in content:
        content += '\n' + CLICKHOUSE_GLOBAL_DB

    path.write_text(content)
    print(f"[OK] Patched {path}")


if __name__ == '__main__':
    root = Path(__file__).parent
    patch_postgres(root / 'postgres' / 'structure.sql')
    patch_clickhouse(root / 'clickhouse' / 'structure.sql')
    print("[DONE]")
