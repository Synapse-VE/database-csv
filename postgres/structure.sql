/**----------------------------------------------------
    --                                               --
    --     GGE Tracker PostgreSQL Database Schema    --
    --                                               --
    --        https://gge-tracker.com (c) 2025       --
    --                                               --
    --  [ x ] Environment: PostgreSQL 17+            --
    --  [ x ] Patch date: 2025-09                    --
    --  [ x ] Patch version: 1.11.2                  --
    --                                               --
    --------------------------------------------------*/


CREATE DATABASE "empire-ranking";
\connect empire-ranking;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: movement_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.movement_type_enum AS ENUM (
    'add',
    'remove',
    'move'
);


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: beyond_the_horizon_event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.beyond_the_horizon_event (
    event_num integer NOT NULL,
    collect_date timestamp without time zone NOT NULL,
    fr integer NOT NULL,
    igh integer NOT NULL,
    top1_player_id integer,
    top1_player_score bigint,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: beyond_the_horizon_ranking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.beyond_the_horizon_ranking (
    id bigint NOT NULL,
    event_num integer NOT NULL,
    player_id integer,
    server character varying(40) NOT NULL,
    level smallint NOT NULL,
    legendary_level smallint,
    point bigint NOT NULL,
    rank integer NOT NULL,
    player_name character varying(60)
);


--
-- Name: beyond_the_horizon_ranking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.beyond_the_horizon_ranking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: beyond_the_horizon_ranking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.beyond_the_horizon_ranking_id_seq OWNED BY public.beyond_the_horizon_ranking.id;


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: outer_realms_event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.outer_realms_event (
    event_num integer NOT NULL,
    collect_date timestamp without time zone NOT NULL,
    fr integer NOT NULL,
    igh integer NOT NULL,
    top1_player_id integer,
    top1_player_score bigint,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: outer_realms_ranking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.outer_realms_ranking (
    id bigint NOT NULL,
    event_num integer NOT NULL,
    player_id integer,
    server character varying(40) NOT NULL,
    level smallint NOT NULL,
    legendary_level smallint,
    point bigint NOT NULL,
    rank integer NOT NULL,
    player_name character varying(60)
);


--
-- Name: outer_realms_ranking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.outer_realms_ranking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: outer_realms_ranking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.outer_realms_ranking_id_seq OWNED BY public.outer_realms_ranking.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: beyond_the_horizon_ranking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beyond_the_horizon_ranking ALTER COLUMN id SET DEFAULT nextval('public.beyond_the_horizon_ranking_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: outer_realms_ranking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outer_realms_ranking ALTER COLUMN id SET DEFAULT nextval('public.outer_realms_ranking_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: beyond_the_horizon_event beyond_the_horizon_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beyond_the_horizon_event
    ADD CONSTRAINT beyond_the_horizon_event_pkey PRIMARY KEY (event_num);


--
-- Name: beyond_the_horizon_ranking beyond_the_horizon_ranking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beyond_the_horizon_ranking
    ADD CONSTRAINT beyond_the_horizon_ranking_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: outer_realms_event outer_realms_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outer_realms_event
    ADD CONSTRAINT outer_realms_event_pkey PRIMARY KEY (event_num);


--
-- Name: outer_realms_ranking outer_realms_ranking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outer_realms_ranking
    ADD CONSTRAINT outer_realms_ranking_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: outer_realms_ranking uq_event_player; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outer_realms_ranking
    ADD CONSTRAINT uq_event_player UNIQUE (event_num, player_id, server);


--
-- Name: beyond_the_horizon_ranking uq_event_player_horizon; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beyond_the_horizon_ranking
    ADD CONSTRAINT uq_event_player_horizon UNIQUE (event_num, player_id, server);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_bth_event_point; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bth_event_point ON public.beyond_the_horizon_ranking USING btree (event_num, point DESC);


--
-- Name: idx_bth_event_rank; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bth_event_rank ON public.beyond_the_horizon_ranking USING btree (event_num, rank);


--
-- Name: idx_bth_player_event; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bth_player_event ON public.beyond_the_horizon_ranking USING btree (player_id, event_num);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_event_rank; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_event_rank ON public.outer_realms_ranking USING btree (event_num, rank);


--
-- Name: idx_event_server; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_event_server ON public.outer_realms_ranking USING btree (event_num, server);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_player_participations; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_participations ON public.outer_realms_ranking USING btree (player_id, event_num);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: beyond_the_horizon_ranking fk_event_num; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.beyond_the_horizon_ranking
    ADD CONSTRAINT fk_event_num FOREIGN KEY (event_num) REFERENCES public.beyond_the_horizon_event(event_num);


--
-- Name: outer_realms_ranking outer_realms_ranking_event_num_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.outer_realms_ranking
    ADD CONSTRAINT outer_realms_ranking_event_num_fkey FOREIGN KEY (event_num) REFERENCES public.outer_realms_event(event_num);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-us1";
\connect empire-ranking-us1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-cz1";
\connect empire-ranking-cz1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-ro1";
\connect empire-ranking-ro1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-nl1";
\connect empire-ranking-nl1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-world1";
\connect empire-ranking-world1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-int3";
\connect empire-ranking-int3;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-de1";
\connect empire-ranking-de1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-tr1";
\connect empire-ranking-tr1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: movement_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.movement_type_enum AS ENUM (
    'add',
    'remove',
    'move'
);


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-pt1";
\connect empire-ranking-pt1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: movement_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.movement_type_enum AS ENUM (
    'add',
    'remove',
    'move'
);


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-br1";
\connect empire-ranking-br1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: movement_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.movement_type_enum AS ENUM (
    'add',
    'remove',
    'move'
);


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-in1";
\connect empire-ranking-in1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: movement_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.movement_type_enum AS ENUM (
    'add',
    'remove',
    'move'
);


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-it1";
\connect empire-ranking-it1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: movement_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.movement_type_enum AS ENUM (
    'add',
    'remove',
    'move'
);


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-pl1";
\connect empire-ranking-pl1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: movement_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.movement_type_enum AS ENUM (
    'add',
    'remove',
    'move'
);


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-au1";
\connect empire-ranking-au1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-ar1";
\connect empire-ranking-ar1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-hant1";
\connect empire-ranking-hant1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-hu1";
\connect empire-ranking-hu1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-hu2";
\connect empire-ranking-hu2;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-global";
\connect empire-ranking-global;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgres_fdw WITH SCHEMA public;


--
-- Name: EXTENSION postgres_fdw; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgres_fdw IS 'foreign-data wrapper for remote PostgreSQL servers';


--
-- Name: ar1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER ar1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-ar1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER ar1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER ar1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: au1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER au1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-au1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER au1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER au1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: br1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER br1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-br1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER br1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER br1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: cz1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER cz1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-cz1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER cz1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER cz1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: de1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER de1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-de1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER de1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER de1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: es1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER es1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-es1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER es1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER es1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: fr1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER fr1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER fr1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER fr1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: hant1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER hant1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-hant1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER hant1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER hant1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: hu1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER hu1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-hu1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER hu1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER hu1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: hu2_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER hu2_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-hu2',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER hu2_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER hu2_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: in1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER in1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-in1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER in1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER in1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: int3_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER int3_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-int3',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER int3_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER int3_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: it1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER it1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-it1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER it1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER it1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: nl1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER nl1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-nl1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER nl1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER nl1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: pl1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER pl1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-pl1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER pl1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER pl1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: pt1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER pt1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-pt1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER pt1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER pt1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: ro1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER ro1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-ro1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER ro1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER ro1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: sa1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER sa1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-sa1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER sa1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER sa1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: tr1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER tr1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-tr1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER tr1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER tr1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: us1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER us1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-us1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER us1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER us1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: world1_server; Type: SERVER; Schema: -; Owner: -
--

CREATE SERVER world1_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'empire-ranking-world1',
    host 'localhost'
);


--
-- Name: USER MAPPING gge-tracker SERVER world1_server; Type: USER MAPPING; Schema: -; Owner: -
--

CREATE USER MAPPING FOR "gge-tracker" SERVER world1_server OPTIONS (
    password 'sz''l`0^nYVC0_y#VT`k.n=v=L6$.8WJj£9h',
    "user" 'gge-tracker'
);


--
-- Name: players_ar1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_ar1 (
    id bigint,
    might_current bigint
)
SERVER ar1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_au1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_au1 (
    id bigint,
    might_current bigint
)
SERVER au1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_br1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_br1 (
    id bigint,
    might_current bigint
)
SERVER br1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_cz1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_cz1 (
    id bigint,
    might_current bigint
)
SERVER cz1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_de1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_de1 (
    id bigint,
    might_current bigint
)
SERVER de1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_es1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_es1 (
    id bigint,
    might_current bigint
)
SERVER es1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_fr1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_fr1 (
    id bigint,
    might_current bigint
)
SERVER fr1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_hant1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_hant1 (
    id bigint,
    might_current bigint
)
SERVER hant1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_hu1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_hu1 (
    id bigint,
    might_current bigint
)
SERVER hu1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_hu2; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_hu2 (
    id bigint,
    might_current bigint
)
SERVER hu2_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_in1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_in1 (
    id bigint,
    might_current bigint
)
SERVER in1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_int3; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_int3 (
    id bigint,
    might_current bigint
)
SERVER int3_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_it1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_it1 (
    id bigint,
    might_current bigint
)
SERVER it1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_nl1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_nl1 (
    id bigint,
    might_current bigint
)
SERVER nl1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_pl1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_pl1 (
    id bigint,
    might_current bigint
)
SERVER pl1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_pt1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_pt1 (
    id bigint,
    might_current bigint
)
SERVER pt1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_ro1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_ro1 (
    id bigint,
    might_current bigint
)
SERVER ro1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_sa1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_sa1 (
    id bigint,
    might_current bigint
)
SERVER sa1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_tr1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_tr1 (
    id bigint,
    might_current bigint
)
SERVER tr1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_us1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_us1 (
    id bigint,
    might_current bigint
)
SERVER us1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_world1; Type: FOREIGN TABLE; Schema: public; Owner: -
--

CREATE FOREIGN TABLE public.players_world1 (
    id bigint,
    might_current bigint
)
SERVER world1_server
OPTIONS (
    schema_name 'public',
    table_name 'players'
);


--
-- Name: players_global; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.players_global AS
 SELECT 'fr1'::text AS region,
    players_fr1.id,
    players_fr1.might_current
   FROM public.players_fr1
UNION ALL
 SELECT 'us1'::text AS region,
    players_us1.id,
    players_us1.might_current
   FROM public.players_us1
UNION ALL
 SELECT 'cz1'::text AS region,
    players_cz1.id,
    players_cz1.might_current
   FROM public.players_cz1
UNION ALL
 SELECT 'ro1'::text AS region,
    players_ro1.id,
    players_ro1.might_current
   FROM public.players_ro1
UNION ALL
 SELECT 'nl1'::text AS region,
    players_nl1.id,
    players_nl1.might_current
   FROM public.players_nl1
UNION ALL
 SELECT 'world1'::text AS region,
    players_world1.id,
    players_world1.might_current
   FROM public.players_world1
UNION ALL
 SELECT 'int3'::text AS region,
    players_int3.id,
    players_int3.might_current
   FROM public.players_int3
UNION ALL
 SELECT 'de1'::text AS region,
    players_de1.id,
    players_de1.might_current
   FROM public.players_de1
UNION ALL
 SELECT 'tr1'::text AS region,
    players_tr1.id,
    players_tr1.might_current
   FROM public.players_tr1
UNION ALL
 SELECT 'pt1'::text AS region,
    players_pt1.id,
    players_pt1.might_current
   FROM public.players_pt1
UNION ALL
 SELECT 'br1'::text AS region,
    players_br1.id,
    players_br1.might_current
   FROM public.players_br1
UNION ALL
 SELECT 'in1'::text AS region,
    players_in1.id,
    players_in1.might_current
   FROM public.players_in1
UNION ALL
 SELECT 'it1'::text AS region,
    players_it1.id,
    players_it1.might_current
   FROM public.players_it1
UNION ALL
 SELECT 'pl1'::text AS region,
    players_pl1.id,
    players_pl1.might_current
   FROM public.players_pl1
UNION ALL
 SELECT 'au1'::text AS region,
    players_au1.id,
    players_au1.might_current
   FROM public.players_au1
UNION ALL
 SELECT 'ar1'::text AS region,
    players_ar1.id,
    players_ar1.might_current
   FROM public.players_ar1
UNION ALL
 SELECT 'hant1'::text AS region,
    players_hant1.id,
    players_hant1.might_current
   FROM public.players_hant1
UNION ALL
 SELECT 'hu1'::text AS region,
    players_hu1.id,
    players_hu1.might_current
   FROM public.players_hu1
UNION ALL
 SELECT 'hu2'::text AS region,
    players_hu2.id,
    players_hu2.might_current
   FROM public.players_hu2
UNION ALL
 SELECT 'es1'::text AS region,
    players_es1.id,
    players_es1.might_current
   FROM public.players_es1
UNION ALL
 SELECT 'sa1'::text AS region,
    players_sa1.id,
    players_sa1.might_current
   FROM public.players_sa1;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: global_ranking; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.global_ranking AS
 SELECT region,
    id,
    rank() OVER (ORDER BY might_current DESC) AS global_rank
   FROM public.players_global
  WITH NO DATA;


--
-- Name: global_ranking_unique_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX global_ranking_unique_idx ON public.global_ranking USING btree (region, id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-es1";
\connect empire-ranking-es1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



CREATE DATABASE "empire-ranking-sa1";
\connect empire-ranking-sa1;
--
-- PostgreSQL database dump
--


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alliance_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliance_update_history (
    id integer NOT NULL,
    alliance_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alliance_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alliance_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alliance_update_history_id_seq OWNED BY public.alliance_update_history.id;


--
-- Name: alliances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alliances (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: dungeon_player_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeon_player_state (
    id integer NOT NULL,
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    player_id integer,
    last_attack_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dungeon_player_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dungeon_player_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dungeon_player_state_id_seq OWNED BY public.dungeon_player_state.id;


--
-- Name: dungeons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dungeons (
    kid smallint NOT NULL,
    position_x smallint NOT NULL,
    position_y smallint NOT NULL,
    attack_cooldown integer,
    player_id integer,
    total_attack_count integer NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: offers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    server_type character varying(30) NOT NULL,
    offer_type character varying(30) NOT NULL,
    offer integer,
    world_type character varying(50) NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


--
-- Name: parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    value integer,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- Name: player_alliance_update; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_alliance_update (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_alliance_id integer,
    new_alliance_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_alliance_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_alliance_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_alliance_update_id_seq OWNED BY public.player_alliance_update.id;


--
-- Name: player_castle_movements_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_castle_movements_history (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    castle_type smallint NOT NULL,
    movement_type character varying(10) NOT NULL,
    position_x_old smallint,
    position_y_old smallint,
    position_x_new smallint,
    position_y_new smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_castle_movements_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_castle_movements_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_castle_movements_history_id_seq OWNED BY public.player_castle_movements_history.id;


--
-- Name: player_name_update_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_name_update_history (
    id integer NOT NULL,
    player_id integer NOT NULL,
    old_name character varying(100),
    new_name character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.player_name_update_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_name_update_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.player_name_update_history_id_seq OWNED BY public.player_name_update_history.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    alliance_id integer,
    might_current bigint,
    might_all_time bigint,
    loot_current bigint,
    loot_all_time bigint,
    level smallint,
    legendary_level smallint,
    highest_fame numeric(20,0) DEFAULT 0 NOT NULL,
    current_fame numeric(20,0) DEFAULT 0 NOT NULL,
    remaining_relocation_time integer DEFAULT 0 NOT NULL,
    castles jsonb,
    castles_realm jsonb,
    honor integer,
    max_honor integer,
    remaining_peace_time integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    peace_disabled_at timestamp with time zone
);


--
-- Name: server_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.server_statistics (
    id bigint NOT NULL,
    avg_might double precision,
    avg_loot double precision,
    avg_honor double precision,
    avg_level double precision,
    max_might bigint,
    max_might_player_id integer,
    max_loot_player_id integer,
    max_loot numeric(20,0),
    players_count bigint,
    alliance_count integer NOT NULL,
    players_in_peace integer,
    players_who_changed_alliance smallint NOT NULL,
    players_who_changed_name smallint NOT NULL,
    total_might numeric(20,0),
    total_loot numeric(20,0),
    total_honor numeric(20,0),
    variation_might numeric(20,0) NOT NULL,
    variation_loot numeric(20,0) NOT NULL,
    variation_honor numeric(20,0) NOT NULL,
    alliances_changed_name integer NOT NULL,
    events_count smallint NOT NULL,
    events_top_3_names text NOT NULL,
    events_participation_rate text NOT NULL,
    event_nomad_points numeric(20,0),
    event_war_realms_points numeric(20,0),
    event_bloodcrow_points numeric(20,0),
    event_samurai_points numeric(20,0),
    event_berimond_invasion_points numeric(20,0),
    event_berimond_kingdom_points numeric(20,0),
    event_nomad_players integer,
    event_berimond_invasion_players integer,
    event_berimond_kingdom_players integer,
    event_bloodcrow_players integer,
    event_samurai_players integer,
    event_war_realms_players integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: server_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.server_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: server_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.server_statistics_id_seq OWNED BY public.server_statistics.id;


--
-- Name: alliance_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history ALTER COLUMN id SET DEFAULT nextval('public.alliance_update_history_id_seq'::regclass);


--
-- Name: dungeon_player_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state ALTER COLUMN id SET DEFAULT nextval('public.dungeon_player_state_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


--
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- Name: player_alliance_update id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update ALTER COLUMN id SET DEFAULT nextval('public.player_alliance_update_id_seq'::regclass);


--
-- Name: player_castle_movements_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history ALTER COLUMN id SET DEFAULT nextval('public.player_castle_movements_history_id_seq'::regclass);


--
-- Name: player_name_update_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history ALTER COLUMN id SET DEFAULT nextval('public.player_name_update_history_id_seq'::regclass);


--
-- Name: server_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics ALTER COLUMN id SET DEFAULT nextval('public.server_statistics_id_seq'::regclass);


--
-- Name: alliance_update_history alliance_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_pkey PRIMARY KEY (id);


--
-- Name: alliances alliances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliances
    ADD CONSTRAINT alliances_pkey PRIMARY KEY (id);


--
-- Name: dungeon_player_state dungeon_player_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_pkey PRIMARY KEY (id);


--
-- Name: dungeons dungeons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_pkey PRIMARY KEY (kid, position_x, position_y);


--
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- Name: player_alliance_update player_alliance_update_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_pkey PRIMARY KEY (id);


--
-- Name: player_castle_movements_history player_castle_movements_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_pkey PRIMARY KEY (id);


--
-- Name: player_name_update_history player_name_update_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: server_statistics server_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_pkey PRIMARY KEY (id);


--
-- Name: idx_alliance_update_history_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_alliance_id ON public.alliance_update_history USING btree (alliance_id);


--
-- Name: idx_alliance_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_alliance_update_history_created_at ON public.alliance_update_history USING btree (created_at);


--
-- Name: idx_castle_movements_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_created_at ON public.player_castle_movements_history USING btree (created_at);


--
-- Name: idx_castle_movements_movement_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_movement_type ON public.player_castle_movements_history USING btree (movement_type);


--
-- Name: idx_castle_movements_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_castle_movements_player_id ON public.player_castle_movements_history USING btree (player_id);


--
-- Name: idx_dungeon_player_state_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_kid_position ON public.dungeon_player_state USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeon_player_state_last_attack; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_last_attack ON public.dungeon_player_state USING btree (last_attack_at);


--
-- Name: idx_dungeon_player_state_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeon_player_state_player_id ON public.dungeon_player_state USING btree (player_id);


--
-- Name: idx_dungeons_kid_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_kid_position ON public.dungeons USING btree (kid, position_x, position_y);


--
-- Name: idx_dungeons_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_player_id ON public.dungeons USING btree (player_id);


--
-- Name: idx_dungeons_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dungeons_updated_at ON public.dungeons USING btree (updated_at);


--
-- Name: idx_parameters_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_parameters_identifier ON public.parameters USING btree (identifier);


--
-- Name: idx_player_alliance_update_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_created_at ON public.player_alliance_update USING btree (created_at);


--
-- Name: idx_player_alliance_update_new_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_new_alliance ON public.player_alliance_update USING btree (new_alliance_id);


--
-- Name: idx_player_alliance_update_old_alliance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_old_alliance ON public.player_alliance_update USING btree (old_alliance_id);


--
-- Name: idx_player_alliance_update_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_alliance_update_player_id ON public.player_alliance_update USING btree (player_id);


--
-- Name: idx_player_name_update_history_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_created_at ON public.player_name_update_history USING btree (created_at);


--
-- Name: idx_player_name_update_history_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_name_update_history_player_id ON public.player_name_update_history USING btree (player_id);


--
-- Name: idx_players_alliance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_alliance_id ON public.players USING btree (alliance_id);


--
-- Name: idx_players_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_name ON public.players USING btree (name);


--
-- Name: idx_players_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_players_updated_at ON public.players USING btree (updated_at);


--
-- Name: players set_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.players FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: alliance_update_history alliance_update_history_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alliance_update_history
    ADD CONSTRAINT alliance_update_history_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: dungeon_player_state dungeon_player_state_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeon_player_state
    ADD CONSTRAINT dungeon_player_state_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: dungeons dungeons_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dungeons
    ADD CONSTRAINT dungeons_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_alliance_update player_alliance_update_new_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_new_alliance_id_fkey FOREIGN KEY (new_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_old_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_old_alliance_id_fkey FOREIGN KEY (old_alliance_id) REFERENCES public.alliances(id);


--
-- Name: player_alliance_update player_alliance_update_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_alliance_update
    ADD CONSTRAINT player_alliance_update_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_castle_movements_history player_castle_movements_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_castle_movements_history
    ADD CONSTRAINT player_castle_movements_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: player_name_update_history player_name_update_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_name_update_history
    ADD CONSTRAINT player_name_update_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: players players_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES public.alliances(id);


--
-- Name: server_statistics server_statistics_max_loot_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_loot_player_id_fkey FOREIGN KEY (max_loot_player_id) REFERENCES public.players(id);


--
-- Name: server_statistics server_statistics_max_might_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.server_statistics
    ADD CONSTRAINT server_statistics_max_might_player_id_fkey FOREIGN KEY (max_might_player_id) REFERENCES public.players(id);


--
-- PostgreSQL database dump complete
--



