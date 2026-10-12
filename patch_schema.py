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
-- ==== gge-tracker-his1 fork: schema drift fixes ====
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

ALTER TABLE public.dungeons ADD COLUMN IF NOT EXISTS global_available_at timestamptz DEFAULT NOW();
ALTER TABLE public.dungeons ADD COLUMN IF NOT EXISTS player_available_at timestamptz;
ALTER TABLE public.dungeons ALTER COLUMN total_attack_count SET DEFAULT 0;

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
  created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
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

"""

CLICKHOUSE_PER_DB_PATCH = r"""
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS {db}.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;

"""

CLICKHOUSE_LOGS_DB = r"""
-- gge-tracker-his1 fork: shared logs database (audit + scrapes)
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

    path.write_text(content)
    print(f"[OK] Patched {path}")


if __name__ == '__main__':
    root = Path(__file__).parent
    patch_postgres(root / 'postgres' / 'structure.sql')
    patch_clickhouse(root / 'clickhouse' / 'structure.sql')
    print("[DONE]")
