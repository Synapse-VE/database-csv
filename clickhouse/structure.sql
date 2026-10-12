/**----------------------------------------------------
    --                                               --
    --     GGE Tracker ClickHouse Database Schema    --
    --                                               --
    --        https://gge-tracker.com (c) 2025       --
    --                                               --
    --  [ x ] Environment: ClickHouse 25.3+          --
    --  [ x ] Patch date: 2025-09                    --
    --  [ x ] Patch version: 1.11.2                  --
    --                                               --
    --------------------------------------------------*/

CREATE DATABASE IF NOT EXISTS empire_ranking;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(toDate(created_at)) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_BR1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_BR1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_BR1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_BR1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_BR1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_BR1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_BR1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_BR1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_BR1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_BR1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_BR1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_IN1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_IN1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_IN1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IN1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IN1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IN1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IN1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IN1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IN1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IN1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IN1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_IT1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_IT1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_IT1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IT1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IT1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IT1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IT1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IT1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IT1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IT1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_IT1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_PL1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_PL1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_PL1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PL1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PL1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PL1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PL1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PL1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PL1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PL1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PL1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_PT1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_PT1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_PT1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PT1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PT1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PT1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PT1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PT1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PT1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PT1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_PT1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_ar1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_ar1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_ar1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ar1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ar1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ar1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ar1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ar1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ar1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ar1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ar1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_au1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_au1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_au1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_au1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_au1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_au1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_au1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_au1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_au1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_au1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_au1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_cz1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_cz1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_cz1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_cz1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_cz1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_cz1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_cz1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_cz1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_cz1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_cz1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_cz1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_de1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_de1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_de1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_de1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_de1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_de1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_de1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_de1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_de1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_de1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_de1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(toDate(created_at)) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_es1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_es1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_es1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_es1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_es1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_es1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_es1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_es1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_es1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_es1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_es1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_hant1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_hant1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_hant1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hant1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hant1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hant1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hant1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hant1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hant1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hant1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hant1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_hu1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_hu1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_hu1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_hu2;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_hu2.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_hu2.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu2.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu2.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu2.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu2.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu2.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu2.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu2.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_hu2.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_int3;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_int3.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_int3.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_int3.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_int3.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_int3.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_int3.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_int3.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_int3.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_int3.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_int3.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_nl1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_nl1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_nl1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_nl1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_nl1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_nl1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_nl1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_nl1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_nl1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_nl1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_nl1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_ro1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_ro1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_ro1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ro1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ro1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ro1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ro1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ro1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ro1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ro1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_ro1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_sa1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_sa1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_sa1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_sa1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_sa1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_sa1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_sa1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_sa1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_sa1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_sa1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_sa1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_tr1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_tr1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_tr1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_tr1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_tr1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_tr1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_tr1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_tr1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_tr1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_tr1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_tr1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_us1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_us1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_us1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_us1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_us1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_us1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_us1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_us1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_us1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_us1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_us1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


CREATE DATABASE IF NOT EXISTS empire_ranking_world1;
-- gge-tracker-his1 fork: player_metrics table (bug in upstream)
CREATE TABLE IF NOT EXISTS empire_ranking_world1.player_metrics (
  player_id UInt32,
  metric_id UInt16,
  value Float64,
  collected_at DateTime
) ENGINE = MergeTree
PARTITION BY toYYYYMM(collected_at)
ORDER BY (player_id, metric_id, collected_at)
SETTINGS index_granularity = 8192;


CREATE TABLE empire_ranking_world1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;




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

