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
CREATE TABLE empire_ranking_world1.event_dates (`table_name` String, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (table_name, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_berimond_invasion_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_berimond_kingdom_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_bloodcrow_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_nomad_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_samurai_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_event_war_realms_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_loot_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) SETTINGS index_granularity = 8192, storage_policy = 'default';


CREATE TABLE empire_ranking_world1.player_might_history (`player_id` UInt32, `point` UInt64, `created_at` DateTime) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY (player_id, created_at) TTL created_at + toIntervalMonth(3) TO VOLUME 'cold' SETTINGS storage_policy = 'hot_and_cold', index_granularity = 8192;


