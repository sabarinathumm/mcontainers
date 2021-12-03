--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities (
    id bigint NOT NULL,
    container_id bigint NOT NULL,
    activity_uid character varying,
    activity_type integer,
    activity_status integer,
    assigned_to_type character varying,
    assigned_to_id bigint,
    inspection_comment text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    activity_date timestamp without time zone
);


ALTER TABLE public.activities OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO postgres;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: activity_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_attachments (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    attachment_type integer,
    attachment json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.activity_attachments OWNER TO postgres;

--
-- Name: activity_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_attachments_id_seq OWNER TO postgres;

--
-- Name: activity_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_attachments_id_seq OWNED BY public.activity_attachments.id;


--
-- Name: activity_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_items (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    repair_code character varying,
    container_repair_area_id bigint,
    container_damaged_area_id bigint,
    repair_type_id bigint,
    location text,
    hours double precision,
    labour_cost_cents integer DEFAULT 0 NOT NULL,
    labour_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    material_cost_cents integer DEFAULT 0 NOT NULL,
    material_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    total_cost_cents integer DEFAULT 0 NOT NULL,
    total_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    damaged_area_image_id bigint,
    repaired_area_image_id bigint,
    comments text,
    unit_id bigint,
    length_id bigint,
    width_id bigint
);


ALTER TABLE public.activity_items OWNER TO postgres;

--
-- Name: activity_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_items_id_seq OWNER TO postgres;

--
-- Name: activity_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_items_id_seq OWNED BY public.activity_items.id;


--
-- Name: activity_timelines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_timelines (
    id bigint NOT NULL,
    history_status integer,
    history_date timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    activity_id bigint NOT NULL
);


ALTER TABLE public.activity_timelines OWNER TO postgres;

--
-- Name: activity_timelines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_timelines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_timelines_id_seq OWNER TO postgres;

--
-- Name: activity_timelines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_timelines_id_seq OWNED BY public.activity_timelines.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    phone_number character varying,
    is_active boolean,
    isd_code character varying,
    display_picture json,
    role integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying,
    province_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.components OWNER TO postgres;

--
-- Name: components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_id_seq OWNER TO postgres;

--
-- Name: components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_id_seq OWNED BY public.components.id;


--
-- Name: comps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comps (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    material character varying,
    description character varying
);


ALTER TABLE public.comps OWNER TO postgres;

--
-- Name: comps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comps_id_seq OWNER TO postgres;

--
-- Name: comps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comps_id_seq OWNED BY public.comps.id;


--
-- Name: container_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container_attachments (
    id bigint NOT NULL,
    container_id bigint NOT NULL,
    attachment_type integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    attachment_id bigint NOT NULL
);


ALTER TABLE public.container_attachments OWNER TO postgres;

--
-- Name: container_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_attachments_id_seq OWNER TO postgres;

--
-- Name: container_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_attachments_id_seq OWNED BY public.container_attachments.id;


--
-- Name: container_damaged_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container_damaged_areas (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.container_damaged_areas OWNER TO postgres;

--
-- Name: container_damaged_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_damaged_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_damaged_areas_id_seq OWNER TO postgres;

--
-- Name: container_damaged_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_damaged_areas_id_seq OWNED BY public.container_damaged_areas.id;


--
-- Name: container_heights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container_heights (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.container_heights OWNER TO postgres;

--
-- Name: container_heights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_heights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_heights_id_seq OWNER TO postgres;

--
-- Name: container_heights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_heights_id_seq OWNED BY public.container_heights.id;


--
-- Name: container_lengths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container_lengths (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.container_lengths OWNER TO postgres;

--
-- Name: container_lengths_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_lengths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_lengths_id_seq OWNER TO postgres;

--
-- Name: container_lengths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_lengths_id_seq OWNED BY public.container_lengths.id;


--
-- Name: container_repair_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container_repair_areas (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.container_repair_areas OWNER TO postgres;

--
-- Name: container_repair_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_repair_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_repair_areas_id_seq OWNER TO postgres;

--
-- Name: container_repair_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_repair_areas_id_seq OWNED BY public.container_repair_areas.id;


--
-- Name: container_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.container_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.container_types OWNER TO postgres;

--
-- Name: container_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.container_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.container_types_id_seq OWNER TO postgres;

--
-- Name: container_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.container_types_id_seq OWNED BY public.container_types.id;


--
-- Name: containers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.containers (
    id bigint NOT NULL,
    container_uid character varying,
    yard_id bigint,
    customer_id bigint,
    container_owner_name character varying,
    submitter_initials character varying,
    container_type_id bigint,
    manufacture_year integer,
    location text,
    comments text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    container_status integer DEFAULT 0,
    container_length_id bigint,
    container_height_id bigint
);


ALTER TABLE public.containers OWNER TO postgres;

--
-- Name: containers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.containers_id_seq OWNER TO postgres;

--
-- Name: containers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.containers_id_seq OWNED BY public.containers.id;


--
-- Name: customer_repair_list_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_repair_list_items (
    id bigint NOT NULL,
    customer_repair_list_id bigint NOT NULL,
    uid character varying,
    container_repair_area_id bigint,
    container_damaged_area_id bigint,
    repair_type_id bigint,
    is_non_mearsk_not_applicable boolean,
    non_mearsk_hours double precision,
    non_mearsk_material_cost_cents integer DEFAULT 0 NOT NULL,
    non_mearsk_material_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    non_mearsk_description text,
    comp_id bigint,
    rep_id bigint,
    dam_id bigint,
    component_id bigint,
    event_id bigint,
    location text,
    unit_id bigint,
    non_mearsk_id_source character varying,
    is_mearsk_not_applicable boolean,
    mearsk_max_material_cost_cents integer DEFAULT 0 NOT NULL,
    mearsk_max_material_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    mearsk_unit_material_cost_cents integer DEFAULT 0 NOT NULL,
    mearsk_unit_material_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    mearsk_hours_per_unit double precision,
    mesrsk_max_pieces double precision,
    mearsk_units double precision,
    repair_mode_id bigint,
    mode_number_id bigint,
    repair_code character varying,
    combined character varying,
    mearsk_description character varying,
    mearsk_id_source character varying,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    width_id bigint,
    length_id bigint
);


ALTER TABLE public.customer_repair_list_items OWNER TO postgres;

--
-- Name: customer_repair_list_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_repair_list_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_repair_list_items_id_seq OWNER TO postgres;

--
-- Name: customer_repair_list_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_repair_list_items_id_seq OWNED BY public.customer_repair_list_items.id;


--
-- Name: customer_repair_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_repair_lists (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    name character varying,
    is_active boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.customer_repair_lists OWNER TO postgres;

--
-- Name: customer_repair_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_repair_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_repair_lists_id_seq OWNER TO postgres;

--
-- Name: customer_repair_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_repair_lists_id_seq OWNED BY public.customer_repair_lists.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    full_name character varying,
    owner_name character varying,
    billing_name character varying,
    hourly_rate_cents integer DEFAULT 0 NOT NULL,
    hourly_rate_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    gst double precision,
    pst double precision,
    city_id bigint,
    province_id bigint,
    address text,
    zipcode character varying,
    customer_type integer,
    is_active boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    billing_type integer,
    approval_type integer
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: dams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dams (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description character varying
);


ALTER TABLE public.dams OWNER TO postgres;

--
-- Name: dams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dams_id_seq OWNER TO postgres;

--
-- Name: dams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dams_id_seq OWNED BY public.dams.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    title character varying,
    created_by character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: lengths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lengths (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.lengths OWNER TO postgres;

--
-- Name: lengths_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lengths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lengths_id_seq OWNER TO postgres;

--
-- Name: lengths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lengths_id_seq OWNED BY public.lengths.id;


--
-- Name: mode_numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mode_numbers (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.mode_numbers OWNER TO postgres;

--
-- Name: mode_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mode_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mode_numbers_id_seq OWNER TO postgres;

--
-- Name: mode_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mode_numbers_id_seq OWNED BY public.mode_numbers.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id bigint,
    application_id bigint,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying,
    previous_refresh_token character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_tokens_id_seq OWNER TO postgres;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provinces_id_seq OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- Name: repair_list_item_uploads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repair_list_item_uploads (
    id bigint NOT NULL,
    attachment character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.repair_list_item_uploads OWNER TO postgres;

--
-- Name: repair_list_item_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repair_list_item_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repair_list_item_uploads_id_seq OWNER TO postgres;

--
-- Name: repair_list_item_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repair_list_item_uploads_id_seq OWNED BY public.repair_list_item_uploads.id;


--
-- Name: repair_list_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repair_list_items (
    id bigint NOT NULL,
    repair_list_id bigint NOT NULL,
    uid character varying,
    container_repair_area_id bigint,
    container_damaged_area_id bigint,
    repair_type_id bigint,
    is_non_mearsk_not_applicable boolean,
    non_mearsk_hours double precision,
    non_mearsk_material_cost_cents integer DEFAULT 0 NOT NULL,
    non_mearsk_material_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    non_mearsk_description text,
    comp_id bigint,
    rep_id bigint,
    dam_id bigint,
    component_id bigint,
    event_id bigint,
    location text,
    unit_id bigint,
    non_mearsk_id_source character varying,
    is_mearsk_not_applicable boolean,
    mearsk_max_material_cost_cents integer DEFAULT 0 NOT NULL,
    mearsk_max_material_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    mearsk_unit_material_cost_cents integer DEFAULT 0 NOT NULL,
    mearsk_unit_material_cost_currency character varying DEFAULT 'USD'::character varying NOT NULL,
    mearsk_hours_per_unit double precision,
    mesrsk_max_pieces double precision,
    mearsk_units double precision,
    repair_mode_id bigint,
    mode_number_id bigint,
    repair_code character varying,
    combined character varying,
    mearsk_description character varying,
    mearsk_id_source character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    length_id bigint,
    width_id bigint
);


ALTER TABLE public.repair_list_items OWNER TO postgres;

--
-- Name: repair_list_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repair_list_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repair_list_items_id_seq OWNER TO postgres;

--
-- Name: repair_list_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repair_list_items_id_seq OWNED BY public.repair_list_items.id;


--
-- Name: repair_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repair_lists (
    id bigint NOT NULL,
    name character varying,
    is_active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.repair_lists OWNER TO postgres;

--
-- Name: repair_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repair_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repair_lists_id_seq OWNER TO postgres;

--
-- Name: repair_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repair_lists_id_seq OWNED BY public.repair_lists.id;


--
-- Name: repair_modes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repair_modes (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.repair_modes OWNER TO postgres;

--
-- Name: repair_modes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repair_modes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repair_modes_id_seq OWNER TO postgres;

--
-- Name: repair_modes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repair_modes_id_seq OWNED BY public.repair_modes.id;


--
-- Name: repair_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repair_types (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.repair_types OWNER TO postgres;

--
-- Name: repair_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repair_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repair_types_id_seq OWNER TO postgres;

--
-- Name: repair_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repair_types_id_seq OWNED BY public.repair_types.id;


--
-- Name: reps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reps (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reps OWNER TO postgres;

--
-- Name: reps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reps_id_seq OWNER TO postgres;

--
-- Name: reps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reps_id_seq OWNED BY public.reps.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.units OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_id_seq OWNER TO postgres;

--
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.units_id_seq OWNED BY public.units.id;


--
-- Name: uploaded_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uploaded_files (
    id bigint NOT NULL,
    attachment character varying,
    user_type character varying NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.uploaded_files OWNER TO postgres;

--
-- Name: uploaded_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uploaded_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uploaded_files_id_seq OWNER TO postgres;

--
-- Name: uploaded_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uploaded_files_id_seq OWNED BY public.uploaded_files.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    phone_number character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: widths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.widths (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.widths OWNER TO postgres;

--
-- Name: widths_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.widths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.widths_id_seq OWNER TO postgres;

--
-- Name: widths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.widths_id_seq OWNED BY public.widths.id;


--
-- Name: yards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yards (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.yards OWNER TO postgres;

--
-- Name: yards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.yards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yards_id_seq OWNER TO postgres;

--
-- Name: yards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.yards_id_seq OWNED BY public.yards.id;


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: activity_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_attachments ALTER COLUMN id SET DEFAULT nextval('public.activity_attachments_id_seq'::regclass);


--
-- Name: activity_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_items ALTER COLUMN id SET DEFAULT nextval('public.activity_items_id_seq'::regclass);


--
-- Name: activity_timelines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_timelines ALTER COLUMN id SET DEFAULT nextval('public.activity_timelines_id_seq'::regclass);


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components ALTER COLUMN id SET DEFAULT nextval('public.components_id_seq'::regclass);


--
-- Name: comps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comps ALTER COLUMN id SET DEFAULT nextval('public.comps_id_seq'::regclass);


--
-- Name: container_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_attachments ALTER COLUMN id SET DEFAULT nextval('public.container_attachments_id_seq'::regclass);


--
-- Name: container_damaged_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_damaged_areas ALTER COLUMN id SET DEFAULT nextval('public.container_damaged_areas_id_seq'::regclass);


--
-- Name: container_heights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_heights ALTER COLUMN id SET DEFAULT nextval('public.container_heights_id_seq'::regclass);


--
-- Name: container_lengths id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_lengths ALTER COLUMN id SET DEFAULT nextval('public.container_lengths_id_seq'::regclass);


--
-- Name: container_repair_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_repair_areas ALTER COLUMN id SET DEFAULT nextval('public.container_repair_areas_id_seq'::regclass);


--
-- Name: container_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_types ALTER COLUMN id SET DEFAULT nextval('public.container_types_id_seq'::regclass);


--
-- Name: containers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers ALTER COLUMN id SET DEFAULT nextval('public.containers_id_seq'::regclass);


--
-- Name: customer_repair_list_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items ALTER COLUMN id SET DEFAULT nextval('public.customer_repair_list_items_id_seq'::regclass);


--
-- Name: customer_repair_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_lists ALTER COLUMN id SET DEFAULT nextval('public.customer_repair_lists_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: dams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dams ALTER COLUMN id SET DEFAULT nextval('public.dams_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: lengths id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lengths ALTER COLUMN id SET DEFAULT nextval('public.lengths_id_seq'::regclass);


--
-- Name: mode_numbers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mode_numbers ALTER COLUMN id SET DEFAULT nextval('public.mode_numbers_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- Name: repair_list_item_uploads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_item_uploads ALTER COLUMN id SET DEFAULT nextval('public.repair_list_item_uploads_id_seq'::regclass);


--
-- Name: repair_list_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items ALTER COLUMN id SET DEFAULT nextval('public.repair_list_items_id_seq'::regclass);


--
-- Name: repair_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_lists ALTER COLUMN id SET DEFAULT nextval('public.repair_lists_id_seq'::regclass);


--
-- Name: repair_modes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_modes ALTER COLUMN id SET DEFAULT nextval('public.repair_modes_id_seq'::regclass);


--
-- Name: repair_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_types ALTER COLUMN id SET DEFAULT nextval('public.repair_types_id_seq'::regclass);


--
-- Name: reps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reps ALTER COLUMN id SET DEFAULT nextval('public.reps_id_seq'::regclass);


--
-- Name: units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units ALTER COLUMN id SET DEFAULT nextval('public.units_id_seq'::regclass);


--
-- Name: uploaded_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uploaded_files ALTER COLUMN id SET DEFAULT nextval('public.uploaded_files_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: widths id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.widths ALTER COLUMN id SET DEFAULT nextval('public.widths_id_seq'::regclass);


--
-- Name: yards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yards ALTER COLUMN id SET DEFAULT nextval('public.yards_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activities (id, container_id, activity_uid, activity_type, activity_status, assigned_to_type, assigned_to_id, inspection_comment, created_at, updated_at, activity_date) FROM stdin;
1	1	\N	\N	8	Admin	1	\N	2021-12-02 13:15:35.741919	2021-12-02 13:15:35.741919	\N
2	1	QF64089	0	9	Admin	1	\N	2021-12-02 13:15:54.115512	2021-12-02 13:16:01.388662	2021-12-02 00:00:00
3	1	QF59243	0	9	Admin	1	\N	2021-12-02 13:16:07.931554	2021-12-02 13:26:56.326522	2021-12-01 00:00:00
4	1	QF48963	0	9	Admin	1	\N	2021-12-02 13:28:48.504776	2021-12-02 13:57:44.949419	2021-12-02 00:00:00
5	1	QF14827	0	0	Admin	1	\N	2021-12-02 13:57:52.21676	2021-12-02 13:57:52.220578	2021-12-01 00:00:00
6	2	\N	\N	8	Admin	1	\N	2021-12-02 14:28:50.910124	2021-12-02 14:28:50.910124	\N
7	2	QF22016	0	2	Admin	1	\N	2021-12-02 14:31:50.328215	2021-12-02 14:42:13.342637	2021-12-01 00:00:00
\.


--
-- Data for Name: activity_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_attachments (id, activity_id, attachment_type, attachment, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: activity_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_items (id, activity_id, repair_code, container_repair_area_id, container_damaged_area_id, repair_type_id, location, hours, labour_cost_cents, labour_cost_currency, material_cost_cents, material_cost_currency, total_cost_cents, total_cost_currency, created_at, updated_at, damaged_area_image_id, repaired_area_image_id, comments, unit_id, length_id, width_id) FROM stdin;
1	3	1002	1	1	1	DBXN	15.6	187200	USD	114000	USD	301200	USD	2021-12-02 13:23:10.3395	2021-12-02 13:23:10.3395	9	\N	\N	1	2	1
2	4	1002	1	1	1	DBXN	15.6	187200	USD	114000	USD	301200	USD	2021-12-02 13:33:33.655752	2021-12-02 13:33:33.655752	10	\N	\N	1	2	1
3	7	9088	12	81	5	DBXN	0.2	500	USD	0	USD	500	USD	2021-12-02 14:40:35.521726	2021-12-02 14:40:35.521726	22	\N	\N	3	3	2
\.


--
-- Data for Name: activity_timelines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_timelines (id, history_status, history_date, created_at, updated_at, activity_id) FROM stdin;
1	0	2021-12-02 00:00:00	2021-12-02 13:15:54.129406	2021-12-02 13:15:54.129406	2
2	9	2021-12-02 00:00:00	2021-12-02 13:16:01.3895	2021-12-02 13:16:01.3895	2
3	0	2021-12-01 00:00:00	2021-12-02 13:16:07.937409	2021-12-02 13:16:07.937409	3
4	1	2021-12-02 00:00:00	2021-12-02 13:24:05.294678	2021-12-02 13:24:05.294678	3
5	2	2021-12-02 00:00:00	2021-12-02 13:24:13.737812	2021-12-02 13:24:13.737812	3
6	3	2021-12-02 00:00:00	2021-12-02 13:24:22.730444	2021-12-02 13:24:22.730444	3
7	4	2021-12-02 00:00:00	2021-12-02 13:24:31.590505	2021-12-02 13:24:31.590505	3
8	9	2021-12-02 00:00:00	2021-12-02 13:26:56.327359	2021-12-02 13:26:56.327359	3
12	0	2021-12-02 00:00:00	2021-12-02 13:34:00.852318	2021-12-02 13:34:00.852318	4
13	9	2021-12-02 00:00:00	2021-12-02 13:57:44.953027	2021-12-02 13:57:44.953027	4
14	0	2021-12-01 00:00:00	2021-12-02 13:57:52.222877	2021-12-02 13:57:52.222877	5
15	0	2021-12-01 00:00:00	2021-12-02 14:31:50.334536	2021-12-02 14:31:50.334536	7
16	1	2021-12-02 00:00:00	2021-12-02 14:41:00.184539	2021-12-02 14:41:00.184539	7
17	2	2021-12-02 00:00:00	2021-12-02 14:42:13.34335	2021-12-02 14:42:13.34335	7
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, first_name, last_name, phone_number, is_active, isd_code, display_picture, role, created_at, updated_at) FROM stdin;
1	test@test.com	$2a$12$Syp6ddaNim6PYywSPDrFxe62/fc7ntmDz6OM1ytzrK/B/FUx/2Tsq	\N	\N	\N	tester	tester	1231231231	\N	\N	\N	\N	2021-12-02 12:52:00.120647	2021-12-02 12:52:00.120647
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-12-02 12:48:59.494213	2021-12-02 12:48:59.494213
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name, province_id, created_at, updated_at) FROM stdin;
1	Saint John's	1	2021-12-02 12:49:11.952335	2021-12-02 12:49:11.952335
2	Jakarta	2	2021-12-02 12:49:11.961244	2021-12-02 12:49:11.961244
3	Phnom Penh	3	2021-12-02 12:49:11.969617	2021-12-02 12:49:11.969617
4	Paris	4	2021-12-02 12:49:11.978529	2021-12-02 12:49:11.978529
5	Port-Vila	5	2021-12-02 12:49:11.986675	2021-12-02 12:49:11.986675
\.


--
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.components (id, name, created_at, updated_at) FROM stdin;
1	Side Rail	2021-12-02 12:49:10.827758	2021-12-02 12:49:10.827758
2	Front Header	2021-12-02 12:49:10.831735	2021-12-02 12:49:10.831735
3	Door	2021-12-02 12:49:10.835422	2021-12-02 12:49:10.835422
4	Gusset	2021-12-02 12:49:10.838979	2021-12-02 12:49:10.838979
5	Rail	2021-12-02 12:49:10.842684	2021-12-02 12:49:10.842684
6	Panel	2021-12-02 12:49:10.846345	2021-12-02 12:49:10.846345
7	Rear Header	2021-12-02 12:49:10.849959	2021-12-02 12:49:10.849959
8	Corner Post Front	2021-12-02 12:49:10.853752	2021-12-02 12:49:10.853752
9	Vent	2021-12-02 12:49:10.857301	2021-12-02 12:49:10.857301
10	Corner Post Rear	2021-12-02 12:49:10.86098	2021-12-02 12:49:10.86098
11	Corner Post J SECTION	2021-12-02 12:49:10.864518	2021-12-02 12:49:10.864518
12	Casting Top	2021-12-02 12:49:10.868192	2021-12-02 12:49:10.868192
13	Casting Bottom	2021-12-02 12:49:10.871778	2021-12-02 12:49:10.871778
14	Door Panel	2021-12-02 12:49:10.875675	2021-12-02 12:49:10.875675
15	Gasket	2021-12-02 12:49:10.879295	2021-12-02 12:49:10.879295
16	Lock Rod	2021-12-02 12:49:10.883086	2021-12-02 12:49:10.883086
17	Lock Rod Guide	2021-12-02 12:49:10.886689	2021-12-02 12:49:10.886689
18	Handle	2021-12-02 12:49:10.890204	2021-12-02 12:49:10.890204
19	Handle Retainer	2021-12-02 12:49:10.893735	2021-12-02 12:49:10.893735
20	Cam End	2021-12-02 12:49:10.897291	2021-12-02 12:49:10.897291
21	Cam End Guide	2021-12-02 12:49:10.900944	2021-12-02 12:49:10.900944
22	Keeper	2021-12-02 12:49:10.904477	2021-12-02 12:49:10.904477
23	SECURITY KEEPER	2021-12-02 12:49:10.908154	2021-12-02 12:49:10.908154
24	Hinge	2021-12-02 12:49:10.912182	2021-12-02 12:49:10.912182
25	Frame	2021-12-02 12:49:10.915721	2021-12-02 12:49:10.915721
26	Gasket Retainer	2021-12-02 12:49:10.9192	2021-12-02 12:49:10.9192
27	Anti racking device	2021-12-02 12:49:10.92269	2021-12-02 12:49:10.92269
28	Security Plate	2021-12-02 12:49:10.926379	2021-12-02 12:49:10.926379
29	Plywood	2021-12-02 12:49:10.929901	2021-12-02 12:49:10.929901
30	Top Hat Section	2021-12-02 12:49:10.933494	2021-12-02 12:49:10.933494
31	Lashing Ring / Bar	2021-12-02 12:49:10.93727	2021-12-02 12:49:10.93727
32	Stiffener	2021-12-02 12:49:10.940776	2021-12-02 12:49:10.940776
33	Door Sill	2021-12-02 12:49:10.944301	2021-12-02 12:49:10.944301
34	CrossMember	2021-12-02 12:49:10.947891	2021-12-02 12:49:10.947891
35	Forklift Pocket	2021-12-02 12:49:10.951426	2021-12-02 12:49:10.951426
36	Gooseneck Tunnel	2021-12-02 12:49:10.955046	2021-12-02 12:49:10.955046
37	Shortcrossmember (Outrigger)	2021-12-02 12:49:10.973139	2021-12-02 12:49:10.973139
38	Front Sill	2021-12-02 12:49:10.976997	2021-12-02 12:49:10.976997
39	Residues	2021-12-02 12:49:10.980583	2021-12-02 12:49:10.980583
40	Dangerous Goods Labels	2021-12-02 12:49:10.984177	2021-12-02 12:49:10.984177
41	Cargo Labels	2021-12-02 12:49:10.987855	2021-12-02 12:49:10.987855
42	Sweeping	2021-12-02 12:49:10.991582	2021-12-02 12:49:10.991582
43	Washing	2021-12-02 12:49:10.995318	2021-12-02 12:49:10.995318
44	Chemical Clean	2021-12-02 12:49:10.999052	2021-12-02 12:49:10.999052
45	Odor	2021-12-02 12:49:11.002832	2021-12-02 12:49:11.002832
46	0 - 20%	2021-12-02 12:49:11.007528	2021-12-02 12:49:11.007528
47	21-40%	2021-12-02 12:49:11.011543	2021-12-02 12:49:11.011543
48	41-60%	2021-12-02 12:49:11.015393	2021-12-02 12:49:11.015393
49	61-80%	2021-12-02 12:49:11.01907	2021-12-02 12:49:11.01907
50	81-100%	2021-12-02 12:49:11.022766	2021-12-02 12:49:11.022766
51	20 FT/40 FT	2021-12-02 12:49:11.026562	2021-12-02 12:49:11.026562
52	Unit Number	2021-12-02 12:49:11.030157	2021-12-02 12:49:11.030157
53	Letter	2021-12-02 12:49:11.03374	2021-12-02 12:49:11.03374
54	Country code	2021-12-02 12:49:11.037592	2021-12-02 12:49:11.037592
55	Mass marking	2021-12-02 12:49:11.041256	2021-12-02 12:49:11.041256
56	Owner's code	2021-12-02 12:49:11.044817	2021-12-02 12:49:11.044817
57	Size/type marking	2021-12-02 12:49:11.048396	2021-12-02 12:49:11.048396
58	Markings - single digit/character	2021-12-02 12:49:11.052109	2021-12-02 12:49:11.052109
59	Serial number and check digit	2021-12-02 12:49:11.05576	2021-12-02 12:49:11.05576
60	Consolidated data plate	2021-12-02 12:49:11.059525	2021-12-02 12:49:11.059525
61	Height marking	2021-12-02 12:49:11.063247	2021-12-02 12:49:11.063247
62	High-cube stripe	2021-12-02 12:49:11.066803	2021-12-02 12:49:11.066803
63	Caution marking	2021-12-02 12:49:11.070611	2021-12-02 12:49:11.070611
64	Owner's logo door	2021-12-02 12:49:11.074287	2021-12-02 12:49:11.074287
65	Owner's logo side panel	2021-12-02 12:49:11.077784	2021-12-02 12:49:11.077784
66	UIC decal	2021-12-02 12:49:11.081325	2021-12-02 12:49:11.081325
67	CSC - Plate	2021-12-02 12:49:11.08492	2021-12-02 12:49:11.08492
68	Operator - Plate	2021-12-02 12:49:11.088538	2021-12-02 12:49:11.088538
69	Customs - Plate	2021-12-02 12:49:11.092053	2021-12-02 12:49:11.092053
70	Fill and Paint	2021-12-02 12:49:11.095717	2021-12-02 12:49:11.095717
71	Paint	2021-12-02 12:49:11.099336	2021-12-02 12:49:11.099336
72	VENT/AIR BAFFLE	2021-12-02 12:49:11.102922	2021-12-02 12:49:11.102922
73	THRESHOLD PLATE / SILL GUTTER	2021-12-02 12:49:11.106499	2021-12-02 12:49:11.106499
74	GASKET INNER	2021-12-02 12:49:11.110136	2021-12-02 12:49:11.110136
75	GASKET RETAINER STRIP	2021-12-02 12:49:11.113795	2021-12-02 12:49:11.113795
76	GASKET OUTER	2021-12-02 12:49:11.117297	2021-12-02 12:49:11.117297
77	DOOR HINGE BLADE	2021-12-02 12:49:11.121012	2021-12-02 12:49:11.121012
78	DOOR HINGE PIN	2021-12-02 12:49:11.124614	2021-12-02 12:49:11.124614
79	INNER LINING PANELS	2021-12-02 12:49:11.128127	2021-12-02 12:49:11.128127
80	INSULATION MATERIAL	2021-12-02 12:49:11.13171	2021-12-02 12:49:11.13171
81	PANEL OUTER FACE	2021-12-02 12:49:11.135277	2021-12-02 12:49:11.135277
82	SUBFLOOR PANEL	2021-12-02 12:49:11.138883	2021-12-02 12:49:11.138883
83	T-FLOOR	2021-12-02 12:49:11.142387	2021-12-02 12:49:11.142387
84	T-FLOOR GUTTER	2021-12-02 12:49:11.145892	2021-12-02 12:49:11.145892
85	T-FLOOR STRIP	2021-12-02 12:49:11.149422	2021-12-02 12:49:11.149422
86	SIDE B/HEAD DOORS | LH	2021-12-02 12:49:11.152978	2021-12-02 12:49:11.152978
87	GENSET BRACKET/MOUNTING HOLE	2021-12-02 12:49:11.156492	2021-12-02 12:49:11.156492
\.


--
-- Data for Name: comps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comps (id, name, created_at, updated_at, material, description) FROM stdin;
22	ARD	2021-12-02 12:49:09.663221	2021-12-02 12:49:09.663221	\N	\N
8	CFG	2021-12-02 12:49:09.611154	2021-12-02 12:49:09.831602	ST	casting bottom
28	CMA	2021-12-02 12:49:09.685135	2021-12-02 12:49:09.836729	ST	cross member
31	CMO	2021-12-02 12:49:09.6958	2021-12-02 12:49:09.841266	ST	outrigger
5	CPA	2021-12-02 12:49:09.600355	2021-12-02 12:49:09.845784	ST	corner post assembly
7	CPJ	2021-12-02 12:49:09.607543	2021-12-02 12:49:09.850316	ST	corner post j section
14	DHC	2021-12-02 12:49:09.633157	2021-12-02 12:49:09.854925	ST	door handle catch
13	DHR	2021-12-02 12:49:09.629548	2021-12-02 12:49:09.859432	ST	door handle retainer
23	DPL	2021-12-02 12:49:09.666861	2021-12-02 12:49:09.863874	ST	door stop/slam plate
55	TFA	2021-12-02 12:49:09.800231	2021-12-02 12:49:10.067353	ST	\N
26	FHS	2021-12-02 12:49:09.677825	2021-12-02 12:49:09.875365	ST	Threshold plate
29	FLA	2021-12-02 12:49:09.688644	2021-12-02 12:49:09.88004	ST	wood floor assembly
24	FPP	2021-12-02 12:49:09.670535	2021-12-02 12:49:09.884518	PP	gasket retainer
48	FTP	2021-12-02 12:49:09.774816	2021-12-02 12:49:09.889911	ST	header extension plate
25	FWA	2021-12-02 12:49:09.674094	2021-12-02 12:49:09.894828	PP	hinge
21	GRS	2021-12-02 12:49:09.659486	2021-12-02 12:49:09.899607	ST	hinge pin
9	GTA	2021-12-02 12:49:09.614805	2021-12-02 12:49:09.90409	RU	locking bar bracket
3	HEP	2021-12-02 12:49:09.592078	2021-12-02 12:49:09.908378	ST	cam end
18	HGA	2021-12-02 12:49:09.648313	2021-12-02 12:49:09.91281	ST	locking bar guide
19	HGP	2021-12-02 12:49:09.652161	2021-12-02 12:49:09.917193	ST	handle
16	LBB	2021-12-02 12:49:09.640828	2021-12-02 12:49:09.921531	ST	lock rod
15	LBC	2021-12-02 12:49:09.636889	2021-12-02 12:49:09.925981	ST	lashing ring
11	LBG	2021-12-02 12:49:09.622247	2021-12-02 12:49:09.930313	ST	caution marking
12	LBH	2021-12-02 12:49:09.625768	2021-12-02 12:49:09.934759	ST	country code
10	LBR	2021-12-02 12:49:09.618471	2021-12-02 12:49:09.939079	ST	cargo container - entire container
27	LSR	2021-12-02 12:49:09.681388	2021-12-02 12:49:09.943595	ST	high cube strips
32	MCA	2021-12-02 12:49:09.712703	2021-12-02 12:49:09.963067	ST	height marking
35	MCC	2021-12-02 12:49:09.726363	2021-12-02 12:49:09.968087	ST	mass marking
33	MCO	2021-12-02 12:49:09.716653	2021-12-02 12:49:09.972835	ST	owner's code
42	MHC	2021-12-02 12:49:09.752638	2021-12-02 12:49:09.977479	ST	owner's logo
41	MHT	2021-12-02 12:49:09.748868	2021-12-02 12:49:09.982096	ST	consolidated data plate
36	MMI	2021-12-02 12:49:09.730238	2021-12-02 12:49:09.986782	ST	owner's plate
37	MOC	2021-12-02 12:49:09.734107	2021-12-02 12:49:09.991547	ST	CSC plates
43	MOL	2021-12-02 12:49:09.756382	2021-12-02 12:49:09.996369	ST	markings-single digit/char
40	MPD	2021-12-02 12:49:09.745194	2021-12-02 12:49:10.001205	ST	serial number and check digit
46	MPO	2021-12-02 12:49:09.767496	2021-12-02 12:49:10.005825	ST	size/type marking
45	MPS	2021-12-02 12:49:09.763602	2021-12-02 12:49:10.010373	ST	UIC decal
34	MSD	2021-12-02 12:49:09.722408	2021-12-02 12:49:10.014853	ST	panel / reefer
39	MSN	2021-12-02 12:49:09.741557	2021-12-02 12:49:10.019321	ST	panel / reefer
38	MST	2021-12-02 12:49:09.737832	2021-12-02 12:49:10.024546	ST	keeper
44	MUI	2021-12-02 12:49:09.75997	2021-12-02 12:49:10.029153	ST	rail / door, front sill
4	PAA	2021-12-02 12:49:09.596666	2021-12-02 12:49:10.033868	ST	rail gusset
17	RCK	2021-12-02 12:49:09.644708	2021-12-02 12:49:10.039305	ST	vent
1	RLA	2021-12-02 12:49:09.584388	2021-12-02 12:49:10.043881	ST	Gaskets
2	RLG	2021-12-02 12:49:09.588482	2021-12-02 12:49:10.048343	ST	Gaskets
30	RTL	2021-12-02 12:49:09.692276	2021-12-02 12:49:10.052747	ST	Roof Corner Gusset - Steel
6	VRA	2021-12-02 12:49:09.603989	2021-12-02 12:49:10.057301	ST	Hinge Blade
20	DSC	2021-12-02 12:49:09.655834	2021-12-02 12:49:10.06184	ST	\N
56	TFG	2021-12-02 12:49:09.803789	2021-12-02 12:49:10.071914	ST	\N
47	ABP	2021-12-02 12:49:09.771222	2021-12-02 12:49:10.076737	ST	\N
49	GIN	2021-12-02 12:49:09.778543	2021-12-02 12:49:10.081589	RU	\N
50	GTO	2021-12-02 12:49:09.782242	2021-12-02 12:49:10.085945	RU	\N
51	HGB	2021-12-02 12:49:09.785879	2021-12-02 12:49:10.091244	ST	\N
52	PIC	2021-12-02 12:49:09.789418	2021-12-02 12:49:10.096019	ST	\N
53	PIM	2021-12-02 12:49:09.793051	2021-12-02 12:49:10.100636	ST	\N
54	POP	2021-12-02 12:49:09.796706	2021-12-02 12:49:10.105153	ST	\N
57	TFI	2021-12-02 12:49:09.807364	2021-12-02 12:49:10.109799	ST	\N
58	EPA	2021-12-02 12:49:09.810972	2021-12-02 12:49:10.114416	ST	\N
59	CHU	2021-12-02 12:49:09.814641	2021-12-02 12:49:10.118814	ST	\N
\.


--
-- Data for Name: container_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container_attachments (id, container_id, attachment_type, created_at, updated_at, attachment_id) FROM stdin;
9	1	2	2021-12-02 13:26:08.347444	2021-12-02 13:26:08.347444	1
10	1	0	2021-12-02 13:26:08.349872	2021-12-02 13:26:08.349872	8
11	1	1	2021-12-02 13:26:08.352005	2021-12-02 13:26:08.352005	7
12	1	3	2021-12-02 13:26:08.354147	2021-12-02 13:26:08.354147	6
13	1	4	2021-12-02 13:26:08.35626	2021-12-02 13:26:08.35626	5
14	1	5	2021-12-02 13:26:08.358396	2021-12-02 13:26:08.358396	4
15	1	6	2021-12-02 13:26:08.360556	2021-12-02 13:26:08.360556	3
16	1	7	2021-12-02 13:26:08.362603	2021-12-02 13:26:08.362603	2
25	2	2	2021-12-02 14:29:18.594832	2021-12-02 14:29:18.594832	14
26	2	0	2021-12-02 14:29:18.597603	2021-12-02 14:29:18.597603	15
27	2	1	2021-12-02 14:29:18.599928	2021-12-02 14:29:18.599928	16
28	2	3	2021-12-02 14:29:18.602308	2021-12-02 14:29:18.602308	17
29	2	4	2021-12-02 14:29:18.604668	2021-12-02 14:29:18.604668	18
30	2	5	2021-12-02 14:29:18.606952	2021-12-02 14:29:18.606952	19
31	2	6	2021-12-02 14:29:18.609319	2021-12-02 14:29:18.609319	20
32	2	7	2021-12-02 14:29:18.611589	2021-12-02 14:29:18.611589	21
\.


--
-- Data for Name: container_damaged_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container_damaged_areas (id, name, created_at, updated_at) FROM stdin;
1	Top Longitudinal Rails	2021-12-02 12:49:08.728194	2021-12-02 12:49:08.728194
2	Front Header	2021-12-02 12:49:08.732197	2021-12-02 12:49:08.732197
3	Rear Header	2021-12-02 12:49:08.736034	2021-12-02 12:49:08.736034
4	Corner Plate/Gusset	2021-12-02 12:49:08.739863	2021-12-02 12:49:08.739863
5	Header extension plate	2021-12-02 12:49:08.743531	2021-12-02 12:49:08.743531
6	Roof panel	2021-12-02 12:49:08.74721	2021-12-02 12:49:08.74721
7	Front Panel	2021-12-02 12:49:08.750842	2021-12-02 12:49:08.750842
8	Corner Post (Front)	2021-12-02 12:49:08.754524	2021-12-02 12:49:08.754524
9	Vents	2021-12-02 12:49:08.758143	2021-12-02 12:49:08.758143
10	Side Panel	2021-12-02 12:49:08.761597	2021-12-02 12:49:08.761597
11	Corner Post (Rear)	2021-12-02 12:49:08.765255	2021-12-02 12:49:08.765255
12	Corner castings (Top)	2021-12-02 12:49:08.769107	2021-12-02 12:49:08.769107
13	Corner castings (Bottom)	2021-12-02 12:49:08.772781	2021-12-02 12:49:08.772781
14	Corner castings	2021-12-02 12:49:08.776488	2021-12-02 12:49:08.776488
15	Door Panel	2021-12-02 12:49:08.780007	2021-12-02 12:49:08.780007
16	Door Gasket	2021-12-02 12:49:08.783602	2021-12-02 12:49:08.783602
17	Lock Rod	2021-12-02 12:49:08.787066	2021-12-02 12:49:08.787066
18	Lock Rod Guide	2021-12-02 12:49:08.790817	2021-12-02 12:49:08.790817
19	Handle	2021-12-02 12:49:08.794416	2021-12-02 12:49:08.794416
20	Handle retainer	2021-12-02 12:49:08.798077	2021-12-02 12:49:08.798077
21	Handle catch	2021-12-02 12:49:08.801604	2021-12-02 12:49:08.801604
22	Cam End	2021-12-02 12:49:08.805177	2021-12-02 12:49:08.805177
23	Cam End Guide	2021-12-02 12:49:08.808738	2021-12-02 12:49:08.808738
24	Keeper	2021-12-02 12:49:08.812631	2021-12-02 12:49:08.812631
25	Keeper (Security)	2021-12-02 12:49:08.816192	2021-12-02 12:49:08.816192
26	Hinge	2021-12-02 12:49:08.819762	2021-12-02 12:49:08.819762
27	Hinge Pin	2021-12-02 12:49:08.823492	2021-12-02 12:49:08.823492
28	Door frame (Stiffener)	2021-12-02 12:49:08.827114	2021-12-02 12:49:08.827114
29	Gasket retainer	2021-12-02 12:49:08.8308	2021-12-02 12:49:08.8308
30	Anti racking device	2021-12-02 12:49:08.834488	2021-12-02 12:49:08.834488
31	Door stop/slam (security) plate	2021-12-02 12:49:08.837993	2021-12-02 12:49:08.837993
32	Flooring	2021-12-02 12:49:08.841571	2021-12-02 12:49:08.841571
33	Top Hat Section	2021-12-02 12:49:08.847303	2021-12-02 12:49:08.847303
34	Lashing Ring / Bar	2021-12-02 12:49:08.850984	2021-12-02 12:49:08.850984
35	Bottom Longitudinal Rails	2021-12-02 12:49:08.85471	2021-12-02 12:49:08.85471
36	Bottom Longitudinal Rail (Stiffeners)	2021-12-02 12:49:08.858339	2021-12-02 12:49:08.858339
37	Rear Sill (Door sill)	2021-12-02 12:49:08.862048	2021-12-02 12:49:08.862048
38	Front Sill - Rear Sill Stiffeners (Door sill)	2021-12-02 12:49:08.865854	2021-12-02 12:49:08.865854
39	Crossmember	2021-12-02 12:49:08.869635	2021-12-02 12:49:08.869635
40	Forklift Pocket	2021-12-02 12:49:08.873476	2021-12-02 12:49:08.873476
41	Gooseneck Tunnel	2021-12-02 12:49:08.877208	2021-12-02 12:49:08.877208
42	Shortcrossmember (Outrigger)	2021-12-02 12:49:08.881254	2021-12-02 12:49:08.881254
43	Front Sill	2021-12-02 12:49:08.88549	2021-12-02 12:49:08.88549
44	Cleaning	2021-12-02 12:49:08.889305	2021-12-02 12:49:08.889305
45	Unit Number	2021-12-02 12:49:08.913034	2021-12-02 12:49:08.913034
46	Letter	2021-12-02 12:49:08.916698	2021-12-02 12:49:08.916698
47	Country code	2021-12-02 12:49:08.920486	2021-12-02 12:49:08.920486
48	Mass marking	2021-12-02 12:49:08.924362	2021-12-02 12:49:08.924362
49	Owner's code	2021-12-02 12:49:08.928135	2021-12-02 12:49:08.928135
50	Size/type marking	2021-12-02 12:49:08.932017	2021-12-02 12:49:08.932017
51	Markings - single digit/character	2021-12-02 12:49:08.935705	2021-12-02 12:49:08.935705
52	Serial number and check digit	2021-12-02 12:49:08.939497	2021-12-02 12:49:08.939497
53	Consolidated data plate	2021-12-02 12:49:08.943329	2021-12-02 12:49:08.943329
54	Height marking	2021-12-02 12:49:08.947259	2021-12-02 12:49:08.947259
55	High-cube stripe	2021-12-02 12:49:08.95103	2021-12-02 12:49:08.95103
56	Caution marking	2021-12-02 12:49:08.954885	2021-12-02 12:49:08.954885
57	Owner's logo door	2021-12-02 12:49:08.958664	2021-12-02 12:49:08.958664
58	Owner's logo side panel	2021-12-02 12:49:08.962504	2021-12-02 12:49:08.962504
59	UIC decal	2021-12-02 12:49:08.966046	2021-12-02 12:49:08.966046
60	CSC - Plate	2021-12-02 12:49:08.969687	2021-12-02 12:49:08.969687
61	Operator - Plate	2021-12-02 12:49:08.975511	2021-12-02 12:49:08.975511
62	Customs - Plate	2021-12-02 12:49:08.979137	2021-12-02 12:49:08.979137
63	Interior Walls	2021-12-02 12:49:08.982843	2021-12-02 12:49:08.982843
64	Markings	2021-12-02 12:49:08.986361	2021-12-02 12:49:08.986361
65	Inspection	2021-12-02 12:49:08.990048	2021-12-02 12:49:08.990048
66	VENT/AIR BAFFLE	2021-12-02 12:49:08.993965	2021-12-02 12:49:08.993965
67	THRESHOLD PLATE / SILL GUTTER	2021-12-02 12:49:08.997663	2021-12-02 12:49:08.997663
68	GASKET INNER	2021-12-02 12:49:09.001503	2021-12-02 12:49:09.001503
69	GASKET RETAINER STRIP	2021-12-02 12:49:09.005306	2021-12-02 12:49:09.005306
70	GASKET OUTER	2021-12-02 12:49:09.008878	2021-12-02 12:49:09.008878
71	DOOR HINGE BLADE	2021-12-02 12:49:09.012912	2021-12-02 12:49:09.012912
72	DOOR HINGE PIN	2021-12-02 12:49:09.018758	2021-12-02 12:49:09.018758
73	INNER LINING PANELS	2021-12-02 12:49:09.022457	2021-12-02 12:49:09.022457
74	INSULATION MATERIAL	2021-12-02 12:49:09.026015	2021-12-02 12:49:09.026015
75	PANEL OUTER FACE	2021-12-02 12:49:09.029885	2021-12-02 12:49:09.029885
76	SUBFLOOR PANEL	2021-12-02 12:49:09.033584	2021-12-02 12:49:09.033584
77	T-FLOOR	2021-12-02 12:49:09.037334	2021-12-02 12:49:09.037334
78	T-FLOOR GUTTER	2021-12-02 12:49:09.040997	2021-12-02 12:49:09.040997
79	T-FLOOR STRIP	2021-12-02 12:49:09.04462	2021-12-02 12:49:09.04462
80	SIDE B/HEAD DOORS | LH	2021-12-02 12:49:09.048157	2021-12-02 12:49:09.048157
81	GENSET BRACKET/MOUNTING HOLE	2021-12-02 12:49:09.051696	2021-12-02 12:49:09.051696
\.


--
-- Data for Name: container_heights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container_heights (id, name, created_at, updated_at) FROM stdin;
1	8.0	2021-12-02 12:49:11.400043	2021-12-02 12:49:11.400043
2	1.0	2021-12-02 12:49:11.404378	2021-12-02 12:49:11.404378
3	10.0	2021-12-02 12:49:11.407987	2021-12-02 12:49:11.407987
4	20.0	2021-12-02 12:49:11.411552	2021-12-02 12:49:11.411552
5	240.0	2021-12-02 12:49:11.415104	2021-12-02 12:49:11.415104
6	45.0	2021-12-02 12:49:11.418714	2021-12-02 12:49:11.418714
7	55.0	2021-12-02 12:49:11.422347	2021-12-02 12:49:11.422347
8	60.0	2021-12-02 12:49:11.425876	2021-12-02 12:49:11.425876
9	65.0	2021-12-02 12:49:11.429376	2021-12-02 12:49:11.429376
10	80.0	2021-12-02 12:49:11.432846	2021-12-02 12:49:11.432846
11	90.0	2021-12-02 12:49:11.436335	2021-12-02 12:49:11.436335
12	100.0	2021-12-02 12:49:11.441247	2021-12-02 12:49:11.441247
13	120.0	2021-12-02 12:49:11.444742	2021-12-02 12:49:11.444742
14	140.0	2021-12-02 12:49:11.448415	2021-12-02 12:49:11.448415
15	170.0	2021-12-02 12:49:11.452172	2021-12-02 12:49:11.452172
16	200.0	2021-12-02 12:49:11.455834	2021-12-02 12:49:11.455834
17	300.0	2021-12-02 12:49:11.459693	2021-12-02 12:49:11.459693
18	400.0	2021-12-02 12:49:11.478003	2021-12-02 12:49:11.478003
19	3.0	2021-12-02 12:49:11.481604	2021-12-02 12:49:11.481604
20	4.0	2021-12-02 12:49:11.485428	2021-12-02 12:49:11.485428
21	5.0	2021-12-02 12:49:11.489354	2021-12-02 12:49:11.489354
22	6.0	2021-12-02 12:49:11.493306	2021-12-02 12:49:11.493306
23	32.0	2021-12-02 12:49:11.497102	2021-12-02 12:49:11.497102
\.


--
-- Data for Name: container_lengths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container_lengths (id, name, created_at, updated_at) FROM stdin;
1	20.0	2021-12-02 12:49:11.185224	2021-12-02 12:49:11.185224
2	40.0	2021-12-02 12:49:11.189178	2021-12-02 12:49:11.189178
3	15.0	2021-12-02 12:49:11.192661	2021-12-02 12:49:11.192661
4	30.0	2021-12-02 12:49:11.196305	2021-12-02 12:49:11.196305
5	60.0	2021-12-02 12:49:11.199838	2021-12-02 12:49:11.199838
6	90.0	2021-12-02 12:49:11.203504	2021-12-02 12:49:11.203504
7	120.0	2021-12-02 12:49:11.207012	2021-12-02 12:49:11.207012
8	150.0	2021-12-02 12:49:11.226021	2021-12-02 12:49:11.226021
9	200.0	2021-12-02 12:49:11.230045	2021-12-02 12:49:11.230045
10	10.0	2021-12-02 12:49:11.233907	2021-12-02 12:49:11.233907
11	1.0	2021-12-02 12:49:11.238065	2021-12-02 12:49:11.238065
12	110.0	2021-12-02 12:49:11.242252	2021-12-02 12:49:11.242252
13	45.0	2021-12-02 12:49:11.246176	2021-12-02 12:49:11.246176
14	55.0	2021-12-02 12:49:11.250069	2021-12-02 12:49:11.250069
15	65.0	2021-12-02 12:49:11.254081	2021-12-02 12:49:11.254081
16	80.0	2021-12-02 12:49:11.257881	2021-12-02 12:49:11.257881
17	100.0	2021-12-02 12:49:11.261637	2021-12-02 12:49:11.261637
18	180.0	2021-12-02 12:49:11.265322	2021-12-02 12:49:11.265322
19	240.0	2021-12-02 12:49:11.2692	2021-12-02 12:49:11.2692
20	300.0	2021-12-02 12:49:11.273111	2021-12-02 12:49:11.273111
21	360.0	2021-12-02 12:49:11.276736	2021-12-02 12:49:11.276736
22	420.0	2021-12-02 12:49:11.280534	2021-12-02 12:49:11.280534
23	480.0	2021-12-02 12:49:11.284249	2021-12-02 12:49:11.284249
24	540.0	2021-12-02 12:49:11.288002	2021-12-02 12:49:11.288002
25	600.0	2021-12-02 12:49:11.291736	2021-12-02 12:49:11.291736
26	270.0	2021-12-02 12:49:11.295859	2021-12-02 12:49:11.295859
27	2.0	2021-12-02 12:49:11.299427	2021-12-02 12:49:11.299427
28	3.0	2021-12-02 12:49:11.304142	2021-12-02 12:49:11.304142
29	4.0	2021-12-02 12:49:11.307768	2021-12-02 12:49:11.307768
30	5.0	2021-12-02 12:49:11.311407	2021-12-02 12:49:11.311407
31	6.0	2021-12-02 12:49:11.31512	2021-12-02 12:49:11.31512
32	7.0	2021-12-02 12:49:11.318815	2021-12-02 12:49:11.318815
33	8.0	2021-12-02 12:49:11.322512	2021-12-02 12:49:11.322512
34	210.0	2021-12-02 12:49:11.326252	2021-12-02 12:49:11.326252
35	12.0	2021-12-02 12:49:11.32993	2021-12-02 12:49:11.32993
36	24.0	2021-12-02 12:49:11.333532	2021-12-02 12:49:11.333532
37	36.0	2021-12-02 12:49:11.337181	2021-12-02 12:49:11.337181
38	48.0	2021-12-02 12:49:11.34088	2021-12-02 12:49:11.34088
39	72.0	2021-12-02 12:49:11.344598	2021-12-02 12:49:11.344598
40	84.0	2021-12-02 12:49:11.348287	2021-12-02 12:49:11.348287
41	96.0	2021-12-02 12:49:11.352084	2021-12-02 12:49:11.352084
42	108.0	2021-12-02 12:49:11.355721	2021-12-02 12:49:11.355721
43	140.0	2021-12-02 12:49:11.359533	2021-12-02 12:49:11.359533
44	170.0	2021-12-02 12:49:11.363114	2021-12-02 12:49:11.363114
45	390.0	2021-12-02 12:49:11.366765	2021-12-02 12:49:11.366765
46	16.0	2021-12-02 12:49:11.370367	2021-12-02 12:49:11.370367
47	9.0	2021-12-02 12:49:11.374085	2021-12-02 12:49:11.374085
48	11.0	2021-12-02 12:49:11.377781	2021-12-02 12:49:11.377781
49	400.0	2021-12-02 12:49:11.381462	2021-12-02 12:49:11.381462
50	50.0	2021-12-02 12:49:11.385126	2021-12-02 12:49:11.385126
51	550.0	2021-12-02 12:49:11.388588	2021-12-02 12:49:11.388588
\.


--
-- Data for Name: container_repair_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container_repair_areas (id, name, created_at, updated_at) FROM stdin;
1	Top Rails and Headers	2021-12-02 12:49:08.673743	2021-12-02 12:49:08.673743
2	Roof	2021-12-02 12:49:08.678388	2021-12-02 12:49:08.678388
3	Side and Front Panels	2021-12-02 12:49:08.682136	2021-12-02 12:49:08.682136
4	Posts	2021-12-02 12:49:08.685835	2021-12-02 12:49:08.685835
5	Doors	2021-12-02 12:49:08.68955	2021-12-02 12:49:08.68955
6	Inside and Floor	2021-12-02 12:49:08.693232	2021-12-02 12:49:08.693232
7	Underside	2021-12-02 12:49:08.696901	2021-12-02 12:49:08.696901
8	Cleaning	2021-12-02 12:49:08.700377	2021-12-02 12:49:08.700377
9	Markings	2021-12-02 12:49:08.704107	2021-12-02 12:49:08.704107
10	Malt	2021-12-02 12:49:08.70771	2021-12-02 12:49:08.70771
11	Inspection	2021-12-02 12:49:08.711493	2021-12-02 12:49:08.711493
12	Reefer	2021-12-02 12:49:08.715306	2021-12-02 12:49:08.715306
\.


--
-- Data for Name: container_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.container_types (id, name, created_at, updated_at) FROM stdin;
1	G1 - DV	2021-12-02 12:49:11.52904	2021-12-02 12:49:11.52904
2	R1 Refrigerated Container	2021-12-02 12:49:11.533446	2021-12-02 12:49:11.533446
3	U1 Open Top Container	2021-12-02 12:49:11.537562	2021-12-02 12:49:11.537562
4	P1 Platform Container	2021-12-02 12:49:11.541169	2021-12-02 12:49:11.541169
5	T1 Tank Container	2021-12-02 12:49:11.544868	2021-12-02 12:49:11.544868
\.


--
-- Data for Name: containers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.containers (id, container_uid, yard_id, customer_id, container_owner_name, submitter_initials, container_type_id, manufacture_year, location, comments, created_at, updated_at, container_status, container_length_id, container_height_id) FROM stdin;
1	MSKU 907032-3	2	1	Jackie Chan	JC	2	2020	DBXN		2021-12-02 13:15:35.706516	2021-12-02 13:57:52.234457	1	4	5
2	MRKU 953040-6	2	2	Maersk Manager	MM	1	2020	DBXN		2021-12-02 14:28:50.886091	2021-12-02 14:31:50.34684	1	6	6
\.


--
-- Data for Name: customer_repair_list_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_repair_list_items (id, customer_repair_list_id, uid, container_repair_area_id, container_damaged_area_id, repair_type_id, is_non_mearsk_not_applicable, non_mearsk_hours, non_mearsk_material_cost_cents, non_mearsk_material_cost_currency, non_mearsk_description, comp_id, rep_id, dam_id, component_id, event_id, location, unit_id, non_mearsk_id_source, is_mearsk_not_applicable, mearsk_max_material_cost_cents, mearsk_max_material_cost_currency, mearsk_unit_material_cost_cents, mearsk_unit_material_cost_currency, mearsk_hours_per_unit, mesrsk_max_pieces, mearsk_units, repair_mode_id, mode_number_id, repair_code, combined, mearsk_description, mearsk_id_source, deleted_at, created_at, updated_at, width_id, length_id) FROM stdin;
1	1	1001	1	1	1	\N	7.8	57000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3421.0	\N	\N	\N	\N	2021-12-02 13:14:25.184109	2021-12-02 13:14:25.184109	1	1
2	1	1002	1	1	1	\N	15.6	114000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	15.6	\N	1	1	\N	3422.0	\N	\N	\N	\N	2021-12-02 13:14:25.192786	2021-12-02 13:14:25.192786	1	2
3	1	1003	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	3600	USD	1.1	\N	1	1	\N	3451.0	\N	\N	\N	\N	2021-12-02 13:14:25.198623	2021-12-02 13:14:25.198623	2	3
4	1	1004	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	5040	USD	1.4	\N	1	1	\N	3452.0	\N	\N	\N	\N	2021-12-02 13:14:25.204474	2021-12-02 13:14:25.204474	2	1
5	1	1005	1	1	2	\N	1.5	3398	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	6480	USD	1.6	\N	1	1	\N	3453.0	\N	\N	\N	\N	2021-12-02 13:14:25.238564	2021-12-02 13:14:25.238564	2	4
6	1	1006	1	1	2	\N	2	4248	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	3454.0	\N	\N	\N	\N	2021-12-02 13:14:25.244541	2021-12-02 13:14:25.244541	2	5
7	1	1007	1	1	2	\N	2.5	5947	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	13680	USD	2.7	\N	1	1	\N	3455.0	\N	\N	\N	\N	2021-12-02 13:14:25.25059	2021-12-02 13:14:25.25059	2	6
8	1	1008	1	1	2	\N	2.8	7646	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	17280	USD	3.8	\N	1	1	\N	3456.0	\N	\N	\N	\N	2021-12-02 13:14:25.25604	2021-12-02 13:14:25.25604	2	7
9	1	1009	1	1	2	\N	3	10526	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	0	USD	4.9	\N	1	1	\N	3457.0	\N	\N	\N	\N	2021-12-02 13:14:25.261556	2021-12-02 13:14:25.261556	2	8
10	1	1010	1	1	3	\N	0.9	1699	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	1440	USD	0.7	\N	1	1	\N	3441.0	\N	\N	\N	\N	2021-12-02 13:14:25.266991	2021-12-02 13:14:25.266991	2	3
11	1	1011	1	1	3	\N	0.9	2195	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2160	USD	0.8	\N	1	1	\N	3442.0	\N	\N	\N	\N	2021-12-02 13:14:25.272514	2021-12-02 13:14:25.272514	2	1
12	1	1012	1	1	3	\N	1	2549	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2880	USD	0.9	\N	1	1	\N	3443.0	\N	\N	\N	\N	2021-12-02 13:14:25.278	2021-12-02 13:14:25.278	2	4
13	1	1013	1	1	3	\N	1.5	4248	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	3600	USD	1	\N	1	1	\N	3444.0	\N	\N	\N	\N	2021-12-02 13:14:25.28358	2021-12-02 13:14:25.28358	2	5
14	1	1014	1	1	3	\N	1.8	5098	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	3445.0	\N	\N	\N	\N	2021-12-02 13:14:25.289139	2021-12-02 13:14:25.289139	2	6
15	1	1015	1	1	3	\N	2	5947	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5040	USD	1.3	\N	1	1	\N	3446.0	\N	\N	\N	\N	2021-12-02 13:14:25.294752	2021-12-02 13:14:25.294752	2	7
16	1	1016	1	1	3	\N	2.2	6797	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	3447.0	\N	\N	\N	\N	2021-12-02 13:14:25.300379	2021-12-02 13:14:25.300379	2	8
17	1	1017	1	1	3	\N	2.8	8118	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	6480	USD	1.7	\N	1	1	\N	3448.0	\N	\N	\N	\N	2021-12-02 13:14:25.305927	2021-12-02 13:14:25.305927	2	9
18	1	1018	1	1	4	\N	0.5	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	3431.0	\N	\N	\N	\N	2021-12-02 13:14:25.311457	2021-12-02 13:14:25.311457	2	10
19	1	1019	1	1	4	\N	1	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:14:25.31705	2021-12-02 13:14:25.31705	2	1
20	1	1020	1	1	5	\N	0.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:14:25.322523	2021-12-02 13:14:25.322523	2	1
21	1	1021	1	1	5	\N	0.9	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:14:25.328161	2021-12-02 13:14:25.328161	2	4
22	1	1022	1	1	5	\N	1.5	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:14:25.339748	2021-12-02 13:14:25.339748	2	5
23	1	1023	1	1	5	\N	1.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:14:25.347516	2021-12-02 13:14:25.347516	2	6
24	1	1024	1	1	5	\N	2	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:14:25.353003	2021-12-02 13:14:25.353003	2	7
25	1	1025	1	2	1	\N	6	28500	USD	\N	1	1	1	2	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	\N	2021-12-02 13:14:25.358479	2021-12-02 13:14:25.358479	2	3
26	1	1026	1	3	1	\N	6	28500	USD	\N	1	1	1	3	1	\N	3	\N	\N	0	USD	33000	USD	3.1	\N	1	1	\N	4457.0	\N	\N	\N	\N	2021-12-02 13:14:25.363919	2021-12-02 13:14:25.363919	2	3
27	1	1027	1	2	2	\N	1.3	2879	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	\N	2021-12-02 13:14:25.369453	2021-12-02 13:14:25.369453	2	1
28	1	1028	1	2	2	\N	1.5	3398	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	\N	2021-12-02 13:14:25.375188	2021-12-02 13:14:25.375188	2	4
29	1	1029	1	2	2	\N	2	6797	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	\N	2021-12-02 13:14:25.380834	2021-12-02 13:14:25.380834	2	5
30	1	1030	1	2	2	\N	2.2	10195	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.8	\N	1	1	\N	2454.0	\N	\N	\N	\N	2021-12-02 13:14:25.386563	2021-12-02 13:14:25.386563	2	6
31	1	1031	1	2	2	\N	2.5	13594	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	2455.0	\N	\N	\N	\N	2021-12-02 13:14:25.39215	2021-12-02 13:14:25.39215	2	7
32	1	1032	1	2	2	\N	3	16992	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	2456.0	\N	\N	\N	\N	2021-12-02 13:14:25.397717	2021-12-02 13:14:25.397717	2	8
33	1	1033	1	2	2	\N	4.5	20390	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	2457.0	\N	\N	\N	\N	2021-12-02 13:14:25.403616	2021-12-02 13:14:25.403616	2	9
34	1	1034	1	2	3	\N	1.3	2879	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2442.0	\N	\N	\N	\N	2021-12-02 13:14:25.40919	2021-12-02 13:14:25.40919	2	1
35	1	1035	1	2	3	\N	1.5	3398	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	2443.0	\N	\N	\N	\N	2021-12-02 13:14:25.414937	2021-12-02 13:14:25.414937	2	4
36	1	1036	1	2	3	\N	2	6797	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2444.0	\N	\N	\N	\N	2021-12-02 13:14:25.42034	2021-12-02 13:14:25.42034	2	5
37	1	1037	1	2	3	\N	2.2	10195	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	2445.0	\N	\N	\N	\N	2021-12-02 13:14:25.426256	2021-12-02 13:14:25.426256	2	6
38	1	1038	1	2	3	\N	2.5	13594	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	2446.0	\N	\N	\N	\N	2021-12-02 13:14:25.43191	2021-12-02 13:14:25.43191	2	7
39	1	1039	1	2	3	\N	3	16992	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	2447.0	\N	\N	\N	\N	2021-12-02 13:14:25.437491	2021-12-02 13:14:25.437491	2	8
40	1	1040	1	2	3	\N	4.5	20390	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	2448.0	\N	\N	\N	\N	2021-12-02 13:14:25.443056	2021-12-02 13:14:25.443056	2	9
41	1	1041	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.448552	2021-12-02 13:14:25.448552	2	10
42	1	1042	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.454311	2021-12-02 13:14:25.454311	2	1
43	1	1043	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.459832	2021-12-02 13:14:25.459832	2	1
44	1	1044	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.465524	2021-12-02 13:14:25.465524	2	4
45	1	1045	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.471393	2021-12-02 13:14:25.471393	2	5
46	1	1046	1	2	5	\N	0.6	300	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.47701	2021-12-02 13:14:25.47701	2	6
47	1	1047	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.482795	2021-12-02 13:14:25.482795	2	7
48	1	1048	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.488385	2021-12-02 13:14:25.488385	2	8
49	1	1049	2	4	1	\N	1.1	1910	USD	\N	2	1	4	4	1	\N	3	\N	\N	0	USD	5000	USD	0.4	\N	1	1	\N	7920.0	\N	\N	\N	\N	2021-12-02 13:14:25.494737	2021-12-02 13:14:25.494737	2	3
50	1	1050	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 13:14:25.500407	2021-12-02 13:14:25.500407	3	10
51	1	1051	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 13:14:25.506047	2021-12-02 13:14:25.506047	4	1
52	1	1053	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7981.0	\N	\N	\N	\N	2021-12-02 13:14:25.51162	2021-12-02 13:14:25.51162	3	10
53	1	1054	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 13:14:25.517212	2021-12-02 13:14:25.517212	4	1
54	1	1055	2	5	1	\N	2.5	19000	USD	\N	3	1	1	5	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	\N	2021-12-02 13:14:25.522835	2021-12-02 13:14:25.522835	2	3
55	1	1056	2	5	3	\N	1.2	1410	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	2880	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	\N	2021-12-02 13:14:25.528429	2021-12-02 13:14:25.528429	3	10
56	1	1057	2	5	3	\N	1	1910	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	4320	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	\N	2021-12-02 13:14:25.534241	2021-12-02 13:14:25.534241	4	1
57	1	1058	2	5	3	\N	1	2450	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	5760	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	\N	2021-12-02 13:14:25.539962	2021-12-02 13:14:25.539962	4	4
58	1	1059	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.545646	2021-12-02 13:14:25.545646	3	10
59	1	1060	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.551092	2021-12-02 13:14:25.551092	4	1
60	1	1061	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:14:25.556765	2021-12-02 13:14:25.556765	4	4
61	1	1062	2	6	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	1410	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 13:14:25.562549	2021-12-02 13:14:25.562549	5	12
62	1	1063	2	6	6	\N	0.8	1410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 13:14:25.568238	2021-12-02 13:14:25.568238	3	10
63	1	1064	2	6	6	\N	1	1680	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 13:14:25.573984	2021-12-02 13:14:25.573984	4	1
64	1	1065	2	6	6	\N	1.4	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	1112.0	\N	\N	\N	\N	2021-12-02 13:14:25.579531	2021-12-02 13:14:25.579531	4	4
65	1	1066	2	6	6	\N	1.5	2160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	1	\N	1	1	\N	1113.0	\N	\N	\N	\N	2021-12-02 13:14:25.585303	2021-12-02 13:14:25.585303	6	13
66	1	1067	2	6	6	\N	1.6	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2160	USD	1	\N	1	1	\N	1114.0	\N	\N	\N	\N	2021-12-02 13:14:25.59102	2021-12-02 13:14:25.59102	7	14
67	1	1068	2	6	6	\N	1.8	2880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	1115.0	\N	\N	\N	\N	2021-12-02 13:14:25.59655	2021-12-02 13:14:25.59655	8	5
68	1	1069	2	6	6	\N	2	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2880	USD	1.5	\N	1	1	\N	1116.0	\N	\N	\N	\N	2021-12-02 13:14:25.60203	2021-12-02 13:14:25.60203	9	15
69	1	1070	2	6	6	\N	2.4	5410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.8	\N	1	1	\N	1117.0	\N	\N	\N	\N	2021-12-02 13:14:25.607645	2021-12-02 13:14:25.607645	10	16
70	1	1071	2	6	6	\N	2.69	6960	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6960	USD	2.2	\N	1	1	\N	1118.0	\N	\N	\N	\N	2021-12-02 13:14:25.613232	2021-12-02 13:14:25.613232	11	6
71	1	1072	2	6	6	\N	2.8	8880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8880	USD	2.4	\N	1	1	\N	1119.0	\N	\N	\N	\N	2021-12-02 13:14:25.618731	2021-12-02 13:14:25.618731	12	17
72	1	1073	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.624324	2021-12-02 13:14:25.624324	2	10
73	1	1074	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.629978	2021-12-02 13:14:25.629978	2	1
74	1	1075	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.635555	2021-12-02 13:14:25.635555	3	10
75	1	1076	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.641213	2021-12-02 13:14:25.641213	4	1
76	1	1077	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.646802	2021-12-02 13:14:25.646802	2	5
77	1	1078	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.652585	2021-12-02 13:14:25.652585	2	7
78	1	1079	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.658189	2021-12-02 13:14:25.658189	2	18
79	1	1080	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.68724	2021-12-02 13:14:25.68724	2	19
80	1	1081	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.692901	2021-12-02 13:14:25.692901	2	20
81	1	1082	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.698268	2021-12-02 13:14:25.698268	2	21
82	1	1083	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.703624	2021-12-02 13:14:25.703624	2	22
83	1	1084	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.709121	2021-12-02 13:14:25.709121	2	23
84	1	1085	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.714592	2021-12-02 13:14:25.714592	2	24
85	1	1086	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:14:25.719979	2021-12-02 13:14:25.719979	2	25
86	1	1095	1	3	3	\N	1.3	2879	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	4442.0	\N	\N	\N	\N	2021-12-02 13:14:25.725586	2021-12-02 13:14:25.725586	2	1
87	1	1096	1	3	3	\N	1.5	3398	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4443.0	\N	\N	\N	\N	2021-12-02 13:14:25.730991	2021-12-02 13:14:25.730991	2	4
88	1	1097	1	3	3	\N	2	6797	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4444.0	\N	\N	\N	\N	2021-12-02 13:14:25.736576	2021-12-02 13:14:25.736576	2	5
89	1	1098	1	3	3	\N	2.2	10195	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4445.0	\N	\N	\N	\N	2021-12-02 13:14:25.742171	2021-12-02 13:14:25.742171	2	6
90	1	1099	1	3	3	\N	2.5	13594	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	4446.0	\N	\N	\N	\N	2021-12-02 13:14:25.747716	2021-12-02 13:14:25.747716	2	7
91	1	1100	1	3	3	\N	3	16992	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4447.0	\N	\N	\N	\N	2021-12-02 13:14:25.753299	2021-12-02 13:14:25.753299	2	8
92	1	1101	1	3	3	\N	4.5	20390	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4448.0	\N	\N	\N	\N	2021-12-02 13:14:25.758688	2021-12-02 13:14:25.758688	2	9
93	1	1102	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:14:25.764243	2021-12-02 13:14:25.764243	2	10
94	1	1103	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:14:25.769887	2021-12-02 13:14:25.769887	2	1
95	1	1104	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:14:25.775481	2021-12-02 13:14:25.775481	2	1
96	1	1105	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:14:25.780916	2021-12-02 13:14:25.780916	2	4
97	1	1106	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:14:25.786308	2021-12-02 13:14:25.786308	2	5
98	1	1107	1	3	5	\N	0.6	300	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:14:25.791709	2021-12-02 13:14:25.791709	2	6
99	1	1108	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:14:25.797108	2021-12-02 13:14:25.797108	2	7
100	1	1109	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:14:25.802559	2021-12-02 13:14:25.802559	2	8
101	1	2001	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	0	USD	3.8	\N	1	1	\N	2122.0	\N	\N	\N	\N	2021-12-02 13:14:25.80819	2021-12-02 13:14:25.80819	13	19
102	1	2002	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	30000	USD	4.2	\N	1	1	\N	2121.0	\N	\N	\N	\N	2021-12-02 13:14:25.813696	2021-12-02 13:14:25.813696	13	26
103	1	2003	3	7	6	\N	0.8	1841	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	\N	2021-12-02 13:14:25.819042	2021-12-02 13:14:25.819042	3	10
104	1	2004	3	7	6	\N	1	2266	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	\N	2021-12-02 13:14:25.824488	2021-12-02 13:14:25.824488	4	1
105	1	2005	3	7	6	\N	1.4	2832	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.9	\N	1	1	\N	2112.0	\N	\N	\N	\N	2021-12-02 13:14:25.830166	2021-12-02 13:14:25.830166	4	4
106	1	2006	3	7	6	\N	1.5	3729	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	2113.0	\N	\N	\N	\N	2021-12-02 13:14:25.835539	2021-12-02 13:14:25.835539	6	13
107	1	2007	3	7	6	\N	1.6	4531	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	2114.0	\N	\N	\N	\N	2021-12-02 13:14:25.840939	2021-12-02 13:14:25.840939	7	14
108	1	2008	3	7	6	\N	1.8	5098	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.4	\N	1	1	\N	2115.0	\N	\N	\N	\N	2021-12-02 13:14:25.846385	2021-12-02 13:14:25.846385	8	5
109	1	2009	3	7	6	\N	2	5947	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.7	\N	1	1	\N	2116.0	\N	\N	\N	\N	2021-12-02 13:14:25.851833	2021-12-02 13:14:25.851833	9	15
110	1	2010	3	7	6	\N	2.1	6443	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	2117.0	\N	\N	\N	\N	2021-12-02 13:14:25.857461	2021-12-02 13:14:25.857461	10	16
111	1	2011	3	7	6	\N	2.2	9629	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.4	\N	1	1	\N	2118.0	\N	\N	\N	\N	2021-12-02 13:14:25.862935	2021-12-02 13:14:25.862935	11	6
112	1	2012	3	7	6	\N	2.3	10077	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.6	\N	1	1	\N	2119.0	\N	\N	\N	\N	2021-12-02 13:14:25.868443	2021-12-02 13:14:25.868443	12	17
113	1	2013	3	7	4	\N	0.3	354	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.873973	2021-12-02 13:14:25.873973	2	10
114	1	2014	3	7	4	\N	0.6	708	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.879496	2021-12-02 13:14:25.879496	2	1
115	1	2015	3	7	4	\N	0.6	354	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.884969	2021-12-02 13:14:25.884969	3	10
116	1	2016	3	7	4	\N	1	708	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.890424	2021-12-02 13:14:25.890424	4	1
117	1	2017	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.895927	2021-12-02 13:14:25.895927	2	5
118	1	2018	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.90143	2021-12-02 13:14:25.90143	2	7
119	1	2019	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.906774	2021-12-02 13:14:25.906774	2	18
120	1	2020	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.912301	2021-12-02 13:14:25.912301	2	19
121	1	2021	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.917773	2021-12-02 13:14:25.917773	2	20
122	1	2022	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.923095	2021-12-02 13:14:25.923095	2	21
123	1	2023	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.928529	2021-12-02 13:14:25.928529	2	22
124	1	2024	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.934032	2021-12-02 13:14:25.934032	2	23
125	1	2025	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.939492	2021-12-02 13:14:25.939492	2	24
126	1	2026	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:14:25.944898	2021-12-02 13:14:25.944898	2	25
127	1	2031	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6	\N	1	1	\N	2621.0	\N	\N	\N	\N	2021-12-02 13:14:25.950245	2021-12-02 13:14:25.950245	2	19
128	1	2032	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6.2	\N	1	1	\N	2622.0	\N	\N	\N	\N	2021-12-02 13:14:25.955742	2021-12-02 13:14:25.955742	2	26
129	1	2033	4	8	3	\N	1.5	5376	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	4800	USD	1.1	\N	1	1	\N	2642.0	\N	\N	\N	\N	2021-12-02 13:14:25.961307	2021-12-02 13:14:25.961307	2	4
130	1	2034	4	8	3	\N	2	10752	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	9600	USD	1.3	\N	1	1	\N	2644.0	\N	\N	\N	\N	2021-12-02 13:14:25.966742	2021-12-02 13:14:25.966742	2	5
131	1	2035	4	8	3	\N	3	16128	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	14400	USD	1.6	\N	1	1	\N	2645.0	\N	\N	\N	\N	2021-12-02 13:14:25.972231	2021-12-02 13:14:25.972231	2	6
132	1	2036	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 13:14:25.977813	2021-12-02 13:14:25.977813	2	4
133	1	2037	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 13:14:25.98323	2021-12-02 13:14:25.98323	2	5
134	1	2038	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 13:14:25.988542	2021-12-02 13:14:25.988542	2	6
135	1	3001	3	9	1	\N	0.6	1290	USD	\N	6	1	6	9	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:14:25.993943	2021-12-02 13:14:25.993943	2	3
136	1	3002	3	9	7	\N	0.6	1290	USD	\N	6	8	1	9	8	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:14:25.999264	2021-12-02 13:14:25.999264	2	3
137	1	3003	3	10	1	\N	4.5	17840	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3	\N	1	1	\N	3221.0	\N	\N	\N	\N	2021-12-02 13:14:26.00461	2021-12-02 13:14:26.00461	13	19
138	1	3004	3	10	1	\N	4.5	0	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	3121.0	\N	\N	\N	\N	2021-12-02 13:14:26.01003	2021-12-02 13:14:26.01003	13	26
139	1	3005	3	10	6	\N	0.8	1560	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.7	\N	1	1	\N	3111.0	\N	\N	\N	\N	2021-12-02 13:14:26.015454	2021-12-02 13:14:26.015454	3	10
140	1	3006	3	10	6	\N	1	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.8	\N	1	1	\N	3112.0	\N	\N	\N	\N	2021-12-02 13:14:26.020842	2021-12-02 13:14:26.020842	4	1
141	1	3007	3	10	6	\N	1.4	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1	\N	1	1	\N	3113.0	\N	\N	\N	\N	2021-12-02 13:14:26.026479	2021-12-02 13:14:26.026479	4	4
142	1	3008	3	10	6	\N	1.5	3160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.3	\N	1	1	\N	3114.0	\N	\N	\N	\N	2021-12-02 13:14:26.031875	2021-12-02 13:14:26.031875	6	13
143	1	3009	3	10	6	\N	1.6	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	4320	USD	1.5	\N	1	1	\N	3115.0	\N	\N	\N	\N	2021-12-02 13:14:26.037337	2021-12-02 13:14:26.037337	7	14
144	1	3010	3	10	6	\N	1.8	4320	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5040	USD	1.8	\N	1	1	\N	3116.0	\N	\N	\N	\N	2021-12-02 13:14:26.042863	2021-12-02 13:14:26.042863	8	5
145	1	3011	3	10	6	\N	2	5040	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2.2	\N	1	1	\N	3117.0	\N	\N	\N	\N	2021-12-02 13:14:26.048477	2021-12-02 13:14:26.048477	9	15
146	1	3012	3	10	6	\N	2.1	5460	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	11520	USD	2.6	\N	1	1	\N	3118.0	\N	\N	\N	\N	2021-12-02 13:14:26.054153	2021-12-02 13:14:26.054153	10	16
147	1	3013	3	10	6	\N	2.2	8160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	\N	2021-12-02 13:14:26.059895	2021-12-02 13:14:26.059895	11	6
148	1	3014	3	10	6	\N	2.3	8540	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	\N	2021-12-02 13:14:26.089807	2021-12-02 13:14:26.089807	12	17
149	1	3015	3	10	4	\N	1	600	USD	\N	4	4	5	6	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.096053	2021-12-02 13:14:26.096053	2	10
150	1	3016	3	10	4	\N	0.6	600	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	300	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.101349	2021-12-02 13:14:26.101349	2	1
151	1	3017	3	10	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.106635	2021-12-02 13:14:26.106635	3	10
152	1	3018	3	10	4	\N	1	600	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.112047	2021-12-02 13:14:26.112047	4	1
153	1	3019	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.119018	2021-12-02 13:14:26.119018	2	5
154	1	3020	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.12452	2021-12-02 13:14:26.12452	2	7
155	1	3021	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.129989	2021-12-02 13:14:26.129989	2	18
156	1	3022	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.135389	2021-12-02 13:14:26.135389	2	19
157	1	3023	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.14084	2021-12-02 13:14:26.14084	2	20
158	1	3024	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.146261	2021-12-02 13:14:26.146261	2	21
159	1	3025	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.151669	2021-12-02 13:14:26.151669	2	22
160	1	3026	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.157304	2021-12-02 13:14:26.157304	2	23
161	1	3027	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.162722	2021-12-02 13:14:26.162722	2	24
162	1	3028	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:14:26.168207	2021-12-02 13:14:26.168207	2	25
163	1	4001	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	4621.0	\N	\N	\N	\N	2021-12-02 13:14:26.173807	2021-12-02 13:14:26.173807	2	19
164	1	4002	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.6	\N	1	1	\N	4622.0	\N	\N	\N	\N	2021-12-02 13:14:26.179343	2021-12-02 13:14:26.179343	2	26
165	1	4003	4	11	3	\N	1.5	4301	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	4642.0	\N	\N	\N	\N	2021-12-02 13:14:26.184928	2021-12-02 13:14:26.184928	2	4
166	1	4004	4	11	3	\N	2	8602	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	7680	USD	1.3	\N	1	1	\N	4644.0	\N	\N	\N	\N	2021-12-02 13:14:26.190469	2021-12-02 13:14:26.190469	2	5
167	1	4005	4	11	3	\N	3	12880	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	11520	USD	1.6	\N	1	1	\N	4645.0	\N	\N	\N	\N	2021-12-02 13:14:26.195956	2021-12-02 13:14:26.195956	2	6
168	1	4006	4	11	5	\N	1	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 13:14:26.201543	2021-12-02 13:14:26.201543	2	4
169	1	4007	4	11	5	\N	1.5	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 13:14:26.213631	2021-12-02 13:14:26.213631	2	5
170	1	4008	4	11	5	\N	2	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	2	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 13:14:26.220338	2021-12-02 13:14:26.220338	2	6
171	1	4009	4	12	1	\N	2.3	10820	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	\N	2021-12-02 13:14:26.225678	2021-12-02 13:14:26.225678	2	3
172	1	4010	4	13	1	\N	2.3	10820	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 13:14:26.23123	2021-12-02 13:14:26.23123	2	3
173	1	4011	4	14	4	\N	1	300	USD	\N	8	4	2	13	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 13:14:26.236682	2021-12-02 13:14:26.236682	2	3
174	1	5000	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3	\N	1	1	\N	5121.0	\N	\N	\N	\N	2021-12-02 13:14:26.242207	2021-12-02 13:14:26.242207	2	3
175	1	5001	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	5122.0	\N	\N	\N	\N	2021-12-02 13:14:26.247666	2021-12-02 13:14:26.247666	2	3
176	1	5002	5	15	6	\N	1	1400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	5111.0	\N	\N	\N	\N	2021-12-02 13:14:26.253083	2021-12-02 13:14:26.253083	3	10
177	1	5003	5	15	6	\N	1.3	1882	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	5112.0	\N	\N	\N	\N	2021-12-02 13:14:26.258718	2021-12-02 13:14:26.258718	4	1
178	1	5004	5	15	6	\N	1.5	2957	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	5113.0	\N	\N	\N	\N	2021-12-02 13:14:26.264227	2021-12-02 13:14:26.264227	4	4
179	1	5005	5	15	6	\N	1.8	4301	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.2	\N	1	1	\N	5114.0	\N	\N	\N	\N	2021-12-02 13:14:26.26974	2021-12-02 13:14:26.26974	6	13
180	1	5006	5	15	6	\N	2	6451	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	5115.0	\N	\N	\N	\N	2021-12-02 13:14:26.2767	2021-12-02 13:14:26.2767	7	14
181	1	5007	5	15	6	\N	2.2	7526	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.8	\N	1	1	\N	5116.0	\N	\N	\N	\N	2021-12-02 13:14:26.286498	2021-12-02 13:14:26.286498	8	5
182	1	5008	5	15	6	\N	2.3	9094	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	5117.0	\N	\N	\N	\N	2021-12-02 13:14:26.295746	2021-12-02 13:14:26.295746	9	15
183	1	5009	5	15	6	\N	2.5	11290	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	5118.0	\N	\N	\N	\N	2021-12-02 13:14:26.306896	2021-12-02 13:14:26.306896	10	16
184	1	5010	5	15	6	\N	3	13574	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	\N	2021-12-02 13:14:26.316908	2021-12-02 13:14:26.316908	11	6
185	1	5011	5	15	6	\N	3.5	16934	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	\N	2021-12-02 13:14:26.328026	2021-12-02 13:14:26.328026	12	17
186	1	5012	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.336702	2021-12-02 13:14:26.336702	2	10
187	1	5013	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.343192	2021-12-02 13:14:26.343192	2	1
188	1	5014	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.349945	2021-12-02 13:14:26.349945	3	10
189	1	5015	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.356253	2021-12-02 13:14:26.356253	4	1
190	1	5016	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.363004	2021-12-02 13:14:26.363004	2	5
191	1	5017	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.372284	2021-12-02 13:14:26.372284	2	7
192	1	5018	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.378217	2021-12-02 13:14:26.378217	2	18
193	1	5019	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.384427	2021-12-02 13:14:26.384427	2	19
194	1	5020	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.390371	2021-12-02 13:14:26.390371	2	20
195	1	5021	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.396733	2021-12-02 13:14:26.396733	2	21
196	1	5022	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.402963	2021-12-02 13:14:26.402963	2	22
197	1	5023	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.409392	2021-12-02 13:14:26.409392	2	23
198	1	5024	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.415996	2021-12-02 13:14:26.415996	2	24
199	1	5025	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:14:26.42493	2021-12-02 13:14:26.42493	2	25
200	1	5030	5	16	2	\N	0.5	1000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:14:26.434658	2021-12-02 13:14:26.434658	2	4
201	1	5031	5	16	2	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:14:26.445965	2021-12-02 13:14:26.445965	2	5
202	1	5032	5	16	2	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:14:26.457016	2021-12-02 13:14:26.457016	2	6
203	1	5033	5	16	2	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:14:26.466392	2021-12-02 13:14:26.466392	2	7
204	1	5034	5	16	2	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:14:26.476585	2021-12-02 13:14:26.476585	2	8
205	1	5035	5	16	2	\N	1	6500	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:14:26.484094	2021-12-02 13:14:26.484094	2	9
206	1	5036	5	16	2	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:14:26.491776	2021-12-02 13:14:26.491776	2	19
207	1	5037	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.499493	2021-12-02 13:14:26.499493	2	10
208	1	5038	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.511174	2021-12-02 13:14:26.511174	2	1
209	1	5039	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.520703	2021-12-02 13:14:26.520703	2	4
210	1	5040	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.528593	2021-12-02 13:14:26.528593	2	5
211	1	5041	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.537111	2021-12-02 13:14:26.537111	2	6
212	1	5042	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.545833	2021-12-02 13:14:26.545833	2	7
213	1	5043	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.577096	2021-12-02 13:14:26.577096	2	8
214	1	5044	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.583527	2021-12-02 13:14:26.583527	2	9
215	1	5045	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:26.589055	2021-12-02 13:14:26.589055	2	19
216	1	5046	5	17	1	\N	1	16822	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	1	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 13:14:26.594557	2021-12-02 13:14:26.594557	2	3
217	1	5047	5	17	1	\N	2	33645	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	2	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 13:14:26.60009	2021-12-02 13:14:26.60009	2	1
218	1	5048	5	17	1	\N	3	50467	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	3	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 13:14:26.605554	2021-12-02 13:14:26.605554	2	4
219	1	5049	5	17	1	\N	4	67290	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	4	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 13:14:26.611256	2021-12-02 13:14:26.611256	2	2
220	1	5050	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	1	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 13:14:26.616874	2021-12-02 13:14:26.616874	2	4
221	1	5051	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	2	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 13:14:26.622379	2021-12-02 13:14:26.622379	2	5
222	1	5052	5	17	2	\N	1	14560	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	3	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 13:14:26.628079	2021-12-02 13:14:26.628079	2	6
223	1	5053	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.633713	2021-12-02 13:14:26.633713	2	3
224	1	5054	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.63921	2021-12-02 13:14:26.63921	2	1
225	1	5055	5	17	4	\N	0.6	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.644666	2021-12-02 13:14:26.644666	2	4
226	1	5056	5	17	4	\N	0.8	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.650634	2021-12-02 13:14:26.650634	2	2
227	1	5057	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.656244	2021-12-02 13:14:26.656244	2	3
228	1	5058	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.662046	2021-12-02 13:14:26.662046	2	1
229	1	5059	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.667645	2021-12-02 13:14:26.667645	2	4
230	1	5060	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.673258	2021-12-02 13:14:26.673258	2	2
231	1	5061	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.67877	2021-12-02 13:14:26.67877	2	3
232	1	5062	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.684256	2021-12-02 13:14:26.684256	2	1
233	1	5063	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.68984	2021-12-02 13:14:26.68984	2	4
234	1	5064	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:14:26.695482	2021-12-02 13:14:26.695482	2	2
235	1	5065	5	18	1	\N	0.5	963	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.700995	2021-12-02 13:14:26.700995	2	3
236	1	5066	5	18	1	\N	0.5	1926	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.706702	2021-12-02 13:14:26.706702	2	1
237	1	5067	5	18	1	\N	0.6	2890	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.712326	2021-12-02 13:14:26.712326	2	4
238	1	5068	5	18	1	\N	0.8	3853	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.717918	2021-12-02 13:14:26.717918	2	2
239	1	5069	5	18	1	\N	1	4816	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.723456	2021-12-02 13:14:26.723456	2	3
240	1	5070	5	18	1	\N	1.2	5779	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.72903	2021-12-02 13:14:26.72903	2	5
241	1	5071	5	18	1	\N	1.4	6742	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.734525	2021-12-02 13:14:26.734525	2	26
242	1	5072	5	18	1	\N	1.6	7706	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.740021	2021-12-02 13:14:26.740021	2	16
243	1	5073	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.745557	2021-12-02 13:14:26.745557	2	3
244	1	5074	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.751	2021-12-02 13:14:26.751	2	1
245	1	5075	5	18	5	\N	0.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.756529	2021-12-02 13:14:26.756529	2	4
246	1	5076	5	18	5	\N	0.8	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.761995	2021-12-02 13:14:26.761995	2	2
247	1	5077	5	18	5	\N	1	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.7674	2021-12-02 13:14:26.7674	2	3
248	1	5078	5	18	5	\N	1.2	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.772954	2021-12-02 13:14:26.772954	2	5
249	1	5079	5	18	5	\N	1.4	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.778541	2021-12-02 13:14:26.778541	2	26
250	1	5080	5	18	5	\N	1.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.784183	2021-12-02 13:14:26.784183	2	16
251	1	5081	5	18	10	\N	0.5	0	USD	\N	11	10	2	17	12	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:14:26.789652	2021-12-02 13:14:26.789652	2	3
252	1	5082	5	19	1	\N	0.5	1725	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:14:26.795225	2021-12-02 13:14:26.795225	2	3
253	1	5083	5	19	1	\N	0.5	3450	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:14:26.800704	2021-12-02 13:14:26.800704	2	1
254	1	5084	5	19	1	\N	0.5	5174	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:14:26.806307	2021-12-02 13:14:26.806307	2	4
255	1	5085	5	19	1	\N	0.8	6899	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:14:26.811991	2021-12-02 13:14:26.811991	2	2
256	1	5086	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:14:26.817601	2021-12-02 13:14:26.817601	2	3
257	1	5087	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:14:26.823072	2021-12-02 13:14:26.823072	2	1
258	1	5088	5	19	4	\N	0.6	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:14:26.828748	2021-12-02 13:14:26.828748	2	4
259	1	5089	5	19	4	\N	0.8	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:14:26.834292	2021-12-02 13:14:26.834292	2	2
260	1	5090	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 13:14:26.839739	2021-12-02 13:14:26.839739	2	3
261	1	5091	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 13:14:26.84516	2021-12-02 13:14:26.84516	2	1
262	1	5092	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 13:14:26.850541	2021-12-02 13:14:26.850541	2	4
263	1	5093	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 13:14:26.856206	2021-12-02 13:14:26.856206	2	2
264	1	5094	5	20	1	\N	0.5	1456	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.861985	2021-12-02 13:14:26.861985	2	3
265	1	5095	5	20	1	\N	0.5	2912	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.867616	2021-12-02 13:14:26.867616	2	1
266	1	5096	5	20	1	\N	0.5	4368	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.873137	2021-12-02 13:14:26.873137	2	4
267	1	5097	5	20	1	\N	0.5	5824	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.878761	2021-12-02 13:14:26.878761	2	2
268	1	5098	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.884317	2021-12-02 13:14:26.884317	2	3
269	1	5099	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.889926	2021-12-02 13:14:26.889926	2	1
270	1	5100	5	20	4	\N	0.6	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.895545	2021-12-02 13:14:26.895545	2	4
271	1	5101	5	20	4	\N	0.8	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.901137	2021-12-02 13:14:26.901137	2	2
272	1	5102	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.906768	2021-12-02 13:14:26.906768	2	3
273	1	5103	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.912486	2021-12-02 13:14:26.912486	2	1
274	1	5104	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.918054	2021-12-02 13:14:26.918054	2	4
275	1	5105	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.923844	2021-12-02 13:14:26.923844	2	2
276	1	5106	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.929419	2021-12-02 13:14:26.929419	2	3
277	1	5107	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.935018	2021-12-02 13:14:26.935018	2	1
278	1	5108	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.940712	2021-12-02 13:14:26.940712	2	4
279	1	5109	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.946378	2021-12-02 13:14:26.946378	2	2
280	1	5110	5	21	1	\N	0.5	1021	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.952059	2021-12-02 13:14:26.952059	2	3
281	1	5111	5	21	1	\N	0.5	2041	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.957635	2021-12-02 13:14:26.957635	2	1
282	1	5112	5	21	1	\N	0.5	3062	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.963199	2021-12-02 13:14:26.963199	2	4
283	1	5113	5	21	1	\N	0.5	4083	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.968747	2021-12-02 13:14:26.968747	2	2
284	1	5114	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.974398	2021-12-02 13:14:26.974398	2	3
285	1	5115	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.980026	2021-12-02 13:14:26.980026	2	1
286	1	5116	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.985644	2021-12-02 13:14:26.985644	2	4
287	1	5117	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.991194	2021-12-02 13:14:26.991194	2	2
288	1	5118	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:26.996854	2021-12-02 13:14:26.996854	2	3
289	1	5119	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:27.002421	2021-12-02 13:14:27.002421	2	1
290	1	5120	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:27.007941	2021-12-02 13:14:27.007941	2	4
291	1	5121	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:27.013459	2021-12-02 13:14:27.013459	2	2
292	1	5122	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:27.019026	2021-12-02 13:14:27.019026	2	3
293	1	5123	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:27.02477	2021-12-02 13:14:27.02477	2	1
294	1	5124	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:27.030354	2021-12-02 13:14:27.030354	2	4
295	1	5125	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:14:27.035911	2021-12-02 13:14:27.035911	2	2
296	1	5126	5	22	1	\N	0.5	1156	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.041539	2021-12-02 13:14:27.041539	2	3
297	1	5127	5	22	1	\N	0.6	2313	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.047139	2021-12-02 13:14:27.047139	2	1
298	1	5128	5	22	1	\N	0.9	3469	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.052749	2021-12-02 13:14:27.052749	2	4
299	1	5129	5	22	1	\N	1.2	4626	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.058528	2021-12-02 13:14:27.058528	2	2
300	1	5130	5	22	5	\N	0.5	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.064369	2021-12-02 13:14:27.064369	2	3
301	1	5131	5	22	5	\N	0.6	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.070104	2021-12-02 13:14:27.070104	2	1
302	1	5132	5	22	5	\N	0.9	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.075818	2021-12-02 13:14:27.075818	2	4
303	1	5133	5	22	5	\N	1.2	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.081592	2021-12-02 13:14:27.081592	2	2
304	1	5134	5	23	1	\N	0.5	800	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.087247	2021-12-02 13:14:27.087247	2	3
305	1	5135	5	23	1	\N	0.5	1600	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.093062	2021-12-02 13:14:27.093062	2	1
306	1	5136	5	23	1	\N	0.6	2400	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.098787	2021-12-02 13:14:27.098787	2	4
307	1	5137	5	23	1	\N	0.8	3200	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.104553	2021-12-02 13:14:27.104553	2	2
308	1	5138	5	24	1	\N	0.5	1310	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.110107	2021-12-02 13:14:27.110107	2	3
309	1	5139	5	24	1	\N	0.6	2620	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.115711	2021-12-02 13:14:27.115711	2	1
310	1	5140	5	24	1	\N	0.9	3929	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.121349	2021-12-02 13:14:27.121349	2	4
311	1	5141	5	24	1	\N	1.2	5239	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.127042	2021-12-02 13:14:27.127042	2	2
312	1	5142	5	25	1	\N	0.5	1300	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.132661	2021-12-02 13:14:27.132661	2	3
313	1	5143	5	25	1	\N	0.8	2600	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.138343	2021-12-02 13:14:27.138343	2	1
314	1	5144	5	25	1	\N	1	3900	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.143974	2021-12-02 13:14:27.143974	2	4
315	1	5145	5	25	1	\N	1	5200	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.149719	2021-12-02 13:14:27.149719	2	2
316	1	5146	5	24	4	\N	0.5	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.161646	2021-12-02 13:14:27.161646	2	3
317	1	5147	5	24	4	\N	0.6	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.166822	2021-12-02 13:14:27.166822	2	1
318	1	5148	5	24	4	\N	0.9	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.1726	2021-12-02 13:14:27.1726	2	4
319	1	5149	5	24	4	\N	1.2	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:14:27.178367	2021-12-02 13:14:27.178367	2	2
320	1	5150	5	26	1	\N	1	4189	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	1	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:14:27.184114	2021-12-02 13:14:27.184114	2	3
321	1	5151	5	26	1	\N	2	8378	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	2	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:14:27.189815	2021-12-02 13:14:27.189815	2	1
322	1	5152	5	26	1	\N	3	12567	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	3	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:14:27.195391	2021-12-02 13:14:27.195391	2	4
323	1	5153	5	26	1	\N	4	16756	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	4	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:14:27.201055	2021-12-02 13:14:27.201055	2	2
324	1	5154	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:27.206701	2021-12-02 13:14:27.206701	2	3
325	1	5155	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:27.212383	2021-12-02 13:14:27.212383	2	1
326	1	5156	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:27.218247	2021-12-02 13:14:27.218247	2	4
327	1	5157	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:27.223955	2021-12-02 13:14:27.223955	2	2
328	1	5158	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:27.230001	2021-12-02 13:14:27.230001	2	3
329	1	5159	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:27.264101	2021-12-02 13:14:27.264101	2	1
330	1	5160	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:27.269879	2021-12-02 13:14:27.269879	2	4
331	1	5161	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:27.275495	2021-12-02 13:14:27.275495	2	2
332	1	5162	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 13:14:27.281122	2021-12-02 13:14:27.281122	2	3
333	1	5163	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 13:14:27.286758	2021-12-02 13:14:27.286758	2	1
334	1	5164	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 13:14:27.292356	2021-12-02 13:14:27.292356	2	4
335	1	5165	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 13:14:27.298014	2021-12-02 13:14:27.298014	2	2
336	1	5166	5	27	1	\N	1	3550	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	1	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:14:27.303679	2021-12-02 13:14:27.303679	2	3
337	1	5167	5	27	1	\N	1.5	7100	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	2	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:14:27.309463	2021-12-02 13:14:27.309463	2	1
338	1	5168	5	27	1	\N	1.5	10650	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	3	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:14:27.315327	2021-12-02 13:14:27.315327	2	4
339	1	5169	5	27	1	\N	2	14200	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	4	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:14:27.320964	2021-12-02 13:14:27.320964	2	2
340	1	5170	5	28	2	\N	0.5	2360	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	\N	2021-12-02 13:14:27.326692	2021-12-02 13:14:27.326692	2	3
341	1	5171	5	28	2	\N	1	2950	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	\N	2021-12-02 13:14:27.332345	2021-12-02 13:14:27.332345	2	1
342	1	5172	5	28	2	\N	1.5	3540	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	\N	2021-12-02 13:14:27.337988	2021-12-02 13:14:27.337988	2	4
343	1	5173	5	28	2	\N	2	7080	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	\N	2021-12-02 13:14:27.343655	2021-12-02 13:14:27.343655	2	5
344	1	5174	5	28	2	\N	2.2	10620	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	\N	2021-12-02 13:14:27.349233	2021-12-02 13:14:27.349233	2	6
345	1	5175	5	28	2	\N	2.5	14160	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	\N	2021-12-02 13:14:27.35483	2021-12-02 13:14:27.35483	2	7
346	1	5176	5	28	2	\N	3	17700	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:14:27.360546	2021-12-02 13:14:27.360546	2	8
347	1	5177	5	28	2	\N	3.6	22420	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:14:27.366265	2021-12-02 13:14:27.366265	2	9
348	1	5178	5	28	2	\N	5	28320	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:14:27.371802	2021-12-02 13:14:27.371802	2	19
349	1	5179	5	28	3	\N	0.5	2360	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	\N	2021-12-02 13:14:27.377385	2021-12-02 13:14:27.377385	2	3
350	1	5180	5	28	3	\N	1	2950	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	\N	2021-12-02 13:14:27.383051	2021-12-02 13:14:27.383051	2	1
351	1	5181	5	28	3	\N	1.5	3540	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	\N	2021-12-02 13:14:27.38867	2021-12-02 13:14:27.38867	2	4
352	1	5182	5	28	3	\N	2	7080	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	\N	2021-12-02 13:14:27.394283	2021-12-02 13:14:27.394283	2	5
353	1	5183	5	28	3	\N	2.2	10620	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	\N	2021-12-02 13:14:27.399888	2021-12-02 13:14:27.399888	2	6
354	1	5184	5	28	3	\N	2.5	14160	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	\N	2021-12-02 13:14:27.405565	2021-12-02 13:14:27.405565	2	7
355	1	5185	5	28	3	\N	3	17700	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:14:27.411128	2021-12-02 13:14:27.411128	2	8
356	1	5186	5	28	3	\N	3.6	22420	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:14:27.416665	2021-12-02 13:14:27.416665	2	9
357	1	5187	5	28	3	\N	5	28320	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:14:27.42232	2021-12-02 13:14:27.42232	2	19
358	1	5188	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.428151	2021-12-02 13:14:27.428151	2	10
359	1	5189	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.433777	2021-12-02 13:14:27.433777	2	1
360	1	5190	5	28	5	\N	0.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.439327	2021-12-02 13:14:27.439327	2	3
361	1	5191	5	28	5	\N	1.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.444753	2021-12-02 13:14:27.444753	2	4
362	1	5192	5	28	5	\N	2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.450198	2021-12-02 13:14:27.450198	2	5
363	1	5193	5	28	5	\N	2.2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.455647	2021-12-02 13:14:27.455647	2	6
364	1	5194	5	28	5	\N	2.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.461133	2021-12-02 13:14:27.461133	2	7
365	1	5195	5	28	5	\N	3	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.466923	2021-12-02 13:14:27.466923	2	8
366	1	5196	5	28	5	\N	3.6	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.472384	2021-12-02 13:14:27.472384	2	9
367	1	5197	5	28	5	\N	5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:14:27.477849	2021-12-02 13:14:27.477849	2	19
368	1	5198	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.483307	2021-12-02 13:14:27.483307	2	1
369	1	5199	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.488814	2021-12-02 13:14:27.488814	2	4
370	1	5200	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.49433	2021-12-02 13:14:27.49433	2	5
371	1	5201	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.499806	2021-12-02 13:14:27.499806	2	6
372	1	5202	5	29	1	\N	0.5	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.50548	2021-12-02 13:14:27.50548	2	7
373	1	5203	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.511012	2021-12-02 13:14:27.511012	2	8
374	1	5204	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.516491	2021-12-02 13:14:27.516491	2	9
375	1	5205	5	29	1	\N	0.6	3172	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	2400	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.522002	2021-12-02 13:14:27.522002	2	19
376	1	5206	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.527498	2021-12-02 13:14:27.527498	2	10
377	1	5207	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.533007	2021-12-02 13:14:27.533007	2	1
378	1	5208	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.538486	2021-12-02 13:14:27.538486	2	4
379	1	5209	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.54402	2021-12-02 13:14:27.54402	2	5
380	1	5210	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.549634	2021-12-02 13:14:27.549634	2	6
381	1	5211	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.555124	2021-12-02 13:14:27.555124	2	7
382	1	5212	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.560674	2021-12-02 13:14:27.560674	2	8
383	1	5213	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.566196	2021-12-02 13:14:27.566196	2	9
384	1	5214	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	5	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:14:27.571663	2021-12-02 13:14:27.571663	2	19
385	1	5215	5	30	1	\N	0.7	1500	USD	\N	22	1	1	27	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5623.0	\N	\N	\N	\N	2021-12-02 13:14:27.57714	2021-12-02 13:14:27.57714	2	3
386	1	5216	5	30	5	\N	0.5	0	USD	\N	22	5	5	27	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	\N	2021-12-02 13:14:27.582631	2021-12-02 13:14:27.582631	2	3
387	1	5217	5	30	4	\N	0.5	300	USD	\N	22	4	10	27	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	\N	2021-12-02 13:14:27.588338	2021-12-02 13:14:27.588338	2	3
388	1	5218	5	12	1	\N	2.3	12768	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	\N	2021-12-02 13:14:27.593928	2021-12-02 13:14:27.593928	2	3
389	1	5219	5	13	1	\N	2.3	12768	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 13:14:27.599436	2021-12-02 13:14:27.599436	2	3
390	1	5220	5	14	4	\N	0.6	600	USD	\N	8	4	2	12	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 13:14:27.604859	2021-12-02 13:14:27.604859	2	3
391	1	5221	5	31	1	\N	1	1400	USD	\N	23	1	1	28	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	\N	2021-12-02 13:14:27.610376	2021-12-02 13:14:27.610376	2	3
392	1	5222	5	31	4	\N	1	1400	USD	\N	23	7	1	28	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	\N	2021-12-02 13:14:27.615839	2021-12-02 13:14:27.615839	2	3
393	1	5223	5	16	1	\N	0.5	1000	USD	\N	9	2	3	15	1	\N	2	\N	\N	0	USD	900	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:27.621275	2021-12-02 13:14:27.621275	2	4
394	1	5224	5	16	1	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	1800	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:27.627022	2021-12-02 13:14:27.627022	2	5
395	1	5225	5	16	1	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2700	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:27.63259	2021-12-02 13:14:27.63259	2	6
396	1	5226	5	16	1	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:27.638073	2021-12-02 13:14:27.638073	2	7
397	1	5227	5	16	1	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2400	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:27.643538	2021-12-02 13:14:27.643538	2	8
398	1	5228	5	16	1	\N	1	6000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2800	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:27.648969	2021-12-02 13:14:27.648969	2	18
399	1	5229	5	16	1	\N	1	7000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3150	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:27.654518	2021-12-02 13:14:27.654518	2	34
400	1	5230	5	16	1	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:27.659971	2021-12-02 13:14:27.659971	2	19
401	1	5231	5	15	11	\N	0.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:27.665635	2021-12-02 13:14:27.665635	2	3
402	1	5232	5	15	11	\N	1	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:27.67128	2021-12-02 13:14:27.67128	2	1
403	1	5233	5	15	11	\N	1.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:27.676694	2021-12-02 13:14:27.676694	2	4
404	1	5234	5	15	11	\N	2	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:27.682158	2021-12-02 13:14:27.682158	2	2
405	1	6000	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 13:14:27.687969	2021-12-02 13:14:27.687969	8	5
406	1	6001	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 13:14:27.693776	2021-12-02 13:14:27.693776	11	5
407	1	6002	6	32	12	\N	1.5	8060	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6500	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 13:14:27.699471	2021-12-02 13:14:27.699471	13	5
408	1	6003	6	32	12	\N	1.5	12500	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	1.2	\N	1	1	\N	6525.0	\N	\N	\N	\N	2021-12-02 13:14:27.70492	2021-12-02 13:14:27.70492	13	6
409	1	6004	6	32	12	\N	1.5	15000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	11000	USD	1.5	\N	1	1	\N	6523.0	\N	\N	\N	\N	2021-12-02 13:14:27.711919	2021-12-02 13:14:27.711919	13	7
410	1	6005	6	32	12	\N	2	20000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	14000	USD	1.7	\N	1	1	\N	6527.0	\N	\N	\N	\N	2021-12-02 13:14:27.7175	2021-12-02 13:14:27.7175	13	8
411	1	6006	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	1.9	\N	1	1	\N	6528.0	\N	\N	\N	\N	2021-12-02 13:14:27.723069	2021-12-02 13:14:27.723069	13	18
412	1	6007	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	4	\N	\N	0	USD	22000	USD	2	\N	1	1	\N	6529.0	\N	\N	\N	\N	2021-12-02 13:14:27.728686	2021-12-02 13:14:27.728686	13	34
413	1	6008	6	32	12	\N	3	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	2.1	\N	1	1	\N	6524.0	\N	\N	\N	\N	2021-12-02 13:14:27.734262	2021-12-02 13:14:27.734262	13	19
414	1	6009	6	32	8	\N	0.75	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	100	USD	0.1	\N	5	1	\N	6173.0	\N	\N	\N	\N	2021-12-02 13:14:27.739732	2021-12-02 13:14:27.739732	2	5
415	1	6010	6	32	8	\N	1.3	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	\N	2021-12-02 13:14:27.745232	2021-12-02 13:14:27.745232	2	7
416	1	6011	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	\N	2021-12-02 13:14:27.750734	2021-12-02 13:14:27.750734	2	19
417	1	6012	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:14:27.756218	2021-12-02 13:14:27.756218	2	21
418	1	6013	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:14:27.761678	2021-12-02 13:14:27.761678	2	23
419	1	6014	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:14:27.767187	2021-12-02 13:14:27.767187	2	5
420	1	6015	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:14:27.772707	2021-12-02 13:14:27.772707	2	39
421	1	6016	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:14:27.778279	2021-12-02 13:14:27.778279	2	40
422	1	6017	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:14:27.78388	2021-12-02 13:14:27.78388	2	41
423	1	6018	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:14:27.789338	2021-12-02 13:14:27.789338	2	42
424	1	6019	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.794819	2021-12-02 13:14:27.794819	2	5
425	1	6020	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.800313	2021-12-02 13:14:27.800313	2	6
426	1	6021	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.80582	2021-12-02 13:14:27.80582	2	7
427	1	6022	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.811387	2021-12-02 13:14:27.811387	2	9
428	1	6023	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.816959	2021-12-02 13:14:27.816959	2	19
429	1	6024	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.822362	2021-12-02 13:14:27.822362	12	17
430	1	6025	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.827865	2021-12-02 13:14:27.827865	14	43
431	1	6026	6	32	14	\N	1.8	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.833399	2021-12-02 13:14:27.833399	15	44
432	1	6027	6	32	14	\N	2.6	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:14:27.838939	2021-12-02 13:14:27.838939	16	9
433	1	6032	6	33	2	\N	1	3540	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:14:27.844524	2021-12-02 13:14:27.844524	2	4
434	1	6033	6	33	2	\N	1	7080	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:14:27.850163	2021-12-02 13:14:27.850163	2	5
435	1	6034	6	33	2	\N	1	10620	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:14:27.855749	2021-12-02 13:14:27.855749	2	6
436	1	6035	6	33	2	\N	1	14160	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:14:27.86121	2021-12-02 13:14:27.86121	2	7
437	1	6036	6	33	2	\N	2	17700	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:14:27.895393	2021-12-02 13:14:27.895393	2	8
438	1	6037	6	33	2	\N	2	22420	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:14:27.90166	2021-12-02 13:14:27.90166	2	9
439	1	6038	6	33	2	\N	2	25724	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:14:27.907125	2021-12-02 13:14:27.907125	2	19
440	1	6039	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.912725	2021-12-02 13:14:27.912725	2	10
441	1	6040	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.918365	2021-12-02 13:14:27.918365	2	1
442	1	6041	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.923964	2021-12-02 13:14:27.923964	2	10
443	1	6042	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.929566	2021-12-02 13:14:27.929566	2	1
444	1	6043	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.935194	2021-12-02 13:14:27.935194	2	4
445	1	6044	6	33	5	\N	0.7	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.940868	2021-12-02 13:14:27.940868	2	5
446	1	6045	6	33	5	\N	0.9	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.946486	2021-12-02 13:14:27.946486	2	6
447	1	6046	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.952052	2021-12-02 13:14:27.952052	2	7
448	1	6047	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.95774	2021-12-02 13:14:27.95774	2	8
449	1	6048	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:14:27.963337	2021-12-02 13:14:27.963337	2	9
450	1	6049	6	34	1	\N	0.5	3500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:14:27.969036	2021-12-02 13:14:27.969036	2	3
451	1	6050	6	34	1	\N	0.5	7000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:14:27.97469	2021-12-02 13:14:27.97469	2	1
452	1	6051	6	34	1	\N	1	10500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:14:27.980314	2021-12-02 13:14:27.980314	2	4
453	1	6052	6	34	1	\N	1	14000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:14:27.985929	2021-12-02 13:14:27.985929	2	2
454	1	6053	6	34	1	\N	1.5	17500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:14:27.991597	2021-12-02 13:14:27.991597	2	3
455	1	6054	6	34	1	\N	2	21000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:14:27.997196	2021-12-02 13:14:27.997196	2	5
456	1	6055	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.002662	2021-12-02 13:14:28.002662	2	3
457	1	6056	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.008227	2021-12-02 13:14:28.008227	2	1
458	1	6057	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.013687	2021-12-02 13:14:28.013687	2	4
459	1	6058	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.019082	2021-12-02 13:14:28.019082	2	2
460	1	6059	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.024465	2021-12-02 13:14:28.024465	2	3
461	1	6060	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.029991	2021-12-02 13:14:28.029991	2	5
462	1	6061	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.035554	2021-12-02 13:14:28.035554	2	3
463	1	6062	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.047426	2021-12-02 13:14:28.047426	2	1
464	1	6063	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.052737	2021-12-02 13:14:28.052737	2	4
465	1	6064	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.058417	2021-12-02 13:14:28.058417	2	2
466	1	6065	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.064041	2021-12-02 13:14:28.064041	2	3
467	1	6066	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.069737	2021-12-02 13:14:28.069737	2	5
468	1	6067	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.075391	2021-12-02 13:14:28.075391	2	3
469	1	6068	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.081061	2021-12-02 13:14:28.081061	2	1
470	1	6069	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.086638	2021-12-02 13:14:28.086638	2	4
471	1	6070	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.092179	2021-12-02 13:14:28.092179	2	2
472	1	6071	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.09777	2021-12-02 13:14:28.09777	2	3
473	1	6072	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:14:28.103318	2021-12-02 13:14:28.103318	2	5
474	1	7000	7	35	1	\N	7.9	66000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	7.9	\N	1	1	\N	3521.0	\N	\N	\N	\N	2021-12-02 13:14:28.108916	2021-12-02 13:14:28.108916	1	1
475	1	7001	7	35	1	\N	15.6	132000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	14.9	\N	1	1	\N	3522.0	\N	\N	\N	\N	2021-12-02 13:14:28.114499	2021-12-02 13:14:28.114499	1	2
476	1	7002	7	35	2	\N	1.5	2880	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	3550.0	\N	\N	\N	\N	2021-12-02 13:14:28.120051	2021-12-02 13:14:28.120051	2	4
477	1	7003	7	35	2	\N	2	5760	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	3600	USD	1.4	\N	1	1	\N	3551.0	\N	\N	\N	\N	2021-12-02 13:14:28.125733	2021-12-02 13:14:28.125733	2	5
478	1	7004	7	35	2	\N	2.2	7200	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	5040	USD	1.7	\N	1	1	\N	3552.0	\N	\N	\N	\N	2021-12-02 13:14:28.131365	2021-12-02 13:14:28.131365	2	6
479	1	7005	7	35	2	\N	2.5	8640	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	6480	USD	2.1	\N	1	1	\N	3553.0	\N	\N	\N	\N	2021-12-02 13:14:28.136938	2021-12-02 13:14:28.136938	2	7
480	1	7006	7	35	2	\N	2.8	10080	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	10080	USD	2.8	\N	1	1	\N	3554.0	\N	\N	\N	\N	2021-12-02 13:14:28.142654	2021-12-02 13:14:28.142654	2	8
481	1	7007	7	35	2	\N	3	11520	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	13680	USD	3.5	\N	1	1	\N	3555.0	\N	\N	\N	\N	2021-12-02 13:14:28.148326	2021-12-02 13:14:28.148326	2	9
482	1	7008	7	35	2	\N	3.2	13000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	17280	USD	4.9	\N	1	1	\N	3556.0	\N	\N	\N	\N	2021-12-02 13:14:28.153997	2021-12-02 13:14:28.153997	2	19
483	1	7009	7	35	2	\N	3.5	14500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	6.3	\N	1	1	\N	3557.0	\N	\N	\N	\N	2021-12-02 13:14:28.159701	2021-12-02 13:14:28.159701	2	20
484	1	7010	7	35	2	\N	4	16000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3558.0	\N	\N	\N	\N	2021-12-02 13:14:28.16539	2021-12-02 13:14:28.16539	2	45
485	1	7011	7	35	2	\N	4.5	17500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	\N	2021-12-02 13:14:28.171001	2021-12-02 13:14:28.171001	2	23
486	1	7012	7	35	2	\N	7	19000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	\N	2021-12-02 13:14:28.176521	2021-12-02 13:14:28.176521	2	25
487	1	7013	7	35	3	\N	1	2400	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	1440	USD	0.9	\N	1	1	\N	3541.0	\N	\N	\N	\N	2021-12-02 13:14:28.182131	2021-12-02 13:14:28.182131	2	1
488	1	7014	7	35	3	\N	1	2880	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	3542.0	\N	\N	\N	\N	2021-12-02 13:14:28.187859	2021-12-02 13:14:28.187859	2	4
489	1	7015	7	35	3	\N	1.5	5760	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	3544.0	\N	\N	\N	\N	2021-12-02 13:14:28.193535	2021-12-02 13:14:28.193535	2	5
490	1	7016	7	35	3	\N	1.8	7200	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	3545.0	\N	\N	\N	\N	2021-12-02 13:14:28.199044	2021-12-02 13:14:28.199044	2	6
491	1	7017	7	35	3	\N	2	8640	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	3546.0	\N	\N	\N	\N	2021-12-02 13:14:28.204657	2021-12-02 13:14:28.204657	2	7
492	1	7018	7	35	3	\N	2.2	10080	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	3547.0	\N	\N	\N	\N	2021-12-02 13:14:28.210357	2021-12-02 13:14:28.210357	2	8
493	1	7019	7	35	3	\N	3	11520	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	11520	USD	2.2	\N	1	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:14:28.215871	2021-12-02 13:14:28.215871	2	9
494	1	7020	7	35	4	\N	0.5	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:14:28.221382	2021-12-02 13:14:28.221382	2	10
495	1	7021	7	35	4	\N	1	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:14:28.226866	2021-12-02 13:14:28.226866	2	1
496	1	7022	7	35	5	\N	0.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:14:28.23227	2021-12-02 13:14:28.23227	2	4
497	1	7023	7	35	5	\N	1	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:14:28.237891	2021-12-02 13:14:28.237891	2	5
498	1	7024	7	35	5	\N	1.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:14:28.24344	2021-12-02 13:14:28.24344	2	6
499	1	7025	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:14:28.24896	2021-12-02 13:14:28.24896	2	7
500	1	7026	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:14:28.254532	2021-12-02 13:14:28.254532	2	8
501	1	7027	7	36	1	\N	1	1800	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:14:28.259942	2021-12-02 13:14:28.259942	2	3
502	1	7028	7	36	4	\N	0.5	0	USD	\N	2	4	2	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:14:28.265511	2021-12-02 13:14:28.265511	2	3
503	1	7029	7	37	1	\N	4	17200	USD	\N	1	1	1	33	1	\N	2	\N	\N	0	USD	0	USD	4	\N	1	1	\N	4521.0	\N	\N	\N	\N	2021-12-02 13:14:28.271239	2021-12-02 13:14:28.271239	2	19
504	1	7031	7	37	2	\N	1.3	2880	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4551.0	\N	\N	\N	\N	2021-12-02 13:14:28.27685	2021-12-02 13:14:28.27685	2	4
505	1	7032	7	37	2	\N	1.8	5760	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	4553.0	\N	\N	\N	\N	2021-12-02 13:14:28.282311	2021-12-02 13:14:28.282311	2	5
506	1	7033	7	37	2	\N	2	8640	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4554.0	\N	\N	\N	\N	2021-12-02 13:14:28.287774	2021-12-02 13:14:28.287774	2	6
507	1	7034	7	37	2	\N	2.5	11520	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	4555.0	\N	\N	\N	\N	2021-12-02 13:14:28.293294	2021-12-02 13:14:28.293294	2	7
508	1	7035	7	37	2	\N	3	14400	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.9	\N	1	1	\N	4556.0	\N	\N	\N	\N	2021-12-02 13:14:28.298798	2021-12-02 13:14:28.298798	2	8
509	1	7036	7	37	3	\N	1	2880	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4543.0	\N	\N	\N	\N	2021-12-02 13:14:28.30433	2021-12-02 13:14:28.30433	2	1
510	1	7037	7	37	3	\N	1.3	5760	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4544.0	\N	\N	\N	\N	2021-12-02 13:14:28.309867	2021-12-02 13:14:28.309867	2	4
511	1	7038	7	37	3	\N	1.8	7200	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4545.0	\N	\N	\N	\N	2021-12-02 13:14:28.315392	2021-12-02 13:14:28.315392	2	5
512	1	7039	7	37	3	\N	2	8640	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	11500	USD	1.7	\N	1	1	\N	4546.0	\N	\N	\N	\N	2021-12-02 13:14:28.320958	2021-12-02 13:14:28.320958	2	6
513	1	7040	7	37	3	\N	2.5	10080	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4547.0	\N	\N	\N	\N	2021-12-02 13:14:28.326425	2021-12-02 13:14:28.326425	2	7
514	1	7041	7	37	3	\N	3	11500	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4548.0	\N	\N	\N	\N	2021-12-02 13:14:28.331956	2021-12-02 13:14:28.331956	2	8
515	1	7042	7	37	4	\N	1	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:14:28.337318	2021-12-02 13:14:28.337318	2	10
516	1	7043	7	37	4	\N	1.2	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:14:28.342658	2021-12-02 13:14:28.342658	2	1
517	1	7044	7	37	5	\N	1	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:14:28.347996	2021-12-02 13:14:28.347996	2	4
518	1	7045	7	37	5	\N	1.2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:14:28.353391	2021-12-02 13:14:28.353391	2	5
519	1	7046	7	37	5	\N	1.8	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:14:28.358801	2021-12-02 13:14:28.358801	2	6
520	1	7047	7	37	5	\N	2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:14:28.364269	2021-12-02 13:14:28.364269	2	7
521	1	7048	7	37	5	\N	2.5	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:14:28.369759	2021-12-02 13:14:28.369759	2	8
522	1	7049	7	38	1	\N	1	1200	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:14:28.375318	2021-12-02 13:14:28.375318	2	3
523	1	7050	7	38	4	\N	1	0	USD	\N	2	4	9	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:14:28.380885	2021-12-02 13:14:28.380885	2	3
524	1	7051	7	39	1	\N	1.2	9587	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	1	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 13:14:28.386398	2021-12-02 13:14:28.386398	2	3
525	1	7052	7	39	1	\N	2.4	19174	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	2	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 13:14:28.391973	2021-12-02 13:14:28.391973	2	1
526	1	7053	7	39	1	\N	3.6	28760	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	3	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 13:14:28.397582	2021-12-02 13:14:28.397582	2	4
527	1	7054	7	39	1	\N	4.8	38347	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	4	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 13:14:28.40307	2021-12-02 13:14:28.40307	2	2
528	1	7055	7	39	3	\N	1	2160	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	2160	USD	0.9	\N	1	1	\N	7141.0	\N	\N	\N	\N	2021-12-02 13:14:28.408553	2021-12-02 13:14:28.408553	2	1
529	1	7056	7	39	3	\N	1.2	3240	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	3240	USD	1	\N	1	1	\N	7142.0	\N	\N	\N	\N	2021-12-02 13:14:28.414015	2021-12-02 13:14:28.414015	2	4
530	1	7057	7	39	3	\N	1.8	6480	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	6480	USD	1.2	\N	1	1	\N	7144.0	\N	\N	\N	\N	2021-12-02 13:14:28.419476	2021-12-02 13:14:28.419476	2	5
531	1	7058	7	39	3	\N	2	9720	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	9720	USD	1.3	\N	1	1	\N	7145.0	\N	\N	\N	\N	2021-12-02 13:14:28.424928	2021-12-02 13:14:28.424928	2	6
532	1	7059	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 13:14:28.430487	2021-12-02 13:14:28.430487	2	3
533	1	7060	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	2	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 13:14:28.435914	2021-12-02 13:14:28.435914	2	10
534	1	7061	7	39	4	\N	0.6	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	3	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 13:14:28.441503	2021-12-02 13:14:28.441503	2	3
535	1	7062	7	39	4	\N	0.8	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	4	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 13:14:28.447204	2021-12-02 13:14:28.447204	2	1
536	1	7063	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:14:28.45288	2021-12-02 13:14:28.45288	2	4
537	1	7064	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:14:28.458573	2021-12-02 13:14:28.458573	2	5
538	1	7065	7	39	5	\N	0.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:14:28.464134	2021-12-02 13:14:28.464134	2	6
539	1	7066	7	39	5	\N	0.8	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:14:28.498782	2021-12-02 13:14:28.498782	2	7
540	1	7067	7	40	1	\N	3.3	9600	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7521.0	\N	\N	\N	\N	2021-12-02 13:14:28.50455	2021-12-02 13:14:28.50455	2	3
541	1	7068	7	40	1	\N	6.6	18000	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	2	1	\N	7521.0	\N	\N	\N	\N	2021-12-02 13:14:28.510081	2021-12-02 13:14:28.510081	2	1
542	1	7069	7	40	3	\N	0.8	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	7541.0	\N	\N	\N	\N	2021-12-02 13:14:28.515579	2021-12-02 13:14:28.515579	2	3
543	1	7070	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1	\N	1	1	\N	7542.0	\N	\N	\N	\N	2021-12-02 13:14:28.521063	2021-12-02 13:14:28.521063	2	1
544	1	7071	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	7543.0	\N	\N	\N	\N	2021-12-02 13:14:28.526565	2021-12-02 13:14:28.526565	2	4
545	1	7072	7	40	3	\N	1.2	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	7544.0	\N	\N	\N	\N	2021-12-02 13:14:28.532103	2021-12-02 13:14:28.532103	2	5
546	1	7073	7	40	3	\N	1.4	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.4	\N	1	1	\N	7545.0	\N	\N	\N	\N	2021-12-02 13:14:28.537761	2021-12-02 13:14:28.537761	2	6
547	1	7074	7	40	3	\N	1.6	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	7546.0	\N	\N	\N	\N	2021-12-02 13:14:28.543349	2021-12-02 13:14:28.543349	2	7
548	1	7075	7	40	4	\N	0.5	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	7582.0	\N	\N	\N	\N	2021-12-02 13:14:28.54887	2021-12-02 13:14:28.54887	2	3
549	1	7076	7	40	4	\N	0.8	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	7582.0	\N	\N	\N	\N	2021-12-02 13:14:28.554456	2021-12-02 13:14:28.554456	2	1
550	1	7077	7	40	5	\N	0.5	0	USD	\N	29	4	9	35	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7581.0	\N	\N	\N	\N	2021-12-02 13:14:28.55998	2021-12-02 13:14:28.55998	2	3
551	1	7078	7	41	1	\N	8.7	28200	USD	\N	30	1	1	36	1	\N	3	\N	\N	0	USD	0	USD	8.7	\N	1	1	\N	7321.0	\N	\N	\N	\N	2021-12-02 13:14:28.565544	2021-12-02 13:14:28.565544	2	3
552	1	7079	7	41	2	\N	1	2800	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	2.7	\N	1	1	\N	7351.0	\N	\N	\N	\N	2021-12-02 13:14:28.5711	2021-12-02 13:14:28.5711	2	1
553	1	7080	7	41	2	\N	1.1	3120	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7352.0	\N	\N	\N	\N	2021-12-02 13:14:28.576603	2021-12-02 13:14:28.576603	2	4
554	1	7081	7	41	2	\N	1.3	6240	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.9	\N	1	1	\N	7353.0	\N	\N	\N	\N	2021-12-02 13:14:28.582273	2021-12-02 13:14:28.582273	2	5
555	1	7082	7	41	2	\N	1.6	9360	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	7354.0	\N	\N	\N	\N	2021-12-02 13:14:28.587936	2021-12-02 13:14:28.587936	2	6
556	1	7083	7	41	3	\N	1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	\N	2021-12-02 13:14:28.593565	2021-12-02 13:14:28.593565	2	1
557	1	7084	7	41	3	\N	1.1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	\N	2021-12-02 13:14:28.599155	2021-12-02 13:14:28.599155	2	4
558	1	7085	7	41	3	\N	1.3	9360	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	6240	USD	1.3	\N	1	1	\N	7357.0	\N	\N	\N	\N	2021-12-02 13:14:28.604706	2021-12-02 13:14:28.604706	2	5
559	1	7086	7	41	3	\N	1.6	12480	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	9360	USD	1.6	\N	1	1	\N	7358.0	\N	\N	\N	\N	2021-12-02 13:14:28.610334	2021-12-02 13:14:28.610334	2	6
560	1	7087	7	41	4	\N	1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 13:14:28.615846	2021-12-02 13:14:28.615846	2	1
561	1	7088	7	41	4	\N	1.1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 13:14:28.621377	2021-12-02 13:14:28.621377	2	4
562	1	7089	7	41	4	\N	1.3	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 13:14:28.626985	2021-12-02 13:14:28.626985	2	5
563	1	7090	7	41	5	\N	1	0	USD	\N	30	5	9	36	5	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 13:14:28.632353	2021-12-02 13:14:28.632353	2	3
564	1	7091	7	42	1	\N	1.5	3600	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:14:28.637902	2021-12-02 13:14:28.637902	2	3
565	1	7092	7	42	1	\N	2.5	7200	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:14:28.643498	2021-12-02 13:14:28.643498	2	1
566	1	7093	7	42	3	\N	0.5	1400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:14:28.649136	2021-12-02 13:14:28.649136	2	3
567	1	7094	7	42	3	\N	1	2400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:14:28.654872	2021-12-02 13:14:28.654872	2	1
568	1	7095	7	42	3	\N	1	3600	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:14:28.660487	2021-12-02 13:14:28.660487	2	4
569	1	7096	7	42	4	\N	0.5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:14:28.666066	2021-12-02 13:14:28.666066	2	3
570	1	7097	7	42	4	\N	5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:14:28.671694	2021-12-02 13:14:28.671694	2	1
571	1	7098	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:14:28.677319	2021-12-02 13:14:28.677319	2	3
572	1	7099	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:14:28.682818	2021-12-02 13:14:28.682818	2	1
573	1	7100	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:14:28.688338	2021-12-02 13:14:28.688338	2	4
574	1	7101	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:14:28.693917	2021-12-02 13:14:28.693917	2	2
575	1	7102	7	39	5	\N	1	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:14:28.699388	2021-12-02 13:14:28.699388	2	8
576	1	7103	7	39	5	\N	1.2	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:14:28.704921	2021-12-02 13:14:28.704921	2	18
577	1	7104	7	39	5	\N	1.4	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:14:28.710439	2021-12-02 13:14:28.710439	2	34
578	1	7105	7	39	5	\N	1.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:14:28.715984	2021-12-02 13:14:28.715984	2	19
579	1	7106	7	43	1	\N	4	17200	USD	\N	1	1	1	38	1	\N	2	\N	\N	0	USD	21000	USD	3.8	\N	1	1	\N	2523.0	\N	\N	\N	\N	2021-12-02 13:14:28.721489	2021-12-02 13:14:28.721489	2	19
580	1	7107	7	43	2	\N	1.3	2880	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	\N	2021-12-02 13:14:28.727049	2021-12-02 13:14:28.727049	2	4
581	1	7108	7	43	2	\N	1.8	5760	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	\N	2021-12-02 13:14:28.732479	2021-12-02 13:14:28.732479	2	5
582	1	7109	7	43	2	\N	2	8640	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	\N	2021-12-02 13:14:28.738013	2021-12-02 13:14:28.738013	2	6
583	1	7110	7	43	2	\N	2.5	11520	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	\N	2021-12-02 13:14:28.74344	2021-12-02 13:14:28.74344	2	7
584	1	7111	7	43	2	\N	3	14400	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	\N	2021-12-02 13:14:28.748972	2021-12-02 13:14:28.748972	2	8
585	1	7112	7	43	3	\N	1	2880	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	2550.0	\N	\N	\N	\N	2021-12-02 13:14:28.754519	2021-12-02 13:14:28.754519	2	1
586	1	7113	7	43	3	\N	1.3	5760	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	\N	2021-12-02 13:14:28.760057	2021-12-02 13:14:28.760057	2	4
587	1	7114	7	43	3	\N	1.8	7200	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	\N	2021-12-02 13:14:28.765517	2021-12-02 13:14:28.765517	2	5
588	1	7115	7	43	3	\N	2	8640	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	\N	2021-12-02 13:14:28.770982	2021-12-02 13:14:28.770982	2	6
589	1	7116	7	43	3	\N	2.5	10080	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	\N	2021-12-02 13:14:28.77653	2021-12-02 13:14:28.77653	2	7
590	1	7117	7	43	3	\N	3	11500	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	\N	2021-12-02 13:14:28.782073	2021-12-02 13:14:28.782073	2	8
591	1	7118	7	43	4	\N	1	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:14:28.787553	2021-12-02 13:14:28.787553	2	10
592	1	7119	7	43	4	\N	1.2	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:14:28.792951	2021-12-02 13:14:28.792951	2	1
593	1	7120	7	43	5	\N	1	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:14:28.798439	2021-12-02 13:14:28.798439	2	4
594	1	7121	7	43	5	\N	1.2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:14:28.803908	2021-12-02 13:14:28.803908	2	5
595	1	7122	7	43	5	\N	1.8	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:14:28.809403	2021-12-02 13:14:28.809403	2	6
596	1	7123	7	43	5	\N	2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:14:28.814949	2021-12-02 13:14:28.814949	2	7
597	1	7124	7	43	5	\N	2.5	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:14:28.820434	2021-12-02 13:14:28.820434	2	8
598	1	8000	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	\N	2021-12-02 13:14:28.825989	2021-12-02 13:14:28.825989	1	1
599	1	8001	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	\N	2021-12-02 13:14:28.831631	2021-12-02 13:14:28.831631	1	2
600	1	8002	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 13:14:28.837157	2021-12-02 13:14:28.837157	1	1
601	1	8003	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 13:14:28.84264	2021-12-02 13:14:28.84264	1	2
602	1	8004	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 13:14:28.847966	2021-12-02 13:14:28.847966	1	1
603	1	8005	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 13:14:28.853452	2021-12-02 13:14:28.853452	1	2
604	1	8006	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	\N	2021-12-02 13:14:28.858878	2021-12-02 13:14:28.858878	1	1
605	1	8007	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.864395	2021-12-02 13:14:28.864395	1	2
606	1	8008	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	\N	2021-12-02 13:14:28.86987	2021-12-02 13:14:28.86987	1	1
607	1	8009	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.875595	2021-12-02 13:14:28.875595	1	2
608	1	8010	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.881089	2021-12-02 13:14:28.881089	1	1
609	1	8011	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.886486	2021-12-02 13:14:28.886486	1	2
610	1	8012	8	44	22	\N	0.5	0	USD	\N	33	17	16	45	20	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.898753	2021-12-02 13:14:28.898753	1	1
611	1	8013	8	44	23	\N	0.5	0	USD	\N	4	18	17	46	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.904383	2021-12-02 13:14:28.904383	1	2
612	1	8014	8	44	23	\N	0.5	0	USD	\N	4	18	17	47	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.910086	2021-12-02 13:14:28.910086	1	16
613	1	8015	8	44	23	\N	0.5	0	USD	\N	4	18	17	48	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.915547	2021-12-02 13:14:28.915547	1	7
614	1	8016	8	44	23	\N	0.5	0	USD	\N	4	18	17	49	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.920989	2021-12-02 13:14:28.920989	1	46
615	1	8017	8	44	23	\N	0.5	0	USD	\N	4	18	17	50	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.926615	2021-12-02 13:14:28.926615	1	1
616	1	8018	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.93212	2021-12-02 13:14:28.93212	2	3
617	1	8019	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.937691	2021-12-02 13:14:28.937691	2	1
618	1	8020	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.943237	2021-12-02 13:14:28.943237	2	4
619	1	8021	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.948736	2021-12-02 13:14:28.948736	2	2
620	1	8022	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.954285	2021-12-02 13:14:28.954285	2	3
621	1	8023	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.95974	2021-12-02 13:14:28.95974	2	5
622	1	8024	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.965357	2021-12-02 13:14:28.965357	2	26
623	1	8025	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.970839	2021-12-02 13:14:28.970839	2	16
624	1	8026	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.976289	2021-12-02 13:14:28.976289	2	6
625	1	8027	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.98187	2021-12-02 13:14:28.98187	2	10
626	1	8028	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.987322	2021-12-02 13:14:28.987322	2	12
627	1	8029	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:14:28.992655	2021-12-02 13:14:28.992655	2	7
628	1	8030	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 13:14:28.998091	2021-12-02 13:14:28.998091	11	6
629	1	8031	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 13:14:29.003454	2021-12-02 13:14:29.003454	16	9
630	1	8032	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 13:14:29.008877	2021-12-02 13:14:29.008877	17	20
631	1	8033	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 13:14:29.014364	2021-12-02 13:14:29.014364	18	49
632	1	8034	9	45	1	\N	0.5	500	USD	\N	34	1	6	52	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	951.0	\N	\N	\N	\N	2021-12-02 13:14:29.019838	2021-12-02 13:14:29.019838	2	3
633	1	8035	9	46	1	\N	0.5	500	USD	\N	34	1	6	53	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	952.0	\N	\N	\N	\N	2021-12-02 13:14:29.025549	2021-12-02 13:14:29.025549	2	3
634	1	8036	9	47	1	\N	1	0	USD	\N	35	1	6	54	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.031168	2021-12-02 13:14:29.031168	2	3
635	1	8037	9	48	1	\N	1	0	USD	\N	36	1	6	55	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.064713	2021-12-02 13:14:29.064713	2	3
636	1	8038	9	49	1	\N	2	500	USD	\N	37	1	6	56	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.070357	2021-12-02 13:14:29.070357	2	3
637	1	8039	9	50	1	\N	0.5	0	USD	\N	38	1	6	57	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.076092	2021-12-02 13:14:29.076092	2	3
638	1	8040	9	51	1	\N	0.5	0	USD	\N	34	1	6	58	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.081918	2021-12-02 13:14:29.081918	2	3
639	1	8041	9	52	1	\N	0.5	0	USD	\N	39	1	6	59	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.087501	2021-12-02 13:14:29.087501	2	3
640	1	8042	9	53	1	\N	0.5	0	USD	\N	40	1	6	60	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.093026	2021-12-02 13:14:29.093026	2	3
641	1	8043	9	54	1	\N	0.5	0	USD	\N	41	1	6	61	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.09858	2021-12-02 13:14:29.09858	2	3
642	1	8044	9	55	1	\N	0.5	0	USD	\N	42	1	6	62	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.104052	2021-12-02 13:14:29.104052	2	3
643	1	8045	9	56	1	\N	0.5	0	USD	\N	32	1	6	63	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.10951	2021-12-02 13:14:29.10951	2	3
644	1	8046	9	57	1	\N	0.5	0	USD	\N	43	1	6	64	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.115101	2021-12-02 13:14:29.115101	2	3
645	1	8047	9	58	1	\N	2	500	USD	\N	43	1	6	65	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.12069	2021-12-02 13:14:29.12069	2	3
646	1	8048	9	59	1	\N	0.5	0	USD	\N	44	1	6	66	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:14:29.126171	2021-12-02 13:14:29.126171	2	3
647	1	8049	9	60	8	\N	0.5	300	USD	\N	45	8	7	67	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 13:14:29.131738	2021-12-02 13:14:29.131738	2	3
648	1	8050	9	61	8	\N	0.5	0	USD	\N	46	8	7	68	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 13:14:29.137241	2021-12-02 13:14:29.137241	2	3
649	1	8051	9	62	8	\N	0.5	0	USD	\N	37	8	7	69	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 13:14:29.142671	2021-12-02 13:14:29.142671	2	3
650	1	8052	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.148112	2021-12-02 13:14:29.148112	2	3
651	1	8053	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.153585	2021-12-02 13:14:29.153585	2	1
652	1	8054	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.159123	2021-12-02 13:14:29.159123	2	4
653	1	8055	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.164643	2021-12-02 13:14:29.164643	2	2
654	1	8056	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.170272	2021-12-02 13:14:29.170272	2	3
655	1	8057	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.175937	2021-12-02 13:14:29.175937	2	5
656	1	8058	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.181454	2021-12-02 13:14:29.181454	2	26
657	1	8059	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.186878	2021-12-02 13:14:29.186878	2	16
658	1	8060	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.192297	2021-12-02 13:14:29.192297	2	6
659	1	8061	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.197742	2021-12-02 13:14:29.197742	2	10
660	1	8062	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.203156	2021-12-02 13:14:29.203156	2	3
661	1	8063	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.20858	2021-12-02 13:14:29.20858	2	1
662	1	8064	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.214012	2021-12-02 13:14:29.214012	2	4
663	1	8065	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.219468	2021-12-02 13:14:29.219468	2	2
664	1	8066	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.224907	2021-12-02 13:14:29.224907	2	3
665	1	8067	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.23062	2021-12-02 13:14:29.23062	2	5
666	1	8068	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.236307	2021-12-02 13:14:29.236307	2	26
667	1	8069	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.241853	2021-12-02 13:14:29.241853	2	16
668	1	8070	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.247533	2021-12-02 13:14:29.247533	2	6
669	1	8071	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.253072	2021-12-02 13:14:29.253072	2	10
670	1	8072	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.258634	2021-12-02 13:14:29.258634	2	3
671	1	8073	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.26413	2021-12-02 13:14:29.26413	2	1
672	1	8074	10	63	27	\N	0.5	1200	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.269714	2021-12-02 13:14:29.269714	2	4
673	1	8075	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.275469	2021-12-02 13:14:29.275469	2	2
674	1	8076	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.281074	2021-12-02 13:14:29.281074	2	3
675	1	8077	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.286703	2021-12-02 13:14:29.286703	2	5
676	1	8078	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.292135	2021-12-02 13:14:29.292135	2	26
677	1	8079	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.297593	2021-12-02 13:14:29.297593	2	16
678	1	8080	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.303026	2021-12-02 13:14:29.303026	2	6
679	1	8081	10	63	27	\N	2	1500	USD	\N	4	19	1	6	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:14:29.308482	2021-12-02 13:14:29.308482	2	10
680	1	8090	9	64	28	\N	16	67500	USD	\N	4	6	1	6	24	\N	3	\N	\N	0	USD	67500	USD	16	\N	1	1	\N	9999.0	\N	\N	\N	\N	2021-12-02 13:14:29.313967	2021-12-02 13:14:29.313967	2	3
681	1	8091	9	64	29	\N	3	157500	USD	\N	4	1	1	6	1	\N	3	\N	\N	0	USD	157500	USD	3	\N	1	1	\N	9999.0	\N	\N	\N	\N	2021-12-02 13:14:29.319436	2021-12-02 13:14:29.319436	2	3
682	1	8100	11	65	30	\N	1	0	USD	\N	4	5	1	6	25	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	\N	2021-12-02 13:14:29.324895	2021-12-02 13:14:29.324895	2	3
683	1	8101	11	65	31	\N	0.5	0	USD	\N	4	5	1	6	19	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	\N	2021-12-02 13:14:29.330226	2021-12-02 13:14:29.330226	2	3
684	1	9001	12	66	1	\N	1.2	10000	USD	\N	47	1	21	72	26	\N	3	\N	\N	0	USD	800	USD	0.3	\N	1	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:14:29.335617	2021-12-02 13:14:29.335617	2	3
685	1	9002	12	66	3	\N	1.2	800	USD	\N	47	3	21	72	27	\N	3	\N	\N	0	USD	800	USD	0.3	\N	2	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:14:29.341068	2021-12-02 13:14:29.341068	2	3
686	1	9003	12	66	32	\N	1.2	800	USD	\N	47	6	9	72	28	\N	3	\N	\N	0	USD	800	USD	0.3	\N	3	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:14:29.346562	2021-12-02 13:14:29.346562	2	3
687	1	9004	12	66	7	\N	1.2	800	USD	\N	47	8	9	72	29	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:14:29.351986	2021-12-02 13:14:29.351986	2	3
688	1	9005	12	66	33	\N	1.2	800	USD	\N	47	10	9	72	30	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:14:29.357492	2021-12-02 13:14:29.357492	2	3
689	1	9006	12	66	34	\N	1.2	800	USD	\N	47	11	9	72	31	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:14:29.362949	2021-12-02 13:14:29.362949	2	3
690	1	9007	12	66	5	\N	1.2	800	USD	\N	47	5	9	72	32	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:14:29.368421	2021-12-02 13:14:29.368421	2	3
691	1	9008	12	66	35	\N	1.2	800	USD	\N	47	20	5	72	33	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:14:29.373873	2021-12-02 13:14:29.373873	2	3
692	1	9009	12	67	1	\N	1.2	10000	USD	\N	48	1	9	73	26	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:14:29.379431	2021-12-02 13:14:29.379431	2	3
693	1	9010	12	67	2	\N	1.2	3000	USD	\N	48	2	9	73	34	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:14:29.385013	2021-12-02 13:14:29.385013	2	3
694	1	9011	12	67	3	\N	1.2	3000	USD	\N	48	3	9	73	27	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:14:29.390527	2021-12-02 13:14:29.390527	2	3
695	1	9012	12	67	7	\N	1.2	800	USD	\N	48	8	7	73	29	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:14:29.396133	2021-12-02 13:14:29.396133	2	3
696	1	9013	12	67	5	\N	1.2	0	USD	\N	48	5	2	73	32	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:14:29.401674	2021-12-02 13:14:29.401674	2	3
697	1	9014	12	67	36	\N	1.2	200	USD	\N	48	7	9	73	35	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:14:29.407109	2021-12-02 13:14:29.407109	2	3
698	1	9015	12	68	1	\N	1.2	8000	USD	\N	49	1	9	74	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.412605	2021-12-02 13:14:29.412605	2	3
699	1	9016	12	68	2	\N	1.2	1000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.418096	2021-12-02 13:14:29.418096	2	4
700	1	9017	12	68	2	\N	1.2	2000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.423673	2021-12-02 13:14:29.423673	2	5
701	1	9018	12	68	2	\N	1.2	3000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.429225	2021-12-02 13:14:29.429225	2	6
702	1	9019	12	68	2	\N	1.2	4000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.434654	2021-12-02 13:14:29.434654	2	7
703	1	9020	12	68	7	\N	1.2	800	USD	\N	49	8	9	74	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:29.440275	2021-12-02 13:14:29.440275	2	3
704	1	9021	12	69	2	\N	1.2	800	USD	\N	21	2	9	75	34	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:29.44589	2021-12-02 13:14:29.44589	2	3
705	1	9022	12	70	1	\N	1.2	8000	USD	\N	50	1	9	76	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.451417	2021-12-02 13:14:29.451417	2	3
706	1	9023	12	70	2	\N	1.2	1000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.456862	2021-12-02 13:14:29.456862	2	4
707	1	9024	12	70	2	\N	1.2	2000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.462444	2021-12-02 13:14:29.462444	2	5
708	1	9025	12	70	2	\N	1.2	3000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.468141	2021-12-02 13:14:29.468141	2	6
709	1	9026	12	70	2	\N	1.2	4000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:14:29.473776	2021-12-02 13:14:29.473776	2	7
710	1	9027	12	70	7	\N	1.2	800	USD	\N	50	8	9	76	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:14:29.479624	2021-12-02 13:14:29.479624	2	3
711	1	9028	12	71	1	\N	1	6500	USD	\N	51	1	9	77	26	\N	3	\N	\N	0	USD	5000	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:14:29.485221	2021-12-02 13:14:29.485221	2	3
712	1	9029	12	71	33	\N	1	300	USD	\N	51	10	1	77	30	\N	3	\N	\N	0	USD	0	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:14:29.490711	2021-12-02 13:14:29.490711	2	3
713	1	9030	12	71	5	\N	0.5	300	USD	\N	51	5	2	77	32	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	2	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:14:29.496152	2021-12-02 13:14:29.496152	2	3
714	1	9031	12	72	1	\N	1	6500	USD	\N	19	1	9	78	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:14:29.501977	2021-12-02 13:14:29.501977	2	3
715	1	9032	12	72	5	\N	0.5	300	USD	\N	19	5	9	78	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:14:29.507405	2021-12-02 13:14:29.507405	2	3
716	1	9033	12	73	32	\N	1.4	1920	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.512989	2021-12-02 13:14:29.512989	17	4
717	1	9034	12	73	32	\N	1.5	2160	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	\N	2021-12-02 13:14:29.518666	2021-12-02 13:14:29.518666	5	2
718	1	9035	12	73	32	\N	1.6	2400	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	\N	2021-12-02 13:14:29.524394	2021-12-02 13:14:29.524394	6	8
719	1	9036	12	73	32	\N	1.8	2880	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	\N	2021-12-02 13:14:29.529797	2021-12-02 13:14:29.529797	8	5
720	1	9037	12	73	7	\N	1.2	800	USD	\N	52	8	9	79	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.535505	2021-12-02 13:14:29.535505	2	3
721	1	9038	12	73	37	\N	1.5	2800	USD	\N	52	21	9	79	36	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.541223	2021-12-02 13:14:29.541223	2	3
722	1	9039	12	73	5	\N	1	0	USD	\N	52	5	2	79	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.546893	2021-12-02 13:14:29.546893	2	3
723	1	9040	12	74	38	\N	0.5	1000	USD	\N	53	22	1	80	37	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.552563	2021-12-02 13:14:29.552563	2	3
724	1	9041	12	75	39	\N	1.5	1200	USD	\N	54	23	19	81	38	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.586506	2021-12-02 13:14:29.586506	2	3
725	1	9042	12	75	32	\N	1.4	1920	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.592278	2021-12-02 13:14:29.592278	17	4
726	1	9043	12	75	32	\N	1.5	2160	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	\N	2021-12-02 13:14:29.598079	2021-12-02 13:14:29.598079	5	2
727	1	9044	12	75	32	\N	1.6	2400	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	\N	2021-12-02 13:14:29.603733	2021-12-02 13:14:29.603733	6	8
728	1	9045	12	75	32	\N	1.8	2880	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	\N	2021-12-02 13:14:29.609399	2021-12-02 13:14:29.609399	8	5
729	1	9046	12	75	7	\N	1.2	800	USD	\N	54	8	22	81	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.615104	2021-12-02 13:14:29.615104	2	3
730	1	9047	12	75	40	\N	1.2	800	USD	\N	54	18	19	81	39	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.620809	2021-12-02 13:14:29.620809	2	3
731	1	9048	12	75	5	\N	1	0	USD	\N	54	5	2	81	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.626692	2021-12-02 13:14:29.626692	2	3
732	1	9049	12	75	36	\N	1	600	USD	\N	54	7	3	81	35	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:14:29.6325	2021-12-02 13:14:29.6325	2	3
733	1	9050	12	76	32	\N	1	600	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	1900	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 13:14:29.638295	2021-12-02 13:14:29.638295	6	3
734	1	9051	12	76	32	\N	1.4	1920	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	2400	USD	0.9	\N	1	2	\N	6502.0	\N	\N	\N	\N	2021-12-02 13:14:29.643995	2021-12-02 13:14:29.643995	17	4
735	1	9052	12	76	32	\N	1.5	2160	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	3500	USD	1.3	\N	1	2	\N	6511.0	\N	\N	\N	\N	2021-12-02 13:14:29.649782	2021-12-02 13:14:29.649782	5	2
736	1	9053	12	76	32	\N	1.6	2400	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	5500	USD	1.7	\N	1	2	\N	6512.0	\N	\N	\N	\N	2021-12-02 13:14:29.655581	2021-12-02 13:14:29.655581	6	8
737	1	9054	12	76	32	\N	1.8	2880	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	7500	USD	2.1	\N	1	2	\N	6513.0	\N	\N	\N	\N	2021-12-02 13:14:29.661324	2021-12-02 13:14:29.661324	8	5
738	1	9055	12	76	40	\N	1.2	800	USD	\N	4	18	19	82	39	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 13:14:29.667137	2021-12-02 13:14:29.667137	2	3
739	1	9056	12	76	5	\N	1	0	USD	\N	4	5	2	82	32	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 13:14:29.672922	2021-12-02 13:14:29.672922	2	3
740	1	9057	12	76	36	\N	1	600	USD	\N	4	7	3	82	35	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 13:14:29.679193	2021-12-02 13:14:29.679193	2	3
741	1	9058	12	77	1	\N	3	21000	USD	\N	55	1	9	83	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 13:14:29.684972	2021-12-02 13:14:29.684972	23	51
742	1	9059	12	77	2	\N	1	3000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 13:14:29.690577	2021-12-02 13:14:29.690577	23	4
743	1	9060	12	77	2	\N	2	6000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.696524	2021-12-02 13:14:29.696524	23	5
744	1	9061	12	77	2	\N	3	9000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.702262	2021-12-02 13:14:29.702262	23	6
745	1	9062	12	77	2	\N	3.5	12000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.707879	2021-12-02 13:14:29.707879	23	7
746	1	9063	12	77	5	\N	1	0	USD	\N	55	5	2	83	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.71359	2021-12-02 13:14:29.71359	2	3
747	1	9064	12	77	41	\N	1	600	USD	\N	55	4	3	83	40	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.719214	2021-12-02 13:14:29.719214	2	3
748	1	9065	12	77	36	\N	0.5	300	USD	\N	55	7	3	83	35	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.724778	2021-12-02 13:14:29.724778	2	3
749	1	9066	12	78	1	\N	3	21000	USD	\N	56	1	3	84	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 13:14:29.730418	2021-12-02 13:14:29.730418	23	51
750	1	9067	12	78	2	\N	1	3000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 13:14:29.73623	2021-12-02 13:14:29.73623	23	4
751	1	9068	12	78	2	\N	2	6000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.741907	2021-12-02 13:14:29.741907	23	5
752	1	9069	12	78	2	\N	3	9000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.747652	2021-12-02 13:14:29.747652	23	6
753	1	9070	12	78	2	\N	3.5	12000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.753407	2021-12-02 13:14:29.753407	23	7
754	1	9071	12	78	7	\N	1.2	800	USD	\N	56	8	5	84	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.759006	2021-12-02 13:14:29.759006	2	3
755	1	9072	12	78	5	\N	1	0	USD	\N	56	5	5	84	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.764562	2021-12-02 13:14:29.764562	2	3
756	1	9073	12	78	35	\N	1	600	USD	\N	56	20	9	84	33	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.77362	2021-12-02 13:14:29.77362	2	3
757	1	9074	12	79	1	\N	3	21000	USD	\N	57	1	9	85	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 13:14:29.781581	2021-12-02 13:14:29.781581	23	51
758	1	9075	12	79	2	\N	1	3000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 13:14:29.78746	2021-12-02 13:14:29.78746	23	4
759	1	9076	12	79	2	\N	2	6000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.793367	2021-12-02 13:14:29.793367	23	5
760	1	9077	12	79	2	\N	3	9000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.799319	2021-12-02 13:14:29.799319	23	6
761	1	9078	12	79	2	\N	3.5	12000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:14:29.805117	2021-12-02 13:14:29.805117	23	7
762	1	9079	12	79	7	\N	1.2	800	USD	\N	57	8	9	85	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.811035	2021-12-02 13:14:29.811035	2	3
763	1	9080	12	79	5	\N	1	0	USD	\N	57	5	2	85	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.816989	2021-12-02 13:14:29.816989	2	3
764	1	9081	12	79	42	\N	1	600	USD	\N	57	4	9	85	41	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.822846	2021-12-02 13:14:29.822846	2	3
765	1	9082	12	79	36	\N	0.5	300	USD	\N	57	7	9	85	35	\N	3	\N	\N	0	USD	500	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:14:29.82859	2021-12-02 13:14:29.82859	2	3
766	1	9083	12	80	1	\N	1	5000	USD	\N	58	1	9	86	26	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:14:29.834186	2021-12-02 13:14:29.834186	2	3
767	1	9084	12	80	7	\N	0.5	500	USD	\N	58	8	9	86	29	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:14:29.839755	2021-12-02 13:14:29.839755	2	3
768	1	9085	12	80	5	\N	0.5	0	USD	\N	58	5	9	86	32	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:14:29.845379	2021-12-02 13:14:29.845379	2	3
769	1	9086	12	81	1	\N	1	5000	USD	\N	59	1	9	87	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 13:14:29.851075	2021-12-02 13:14:29.851075	2	3
770	1	9087	12	81	33	\N	0.5	500	USD	\N	59	10	1	87	30	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 13:14:29.856871	2021-12-02 13:14:29.856871	2	3
771	1	9088	12	81	5	\N	0.5	0	USD	\N	59	5	2	87	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 13:14:29.862836	2021-12-02 13:14:29.862836	2	3
772	2	1001	1	1	1	\N	7.8	57000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3421.0	\N	\N	\N	\N	2021-12-02 13:37:13.525364	2021-12-02 13:37:13.525364	1	1
773	2	1002	1	1	1	\N	15.6	114000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	15.6	\N	1	1	\N	3422.0	\N	\N	\N	\N	2021-12-02 13:37:13.555041	2021-12-02 13:37:13.555041	1	2
774	2	1003	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	3600	USD	1.1	\N	1	1	\N	3451.0	\N	\N	\N	\N	2021-12-02 13:37:13.583939	2021-12-02 13:37:13.583939	2	3
775	2	1004	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	5040	USD	1.4	\N	1	1	\N	3452.0	\N	\N	\N	\N	2021-12-02 13:37:13.612174	2021-12-02 13:37:13.612174	2	1
776	2	1005	1	1	2	\N	1.5	3398	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	6480	USD	1.6	\N	1	1	\N	3453.0	\N	\N	\N	\N	2021-12-02 13:37:13.640698	2021-12-02 13:37:13.640698	2	4
777	2	1006	1	1	2	\N	2	4248	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	3454.0	\N	\N	\N	\N	2021-12-02 13:37:13.668732	2021-12-02 13:37:13.668732	2	5
778	2	1007	1	1	2	\N	2.5	5947	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	13680	USD	2.7	\N	1	1	\N	3455.0	\N	\N	\N	\N	2021-12-02 13:37:13.696147	2021-12-02 13:37:13.696147	2	6
779	2	1008	1	1	2	\N	2.8	7646	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	17280	USD	3.8	\N	1	1	\N	3456.0	\N	\N	\N	\N	2021-12-02 13:37:13.723204	2021-12-02 13:37:13.723204	2	7
780	2	1009	1	1	2	\N	3	10526	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	0	USD	4.9	\N	1	1	\N	3457.0	\N	\N	\N	\N	2021-12-02 13:37:13.749946	2021-12-02 13:37:13.749946	2	8
781	2	1010	1	1	3	\N	0.9	1699	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	1440	USD	0.7	\N	1	1	\N	3441.0	\N	\N	\N	\N	2021-12-02 13:37:13.77727	2021-12-02 13:37:13.77727	2	3
782	2	1011	1	1	3	\N	0.9	2195	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2160	USD	0.8	\N	1	1	\N	3442.0	\N	\N	\N	\N	2021-12-02 13:37:13.805427	2021-12-02 13:37:13.805427	2	1
783	2	1012	1	1	3	\N	1	2549	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2880	USD	0.9	\N	1	1	\N	3443.0	\N	\N	\N	\N	2021-12-02 13:37:13.879996	2021-12-02 13:37:13.879996	2	4
784	2	1013	1	1	3	\N	1.5	4248	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	3600	USD	1	\N	1	1	\N	3444.0	\N	\N	\N	\N	2021-12-02 13:37:13.908056	2021-12-02 13:37:13.908056	2	5
785	2	1014	1	1	3	\N	1.8	5098	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	3445.0	\N	\N	\N	\N	2021-12-02 13:37:13.936235	2021-12-02 13:37:13.936235	2	6
786	2	1015	1	1	3	\N	2	5947	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5040	USD	1.3	\N	1	1	\N	3446.0	\N	\N	\N	\N	2021-12-02 13:37:13.964544	2021-12-02 13:37:13.964544	2	7
787	2	1016	1	1	3	\N	2.2	6797	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	3447.0	\N	\N	\N	\N	2021-12-02 13:37:13.992607	2021-12-02 13:37:13.992607	2	8
788	2	1017	1	1	3	\N	2.8	8118	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	6480	USD	1.7	\N	1	1	\N	3448.0	\N	\N	\N	\N	2021-12-02 13:37:14.020216	2021-12-02 13:37:14.020216	2	9
789	2	1018	1	1	4	\N	0.5	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	3431.0	\N	\N	\N	\N	2021-12-02 13:37:14.047805	2021-12-02 13:37:14.047805	2	10
790	2	1019	1	1	4	\N	1	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:37:14.075177	2021-12-02 13:37:14.075177	2	1
791	2	1020	1	1	5	\N	0.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:37:14.102288	2021-12-02 13:37:14.102288	2	1
792	2	1021	1	1	5	\N	0.9	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:37:14.129759	2021-12-02 13:37:14.129759	2	4
793	2	1022	1	1	5	\N	1.5	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:37:14.157631	2021-12-02 13:37:14.157631	2	5
794	2	1023	1	1	5	\N	1.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:37:14.185151	2021-12-02 13:37:14.185151	2	6
795	2	1024	1	1	5	\N	2	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 13:37:14.211946	2021-12-02 13:37:14.211946	2	7
796	2	1025	1	2	1	\N	6	28500	USD	\N	1	1	1	2	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	\N	2021-12-02 13:37:14.23927	2021-12-02 13:37:14.23927	2	3
797	2	1026	1	3	1	\N	6	28500	USD	\N	1	1	1	3	1	\N	3	\N	\N	0	USD	33000	USD	3.1	\N	1	1	\N	4457.0	\N	\N	\N	\N	2021-12-02 13:37:14.268043	2021-12-02 13:37:14.268043	2	3
798	2	1027	1	2	2	\N	1.3	2879	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	\N	2021-12-02 13:37:14.296657	2021-12-02 13:37:14.296657	2	1
799	2	1028	1	2	2	\N	1.5	3398	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	\N	2021-12-02 13:37:14.326239	2021-12-02 13:37:14.326239	2	4
800	2	1029	1	2	2	\N	2	6797	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	\N	2021-12-02 13:37:14.355194	2021-12-02 13:37:14.355194	2	5
801	2	1030	1	2	2	\N	2.2	10195	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.8	\N	1	1	\N	2454.0	\N	\N	\N	\N	2021-12-02 13:37:14.383863	2021-12-02 13:37:14.383863	2	6
802	2	1031	1	2	2	\N	2.5	13594	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	2455.0	\N	\N	\N	\N	2021-12-02 13:37:14.41941	2021-12-02 13:37:14.41941	2	7
803	2	1032	1	2	2	\N	3	16992	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	2456.0	\N	\N	\N	\N	2021-12-02 13:37:14.447827	2021-12-02 13:37:14.447827	2	8
804	2	1033	1	2	2	\N	4.5	20390	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	2457.0	\N	\N	\N	\N	2021-12-02 13:37:14.475852	2021-12-02 13:37:14.475852	2	9
805	2	1034	1	2	3	\N	1.3	2879	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2442.0	\N	\N	\N	\N	2021-12-02 13:37:14.50413	2021-12-02 13:37:14.50413	2	1
806	2	1035	1	2	3	\N	1.5	3398	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	2443.0	\N	\N	\N	\N	2021-12-02 13:37:14.532555	2021-12-02 13:37:14.532555	2	4
807	2	1036	1	2	3	\N	2	6797	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2444.0	\N	\N	\N	\N	2021-12-02 13:37:14.561726	2021-12-02 13:37:14.561726	2	5
808	2	1037	1	2	3	\N	2.2	10195	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	2445.0	\N	\N	\N	\N	2021-12-02 13:37:14.626292	2021-12-02 13:37:14.626292	2	6
809	2	1038	1	2	3	\N	2.5	13594	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	2446.0	\N	\N	\N	\N	2021-12-02 13:37:14.654635	2021-12-02 13:37:14.654635	2	7
810	2	1039	1	2	3	\N	3	16992	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	2447.0	\N	\N	\N	\N	2021-12-02 13:37:14.683368	2021-12-02 13:37:14.683368	2	8
811	2	1040	1	2	3	\N	4.5	20390	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	2448.0	\N	\N	\N	\N	2021-12-02 13:37:14.711937	2021-12-02 13:37:14.711937	2	9
812	2	1041	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:14.740212	2021-12-02 13:37:14.740212	2	10
813	2	1042	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:14.768848	2021-12-02 13:37:14.768848	2	1
814	2	1043	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:14.797662	2021-12-02 13:37:14.797662	2	1
815	2	1044	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:14.825777	2021-12-02 13:37:14.825777	2	4
816	2	1045	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:14.854296	2021-12-02 13:37:14.854296	2	5
817	2	1046	1	2	5	\N	0.6	300	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:14.882518	2021-12-02 13:37:14.882518	2	6
818	2	1047	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:14.911128	2021-12-02 13:37:14.911128	2	7
819	2	1048	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:14.940028	2021-12-02 13:37:14.940028	2	8
820	2	1049	2	4	1	\N	1.1	1910	USD	\N	2	1	4	4	1	\N	3	\N	\N	0	USD	5000	USD	0.4	\N	1	1	\N	7920.0	\N	\N	\N	\N	2021-12-02 13:37:14.975179	2021-12-02 13:37:14.975179	2	3
821	2	1050	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 13:37:15.004391	2021-12-02 13:37:15.004391	3	10
822	2	1051	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 13:37:15.033475	2021-12-02 13:37:15.033475	4	1
823	2	1053	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7981.0	\N	\N	\N	\N	2021-12-02 13:37:15.062258	2021-12-02 13:37:15.062258	3	10
824	2	1054	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 13:37:15.091087	2021-12-02 13:37:15.091087	4	1
825	2	1055	2	5	1	\N	2.5	19000	USD	\N	3	1	1	5	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	\N	2021-12-02 13:37:15.11982	2021-12-02 13:37:15.11982	2	3
826	2	1056	2	5	3	\N	1.2	1410	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	2880	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	\N	2021-12-02 13:37:15.148371	2021-12-02 13:37:15.148371	3	10
827	2	1057	2	5	3	\N	1	1910	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	4320	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	\N	2021-12-02 13:37:15.177091	2021-12-02 13:37:15.177091	4	1
828	2	1058	2	5	3	\N	1	2450	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	5760	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	\N	2021-12-02 13:37:15.206421	2021-12-02 13:37:15.206421	4	4
829	2	1059	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:15.235042	2021-12-02 13:37:15.235042	3	10
830	2	1060	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:15.263719	2021-12-02 13:37:15.263719	4	1
831	2	1061	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 13:37:15.292117	2021-12-02 13:37:15.292117	4	4
832	2	1062	2	6	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	1410	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 13:37:15.320599	2021-12-02 13:37:15.320599	5	12
833	2	1063	2	6	6	\N	0.8	1410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 13:37:15.385419	2021-12-02 13:37:15.385419	3	10
834	2	1064	2	6	6	\N	1	1680	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 13:37:15.414912	2021-12-02 13:37:15.414912	4	1
835	2	1065	2	6	6	\N	1.4	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	1112.0	\N	\N	\N	\N	2021-12-02 13:37:15.443793	2021-12-02 13:37:15.443793	4	4
836	2	1066	2	6	6	\N	1.5	2160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	1	\N	1	1	\N	1113.0	\N	\N	\N	\N	2021-12-02 13:37:15.472662	2021-12-02 13:37:15.472662	6	13
837	2	1067	2	6	6	\N	1.6	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2160	USD	1	\N	1	1	\N	1114.0	\N	\N	\N	\N	2021-12-02 13:37:15.501131	2021-12-02 13:37:15.501131	7	14
838	2	1068	2	6	6	\N	1.8	2880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	1115.0	\N	\N	\N	\N	2021-12-02 13:37:15.529762	2021-12-02 13:37:15.529762	8	5
839	2	1069	2	6	6	\N	2	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2880	USD	1.5	\N	1	1	\N	1116.0	\N	\N	\N	\N	2021-12-02 13:37:15.564348	2021-12-02 13:37:15.564348	9	15
840	2	1070	2	6	6	\N	2.4	5410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.8	\N	1	1	\N	1117.0	\N	\N	\N	\N	2021-12-02 13:37:15.593713	2021-12-02 13:37:15.593713	10	16
841	2	1071	2	6	6	\N	2.69	6960	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6960	USD	2.2	\N	1	1	\N	1118.0	\N	\N	\N	\N	2021-12-02 13:37:15.622861	2021-12-02 13:37:15.622861	11	6
842	2	1072	2	6	6	\N	2.8	8880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8880	USD	2.4	\N	1	1	\N	1119.0	\N	\N	\N	\N	2021-12-02 13:37:15.651845	2021-12-02 13:37:15.651845	12	17
843	2	1073	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.680713	2021-12-02 13:37:15.680713	2	10
844	2	1074	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.709268	2021-12-02 13:37:15.709268	2	1
845	2	1075	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.737756	2021-12-02 13:37:15.737756	3	10
846	2	1076	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.765878	2021-12-02 13:37:15.765878	4	1
847	2	1077	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.795322	2021-12-02 13:37:15.795322	2	5
848	2	1078	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.823856	2021-12-02 13:37:15.823856	2	7
849	2	1079	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.852634	2021-12-02 13:37:15.852634	2	18
850	2	1080	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.881236	2021-12-02 13:37:15.881236	2	19
851	2	1081	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.910146	2021-12-02 13:37:15.910146	2	20
852	2	1082	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.939161	2021-12-02 13:37:15.939161	2	21
853	2	1083	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.967971	2021-12-02 13:37:15.967971	2	22
854	2	1084	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:15.996736	2021-12-02 13:37:15.996736	2	23
855	2	1085	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:16.025327	2021-12-02 13:37:16.025327	2	24
856	2	1086	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 13:37:16.05296	2021-12-02 13:37:16.05296	2	25
857	2	1095	1	3	3	\N	1.3	2879	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	4442.0	\N	\N	\N	\N	2021-12-02 13:37:16.086941	2021-12-02 13:37:16.086941	2	1
858	2	1096	1	3	3	\N	1.5	3398	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4443.0	\N	\N	\N	\N	2021-12-02 13:37:16.21263	2021-12-02 13:37:16.21263	2	4
859	2	1097	1	3	3	\N	2	6797	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4444.0	\N	\N	\N	\N	2021-12-02 13:37:16.265157	2021-12-02 13:37:16.265157	2	5
860	2	1098	1	3	3	\N	2.2	10195	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4445.0	\N	\N	\N	\N	2021-12-02 13:37:16.29446	2021-12-02 13:37:16.29446	2	6
861	2	1099	1	3	3	\N	2.5	13594	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	4446.0	\N	\N	\N	\N	2021-12-02 13:37:16.323811	2021-12-02 13:37:16.323811	2	7
862	2	1100	1	3	3	\N	3	16992	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4447.0	\N	\N	\N	\N	2021-12-02 13:37:16.352681	2021-12-02 13:37:16.352681	2	8
863	2	1101	1	3	3	\N	4.5	20390	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4448.0	\N	\N	\N	\N	2021-12-02 13:37:16.381865	2021-12-02 13:37:16.381865	2	9
864	2	1102	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:37:16.411249	2021-12-02 13:37:16.411249	2	10
865	2	1103	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:37:16.440203	2021-12-02 13:37:16.440203	2	1
866	2	1104	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:37:16.483441	2021-12-02 13:37:16.483441	2	1
867	2	1105	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:37:16.542337	2021-12-02 13:37:16.542337	2	4
868	2	1106	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:37:16.574445	2021-12-02 13:37:16.574445	2	5
869	2	1107	1	3	5	\N	0.6	300	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:37:16.603178	2021-12-02 13:37:16.603178	2	6
870	2	1108	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:37:16.631449	2021-12-02 13:37:16.631449	2	7
871	2	1109	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 13:37:16.659784	2021-12-02 13:37:16.659784	2	8
872	2	2001	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	0	USD	3.8	\N	1	1	\N	2122.0	\N	\N	\N	\N	2021-12-02 13:37:16.694084	2021-12-02 13:37:16.694084	13	19
873	2	2002	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	30000	USD	4.2	\N	1	1	\N	2121.0	\N	\N	\N	\N	2021-12-02 13:37:16.722527	2021-12-02 13:37:16.722527	13	26
874	2	2003	3	7	6	\N	0.8	1841	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	\N	2021-12-02 13:37:16.751862	2021-12-02 13:37:16.751862	3	10
875	2	2004	3	7	6	\N	1	2266	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	\N	2021-12-02 13:37:16.781122	2021-12-02 13:37:16.781122	4	1
876	2	2005	3	7	6	\N	1.4	2832	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.9	\N	1	1	\N	2112.0	\N	\N	\N	\N	2021-12-02 13:37:16.891168	2021-12-02 13:37:16.891168	4	4
877	2	2006	3	7	6	\N	1.5	3729	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	2113.0	\N	\N	\N	\N	2021-12-02 13:37:16.921084	2021-12-02 13:37:16.921084	6	13
878	2	2007	3	7	6	\N	1.6	4531	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	2114.0	\N	\N	\N	\N	2021-12-02 13:37:16.950557	2021-12-02 13:37:16.950557	7	14
879	2	2008	3	7	6	\N	1.8	5098	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.4	\N	1	1	\N	2115.0	\N	\N	\N	\N	2021-12-02 13:37:16.97972	2021-12-02 13:37:16.97972	8	5
880	2	2009	3	7	6	\N	2	5947	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.7	\N	1	1	\N	2116.0	\N	\N	\N	\N	2021-12-02 13:37:17.009077	2021-12-02 13:37:17.009077	9	15
881	2	2010	3	7	6	\N	2.1	6443	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	2117.0	\N	\N	\N	\N	2021-12-02 13:37:17.037875	2021-12-02 13:37:17.037875	10	16
882	2	2011	3	7	6	\N	2.2	9629	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.4	\N	1	1	\N	2118.0	\N	\N	\N	\N	2021-12-02 13:37:17.066534	2021-12-02 13:37:17.066534	11	6
883	2	2012	3	7	6	\N	2.3	10077	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.6	\N	1	1	\N	2119.0	\N	\N	\N	\N	2021-12-02 13:37:17.095318	2021-12-02 13:37:17.095318	12	17
884	2	2013	3	7	4	\N	0.3	354	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.124127	2021-12-02 13:37:17.124127	2	10
885	2	2014	3	7	4	\N	0.6	708	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.153314	2021-12-02 13:37:17.153314	2	1
886	2	2015	3	7	4	\N	0.6	354	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.182794	2021-12-02 13:37:17.182794	3	10
887	2	2016	3	7	4	\N	1	708	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.21157	2021-12-02 13:37:17.21157	4	1
888	2	2017	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.240757	2021-12-02 13:37:17.240757	2	5
889	2	2018	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.26984	2021-12-02 13:37:17.26984	2	7
890	2	2019	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.304876	2021-12-02 13:37:17.304876	2	18
891	2	2020	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.333482	2021-12-02 13:37:17.333482	2	19
892	2	2021	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.362275	2021-12-02 13:37:17.362275	2	20
893	2	2022	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.391526	2021-12-02 13:37:17.391526	2	21
894	2	2023	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.421046	2021-12-02 13:37:17.421046	2	22
895	2	2024	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.450223	2021-12-02 13:37:17.450223	2	23
896	2	2025	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.478935	2021-12-02 13:37:17.478935	2	24
897	2	2026	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 13:37:17.507707	2021-12-02 13:37:17.507707	2	25
898	2	2031	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6	\N	1	1	\N	2621.0	\N	\N	\N	\N	2021-12-02 13:37:17.536037	2021-12-02 13:37:17.536037	2	19
899	2	2032	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6.2	\N	1	1	\N	2622.0	\N	\N	\N	\N	2021-12-02 13:37:17.564698	2021-12-02 13:37:17.564698	2	26
900	2	2033	4	8	3	\N	1.5	5376	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	4800	USD	1.1	\N	1	1	\N	2642.0	\N	\N	\N	\N	2021-12-02 13:37:17.593235	2021-12-02 13:37:17.593235	2	4
901	2	2034	4	8	3	\N	2	10752	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	9600	USD	1.3	\N	1	1	\N	2644.0	\N	\N	\N	\N	2021-12-02 13:37:17.655283	2021-12-02 13:37:17.655283	2	5
902	2	2035	4	8	3	\N	3	16128	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	14400	USD	1.6	\N	1	1	\N	2645.0	\N	\N	\N	\N	2021-12-02 13:37:17.684633	2021-12-02 13:37:17.684633	2	6
903	2	2036	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 13:37:17.713679	2021-12-02 13:37:17.713679	2	4
904	2	2037	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 13:37:17.742744	2021-12-02 13:37:17.742744	2	5
905	2	2038	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 13:37:17.771008	2021-12-02 13:37:17.771008	2	6
906	2	3001	3	9	1	\N	0.6	1290	USD	\N	6	1	6	9	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:37:17.799831	2021-12-02 13:37:17.799831	2	3
907	2	3002	3	9	7	\N	0.6	1290	USD	\N	6	8	1	9	8	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:37:17.828734	2021-12-02 13:37:17.828734	2	3
908	2	3003	3	10	1	\N	4.5	17840	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3	\N	1	1	\N	3221.0	\N	\N	\N	\N	2021-12-02 13:37:17.864001	2021-12-02 13:37:17.864001	13	19
909	2	3004	3	10	1	\N	4.5	0	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	3121.0	\N	\N	\N	\N	2021-12-02 13:37:17.892637	2021-12-02 13:37:17.892637	13	26
910	2	3005	3	10	6	\N	0.8	1560	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.7	\N	1	1	\N	3111.0	\N	\N	\N	\N	2021-12-02 13:37:17.922062	2021-12-02 13:37:17.922062	3	10
911	2	3006	3	10	6	\N	1	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.8	\N	1	1	\N	3112.0	\N	\N	\N	\N	2021-12-02 13:37:17.951461	2021-12-02 13:37:17.951461	4	1
912	2	3007	3	10	6	\N	1.4	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1	\N	1	1	\N	3113.0	\N	\N	\N	\N	2021-12-02 13:37:17.981118	2021-12-02 13:37:17.981118	4	4
913	2	3008	3	10	6	\N	1.5	3160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.3	\N	1	1	\N	3114.0	\N	\N	\N	\N	2021-12-02 13:37:18.009289	2021-12-02 13:37:18.009289	6	13
914	2	3009	3	10	6	\N	1.6	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	4320	USD	1.5	\N	1	1	\N	3115.0	\N	\N	\N	\N	2021-12-02 13:37:18.037884	2021-12-02 13:37:18.037884	7	14
915	2	3010	3	10	6	\N	1.8	4320	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5040	USD	1.8	\N	1	1	\N	3116.0	\N	\N	\N	\N	2021-12-02 13:37:18.067212	2021-12-02 13:37:18.067212	8	5
916	2	3011	3	10	6	\N	2	5040	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2.2	\N	1	1	\N	3117.0	\N	\N	\N	\N	2021-12-02 13:37:18.095849	2021-12-02 13:37:18.095849	9	15
917	2	3012	3	10	6	\N	2.1	5460	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	11520	USD	2.6	\N	1	1	\N	3118.0	\N	\N	\N	\N	2021-12-02 13:37:18.124609	2021-12-02 13:37:18.124609	10	16
918	2	3013	3	10	6	\N	2.2	8160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	\N	2021-12-02 13:37:18.153214	2021-12-02 13:37:18.153214	11	6
919	2	3014	3	10	6	\N	2.3	8540	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	\N	2021-12-02 13:37:18.181459	2021-12-02 13:37:18.181459	12	17
920	2	3015	3	10	4	\N	1	600	USD	\N	4	4	5	6	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.210611	2021-12-02 13:37:18.210611	2	10
921	2	3016	3	10	4	\N	0.6	600	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	300	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.238524	2021-12-02 13:37:18.238524	2	1
922	2	3017	3	10	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.265766	2021-12-02 13:37:18.265766	3	10
923	2	3018	3	10	4	\N	1	600	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.292894	2021-12-02 13:37:18.292894	4	1
924	2	3019	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.319946	2021-12-02 13:37:18.319946	2	5
925	2	3020	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.347441	2021-12-02 13:37:18.347441	2	7
926	2	3021	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.405722	2021-12-02 13:37:18.405722	2	18
927	2	3022	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.440745	2021-12-02 13:37:18.440745	2	19
928	2	3023	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.468759	2021-12-02 13:37:18.468759	2	20
929	2	3024	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.497447	2021-12-02 13:37:18.497447	2	21
930	2	3025	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.525546	2021-12-02 13:37:18.525546	2	22
931	2	3026	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.553098	2021-12-02 13:37:18.553098	2	23
932	2	3027	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.580687	2021-12-02 13:37:18.580687	2	24
933	2	3028	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 13:37:18.608272	2021-12-02 13:37:18.608272	2	25
934	2	4001	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	4621.0	\N	\N	\N	\N	2021-12-02 13:37:18.635759	2021-12-02 13:37:18.635759	2	19
935	2	4002	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.6	\N	1	1	\N	4622.0	\N	\N	\N	\N	2021-12-02 13:37:18.663287	2021-12-02 13:37:18.663287	2	26
936	2	4003	4	11	3	\N	1.5	4301	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	4642.0	\N	\N	\N	\N	2021-12-02 13:37:18.69098	2021-12-02 13:37:18.69098	2	4
937	2	4004	4	11	3	\N	2	8602	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	7680	USD	1.3	\N	1	1	\N	4644.0	\N	\N	\N	\N	2021-12-02 13:37:18.718819	2021-12-02 13:37:18.718819	2	5
938	2	4005	4	11	3	\N	3	12880	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	11520	USD	1.6	\N	1	1	\N	4645.0	\N	\N	\N	\N	2021-12-02 13:37:18.745741	2021-12-02 13:37:18.745741	2	6
939	2	4006	4	11	5	\N	1	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 13:37:18.773173	2021-12-02 13:37:18.773173	2	4
940	2	4007	4	11	5	\N	1.5	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 13:37:18.800542	2021-12-02 13:37:18.800542	2	5
941	2	4008	4	11	5	\N	2	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	2	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 13:37:18.827582	2021-12-02 13:37:18.827582	2	6
942	2	4009	4	12	1	\N	2.3	10820	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	\N	2021-12-02 13:37:18.854172	2021-12-02 13:37:18.854172	2	3
943	2	4010	4	13	1	\N	2.3	10820	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 13:37:18.881486	2021-12-02 13:37:18.881486	2	3
944	2	4011	4	14	4	\N	1	300	USD	\N	8	4	2	13	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 13:37:18.908868	2021-12-02 13:37:18.908868	2	3
945	2	5000	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3	\N	1	1	\N	5121.0	\N	\N	\N	\N	2021-12-02 13:37:18.942706	2021-12-02 13:37:18.942706	2	3
946	2	5001	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	5122.0	\N	\N	\N	\N	2021-12-02 13:37:18.97057	2021-12-02 13:37:18.97057	2	3
947	2	5002	5	15	6	\N	1	1400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	5111.0	\N	\N	\N	\N	2021-12-02 13:37:18.998326	2021-12-02 13:37:18.998326	3	10
948	2	5003	5	15	6	\N	1.3	1882	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	5112.0	\N	\N	\N	\N	2021-12-02 13:37:19.026746	2021-12-02 13:37:19.026746	4	1
949	2	5004	5	15	6	\N	1.5	2957	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	5113.0	\N	\N	\N	\N	2021-12-02 13:37:19.054377	2021-12-02 13:37:19.054377	4	4
950	2	5005	5	15	6	\N	1.8	4301	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.2	\N	1	1	\N	5114.0	\N	\N	\N	\N	2021-12-02 13:37:19.082012	2021-12-02 13:37:19.082012	6	13
951	2	5006	5	15	6	\N	2	6451	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	5115.0	\N	\N	\N	\N	2021-12-02 13:37:19.140218	2021-12-02 13:37:19.140218	7	14
952	2	5007	5	15	6	\N	2.2	7526	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.8	\N	1	1	\N	5116.0	\N	\N	\N	\N	2021-12-02 13:37:19.168575	2021-12-02 13:37:19.168575	8	5
953	2	5008	5	15	6	\N	2.3	9094	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	5117.0	\N	\N	\N	\N	2021-12-02 13:37:19.197155	2021-12-02 13:37:19.197155	9	15
954	2	5009	5	15	6	\N	2.5	11290	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	5118.0	\N	\N	\N	\N	2021-12-02 13:37:19.225373	2021-12-02 13:37:19.225373	10	16
955	2	5010	5	15	6	\N	3	13574	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	\N	2021-12-02 13:37:19.252968	2021-12-02 13:37:19.252968	11	6
956	2	5011	5	15	6	\N	3.5	16934	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	\N	2021-12-02 13:37:19.280407	2021-12-02 13:37:19.280407	12	17
957	2	5012	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.307781	2021-12-02 13:37:19.307781	2	10
958	2	5013	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.336064	2021-12-02 13:37:19.336064	2	1
959	2	5014	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.364371	2021-12-02 13:37:19.364371	3	10
960	2	5015	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.391785	2021-12-02 13:37:19.391785	4	1
961	2	5016	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.419487	2021-12-02 13:37:19.419487	2	5
962	2	5017	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.446919	2021-12-02 13:37:19.446919	2	7
963	2	5018	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.474244	2021-12-02 13:37:19.474244	2	18
964	2	5019	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.507997	2021-12-02 13:37:19.507997	2	19
965	2	5020	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.535739	2021-12-02 13:37:19.535739	2	20
966	2	5021	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.562651	2021-12-02 13:37:19.562651	2	21
967	2	5022	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.589583	2021-12-02 13:37:19.589583	2	22
968	2	5023	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.617216	2021-12-02 13:37:19.617216	2	23
969	2	5024	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.644528	2021-12-02 13:37:19.644528	2	24
970	2	5025	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 13:37:19.672086	2021-12-02 13:37:19.672086	2	25
971	2	5030	5	16	2	\N	0.5	1000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:37:19.699747	2021-12-02 13:37:19.699747	2	4
972	2	5031	5	16	2	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:37:19.727281	2021-12-02 13:37:19.727281	2	5
973	2	5032	5	16	2	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:37:19.75457	2021-12-02 13:37:19.75457	2	6
974	2	5033	5	16	2	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:37:19.782478	2021-12-02 13:37:19.782478	2	7
975	2	5034	5	16	2	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:37:19.80999	2021-12-02 13:37:19.80999	2	8
976	2	5035	5	16	2	\N	1	6500	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:37:19.867926	2021-12-02 13:37:19.867926	2	9
977	2	5036	5	16	2	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 13:37:19.895283	2021-12-02 13:37:19.895283	2	19
978	2	5037	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:19.922547	2021-12-02 13:37:19.922547	2	10
979	2	5038	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:19.950152	2021-12-02 13:37:19.950152	2	1
980	2	5039	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:19.977909	2021-12-02 13:37:19.977909	2	4
981	2	5040	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:20.00521	2021-12-02 13:37:20.00521	2	5
982	2	5041	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:20.039213	2021-12-02 13:37:20.039213	2	6
983	2	5042	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:20.066611	2021-12-02 13:37:20.066611	2	7
984	2	5043	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:20.094898	2021-12-02 13:37:20.094898	2	8
985	2	5044	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:20.122729	2021-12-02 13:37:20.122729	2	9
986	2	5045	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:20.150736	2021-12-02 13:37:20.150736	2	19
987	2	5046	5	17	1	\N	1	16822	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	1	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 13:37:20.178173	2021-12-02 13:37:20.178173	2	3
988	2	5047	5	17	1	\N	2	33645	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	2	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 13:37:20.205945	2021-12-02 13:37:20.205945	2	1
989	2	5048	5	17	1	\N	3	50467	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	3	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 13:37:20.236778	2021-12-02 13:37:20.236778	2	4
990	2	5049	5	17	1	\N	4	67290	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	4	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 13:37:20.264141	2021-12-02 13:37:20.264141	2	2
991	2	5050	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	1	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 13:37:20.291639	2021-12-02 13:37:20.291639	2	4
992	2	5051	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	2	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 13:37:20.31864	2021-12-02 13:37:20.31864	2	5
993	2	5052	5	17	2	\N	1	14560	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	3	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 13:37:20.346626	2021-12-02 13:37:20.346626	2	6
994	2	5053	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.373693	2021-12-02 13:37:20.373693	2	3
995	2	5054	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.400473	2021-12-02 13:37:20.400473	2	1
996	2	5055	5	17	4	\N	0.6	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.428855	2021-12-02 13:37:20.428855	2	4
997	2	5056	5	17	4	\N	0.8	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.456332	2021-12-02 13:37:20.456332	2	2
998	2	5057	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.483095	2021-12-02 13:37:20.483095	2	3
999	2	5058	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.509685	2021-12-02 13:37:20.509685	2	1
1000	2	5059	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.567118	2021-12-02 13:37:20.567118	2	4
1001	2	5060	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.600837	2021-12-02 13:37:20.600837	2	2
1002	2	5061	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.629328	2021-12-02 13:37:20.629328	2	3
1003	2	5062	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.657524	2021-12-02 13:37:20.657524	2	1
1004	2	5063	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.684763	2021-12-02 13:37:20.684763	2	4
1005	2	5064	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 13:37:20.712203	2021-12-02 13:37:20.712203	2	2
1006	2	5065	5	18	1	\N	0.5	963	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.740535	2021-12-02 13:37:20.740535	2	3
1007	2	5066	5	18	1	\N	0.5	1926	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.76821	2021-12-02 13:37:20.76821	2	1
1008	2	5067	5	18	1	\N	0.6	2890	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.795614	2021-12-02 13:37:20.795614	2	4
1009	2	5068	5	18	1	\N	0.8	3853	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.823338	2021-12-02 13:37:20.823338	2	2
1010	2	5069	5	18	1	\N	1	4816	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.850638	2021-12-02 13:37:20.850638	2	3
1011	2	5070	5	18	1	\N	1.2	5779	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.878034	2021-12-02 13:37:20.878034	2	5
1012	2	5071	5	18	1	\N	1.4	6742	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.905334	2021-12-02 13:37:20.905334	2	26
1013	2	5072	5	18	1	\N	1.6	7706	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.932761	2021-12-02 13:37:20.932761	2	16
1014	2	5073	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.960552	2021-12-02 13:37:20.960552	2	3
1015	2	5074	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:20.987645	2021-12-02 13:37:20.987645	2	1
1016	2	5075	5	18	5	\N	0.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:21.015107	2021-12-02 13:37:21.015107	2	4
1017	2	5076	5	18	5	\N	0.8	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:21.043665	2021-12-02 13:37:21.043665	2	2
1018	2	5077	5	18	5	\N	1	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:21.070816	2021-12-02 13:37:21.070816	2	3
1019	2	5078	5	18	5	\N	1.2	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:21.104823	2021-12-02 13:37:21.104823	2	5
1020	2	5079	5	18	5	\N	1.4	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:21.132153	2021-12-02 13:37:21.132153	2	26
1021	2	5080	5	18	5	\N	1.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:21.159208	2021-12-02 13:37:21.159208	2	16
1022	2	5081	5	18	10	\N	0.5	0	USD	\N	11	10	2	17	12	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 13:37:21.186301	2021-12-02 13:37:21.186301	2	3
1023	2	5082	5	19	1	\N	0.5	1725	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:37:21.213376	2021-12-02 13:37:21.213376	2	3
1024	2	5083	5	19	1	\N	0.5	3450	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:37:21.240876	2021-12-02 13:37:21.240876	2	1
1025	2	5084	5	19	1	\N	0.5	5174	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:37:21.300422	2021-12-02 13:37:21.300422	2	4
1026	2	5085	5	19	1	\N	0.8	6899	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:37:21.328193	2021-12-02 13:37:21.328193	2	2
1027	2	5086	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:37:21.356214	2021-12-02 13:37:21.356214	2	3
1028	2	5087	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:37:21.383474	2021-12-02 13:37:21.383474	2	1
1029	2	5088	5	19	4	\N	0.6	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:37:21.411389	2021-12-02 13:37:21.411389	2	4
1030	2	5089	5	19	4	\N	0.8	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 13:37:21.439491	2021-12-02 13:37:21.439491	2	2
1031	2	5090	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 13:37:21.467296	2021-12-02 13:37:21.467296	2	3
1032	2	5091	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 13:37:21.49548	2021-12-02 13:37:21.49548	2	1
1033	2	5092	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 13:37:21.523442	2021-12-02 13:37:21.523442	2	4
1034	2	5093	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 13:37:21.551193	2021-12-02 13:37:21.551193	2	2
1035	2	5094	5	20	1	\N	0.5	1456	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.578538	2021-12-02 13:37:21.578538	2	3
1036	2	5095	5	20	1	\N	0.5	2912	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.605851	2021-12-02 13:37:21.605851	2	1
1037	2	5096	5	20	1	\N	0.5	4368	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.633792	2021-12-02 13:37:21.633792	2	4
1038	2	5097	5	20	1	\N	0.5	5824	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.667479	2021-12-02 13:37:21.667479	2	2
1039	2	5098	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.695673	2021-12-02 13:37:21.695673	2	3
1040	2	5099	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.723292	2021-12-02 13:37:21.723292	2	1
1041	2	5100	5	20	4	\N	0.6	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.751349	2021-12-02 13:37:21.751349	2	4
1042	2	5101	5	20	4	\N	0.8	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.779261	2021-12-02 13:37:21.779261	2	2
1043	2	5102	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.806191	2021-12-02 13:37:21.806191	2	3
1044	2	5103	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.834514	2021-12-02 13:37:21.834514	2	1
1045	2	5104	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.861869	2021-12-02 13:37:21.861869	2	4
1046	2	5105	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.889483	2021-12-02 13:37:21.889483	2	2
1047	2	5106	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.917483	2021-12-02 13:37:21.917483	2	3
1048	2	5107	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.944775	2021-12-02 13:37:21.944775	2	1
1049	2	5108	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:21.972191	2021-12-02 13:37:21.972191	2	4
1050	2	5109	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.031391	2021-12-02 13:37:22.031391	2	2
1051	2	5110	5	21	1	\N	0.5	1021	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.059178	2021-12-02 13:37:22.059178	2	3
1052	2	5111	5	21	1	\N	0.5	2041	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.087287	2021-12-02 13:37:22.087287	2	1
1053	2	5112	5	21	1	\N	0.5	3062	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.115367	2021-12-02 13:37:22.115367	2	4
1054	2	5113	5	21	1	\N	0.5	4083	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.142688	2021-12-02 13:37:22.142688	2	2
1055	2	5114	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.170092	2021-12-02 13:37:22.170092	2	3
1056	2	5115	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.204203	2021-12-02 13:37:22.204203	2	1
1057	2	5116	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.232411	2021-12-02 13:37:22.232411	2	4
1058	2	5117	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.269127	2021-12-02 13:37:22.269127	2	2
1059	2	5118	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.297479	2021-12-02 13:37:22.297479	2	3
1060	2	5119	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.324872	2021-12-02 13:37:22.324872	2	1
1061	2	5120	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.352468	2021-12-02 13:37:22.352468	2	4
1062	2	5121	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.380332	2021-12-02 13:37:22.380332	2	2
1063	2	5122	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.408855	2021-12-02 13:37:22.408855	2	3
1064	2	5123	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.436587	2021-12-02 13:37:22.436587	2	1
1065	2	5124	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.463796	2021-12-02 13:37:22.463796	2	4
1066	2	5125	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 13:37:22.491019	2021-12-02 13:37:22.491019	2	2
1067	2	5126	5	22	1	\N	0.5	1156	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.518236	2021-12-02 13:37:22.518236	2	3
1068	2	5127	5	22	1	\N	0.6	2313	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.546171	2021-12-02 13:37:22.546171	2	1
1069	2	5128	5	22	1	\N	0.9	3469	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.573832	2021-12-02 13:37:22.573832	2	4
1070	2	5129	5	22	1	\N	1.2	4626	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.67691	2021-12-02 13:37:22.67691	2	2
1071	2	5130	5	22	5	\N	0.5	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.737648	2021-12-02 13:37:22.737648	2	3
1072	2	5131	5	22	5	\N	0.6	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.765599	2021-12-02 13:37:22.765599	2	1
1073	2	5132	5	22	5	\N	0.9	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.793509	2021-12-02 13:37:22.793509	2	4
1074	2	5133	5	22	5	\N	1.2	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.827204	2021-12-02 13:37:22.827204	2	2
1075	2	5134	5	23	1	\N	0.5	800	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.854685	2021-12-02 13:37:22.854685	2	3
1076	2	5135	5	23	1	\N	0.5	1600	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.922115	2021-12-02 13:37:22.922115	2	1
1077	2	5136	5	23	1	\N	0.6	2400	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.971415	2021-12-02 13:37:22.971415	2	4
1078	2	5137	5	23	1	\N	0.8	3200	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:22.998541	2021-12-02 13:37:22.998541	2	2
1079	2	5138	5	24	1	\N	0.5	1310	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.026002	2021-12-02 13:37:23.026002	2	3
1080	2	5139	5	24	1	\N	0.6	2620	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.05372	2021-12-02 13:37:23.05372	2	1
1081	2	5140	5	24	1	\N	0.9	3929	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.081486	2021-12-02 13:37:23.081486	2	4
1082	2	5141	5	24	1	\N	1.2	5239	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.108351	2021-12-02 13:37:23.108351	2	2
1083	2	5142	5	25	1	\N	0.5	1300	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.134779	2021-12-02 13:37:23.134779	2	3
1084	2	5143	5	25	1	\N	0.8	2600	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.183185	2021-12-02 13:37:23.183185	2	1
1085	2	5144	5	25	1	\N	1	3900	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.240364	2021-12-02 13:37:23.240364	2	4
1086	2	5145	5	25	1	\N	1	5200	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.268141	2021-12-02 13:37:23.268141	2	2
1087	2	5146	5	24	4	\N	0.5	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.295626	2021-12-02 13:37:23.295626	2	3
1088	2	5147	5	24	4	\N	0.6	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.322936	2021-12-02 13:37:23.322936	2	1
1089	2	5148	5	24	4	\N	0.9	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.350425	2021-12-02 13:37:23.350425	2	4
1090	2	5149	5	24	4	\N	1.2	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 13:37:23.419494	2021-12-02 13:37:23.419494	2	2
1091	2	5150	5	26	1	\N	1	4189	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	1	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:37:23.44887	2021-12-02 13:37:23.44887	2	3
1092	2	5151	5	26	1	\N	2	8378	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	2	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:37:23.499753	2021-12-02 13:37:23.499753	2	1
1093	2	5152	5	26	1	\N	3	12567	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	3	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:37:23.572766	2021-12-02 13:37:23.572766	2	4
1094	2	5153	5	26	1	\N	4	16756	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	4	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:37:23.714894	2021-12-02 13:37:23.714894	2	2
1095	2	5154	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:23.967417	2021-12-02 13:37:23.967417	2	3
1096	2	5155	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:24.10544	2021-12-02 13:37:24.10544	2	1
1097	2	5156	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:24.134496	2021-12-02 13:37:24.134496	2	4
1098	2	5157	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:24.162314	2021-12-02 13:37:24.162314	2	2
1099	2	5158	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:24.189506	2021-12-02 13:37:24.189506	2	3
1100	2	5159	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:24.217096	2021-12-02 13:37:24.217096	2	1
1101	2	5160	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:24.244958	2021-12-02 13:37:24.244958	2	4
1102	2	5161	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:24.27228	2021-12-02 13:37:24.27228	2	2
1103	2	5162	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 13:37:24.300134	2021-12-02 13:37:24.300134	2	3
1104	2	5163	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 13:37:24.327853	2021-12-02 13:37:24.327853	2	1
1105	2	5164	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 13:37:24.354886	2021-12-02 13:37:24.354886	2	4
1106	2	5165	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 13:37:24.38212	2021-12-02 13:37:24.38212	2	2
1107	2	5166	5	27	1	\N	1	3550	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	1	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:37:24.409559	2021-12-02 13:37:24.409559	2	3
1108	2	5167	5	27	1	\N	1.5	7100	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	2	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:37:24.437038	2021-12-02 13:37:24.437038	2	1
1109	2	5168	5	27	1	\N	1.5	10650	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	3	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:37:24.471595	2021-12-02 13:37:24.471595	2	4
1110	2	5169	5	27	1	\N	2	14200	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	4	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:37:24.525833	2021-12-02 13:37:24.525833	2	2
1111	2	5170	5	28	2	\N	0.5	2360	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	\N	2021-12-02 13:37:24.693181	2021-12-02 13:37:24.693181	2	3
1112	2	5171	5	28	2	\N	1	2950	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	\N	2021-12-02 13:37:24.802298	2021-12-02 13:37:24.802298	2	1
1113	2	5172	5	28	2	\N	1.5	3540	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	\N	2021-12-02 13:37:25.032985	2021-12-02 13:37:25.032985	2	4
1114	2	5173	5	28	2	\N	2	7080	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	\N	2021-12-02 13:37:25.155933	2021-12-02 13:37:25.155933	2	5
1115	2	5174	5	28	2	\N	2.2	10620	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	\N	2021-12-02 13:37:25.184224	2021-12-02 13:37:25.184224	2	6
1116	2	5175	5	28	2	\N	2.5	14160	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	\N	2021-12-02 13:37:25.218783	2021-12-02 13:37:25.218783	2	7
1117	2	5176	5	28	2	\N	3	17700	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:37:25.247765	2021-12-02 13:37:25.247765	2	8
1118	2	5177	5	28	2	\N	3.6	22420	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:37:25.276092	2021-12-02 13:37:25.276092	2	9
1119	2	5178	5	28	2	\N	5	28320	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:37:25.304687	2021-12-02 13:37:25.304687	2	19
1120	2	5179	5	28	3	\N	0.5	2360	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	\N	2021-12-02 13:37:25.332875	2021-12-02 13:37:25.332875	2	3
1121	2	5180	5	28	3	\N	1	2950	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	\N	2021-12-02 13:37:25.361256	2021-12-02 13:37:25.361256	2	1
1122	2	5181	5	28	3	\N	1.5	3540	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	\N	2021-12-02 13:37:25.389025	2021-12-02 13:37:25.389025	2	4
1123	2	5182	5	28	3	\N	2	7080	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	\N	2021-12-02 13:37:25.417059	2021-12-02 13:37:25.417059	2	5
1124	2	5183	5	28	3	\N	2.2	10620	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	\N	2021-12-02 13:37:25.444952	2021-12-02 13:37:25.444952	2	6
1125	2	5184	5	28	3	\N	2.5	14160	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	\N	2021-12-02 13:37:25.472489	2021-12-02 13:37:25.472489	2	7
1126	2	5185	5	28	3	\N	3	17700	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:37:25.500488	2021-12-02 13:37:25.500488	2	8
1127	2	5186	5	28	3	\N	3.6	22420	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:37:25.527779	2021-12-02 13:37:25.527779	2	9
1128	2	5187	5	28	3	\N	5	28320	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 13:37:25.555287	2021-12-02 13:37:25.555287	2	19
1129	2	5188	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.582372	2021-12-02 13:37:25.582372	2	10
1130	2	5189	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.609647	2021-12-02 13:37:25.609647	2	1
1131	2	5190	5	28	5	\N	0.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.636697	2021-12-02 13:37:25.636697	2	3
1132	2	5191	5	28	5	\N	1.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.663916	2021-12-02 13:37:25.663916	2	4
1133	2	5192	5	28	5	\N	2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.690772	2021-12-02 13:37:25.690772	2	5
1134	2	5193	5	28	5	\N	2.2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.717364	2021-12-02 13:37:25.717364	2	6
1135	2	5194	5	28	5	\N	2.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.750542	2021-12-02 13:37:25.750542	2	7
1136	2	5195	5	28	5	\N	3	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.808245	2021-12-02 13:37:25.808245	2	8
1137	2	5196	5	28	5	\N	3.6	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.836944	2021-12-02 13:37:25.836944	2	9
1138	2	5197	5	28	5	\N	5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 13:37:25.864639	2021-12-02 13:37:25.864639	2	19
1139	2	5198	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:25.892016	2021-12-02 13:37:25.892016	2	1
1140	2	5199	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:25.920191	2021-12-02 13:37:25.920191	2	4
1141	2	5200	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:25.948258	2021-12-02 13:37:25.948258	2	5
1142	2	5201	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:25.975587	2021-12-02 13:37:25.975587	2	6
1143	2	5202	5	29	1	\N	0.5	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.002467	2021-12-02 13:37:26.002467	2	7
1144	2	5203	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.029246	2021-12-02 13:37:26.029246	2	8
1145	2	5204	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.057233	2021-12-02 13:37:26.057233	2	9
1146	2	5205	5	29	1	\N	0.6	3172	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	2400	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.084342	2021-12-02 13:37:26.084342	2	19
1147	2	5206	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.111825	2021-12-02 13:37:26.111825	2	10
1148	2	5207	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.138791	2021-12-02 13:37:26.138791	2	1
1149	2	5208	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.166276	2021-12-02 13:37:26.166276	2	4
1150	2	5209	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.194075	2021-12-02 13:37:26.194075	2	5
1151	2	5210	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.288594	2021-12-02 13:37:26.288594	2	6
1152	2	5211	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.341253	2021-12-02 13:37:26.341253	2	7
1153	2	5212	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.369216	2021-12-02 13:37:26.369216	2	8
1154	2	5213	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.396094	2021-12-02 13:37:26.396094	2	9
1155	2	5214	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	5	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 13:37:26.423677	2021-12-02 13:37:26.423677	2	19
1156	2	5215	5	30	1	\N	0.7	1500	USD	\N	22	1	1	27	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5623.0	\N	\N	\N	\N	2021-12-02 13:37:26.489628	2021-12-02 13:37:26.489628	2	3
1157	2	5216	5	30	5	\N	0.5	0	USD	\N	22	5	5	27	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	\N	2021-12-02 13:37:26.522041	2021-12-02 13:37:26.522041	2	3
1158	2	5217	5	30	4	\N	0.5	300	USD	\N	22	4	10	27	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	\N	2021-12-02 13:37:26.558467	2021-12-02 13:37:26.558467	2	3
1159	2	5218	5	12	1	\N	2.3	12768	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	\N	2021-12-02 13:37:26.58616	2021-12-02 13:37:26.58616	2	3
1160	2	5219	5	13	1	\N	2.3	12768	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 13:37:26.613918	2021-12-02 13:37:26.613918	2	3
1161	2	5220	5	14	4	\N	0.6	600	USD	\N	8	4	2	12	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 13:37:26.641581	2021-12-02 13:37:26.641581	2	3
1162	2	5221	5	31	1	\N	1	1400	USD	\N	23	1	1	28	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	\N	2021-12-02 13:37:26.669655	2021-12-02 13:37:26.669655	2	3
1163	2	5222	5	31	4	\N	1	1400	USD	\N	23	7	1	28	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	\N	2021-12-02 13:37:26.697264	2021-12-02 13:37:26.697264	2	3
1164	2	5223	5	16	1	\N	0.5	1000	USD	\N	9	2	3	15	1	\N	2	\N	\N	0	USD	900	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:26.724714	2021-12-02 13:37:26.724714	2	4
1165	2	5224	5	16	1	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	1800	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:26.752144	2021-12-02 13:37:26.752144	2	5
1166	2	5225	5	16	1	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2700	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:26.779756	2021-12-02 13:37:26.779756	2	6
1167	2	5226	5	16	1	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:26.807697	2021-12-02 13:37:26.807697	2	7
1168	2	5227	5	16	1	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2400	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:26.835792	2021-12-02 13:37:26.835792	2	8
1169	2	5228	5	16	1	\N	1	6000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2800	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:26.863473	2021-12-02 13:37:26.863473	2	18
1170	2	5229	5	16	1	\N	1	7000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3150	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:26.896927	2021-12-02 13:37:26.896927	2	34
1171	2	5230	5	16	1	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:26.92497	2021-12-02 13:37:26.92497	2	19
1172	2	5231	5	15	11	\N	0.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:26.95256	2021-12-02 13:37:26.95256	2	3
1173	2	5232	5	15	11	\N	1	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:26.980205	2021-12-02 13:37:26.980205	2	1
1174	2	5233	5	15	11	\N	1.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:27.008047	2021-12-02 13:37:27.008047	2	4
1175	2	5234	5	15	11	\N	2	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:27.03535	2021-12-02 13:37:27.03535	2	2
1176	2	6000	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 13:37:27.062445	2021-12-02 13:37:27.062445	8	5
1177	2	6001	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 13:37:27.089677	2021-12-02 13:37:27.089677	11	5
1178	2	6002	6	32	12	\N	1.5	8060	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6500	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 13:37:27.148492	2021-12-02 13:37:27.148492	13	5
1179	2	6003	6	32	12	\N	1.5	12500	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	1.2	\N	1	1	\N	6525.0	\N	\N	\N	\N	2021-12-02 13:37:27.176533	2021-12-02 13:37:27.176533	13	6
1180	2	6004	6	32	12	\N	1.5	15000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	11000	USD	1.5	\N	1	1	\N	6523.0	\N	\N	\N	\N	2021-12-02 13:37:27.205193	2021-12-02 13:37:27.205193	13	7
1181	2	6005	6	32	12	\N	2	20000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	14000	USD	1.7	\N	1	1	\N	6527.0	\N	\N	\N	\N	2021-12-02 13:37:27.233043	2021-12-02 13:37:27.233043	13	8
1182	2	6006	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	1.9	\N	1	1	\N	6528.0	\N	\N	\N	\N	2021-12-02 13:37:27.260483	2021-12-02 13:37:27.260483	13	18
1183	2	6007	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	4	\N	\N	0	USD	22000	USD	2	\N	1	1	\N	6529.0	\N	\N	\N	\N	2021-12-02 13:37:27.287458	2021-12-02 13:37:27.287458	13	34
1184	2	6008	6	32	12	\N	3	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	2.1	\N	1	1	\N	6524.0	\N	\N	\N	\N	2021-12-02 13:37:27.315789	2021-12-02 13:37:27.315789	13	19
1185	2	6009	6	32	8	\N	0.75	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	100	USD	0.1	\N	5	1	\N	6173.0	\N	\N	\N	\N	2021-12-02 13:37:27.343042	2021-12-02 13:37:27.343042	2	5
1186	2	6010	6	32	8	\N	1.3	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	\N	2021-12-02 13:37:27.370778	2021-12-02 13:37:27.370778	2	7
1187	2	6011	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	\N	2021-12-02 13:37:27.399169	2021-12-02 13:37:27.399169	2	19
1188	2	6012	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:37:27.43349	2021-12-02 13:37:27.43349	2	21
1189	2	6013	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:37:27.4621	2021-12-02 13:37:27.4621	2	23
1190	2	6014	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:37:27.489697	2021-12-02 13:37:27.489697	2	5
1191	2	6015	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:37:27.538289	2021-12-02 13:37:27.538289	2	39
1192	2	6016	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:37:27.624892	2021-12-02 13:37:27.624892	2	40
1193	2	6017	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:37:27.664873	2021-12-02 13:37:27.664873	2	41
1194	2	6018	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 13:37:27.692859	2021-12-02 13:37:27.692859	2	42
1195	2	6019	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:27.720982	2021-12-02 13:37:27.720982	2	5
1196	2	6020	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:27.748866	2021-12-02 13:37:27.748866	2	6
1197	2	6021	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:27.823431	2021-12-02 13:37:27.823431	2	7
1198	2	6022	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:27.878826	2021-12-02 13:37:27.878826	2	9
1199	2	6023	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:27.907102	2021-12-02 13:37:27.907102	2	19
1200	2	6024	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:27.935251	2021-12-02 13:37:27.935251	12	17
1201	2	6025	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:27.963219	2021-12-02 13:37:27.963219	14	43
1202	2	6026	6	32	14	\N	1.8	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:27.991055	2021-12-02 13:37:27.991055	15	44
1203	2	6027	6	32	14	\N	2.6	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 13:37:28.02522	2021-12-02 13:37:28.02522	16	9
1204	2	6032	6	33	2	\N	1	3540	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:37:28.053475	2021-12-02 13:37:28.053475	2	4
1205	2	6033	6	33	2	\N	1	7080	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:37:28.08164	2021-12-02 13:37:28.08164	2	5
1206	2	6034	6	33	2	\N	1	10620	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:37:28.155598	2021-12-02 13:37:28.155598	2	6
1207	2	6035	6	33	2	\N	1	14160	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:37:28.184077	2021-12-02 13:37:28.184077	2	7
1208	2	6036	6	33	2	\N	2	17700	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:37:28.212131	2021-12-02 13:37:28.212131	2	8
1209	2	6037	6	33	2	\N	2	22420	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:37:28.238984	2021-12-02 13:37:28.238984	2	9
1210	2	6038	6	33	2	\N	2	25724	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 13:37:28.266578	2021-12-02 13:37:28.266578	2	19
1211	2	6039	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.294312	2021-12-02 13:37:28.294312	2	10
1212	2	6040	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.322417	2021-12-02 13:37:28.322417	2	1
1213	2	6041	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.350183	2021-12-02 13:37:28.350183	2	10
1214	2	6042	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.377198	2021-12-02 13:37:28.377198	2	1
1215	2	6043	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.404597	2021-12-02 13:37:28.404597	2	4
1216	2	6044	6	33	5	\N	0.7	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.465946	2021-12-02 13:37:28.465946	2	5
1217	2	6045	6	33	5	\N	0.9	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.493606	2021-12-02 13:37:28.493606	2	6
1218	2	6046	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.521527	2021-12-02 13:37:28.521527	2	7
1219	2	6047	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.549073	2021-12-02 13:37:28.549073	2	8
1220	2	6048	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 13:37:28.577139	2021-12-02 13:37:28.577139	2	9
1221	2	6049	6	34	1	\N	0.5	3500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:37:28.611811	2021-12-02 13:37:28.611811	2	3
1222	2	6050	6	34	1	\N	0.5	7000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:37:28.639927	2021-12-02 13:37:28.639927	2	1
1223	2	6051	6	34	1	\N	1	10500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:37:28.668412	2021-12-02 13:37:28.668412	2	4
1224	2	6052	6	34	1	\N	1	14000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:37:28.696576	2021-12-02 13:37:28.696576	2	2
1225	2	6053	6	34	1	\N	1.5	17500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:37:28.724236	2021-12-02 13:37:28.724236	2	3
1226	2	6054	6	34	1	\N	2	21000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 13:37:28.751512	2021-12-02 13:37:28.751512	2	5
1227	2	6055	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.779162	2021-12-02 13:37:28.779162	2	3
1228	2	6056	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.806832	2021-12-02 13:37:28.806832	2	1
1229	2	6057	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.835199	2021-12-02 13:37:28.835199	2	4
1230	2	6058	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.863378	2021-12-02 13:37:28.863378	2	2
1231	2	6059	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.89049	2021-12-02 13:37:28.89049	2	3
1232	2	6060	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.91709	2021-12-02 13:37:28.91709	2	5
1233	2	6061	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.944244	2021-12-02 13:37:28.944244	2	3
1234	2	6062	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.972123	2021-12-02 13:37:28.972123	2	1
1235	2	6063	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:28.999112	2021-12-02 13:37:28.999112	2	4
1236	2	6064	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.025845	2021-12-02 13:37:29.025845	2	2
1237	2	6065	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.052596	2021-12-02 13:37:29.052596	2	3
1238	2	6066	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.079302	2021-12-02 13:37:29.079302	2	5
1239	2	6067	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.136015	2021-12-02 13:37:29.136015	2	3
1240	2	6068	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.169822	2021-12-02 13:37:29.169822	2	1
1241	2	6069	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.197975	2021-12-02 13:37:29.197975	2	4
1242	2	6070	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.225705	2021-12-02 13:37:29.225705	2	2
1243	2	6071	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.271327	2021-12-02 13:37:29.271327	2	3
1244	2	6072	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 13:37:29.320563	2021-12-02 13:37:29.320563	2	5
1245	2	7000	7	35	1	\N	7.9	66000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	7.9	\N	1	1	\N	3521.0	\N	\N	\N	\N	2021-12-02 13:37:29.348533	2021-12-02 13:37:29.348533	1	1
1246	2	7001	7	35	1	\N	15.6	132000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	14.9	\N	1	1	\N	3522.0	\N	\N	\N	\N	2021-12-02 13:37:29.37637	2021-12-02 13:37:29.37637	1	2
1247	2	7002	7	35	2	\N	1.5	2880	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	3550.0	\N	\N	\N	\N	2021-12-02 13:37:29.404834	2021-12-02 13:37:29.404834	2	4
1248	2	7003	7	35	2	\N	2	5760	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	3600	USD	1.4	\N	1	1	\N	3551.0	\N	\N	\N	\N	2021-12-02 13:37:29.432588	2021-12-02 13:37:29.432588	2	5
1249	2	7004	7	35	2	\N	2.2	7200	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	5040	USD	1.7	\N	1	1	\N	3552.0	\N	\N	\N	\N	2021-12-02 13:37:29.460204	2021-12-02 13:37:29.460204	2	6
1250	2	7005	7	35	2	\N	2.5	8640	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	6480	USD	2.1	\N	1	1	\N	3553.0	\N	\N	\N	\N	2021-12-02 13:37:29.487955	2021-12-02 13:37:29.487955	2	7
1251	2	7006	7	35	2	\N	2.8	10080	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	10080	USD	2.8	\N	1	1	\N	3554.0	\N	\N	\N	\N	2021-12-02 13:37:29.514778	2021-12-02 13:37:29.514778	2	8
1252	2	7007	7	35	2	\N	3	11520	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	13680	USD	3.5	\N	1	1	\N	3555.0	\N	\N	\N	\N	2021-12-02 13:37:29.5424	2021-12-02 13:37:29.5424	2	9
1253	2	7008	7	35	2	\N	3.2	13000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	17280	USD	4.9	\N	1	1	\N	3556.0	\N	\N	\N	\N	2021-12-02 13:37:29.584844	2021-12-02 13:37:29.584844	2	19
1254	2	7009	7	35	2	\N	3.5	14500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	6.3	\N	1	1	\N	3557.0	\N	\N	\N	\N	2021-12-02 13:37:29.625559	2021-12-02 13:37:29.625559	2	20
1255	2	7010	7	35	2	\N	4	16000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3558.0	\N	\N	\N	\N	2021-12-02 13:37:29.653018	2021-12-02 13:37:29.653018	2	45
1256	2	7011	7	35	2	\N	4.5	17500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	\N	2021-12-02 13:37:29.686739	2021-12-02 13:37:29.686739	2	23
1257	2	7012	7	35	2	\N	7	19000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	\N	2021-12-02 13:37:29.714333	2021-12-02 13:37:29.714333	2	25
1258	2	7013	7	35	3	\N	1	2400	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	1440	USD	0.9	\N	1	1	\N	3541.0	\N	\N	\N	\N	2021-12-02 13:37:29.741327	2021-12-02 13:37:29.741327	2	1
1259	2	7014	7	35	3	\N	1	2880	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	3542.0	\N	\N	\N	\N	2021-12-02 13:37:29.80039	2021-12-02 13:37:29.80039	2	4
1260	2	7015	7	35	3	\N	1.5	5760	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	3544.0	\N	\N	\N	\N	2021-12-02 13:37:29.82932	2021-12-02 13:37:29.82932	2	5
1261	2	7016	7	35	3	\N	1.8	7200	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	3545.0	\N	\N	\N	\N	2021-12-02 13:37:29.858048	2021-12-02 13:37:29.858048	2	6
1262	2	7017	7	35	3	\N	2	8640	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	3546.0	\N	\N	\N	\N	2021-12-02 13:37:29.894934	2021-12-02 13:37:29.894934	2	7
1263	2	7018	7	35	3	\N	2.2	10080	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	3547.0	\N	\N	\N	\N	2021-12-02 13:37:29.923034	2021-12-02 13:37:29.923034	2	8
1264	2	7019	7	35	3	\N	3	11520	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	11520	USD	2.2	\N	1	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:37:29.95112	2021-12-02 13:37:29.95112	2	9
1265	2	7020	7	35	4	\N	0.5	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:37:29.978997	2021-12-02 13:37:29.978997	2	10
1266	2	7021	7	35	4	\N	1	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:37:30.006673	2021-12-02 13:37:30.006673	2	1
1267	2	7022	7	35	5	\N	0.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:37:30.034125	2021-12-02 13:37:30.034125	2	4
1268	2	7023	7	35	5	\N	1	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:37:30.062024	2021-12-02 13:37:30.062024	2	5
1269	2	7024	7	35	5	\N	1.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:37:30.089389	2021-12-02 13:37:30.089389	2	6
1270	2	7025	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:37:30.116508	2021-12-02 13:37:30.116508	2	7
1271	2	7026	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 13:37:30.144281	2021-12-02 13:37:30.144281	2	8
1272	2	7027	7	36	1	\N	1	1800	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:37:30.172207	2021-12-02 13:37:30.172207	2	3
1273	2	7028	7	36	4	\N	0.5	0	USD	\N	2	4	2	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:37:30.198795	2021-12-02 13:37:30.198795	2	3
1274	2	7029	7	37	1	\N	4	17200	USD	\N	1	1	1	33	1	\N	2	\N	\N	0	USD	0	USD	4	\N	1	1	\N	4521.0	\N	\N	\N	\N	2021-12-02 13:37:30.232186	2021-12-02 13:37:30.232186	2	19
1275	2	7031	7	37	2	\N	1.3	2880	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4551.0	\N	\N	\N	\N	2021-12-02 13:37:30.259931	2021-12-02 13:37:30.259931	2	4
1276	2	7032	7	37	2	\N	1.8	5760	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	4553.0	\N	\N	\N	\N	2021-12-02 13:37:30.28757	2021-12-02 13:37:30.28757	2	5
1277	2	7033	7	37	2	\N	2	8640	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4554.0	\N	\N	\N	\N	2021-12-02 13:37:30.315612	2021-12-02 13:37:30.315612	2	6
1278	2	7034	7	37	2	\N	2.5	11520	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	4555.0	\N	\N	\N	\N	2021-12-02 13:37:30.343314	2021-12-02 13:37:30.343314	2	7
1279	2	7035	7	37	2	\N	3	14400	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.9	\N	1	1	\N	4556.0	\N	\N	\N	\N	2021-12-02 13:37:30.370736	2021-12-02 13:37:30.370736	2	8
1280	2	7036	7	37	3	\N	1	2880	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4543.0	\N	\N	\N	\N	2021-12-02 13:37:30.398309	2021-12-02 13:37:30.398309	2	1
1281	2	7037	7	37	3	\N	1.3	5760	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4544.0	\N	\N	\N	\N	2021-12-02 13:37:30.425748	2021-12-02 13:37:30.425748	2	4
1282	2	7038	7	37	3	\N	1.8	7200	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4545.0	\N	\N	\N	\N	2021-12-02 13:37:30.484231	2021-12-02 13:37:30.484231	2	5
1283	2	7039	7	37	3	\N	2	8640	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	11500	USD	1.7	\N	1	1	\N	4546.0	\N	\N	\N	\N	2021-12-02 13:37:30.512067	2021-12-02 13:37:30.512067	2	6
1284	2	7040	7	37	3	\N	2.5	10080	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4547.0	\N	\N	\N	\N	2021-12-02 13:37:30.539199	2021-12-02 13:37:30.539199	2	7
1285	2	7041	7	37	3	\N	3	11500	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4548.0	\N	\N	\N	\N	2021-12-02 13:37:30.566164	2021-12-02 13:37:30.566164	2	8
1286	2	7042	7	37	4	\N	1	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:37:30.593414	2021-12-02 13:37:30.593414	2	10
1287	2	7043	7	37	4	\N	1.2	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:37:30.620981	2021-12-02 13:37:30.620981	2	1
1288	2	7044	7	37	5	\N	1	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:37:30.648479	2021-12-02 13:37:30.648479	2	4
1289	2	7045	7	37	5	\N	1.2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:37:30.67655	2021-12-02 13:37:30.67655	2	5
1290	2	7046	7	37	5	\N	1.8	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:37:30.703871	2021-12-02 13:37:30.703871	2	6
1291	2	7047	7	37	5	\N	2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:37:30.731166	2021-12-02 13:37:30.731166	2	7
1292	2	7048	7	37	5	\N	2.5	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 13:37:30.757982	2021-12-02 13:37:30.757982	2	8
1293	2	7049	7	38	1	\N	1	1200	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:37:30.790744	2021-12-02 13:37:30.790744	2	3
1294	2	7050	7	38	4	\N	1	0	USD	\N	2	4	9	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 13:37:30.818943	2021-12-02 13:37:30.818943	2	3
1295	2	7051	7	39	1	\N	1.2	9587	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	1	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 13:37:30.846356	2021-12-02 13:37:30.846356	2	3
1296	2	7052	7	39	1	\N	2.4	19174	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	2	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 13:37:30.873689	2021-12-02 13:37:30.873689	2	1
1297	2	7053	7	39	1	\N	3.6	28760	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	3	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 13:37:30.900546	2021-12-02 13:37:30.900546	2	4
1298	2	7054	7	39	1	\N	4.8	38347	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	4	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 13:37:30.927578	2021-12-02 13:37:30.927578	2	2
1299	2	7055	7	39	3	\N	1	2160	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	2160	USD	0.9	\N	1	1	\N	7141.0	\N	\N	\N	\N	2021-12-02 13:37:30.954331	2021-12-02 13:37:30.954331	2	1
1300	2	7056	7	39	3	\N	1.2	3240	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	3240	USD	1	\N	1	1	\N	7142.0	\N	\N	\N	\N	2021-12-02 13:37:30.981221	2021-12-02 13:37:30.981221	2	4
1301	2	7057	7	39	3	\N	1.8	6480	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	6480	USD	1.2	\N	1	1	\N	7144.0	\N	\N	\N	\N	2021-12-02 13:37:31.008192	2021-12-02 13:37:31.008192	2	5
1302	2	7058	7	39	3	\N	2	9720	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	9720	USD	1.3	\N	1	1	\N	7145.0	\N	\N	\N	\N	2021-12-02 13:37:31.034667	2021-12-02 13:37:31.034667	2	6
1303	2	7059	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 13:37:31.061233	2021-12-02 13:37:31.061233	2	3
1304	2	7060	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	2	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 13:37:31.118524	2021-12-02 13:37:31.118524	2	10
1305	2	7061	7	39	4	\N	0.6	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	3	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 13:37:31.146643	2021-12-02 13:37:31.146643	2	3
1306	2	7062	7	39	4	\N	0.8	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	4	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 13:37:31.173562	2021-12-02 13:37:31.173562	2	1
1307	2	7063	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:37:31.200366	2021-12-02 13:37:31.200366	2	4
1308	2	7064	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:37:31.22757	2021-12-02 13:37:31.22757	2	5
1309	2	7065	7	39	5	\N	0.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:37:31.255171	2021-12-02 13:37:31.255171	2	6
1310	2	7066	7	39	5	\N	0.8	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:37:31.282669	2021-12-02 13:37:31.282669	2	7
1311	2	7067	7	40	1	\N	3.3	9600	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7521.0	\N	\N	\N	\N	2021-12-02 13:37:31.316654	2021-12-02 13:37:31.316654	2	3
1312	2	7068	7	40	1	\N	6.6	18000	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	2	1	\N	7521.0	\N	\N	\N	\N	2021-12-02 13:37:31.344895	2021-12-02 13:37:31.344895	2	1
1313	2	7069	7	40	3	\N	0.8	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	7541.0	\N	\N	\N	\N	2021-12-02 13:37:31.372627	2021-12-02 13:37:31.372627	2	3
1314	2	7070	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1	\N	1	1	\N	7542.0	\N	\N	\N	\N	2021-12-02 13:37:31.400492	2021-12-02 13:37:31.400492	2	1
1315	2	7071	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	7543.0	\N	\N	\N	\N	2021-12-02 13:37:31.428241	2021-12-02 13:37:31.428241	2	4
1316	2	7072	7	40	3	\N	1.2	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	7544.0	\N	\N	\N	\N	2021-12-02 13:37:31.455724	2021-12-02 13:37:31.455724	2	5
1317	2	7073	7	40	3	\N	1.4	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.4	\N	1	1	\N	7545.0	\N	\N	\N	\N	2021-12-02 13:37:31.483427	2021-12-02 13:37:31.483427	2	6
1318	2	7074	7	40	3	\N	1.6	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	7546.0	\N	\N	\N	\N	2021-12-02 13:37:31.510441	2021-12-02 13:37:31.510441	2	7
1319	2	7075	7	40	4	\N	0.5	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	7582.0	\N	\N	\N	\N	2021-12-02 13:37:31.538012	2021-12-02 13:37:31.538012	2	3
1320	2	7076	7	40	4	\N	0.8	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	7582.0	\N	\N	\N	\N	2021-12-02 13:37:31.564994	2021-12-02 13:37:31.564994	2	1
1321	2	7077	7	40	5	\N	0.5	0	USD	\N	29	4	9	35	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7581.0	\N	\N	\N	\N	2021-12-02 13:37:31.591882	2021-12-02 13:37:31.591882	2	3
1322	2	7078	7	41	1	\N	8.7	28200	USD	\N	30	1	1	36	1	\N	3	\N	\N	0	USD	0	USD	8.7	\N	1	1	\N	7321.0	\N	\N	\N	\N	2021-12-02 13:37:31.619358	2021-12-02 13:37:31.619358	2	3
1323	2	7079	7	41	2	\N	1	2800	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	2.7	\N	1	1	\N	7351.0	\N	\N	\N	\N	2021-12-02 13:37:31.646738	2021-12-02 13:37:31.646738	2	1
1324	2	7080	7	41	2	\N	1.1	3120	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7352.0	\N	\N	\N	\N	2021-12-02 13:37:31.674297	2021-12-02 13:37:31.674297	2	4
1325	2	7081	7	41	2	\N	1.3	6240	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.9	\N	1	1	\N	7353.0	\N	\N	\N	\N	2021-12-02 13:37:31.701487	2021-12-02 13:37:31.701487	2	5
1326	2	7082	7	41	2	\N	1.6	9360	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	7354.0	\N	\N	\N	\N	2021-12-02 13:37:31.728455	2021-12-02 13:37:31.728455	2	6
1327	2	7083	7	41	3	\N	1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	\N	2021-12-02 13:37:31.785125	2021-12-02 13:37:31.785125	2	1
1328	2	7084	7	41	3	\N	1.1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	\N	2021-12-02 13:37:31.813153	2021-12-02 13:37:31.813153	2	4
1329	2	7085	7	41	3	\N	1.3	9360	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	6240	USD	1.3	\N	1	1	\N	7357.0	\N	\N	\N	\N	2021-12-02 13:37:31.841783	2021-12-02 13:37:31.841783	2	5
1330	2	7086	7	41	3	\N	1.6	12480	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	9360	USD	1.6	\N	1	1	\N	7358.0	\N	\N	\N	\N	2021-12-02 13:37:31.875834	2021-12-02 13:37:31.875834	2	6
1331	2	7087	7	41	4	\N	1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 13:37:31.903525	2021-12-02 13:37:31.903525	2	1
1332	2	7088	7	41	4	\N	1.1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 13:37:31.932384	2021-12-02 13:37:31.932384	2	4
1333	2	7089	7	41	4	\N	1.3	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 13:37:31.961088	2021-12-02 13:37:31.961088	2	5
1334	2	7090	7	41	5	\N	1	0	USD	\N	30	5	9	36	5	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 13:37:31.989908	2021-12-02 13:37:31.989908	2	3
1335	2	7091	7	42	1	\N	1.5	3600	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:37:32.017339	2021-12-02 13:37:32.017339	2	3
1336	2	7092	7	42	1	\N	2.5	7200	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:37:32.044827	2021-12-02 13:37:32.044827	2	1
1337	2	7093	7	42	3	\N	0.5	1400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:37:32.072651	2021-12-02 13:37:32.072651	2	3
1338	2	7094	7	42	3	\N	1	2400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:37:32.099341	2021-12-02 13:37:32.099341	2	1
1339	2	7095	7	42	3	\N	1	3600	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 13:37:32.12625	2021-12-02 13:37:32.12625	2	4
1340	2	7096	7	42	4	\N	0.5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:37:32.151656	2021-12-02 13:37:32.151656	2	3
1341	2	7097	7	42	4	\N	5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:37:32.177629	2021-12-02 13:37:32.177629	2	1
1342	2	7098	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:37:32.203796	2021-12-02 13:37:32.203796	2	3
1343	2	7099	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:37:32.229837	2021-12-02 13:37:32.229837	2	1
1344	2	7100	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:37:32.25578	2021-12-02 13:37:32.25578	2	4
1345	2	7101	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 13:37:32.28207	2021-12-02 13:37:32.28207	2	2
1346	2	7102	7	39	5	\N	1	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:37:32.30891	2021-12-02 13:37:32.30891	2	8
1347	2	7103	7	39	5	\N	1.2	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:37:32.336643	2021-12-02 13:37:32.336643	2	18
1348	2	7104	7	39	5	\N	1.4	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:37:32.363706	2021-12-02 13:37:32.363706	2	34
1349	2	7105	7	39	5	\N	1.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 13:37:32.395644	2021-12-02 13:37:32.395644	2	19
1350	2	7106	7	43	1	\N	4	17200	USD	\N	1	1	1	38	1	\N	2	\N	\N	0	USD	21000	USD	3.8	\N	1	1	\N	2523.0	\N	\N	\N	\N	2021-12-02 13:37:32.451505	2021-12-02 13:37:32.451505	2	19
1351	2	7107	7	43	2	\N	1.3	2880	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	\N	2021-12-02 13:37:32.478645	2021-12-02 13:37:32.478645	2	4
1352	2	7108	7	43	2	\N	1.8	5760	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	\N	2021-12-02 13:37:32.50554	2021-12-02 13:37:32.50554	2	5
1353	2	7109	7	43	2	\N	2	8640	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	\N	2021-12-02 13:37:32.532619	2021-12-02 13:37:32.532619	2	6
1354	2	7110	7	43	2	\N	2.5	11520	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	\N	2021-12-02 13:37:32.559027	2021-12-02 13:37:32.559027	2	7
1355	2	7111	7	43	2	\N	3	14400	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	\N	2021-12-02 13:37:32.585361	2021-12-02 13:37:32.585361	2	8
1356	2	7112	7	43	3	\N	1	2880	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	2550.0	\N	\N	\N	\N	2021-12-02 13:37:32.612288	2021-12-02 13:37:32.612288	2	1
1357	2	7113	7	43	3	\N	1.3	5760	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	\N	2021-12-02 13:37:32.638762	2021-12-02 13:37:32.638762	2	4
1358	2	7114	7	43	3	\N	1.8	7200	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	\N	2021-12-02 13:37:32.665777	2021-12-02 13:37:32.665777	2	5
1359	2	7115	7	43	3	\N	2	8640	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	\N	2021-12-02 13:37:32.692687	2021-12-02 13:37:32.692687	2	6
1360	2	7116	7	43	3	\N	2.5	10080	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	\N	2021-12-02 13:37:32.718891	2021-12-02 13:37:32.718891	2	7
1361	2	7117	7	43	3	\N	3	11500	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	\N	2021-12-02 13:37:32.745299	2021-12-02 13:37:32.745299	2	8
1362	2	7118	7	43	4	\N	1	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:37:32.771857	2021-12-02 13:37:32.771857	2	10
1363	2	7119	7	43	4	\N	1.2	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:37:32.798578	2021-12-02 13:37:32.798578	2	1
1364	2	7120	7	43	5	\N	1	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:37:32.825278	2021-12-02 13:37:32.825278	2	4
1365	2	7121	7	43	5	\N	1.2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:37:32.851601	2021-12-02 13:37:32.851601	2	5
1366	2	7122	7	43	5	\N	1.8	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:37:32.878346	2021-12-02 13:37:32.878346	2	6
1367	2	7123	7	43	5	\N	2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:37:32.911606	2021-12-02 13:37:32.911606	2	7
1368	2	7124	7	43	5	\N	2.5	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 13:37:32.937877	2021-12-02 13:37:32.937877	2	8
1369	2	8000	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	\N	2021-12-02 13:37:32.964155	2021-12-02 13:37:32.964155	1	1
1370	2	8001	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	\N	2021-12-02 13:37:32.990577	2021-12-02 13:37:32.990577	1	2
1371	2	8002	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 13:37:33.016757	2021-12-02 13:37:33.016757	1	1
1372	2	8003	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 13:37:33.071078	2021-12-02 13:37:33.071078	1	2
1373	2	8004	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 13:37:33.098642	2021-12-02 13:37:33.098642	1	1
1374	2	8005	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 13:37:33.124622	2021-12-02 13:37:33.124622	1	2
1375	2	8006	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	\N	2021-12-02 13:37:33.150777	2021-12-02 13:37:33.150777	1	1
1376	2	8007	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.177641	2021-12-02 13:37:33.177641	1	2
1377	2	8008	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	\N	2021-12-02 13:37:33.204426	2021-12-02 13:37:33.204426	1	1
1378	2	8009	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.23117	2021-12-02 13:37:33.23117	1	2
1379	2	8010	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.25776	2021-12-02 13:37:33.25776	1	1
1380	2	8011	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.291215	2021-12-02 13:37:33.291215	1	2
1381	2	8012	8	44	22	\N	0.5	0	USD	\N	33	17	16	45	20	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.317894	2021-12-02 13:37:33.317894	1	1
1382	2	8013	8	44	23	\N	0.5	0	USD	\N	4	18	17	46	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.344287	2021-12-02 13:37:33.344287	1	2
1383	2	8014	8	44	23	\N	0.5	0	USD	\N	4	18	17	47	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.372105	2021-12-02 13:37:33.372105	1	16
1384	2	8015	8	44	23	\N	0.5	0	USD	\N	4	18	17	48	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.399767	2021-12-02 13:37:33.399767	1	7
1385	2	8016	8	44	23	\N	0.5	0	USD	\N	4	18	17	49	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.427365	2021-12-02 13:37:33.427365	1	46
1386	2	8017	8	44	23	\N	0.5	0	USD	\N	4	18	17	50	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.46098	2021-12-02 13:37:33.46098	1	1
1387	2	8018	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.489252	2021-12-02 13:37:33.489252	2	3
1388	2	8019	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.517759	2021-12-02 13:37:33.517759	2	1
1389	2	8020	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.545557	2021-12-02 13:37:33.545557	2	4
1390	2	8021	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.572904	2021-12-02 13:37:33.572904	2	2
1391	2	8022	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.600094	2021-12-02 13:37:33.600094	2	3
1392	2	8023	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.627698	2021-12-02 13:37:33.627698	2	5
1393	2	8024	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.655333	2021-12-02 13:37:33.655333	2	26
1394	2	8025	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.682957	2021-12-02 13:37:33.682957	2	16
1395	2	8026	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.740367	2021-12-02 13:37:33.740367	2	6
1396	2	8027	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.768571	2021-12-02 13:37:33.768571	2	10
1397	2	8028	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.796596	2021-12-02 13:37:33.796596	2	12
1398	2	8029	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 13:37:33.824545	2021-12-02 13:37:33.824545	2	7
1399	2	8030	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 13:37:33.852596	2021-12-02 13:37:33.852596	11	6
1400	2	8031	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 13:37:33.880364	2021-12-02 13:37:33.880364	16	9
1401	2	8032	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 13:37:33.908083	2021-12-02 13:37:33.908083	17	20
1402	2	8033	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 13:37:33.935695	2021-12-02 13:37:33.935695	18	49
1403	2	8034	9	45	1	\N	0.5	500	USD	\N	34	1	6	52	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	951.0	\N	\N	\N	\N	2021-12-02 13:37:33.963622	2021-12-02 13:37:33.963622	2	3
1404	2	8035	9	46	1	\N	0.5	500	USD	\N	34	1	6	53	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	952.0	\N	\N	\N	\N	2021-12-02 13:37:33.9969	2021-12-02 13:37:33.9969	2	3
1405	2	8036	9	47	1	\N	1	0	USD	\N	35	1	6	54	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.02423	2021-12-02 13:37:34.02423	2	3
1406	2	8037	9	48	1	\N	1	0	USD	\N	36	1	6	55	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.051595	2021-12-02 13:37:34.051595	2	3
1407	2	8038	9	49	1	\N	2	500	USD	\N	37	1	6	56	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.080267	2021-12-02 13:37:34.080267	2	3
1408	2	8039	9	50	1	\N	0.5	0	USD	\N	38	1	6	57	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.107863	2021-12-02 13:37:34.107863	2	3
1409	2	8040	9	51	1	\N	0.5	0	USD	\N	34	1	6	58	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.134823	2021-12-02 13:37:34.134823	2	3
1410	2	8041	9	52	1	\N	0.5	0	USD	\N	39	1	6	59	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.161576	2021-12-02 13:37:34.161576	2	3
1411	2	8042	9	53	1	\N	0.5	0	USD	\N	40	1	6	60	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.188695	2021-12-02 13:37:34.188695	2	3
1412	2	8043	9	54	1	\N	0.5	0	USD	\N	41	1	6	61	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.216436	2021-12-02 13:37:34.216436	2	3
1413	2	8044	9	55	1	\N	0.5	0	USD	\N	42	1	6	62	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.243852	2021-12-02 13:37:34.243852	2	3
1414	2	8045	9	56	1	\N	0.5	0	USD	\N	32	1	6	63	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.271281	2021-12-02 13:37:34.271281	2	3
1415	2	8046	9	57	1	\N	0.5	0	USD	\N	43	1	6	64	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.299039	2021-12-02 13:37:34.299039	2	3
1416	2	8047	9	58	1	\N	2	500	USD	\N	43	1	6	65	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.326425	2021-12-02 13:37:34.326425	2	3
1417	2	8048	9	59	1	\N	0.5	0	USD	\N	44	1	6	66	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 13:37:34.35416	2021-12-02 13:37:34.35416	2	3
1418	2	8049	9	60	8	\N	0.5	300	USD	\N	45	8	7	67	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 13:37:34.413263	2021-12-02 13:37:34.413263	2	3
1419	2	8050	9	61	8	\N	0.5	0	USD	\N	46	8	7	68	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 13:37:34.441911	2021-12-02 13:37:34.441911	2	3
1420	2	8051	9	62	8	\N	0.5	0	USD	\N	37	8	7	69	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 13:37:34.469909	2021-12-02 13:37:34.469909	2	3
1421	2	8052	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.498079	2021-12-02 13:37:34.498079	2	3
1422	2	8053	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.525046	2021-12-02 13:37:34.525046	2	1
1423	2	8054	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.55992	2021-12-02 13:37:34.55992	2	4
1424	2	8055	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.587781	2021-12-02 13:37:34.587781	2	2
1425	2	8056	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.616563	2021-12-02 13:37:34.616563	2	3
1426	2	8057	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.644609	2021-12-02 13:37:34.644609	2	5
1427	2	8058	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.672433	2021-12-02 13:37:34.672433	2	26
1428	2	8059	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.700692	2021-12-02 13:37:34.700692	2	16
1429	2	8060	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.728665	2021-12-02 13:37:34.728665	2	6
1430	2	8061	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.75662	2021-12-02 13:37:34.75662	2	10
1431	2	8062	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.784211	2021-12-02 13:37:34.784211	2	3
1432	2	8063	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.811732	2021-12-02 13:37:34.811732	2	1
1433	2	8064	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.8392	2021-12-02 13:37:34.8392	2	4
1434	2	8065	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.866708	2021-12-02 13:37:34.866708	2	2
1435	2	8066	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.894332	2021-12-02 13:37:34.894332	2	3
1436	2	8067	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.921782	2021-12-02 13:37:34.921782	2	5
1437	2	8068	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.94885	2021-12-02 13:37:34.94885	2	26
1438	2	8069	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:34.975857	2021-12-02 13:37:34.975857	2	16
1439	2	8070	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.003092	2021-12-02 13:37:35.003092	2	6
1440	2	8071	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.061267	2021-12-02 13:37:35.061267	2	10
1441	2	8072	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.09598	2021-12-02 13:37:35.09598	2	3
1442	2	8073	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.124241	2021-12-02 13:37:35.124241	2	1
1443	2	8074	10	63	27	\N	0.5	1200	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.152775	2021-12-02 13:37:35.152775	2	4
1444	2	8075	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.18068	2021-12-02 13:37:35.18068	2	2
1445	2	8076	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.208332	2021-12-02 13:37:35.208332	2	3
1446	2	8077	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.236713	2021-12-02 13:37:35.236713	2	5
1447	2	8078	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.265308	2021-12-02 13:37:35.265308	2	26
1448	2	8079	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.29315	2021-12-02 13:37:35.29315	2	16
1449	2	8080	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.321534	2021-12-02 13:37:35.321534	2	6
1450	2	8081	10	63	27	\N	2	1500	USD	\N	4	19	1	6	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 13:37:35.34919	2021-12-02 13:37:35.34919	2	10
1451	2	8090	9	64	28	\N	16	67500	USD	\N	4	6	1	6	24	\N	3	\N	\N	0	USD	67500	USD	16	\N	1	1	\N	9999.0	\N	\N	\N	\N	2021-12-02 13:37:35.377303	2021-12-02 13:37:35.377303	2	3
1452	2	8091	9	64	29	\N	3	157500	USD	\N	4	1	1	6	1	\N	3	\N	\N	0	USD	157500	USD	3	\N	1	1	\N	9999.0	\N	\N	\N	\N	2021-12-02 13:37:35.404638	2021-12-02 13:37:35.404638	2	3
1453	2	8100	11	65	30	\N	1	0	USD	\N	4	5	1	6	25	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	\N	2021-12-02 13:37:35.435801	2021-12-02 13:37:35.435801	2	3
1454	2	8101	11	65	31	\N	0.5	0	USD	\N	4	5	1	6	19	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	\N	2021-12-02 13:37:35.465617	2021-12-02 13:37:35.465617	2	3
1455	2	9001	12	66	1	\N	1.2	10000	USD	\N	47	1	21	72	26	\N	3	\N	\N	0	USD	800	USD	0.3	\N	1	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:37:35.493673	2021-12-02 13:37:35.493673	2	3
1456	2	9002	12	66	3	\N	1.2	800	USD	\N	47	3	21	72	27	\N	3	\N	\N	0	USD	800	USD	0.3	\N	2	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:37:35.521812	2021-12-02 13:37:35.521812	2	3
1457	2	9003	12	66	32	\N	1.2	800	USD	\N	47	6	9	72	28	\N	3	\N	\N	0	USD	800	USD	0.3	\N	3	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:37:35.549207	2021-12-02 13:37:35.549207	2	3
1458	2	9004	12	66	7	\N	1.2	800	USD	\N	47	8	9	72	29	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:37:35.577038	2021-12-02 13:37:35.577038	2	3
1459	2	9005	12	66	33	\N	1.2	800	USD	\N	47	10	9	72	30	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:37:35.609157	2021-12-02 13:37:35.609157	2	3
1460	2	9006	12	66	34	\N	1.2	800	USD	\N	47	11	9	72	31	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:37:35.638303	2021-12-02 13:37:35.638303	2	3
1461	2	9007	12	66	5	\N	1.2	800	USD	\N	47	5	9	72	32	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:37:35.665684	2021-12-02 13:37:35.665684	2	3
1462	2	9008	12	66	35	\N	1.2	800	USD	\N	47	20	5	72	33	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 13:37:35.692723	2021-12-02 13:37:35.692723	2	3
1463	2	9009	12	67	1	\N	1.2	10000	USD	\N	48	1	9	73	26	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:37:35.751136	2021-12-02 13:37:35.751136	2	3
1464	2	9010	12	67	2	\N	1.2	3000	USD	\N	48	2	9	73	34	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:37:35.778699	2021-12-02 13:37:35.778699	2	3
1465	2	9011	12	67	3	\N	1.2	3000	USD	\N	48	3	9	73	27	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:37:35.805882	2021-12-02 13:37:35.805882	2	3
1466	2	9012	12	67	7	\N	1.2	800	USD	\N	48	8	7	73	29	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:37:35.833113	2021-12-02 13:37:35.833113	2	3
1467	2	9013	12	67	5	\N	1.2	0	USD	\N	48	5	2	73	32	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:37:35.861246	2021-12-02 13:37:35.861246	2	3
1468	2	9014	12	67	36	\N	1.2	200	USD	\N	48	7	9	73	35	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 13:37:35.88864	2021-12-02 13:37:35.88864	2	3
1469	2	9015	12	68	1	\N	1.2	8000	USD	\N	49	1	9	74	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:35.916312	2021-12-02 13:37:35.916312	2	3
1470	2	9016	12	68	2	\N	1.2	1000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:35.943489	2021-12-02 13:37:35.943489	2	4
1471	2	9017	12	68	2	\N	1.2	2000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:35.971048	2021-12-02 13:37:35.971048	2	5
1472	2	9018	12	68	2	\N	1.2	3000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:35.999261	2021-12-02 13:37:35.999261	2	6
1473	2	9019	12	68	2	\N	1.2	4000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:36.026714	2021-12-02 13:37:36.026714	2	7
1474	2	9020	12	68	7	\N	1.2	800	USD	\N	49	8	9	74	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:36.053281	2021-12-02 13:37:36.053281	2	3
1475	2	9021	12	69	2	\N	1.2	800	USD	\N	21	2	9	75	34	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:36.080029	2021-12-02 13:37:36.080029	2	3
1476	2	9022	12	70	1	\N	1.2	8000	USD	\N	50	1	9	76	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:36.107105	2021-12-02 13:37:36.107105	2	3
1477	2	9023	12	70	2	\N	1.2	1000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:36.135074	2021-12-02 13:37:36.135074	2	4
1478	2	9024	12	70	2	\N	1.2	2000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:36.16782	2021-12-02 13:37:36.16782	2	5
1479	2	9025	12	70	2	\N	1.2	3000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:36.194859	2021-12-02 13:37:36.194859	2	6
1480	2	9026	12	70	2	\N	1.2	4000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 13:37:36.222081	2021-12-02 13:37:36.222081	2	7
1481	2	9027	12	70	7	\N	1.2	800	USD	\N	50	8	9	76	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 13:37:36.249638	2021-12-02 13:37:36.249638	2	3
1482	2	9028	12	71	1	\N	1	6500	USD	\N	51	1	9	77	26	\N	3	\N	\N	0	USD	5000	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:37:36.277329	2021-12-02 13:37:36.277329	2	3
1483	2	9029	12	71	33	\N	1	300	USD	\N	51	10	1	77	30	\N	3	\N	\N	0	USD	0	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	\N	2021-12-02 13:37:36.304688	2021-12-02 13:37:36.304688	2	3
1484	2	9030	12	71	5	\N	0.5	300	USD	\N	51	5	2	77	32	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	2	\N	5281.0	\N	\N	\N	\N	2021-12-02 13:37:36.331397	2021-12-02 13:37:36.331397	2	3
1485	2	9031	12	72	1	\N	1	6500	USD	\N	19	1	9	78	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:37:36.38904	2021-12-02 13:37:36.38904	2	3
1486	2	9032	12	72	5	\N	0.5	300	USD	\N	19	5	9	78	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	\N	2021-12-02 13:37:36.416144	2021-12-02 13:37:36.416144	2	3
1487	2	9033	12	73	32	\N	1.4	1920	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.443752	2021-12-02 13:37:36.443752	17	4
1488	2	9034	12	73	32	\N	1.5	2160	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	\N	2021-12-02 13:37:36.471435	2021-12-02 13:37:36.471435	5	2
1489	2	9035	12	73	32	\N	1.6	2400	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	\N	2021-12-02 13:37:36.498551	2021-12-02 13:37:36.498551	6	8
1490	2	9036	12	73	32	\N	1.8	2880	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	\N	2021-12-02 13:37:36.52534	2021-12-02 13:37:36.52534	8	5
1491	2	9037	12	73	7	\N	1.2	800	USD	\N	52	8	9	79	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.552592	2021-12-02 13:37:36.552592	2	3
1492	2	9038	12	73	37	\N	1.5	2800	USD	\N	52	21	9	79	36	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.580542	2021-12-02 13:37:36.580542	2	3
1493	2	9039	12	73	5	\N	1	0	USD	\N	52	5	2	79	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.608202	2021-12-02 13:37:36.608202	2	3
1494	2	9040	12	74	38	\N	0.5	1000	USD	\N	53	22	1	80	37	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.635888	2021-12-02 13:37:36.635888	2	3
1495	2	9041	12	75	39	\N	1.5	1200	USD	\N	54	23	19	81	38	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.663153	2021-12-02 13:37:36.663153	2	3
1496	2	9042	12	75	32	\N	1.4	1920	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.693767	2021-12-02 13:37:36.693767	17	4
1497	2	9043	12	75	32	\N	1.5	2160	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	\N	2021-12-02 13:37:36.725066	2021-12-02 13:37:36.725066	5	2
1498	2	9044	12	75	32	\N	1.6	2400	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	\N	2021-12-02 13:37:36.753176	2021-12-02 13:37:36.753176	6	8
1499	2	9045	12	75	32	\N	1.8	2880	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	\N	2021-12-02 13:37:36.781009	2021-12-02 13:37:36.781009	8	5
1500	2	9046	12	75	7	\N	1.2	800	USD	\N	54	8	22	81	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.808335	2021-12-02 13:37:36.808335	2	3
1501	2	9047	12	75	40	\N	1.2	800	USD	\N	54	18	19	81	39	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.835594	2021-12-02 13:37:36.835594	2	3
1502	2	9048	12	75	5	\N	1	0	USD	\N	54	5	2	81	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.863661	2021-12-02 13:37:36.863661	2	3
1503	2	9049	12	75	36	\N	1	600	USD	\N	54	7	3	81	35	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 13:37:36.891641	2021-12-02 13:37:36.891641	2	3
1504	2	9050	12	76	32	\N	1	600	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	1900	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 13:37:36.919118	2021-12-02 13:37:36.919118	6	3
1505	2	9051	12	76	32	\N	1.4	1920	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	2400	USD	0.9	\N	1	2	\N	6502.0	\N	\N	\N	\N	2021-12-02 13:37:36.946363	2021-12-02 13:37:36.946363	17	4
1506	2	9052	12	76	32	\N	1.5	2160	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	3500	USD	1.3	\N	1	2	\N	6511.0	\N	\N	\N	\N	2021-12-02 13:37:36.973195	2021-12-02 13:37:36.973195	5	2
1507	2	9053	12	76	32	\N	1.6	2400	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	5500	USD	1.7	\N	1	2	\N	6512.0	\N	\N	\N	\N	2021-12-02 13:37:37.000671	2021-12-02 13:37:37.000671	6	8
1508	2	9054	12	76	32	\N	1.8	2880	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	7500	USD	2.1	\N	1	2	\N	6513.0	\N	\N	\N	\N	2021-12-02 13:37:37.058012	2021-12-02 13:37:37.058012	8	5
1509	2	9055	12	76	40	\N	1.2	800	USD	\N	4	18	19	82	39	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 13:37:37.085452	2021-12-02 13:37:37.085452	2	3
1510	2	9056	12	76	5	\N	1	0	USD	\N	4	5	2	82	32	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 13:37:37.112457	2021-12-02 13:37:37.112457	2	3
1511	2	9057	12	76	36	\N	1	600	USD	\N	4	7	3	82	35	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 13:37:37.139711	2021-12-02 13:37:37.139711	2	3
1512	2	9058	12	77	1	\N	3	21000	USD	\N	55	1	9	83	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 13:37:37.167551	2021-12-02 13:37:37.167551	23	51
1513	2	9059	12	77	2	\N	1	3000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 13:37:37.19532	2021-12-02 13:37:37.19532	23	4
1514	2	9060	12	77	2	\N	2	6000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.223446	2021-12-02 13:37:37.223446	23	5
1515	2	9061	12	77	2	\N	3	9000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.258261	2021-12-02 13:37:37.258261	23	6
1516	2	9062	12	77	2	\N	3.5	12000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.286144	2021-12-02 13:37:37.286144	23	7
1517	2	9063	12	77	5	\N	1	0	USD	\N	55	5	2	83	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.313573	2021-12-02 13:37:37.313573	2	3
1518	2	9064	12	77	41	\N	1	600	USD	\N	55	4	3	83	40	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.341852	2021-12-02 13:37:37.341852	2	3
1519	2	9065	12	77	36	\N	0.5	300	USD	\N	55	7	3	83	35	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.369678	2021-12-02 13:37:37.369678	2	3
1520	2	9066	12	78	1	\N	3	21000	USD	\N	56	1	3	84	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 13:37:37.397507	2021-12-02 13:37:37.397507	23	51
1521	2	9067	12	78	2	\N	1	3000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 13:37:37.425364	2021-12-02 13:37:37.425364	23	4
1522	2	9068	12	78	2	\N	2	6000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.452506	2021-12-02 13:37:37.452506	23	5
1523	2	9069	12	78	2	\N	3	9000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.479578	2021-12-02 13:37:37.479578	23	6
1524	2	9070	12	78	2	\N	3.5	12000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.506956	2021-12-02 13:37:37.506956	23	7
1525	2	9071	12	78	7	\N	1.2	800	USD	\N	56	8	5	84	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.5343	2021-12-02 13:37:37.5343	2	3
1526	2	9072	12	78	5	\N	1	0	USD	\N	56	5	5	84	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.561638	2021-12-02 13:37:37.561638	2	3
1527	2	9073	12	78	35	\N	1	600	USD	\N	56	20	9	84	33	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.589449	2021-12-02 13:37:37.589449	2	3
1528	2	9074	12	79	1	\N	3	21000	USD	\N	57	1	9	85	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 13:37:37.616256	2021-12-02 13:37:37.616256	23	51
1529	2	9075	12	79	2	\N	1	3000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 13:37:37.643323	2021-12-02 13:37:37.643323	23	4
1530	2	9076	12	79	2	\N	2	6000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.70172	2021-12-02 13:37:37.70172	23	5
1531	2	9077	12	79	2	\N	3	9000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.729576	2021-12-02 13:37:37.729576	23	6
1532	2	9078	12	79	2	\N	3.5	12000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 13:37:37.756988	2021-12-02 13:37:37.756988	23	7
1533	2	9079	12	79	7	\N	1.2	800	USD	\N	57	8	9	85	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.789837	2021-12-02 13:37:37.789837	2	3
1534	2	9080	12	79	5	\N	1	0	USD	\N	57	5	2	85	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.818847	2021-12-02 13:37:37.818847	2	3
1535	2	9081	12	79	42	\N	1	600	USD	\N	57	4	9	85	41	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.846889	2021-12-02 13:37:37.846889	2	3
1536	2	9082	12	79	36	\N	0.5	300	USD	\N	57	7	9	85	35	\N	3	\N	\N	0	USD	500	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 13:37:37.874869	2021-12-02 13:37:37.874869	2	3
1537	2	9083	12	80	1	\N	1	5000	USD	\N	58	1	9	86	26	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:37:37.903911	2021-12-02 13:37:37.903911	2	3
1538	2	9084	12	80	7	\N	0.5	500	USD	\N	58	8	9	86	29	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:37:37.93198	2021-12-02 13:37:37.93198	2	3
1539	2	9085	12	80	5	\N	0.5	0	USD	\N	58	5	9	86	32	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 13:37:37.960109	2021-12-02 13:37:37.960109	2	3
1540	2	9086	12	81	1	\N	1	5000	USD	\N	59	1	9	87	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 13:37:38.025814	2021-12-02 13:37:38.025814	2	3
1541	2	9087	12	81	33	\N	0.5	500	USD	\N	59	10	1	87	30	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 13:37:38.054326	2021-12-02 13:37:38.054326	2	3
1542	2	9088	12	81	5	\N	0.5	0	USD	\N	59	5	2	87	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 13:37:38.08205	2021-12-02 13:37:38.08205	2	3
1543	3	1001	1	1	1	\N	7.8	57000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3421.0	\N	\N	\N	\N	2021-12-02 14:07:14.171621	2021-12-02 14:07:14.171621	1	1
1544	3	1002	1	1	1	\N	15.6	114000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	15.6	\N	1	1	\N	3422.0	\N	\N	\N	\N	2021-12-02 14:07:14.179406	2021-12-02 14:07:14.179406	1	2
1545	3	1003	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	3600	USD	1.1	\N	1	1	\N	3451.0	\N	\N	\N	\N	2021-12-02 14:07:14.185345	2021-12-02 14:07:14.185345	2	3
1546	3	1004	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	5040	USD	1.4	\N	1	1	\N	3452.0	\N	\N	\N	\N	2021-12-02 14:07:14.191513	2021-12-02 14:07:14.191513	2	1
1547	3	1005	1	1	2	\N	1.5	3398	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	6480	USD	1.6	\N	1	1	\N	3453.0	\N	\N	\N	\N	2021-12-02 14:07:14.197697	2021-12-02 14:07:14.197697	2	4
1548	3	1006	1	1	2	\N	2	4248	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	3454.0	\N	\N	\N	\N	2021-12-02 14:07:14.203698	2021-12-02 14:07:14.203698	2	5
1549	3	1007	1	1	2	\N	2.5	5947	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	13680	USD	2.7	\N	1	1	\N	3455.0	\N	\N	\N	\N	2021-12-02 14:07:14.209873	2021-12-02 14:07:14.209873	2	6
1550	3	1008	1	1	2	\N	2.8	7646	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	17280	USD	3.8	\N	1	1	\N	3456.0	\N	\N	\N	\N	2021-12-02 14:07:14.215511	2021-12-02 14:07:14.215511	2	7
1551	3	1009	1	1	2	\N	3	10526	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	0	USD	4.9	\N	1	1	\N	3457.0	\N	\N	\N	\N	2021-12-02 14:07:14.221244	2021-12-02 14:07:14.221244	2	8
1552	3	1010	1	1	3	\N	0.9	1699	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	1440	USD	0.7	\N	1	1	\N	3441.0	\N	\N	\N	\N	2021-12-02 14:07:14.227051	2021-12-02 14:07:14.227051	2	3
1553	3	1011	1	1	3	\N	0.9	2195	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2160	USD	0.8	\N	1	1	\N	3442.0	\N	\N	\N	\N	2021-12-02 14:07:14.232615	2021-12-02 14:07:14.232615	2	1
1554	3	1012	1	1	3	\N	1	2549	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2880	USD	0.9	\N	1	1	\N	3443.0	\N	\N	\N	\N	2021-12-02 14:07:14.238313	2021-12-02 14:07:14.238313	2	4
1555	3	1013	1	1	3	\N	1.5	4248	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	3600	USD	1	\N	1	1	\N	3444.0	\N	\N	\N	\N	2021-12-02 14:07:14.243869	2021-12-02 14:07:14.243869	2	5
1556	3	1014	1	1	3	\N	1.8	5098	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	3445.0	\N	\N	\N	\N	2021-12-02 14:07:14.249653	2021-12-02 14:07:14.249653	2	6
1557	3	1015	1	1	3	\N	2	5947	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5040	USD	1.3	\N	1	1	\N	3446.0	\N	\N	\N	\N	2021-12-02 14:07:14.255174	2021-12-02 14:07:14.255174	2	7
1558	3	1016	1	1	3	\N	2.2	6797	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	3447.0	\N	\N	\N	\N	2021-12-02 14:07:14.260855	2021-12-02 14:07:14.260855	2	8
1559	3	1017	1	1	3	\N	2.8	8118	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	6480	USD	1.7	\N	1	1	\N	3448.0	\N	\N	\N	\N	2021-12-02 14:07:14.26641	2021-12-02 14:07:14.26641	2	9
1560	3	1018	1	1	4	\N	0.5	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	3431.0	\N	\N	\N	\N	2021-12-02 14:07:14.272045	2021-12-02 14:07:14.272045	2	10
1561	3	1019	1	1	4	\N	1	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 14:07:14.277474	2021-12-02 14:07:14.277474	2	1
1562	3	1020	1	1	5	\N	0.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 14:07:14.282953	2021-12-02 14:07:14.282953	2	1
1563	3	1021	1	1	5	\N	0.9	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 14:07:14.288613	2021-12-02 14:07:14.288613	2	4
1564	3	1022	1	1	5	\N	1.5	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 14:07:14.294245	2021-12-02 14:07:14.294245	2	5
1565	3	1023	1	1	5	\N	1.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 14:07:14.299904	2021-12-02 14:07:14.299904	2	6
1566	3	1024	1	1	5	\N	2	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	\N	2021-12-02 14:07:14.305444	2021-12-02 14:07:14.305444	2	7
1567	3	1025	1	2	1	\N	6	28500	USD	\N	1	1	1	2	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	\N	2021-12-02 14:07:14.310972	2021-12-02 14:07:14.310972	2	3
1568	3	1026	1	3	1	\N	6	28500	USD	\N	1	1	1	3	1	\N	3	\N	\N	0	USD	33000	USD	3.1	\N	1	1	\N	4457.0	\N	\N	\N	\N	2021-12-02 14:07:14.316584	2021-12-02 14:07:14.316584	2	3
1569	3	1027	1	2	2	\N	1.3	2879	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	\N	2021-12-02 14:07:14.322016	2021-12-02 14:07:14.322016	2	1
1570	3	1028	1	2	2	\N	1.5	3398	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	\N	2021-12-02 14:07:14.327521	2021-12-02 14:07:14.327521	2	4
1571	3	1029	1	2	2	\N	2	6797	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	\N	2021-12-02 14:07:14.333351	2021-12-02 14:07:14.333351	2	5
1572	3	1030	1	2	2	\N	2.2	10195	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.8	\N	1	1	\N	2454.0	\N	\N	\N	\N	2021-12-02 14:07:14.339141	2021-12-02 14:07:14.339141	2	6
1573	3	1031	1	2	2	\N	2.5	13594	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	2455.0	\N	\N	\N	\N	2021-12-02 14:07:14.344619	2021-12-02 14:07:14.344619	2	7
1574	3	1032	1	2	2	\N	3	16992	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	2456.0	\N	\N	\N	\N	2021-12-02 14:07:14.350354	2021-12-02 14:07:14.350354	2	8
1575	3	1033	1	2	2	\N	4.5	20390	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	2457.0	\N	\N	\N	\N	2021-12-02 14:07:14.355886	2021-12-02 14:07:14.355886	2	9
1576	3	1034	1	2	3	\N	1.3	2879	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2442.0	\N	\N	\N	\N	2021-12-02 14:07:14.361535	2021-12-02 14:07:14.361535	2	1
1577	3	1035	1	2	3	\N	1.5	3398	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	2443.0	\N	\N	\N	\N	2021-12-02 14:07:14.367076	2021-12-02 14:07:14.367076	2	4
1578	3	1036	1	2	3	\N	2	6797	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2444.0	\N	\N	\N	\N	2021-12-02 14:07:14.372637	2021-12-02 14:07:14.372637	2	5
1579	3	1037	1	2	3	\N	2.2	10195	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	2445.0	\N	\N	\N	\N	2021-12-02 14:07:14.378903	2021-12-02 14:07:14.378903	2	6
1580	3	1038	1	2	3	\N	2.5	13594	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	2446.0	\N	\N	\N	\N	2021-12-02 14:07:14.384638	2021-12-02 14:07:14.384638	2	7
1581	3	1039	1	2	3	\N	3	16992	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	2447.0	\N	\N	\N	\N	2021-12-02 14:07:14.390204	2021-12-02 14:07:14.390204	2	8
1582	3	1040	1	2	3	\N	4.5	20390	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	2448.0	\N	\N	\N	\N	2021-12-02 14:07:14.395753	2021-12-02 14:07:14.395753	2	9
1583	3	1041	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.401108	2021-12-02 14:07:14.401108	2	10
1584	3	1042	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.406776	2021-12-02 14:07:14.406776	2	1
1585	3	1043	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.412245	2021-12-02 14:07:14.412245	2	1
1586	3	1044	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.41777	2021-12-02 14:07:14.41777	2	4
1587	3	1045	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.423164	2021-12-02 14:07:14.423164	2	5
1588	3	1046	1	2	5	\N	0.6	300	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.428604	2021-12-02 14:07:14.428604	2	6
1589	3	1047	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.434269	2021-12-02 14:07:14.434269	2	7
1590	3	1048	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.439952	2021-12-02 14:07:14.439952	2	8
1591	3	1049	2	4	1	\N	1.1	1910	USD	\N	2	1	4	4	1	\N	3	\N	\N	0	USD	5000	USD	0.4	\N	1	1	\N	7920.0	\N	\N	\N	\N	2021-12-02 14:07:14.445343	2021-12-02 14:07:14.445343	2	3
1592	3	1050	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 14:07:14.450825	2021-12-02 14:07:14.450825	3	10
1593	3	1051	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 14:07:14.456583	2021-12-02 14:07:14.456583	4	1
1594	3	1053	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7981.0	\N	\N	\N	\N	2021-12-02 14:07:14.462198	2021-12-02 14:07:14.462198	3	10
1595	3	1054	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	\N	2021-12-02 14:07:14.467774	2021-12-02 14:07:14.467774	4	1
1596	3	1055	2	5	1	\N	2.5	19000	USD	\N	3	1	1	5	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	\N	2021-12-02 14:07:14.473402	2021-12-02 14:07:14.473402	2	3
1597	3	1056	2	5	3	\N	1.2	1410	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	2880	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	\N	2021-12-02 14:07:14.478972	2021-12-02 14:07:14.478972	3	10
1598	3	1057	2	5	3	\N	1	1910	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	4320	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	\N	2021-12-02 14:07:14.484629	2021-12-02 14:07:14.484629	4	1
1599	3	1058	2	5	3	\N	1	2450	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	5760	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	\N	2021-12-02 14:07:14.490255	2021-12-02 14:07:14.490255	4	4
1600	3	1059	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.495823	2021-12-02 14:07:14.495823	3	10
1601	3	1060	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.501457	2021-12-02 14:07:14.501457	4	1
1602	3	1061	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	\N	2021-12-02 14:07:14.506981	2021-12-02 14:07:14.506981	4	4
1603	3	1062	2	6	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	1410	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 14:07:14.51275	2021-12-02 14:07:14.51275	5	12
1604	3	1063	2	6	6	\N	0.8	1410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 14:07:14.518706	2021-12-02 14:07:14.518706	3	10
1605	3	1064	2	6	6	\N	1	1680	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	\N	2021-12-02 14:07:14.524446	2021-12-02 14:07:14.524446	4	1
1606	3	1065	2	6	6	\N	1.4	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	1112.0	\N	\N	\N	\N	2021-12-02 14:07:14.530056	2021-12-02 14:07:14.530056	4	4
1607	3	1066	2	6	6	\N	1.5	2160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	1	\N	1	1	\N	1113.0	\N	\N	\N	\N	2021-12-02 14:07:14.535746	2021-12-02 14:07:14.535746	6	13
1608	3	1067	2	6	6	\N	1.6	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2160	USD	1	\N	1	1	\N	1114.0	\N	\N	\N	\N	2021-12-02 14:07:14.541405	2021-12-02 14:07:14.541405	7	14
1609	3	1068	2	6	6	\N	1.8	2880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	1115.0	\N	\N	\N	\N	2021-12-02 14:07:14.547001	2021-12-02 14:07:14.547001	8	5
1610	3	1069	2	6	6	\N	2	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2880	USD	1.5	\N	1	1	\N	1116.0	\N	\N	\N	\N	2021-12-02 14:07:14.552658	2021-12-02 14:07:14.552658	9	15
1611	3	1070	2	6	6	\N	2.4	5410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.8	\N	1	1	\N	1117.0	\N	\N	\N	\N	2021-12-02 14:07:14.558171	2021-12-02 14:07:14.558171	10	16
1612	3	1071	2	6	6	\N	2.69	6960	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6960	USD	2.2	\N	1	1	\N	1118.0	\N	\N	\N	\N	2021-12-02 14:07:14.563772	2021-12-02 14:07:14.563772	11	6
1613	3	1072	2	6	6	\N	2.8	8880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8880	USD	2.4	\N	1	1	\N	1119.0	\N	\N	\N	\N	2021-12-02 14:07:14.569325	2021-12-02 14:07:14.569325	12	17
1614	3	1073	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.575012	2021-12-02 14:07:14.575012	2	10
1615	3	1074	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.580736	2021-12-02 14:07:14.580736	2	1
1616	3	1075	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.586343	2021-12-02 14:07:14.586343	3	10
1617	3	1076	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.591903	2021-12-02 14:07:14.591903	4	1
1618	3	1077	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.597485	2021-12-02 14:07:14.597485	2	5
1619	3	1078	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.602913	2021-12-02 14:07:14.602913	2	7
1620	3	1079	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.608518	2021-12-02 14:07:14.608518	2	18
1621	3	1080	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.614001	2021-12-02 14:07:14.614001	2	19
1622	3	1081	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.619465	2021-12-02 14:07:14.619465	2	20
1623	3	1082	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.625032	2021-12-02 14:07:14.625032	2	21
1624	3	1083	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.630624	2021-12-02 14:07:14.630624	2	22
1625	3	1084	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.636109	2021-12-02 14:07:14.636109	2	23
1626	3	1085	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.641968	2021-12-02 14:07:14.641968	2	24
1627	3	1086	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	\N	2021-12-02 14:07:14.647652	2021-12-02 14:07:14.647652	2	25
1628	3	1095	1	3	3	\N	1.3	2879	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	4442.0	\N	\N	\N	\N	2021-12-02 14:07:14.653097	2021-12-02 14:07:14.653097	2	1
1629	3	1096	1	3	3	\N	1.5	3398	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4443.0	\N	\N	\N	\N	2021-12-02 14:07:14.658507	2021-12-02 14:07:14.658507	2	4
1630	3	1097	1	3	3	\N	2	6797	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4444.0	\N	\N	\N	\N	2021-12-02 14:07:14.663938	2021-12-02 14:07:14.663938	2	5
1631	3	1098	1	3	3	\N	2.2	10195	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4445.0	\N	\N	\N	\N	2021-12-02 14:07:14.669505	2021-12-02 14:07:14.669505	2	6
1632	3	1099	1	3	3	\N	2.5	13594	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	4446.0	\N	\N	\N	\N	2021-12-02 14:07:14.675054	2021-12-02 14:07:14.675054	2	7
1633	3	1100	1	3	3	\N	3	16992	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4447.0	\N	\N	\N	\N	2021-12-02 14:07:14.680643	2021-12-02 14:07:14.680643	2	8
1634	3	1101	1	3	3	\N	4.5	20390	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4448.0	\N	\N	\N	\N	2021-12-02 14:07:14.686441	2021-12-02 14:07:14.686441	2	9
1635	3	1102	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 14:07:14.692013	2021-12-02 14:07:14.692013	2	10
1636	3	1103	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 14:07:14.697489	2021-12-02 14:07:14.697489	2	1
1637	3	1104	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 14:07:14.702999	2021-12-02 14:07:14.702999	2	1
1638	3	1105	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 14:07:14.708709	2021-12-02 14:07:14.708709	2	4
1639	3	1106	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 14:07:14.714265	2021-12-02 14:07:14.714265	2	5
1640	3	1107	1	3	5	\N	0.6	300	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 14:07:14.719893	2021-12-02 14:07:14.719893	2	6
1641	3	1108	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 14:07:14.729009	2021-12-02 14:07:14.729009	2	7
1642	3	1109	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	\N	2021-12-02 14:07:14.737456	2021-12-02 14:07:14.737456	2	8
1643	3	2001	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	0	USD	3.8	\N	1	1	\N	2122.0	\N	\N	\N	\N	2021-12-02 14:07:14.743126	2021-12-02 14:07:14.743126	13	19
1644	3	2002	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	30000	USD	4.2	\N	1	1	\N	2121.0	\N	\N	\N	\N	2021-12-02 14:07:14.748745	2021-12-02 14:07:14.748745	13	26
1645	3	2003	3	7	6	\N	0.8	1841	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	\N	2021-12-02 14:07:14.75442	2021-12-02 14:07:14.75442	3	10
1646	3	2004	3	7	6	\N	1	2266	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	\N	2021-12-02 14:07:14.760109	2021-12-02 14:07:14.760109	4	1
1647	3	2005	3	7	6	\N	1.4	2832	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.9	\N	1	1	\N	2112.0	\N	\N	\N	\N	2021-12-02 14:07:14.765898	2021-12-02 14:07:14.765898	4	4
1648	3	2006	3	7	6	\N	1.5	3729	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	2113.0	\N	\N	\N	\N	2021-12-02 14:07:14.771397	2021-12-02 14:07:14.771397	6	13
1649	3	2007	3	7	6	\N	1.6	4531	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	2114.0	\N	\N	\N	\N	2021-12-02 14:07:14.777298	2021-12-02 14:07:14.777298	7	14
1650	3	2008	3	7	6	\N	1.8	5098	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.4	\N	1	1	\N	2115.0	\N	\N	\N	\N	2021-12-02 14:07:14.783147	2021-12-02 14:07:14.783147	8	5
1651	3	2009	3	7	6	\N	2	5947	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.7	\N	1	1	\N	2116.0	\N	\N	\N	\N	2021-12-02 14:07:14.788831	2021-12-02 14:07:14.788831	9	15
1652	3	2010	3	7	6	\N	2.1	6443	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	2117.0	\N	\N	\N	\N	2021-12-02 14:07:14.794335	2021-12-02 14:07:14.794335	10	16
1653	3	2011	3	7	6	\N	2.2	9629	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.4	\N	1	1	\N	2118.0	\N	\N	\N	\N	2021-12-02 14:07:14.799914	2021-12-02 14:07:14.799914	11	6
1654	3	2012	3	7	6	\N	2.3	10077	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.6	\N	1	1	\N	2119.0	\N	\N	\N	\N	2021-12-02 14:07:14.805563	2021-12-02 14:07:14.805563	12	17
1655	3	2013	3	7	4	\N	0.3	354	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.811103	2021-12-02 14:07:14.811103	2	10
1656	3	2014	3	7	4	\N	0.6	708	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.816525	2021-12-02 14:07:14.816525	2	1
1657	3	2015	3	7	4	\N	0.6	354	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.822195	2021-12-02 14:07:14.822195	3	10
1658	3	2016	3	7	4	\N	1	708	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.82766	2021-12-02 14:07:14.82766	4	1
1659	3	2017	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.833274	2021-12-02 14:07:14.833274	2	5
1660	3	2018	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.838732	2021-12-02 14:07:14.838732	2	7
1661	3	2019	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.844233	2021-12-02 14:07:14.844233	2	18
1662	3	2020	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.850026	2021-12-02 14:07:14.850026	2	19
1663	3	2021	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.855696	2021-12-02 14:07:14.855696	2	20
1664	3	2022	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.861144	2021-12-02 14:07:14.861144	2	21
1665	3	2023	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.866763	2021-12-02 14:07:14.866763	2	22
1666	3	2024	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.872482	2021-12-02 14:07:14.872482	2	23
1667	3	2025	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.878034	2021-12-02 14:07:14.878034	2	24
1668	3	2026	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	\N	2021-12-02 14:07:14.883448	2021-12-02 14:07:14.883448	2	25
1669	3	2031	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6	\N	1	1	\N	2621.0	\N	\N	\N	\N	2021-12-02 14:07:14.888966	2021-12-02 14:07:14.888966	2	19
1670	3	2032	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6.2	\N	1	1	\N	2622.0	\N	\N	\N	\N	2021-12-02 14:07:14.894658	2021-12-02 14:07:14.894658	2	26
1671	3	2033	4	8	3	\N	1.5	5376	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	4800	USD	1.1	\N	1	1	\N	2642.0	\N	\N	\N	\N	2021-12-02 14:07:14.900296	2021-12-02 14:07:14.900296	2	4
1672	3	2034	4	8	3	\N	2	10752	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	9600	USD	1.3	\N	1	1	\N	2644.0	\N	\N	\N	\N	2021-12-02 14:07:14.905937	2021-12-02 14:07:14.905937	2	5
1673	3	2035	4	8	3	\N	3	16128	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	14400	USD	1.6	\N	1	1	\N	2645.0	\N	\N	\N	\N	2021-12-02 14:07:14.91172	2021-12-02 14:07:14.91172	2	6
1674	3	2036	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 14:07:14.917318	2021-12-02 14:07:14.917318	2	4
1675	3	2037	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 14:07:14.923226	2021-12-02 14:07:14.923226	2	5
1676	3	2038	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	\N	2021-12-02 14:07:14.92902	2021-12-02 14:07:14.92902	2	6
1677	3	3001	3	9	1	\N	0.6	1290	USD	\N	6	1	6	9	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	\N	2021-12-02 14:07:14.934799	2021-12-02 14:07:14.934799	2	3
1678	3	3002	3	9	7	\N	0.6	1290	USD	\N	6	8	1	9	8	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	\N	2021-12-02 14:07:14.940316	2021-12-02 14:07:14.940316	2	3
1679	3	3003	3	10	1	\N	4.5	17840	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3	\N	1	1	\N	3221.0	\N	\N	\N	\N	2021-12-02 14:07:14.946076	2021-12-02 14:07:14.946076	13	19
1680	3	3004	3	10	1	\N	4.5	0	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	3121.0	\N	\N	\N	\N	2021-12-02 14:07:14.951881	2021-12-02 14:07:14.951881	13	26
1681	3	3005	3	10	6	\N	0.8	1560	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.7	\N	1	1	\N	3111.0	\N	\N	\N	\N	2021-12-02 14:07:14.957826	2021-12-02 14:07:14.957826	3	10
1682	3	3006	3	10	6	\N	1	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.8	\N	1	1	\N	3112.0	\N	\N	\N	\N	2021-12-02 14:07:14.963623	2021-12-02 14:07:14.963623	4	1
1683	3	3007	3	10	6	\N	1.4	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1	\N	1	1	\N	3113.0	\N	\N	\N	\N	2021-12-02 14:07:14.969294	2021-12-02 14:07:14.969294	4	4
1684	3	3008	3	10	6	\N	1.5	3160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.3	\N	1	1	\N	3114.0	\N	\N	\N	\N	2021-12-02 14:07:14.975089	2021-12-02 14:07:14.975089	6	13
1685	3	3009	3	10	6	\N	1.6	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	4320	USD	1.5	\N	1	1	\N	3115.0	\N	\N	\N	\N	2021-12-02 14:07:14.981002	2021-12-02 14:07:14.981002	7	14
1686	3	3010	3	10	6	\N	1.8	4320	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5040	USD	1.8	\N	1	1	\N	3116.0	\N	\N	\N	\N	2021-12-02 14:07:14.98656	2021-12-02 14:07:14.98656	8	5
1687	3	3011	3	10	6	\N	2	5040	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2.2	\N	1	1	\N	3117.0	\N	\N	\N	\N	2021-12-02 14:07:14.992143	2021-12-02 14:07:14.992143	9	15
1688	3	3012	3	10	6	\N	2.1	5460	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	11520	USD	2.6	\N	1	1	\N	3118.0	\N	\N	\N	\N	2021-12-02 14:07:14.99767	2021-12-02 14:07:14.99767	10	16
1689	3	3013	3	10	6	\N	2.2	8160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	\N	2021-12-02 14:07:15.003182	2021-12-02 14:07:15.003182	11	6
1690	3	3014	3	10	6	\N	2.3	8540	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	\N	2021-12-02 14:07:15.008853	2021-12-02 14:07:15.008853	12	17
1691	3	3015	3	10	4	\N	1	600	USD	\N	4	4	5	6	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.014433	2021-12-02 14:07:15.014433	2	10
1692	3	3016	3	10	4	\N	0.6	600	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	300	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.020134	2021-12-02 14:07:15.020134	2	1
1693	3	3017	3	10	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.025713	2021-12-02 14:07:15.025713	3	10
1694	3	3018	3	10	4	\N	1	600	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.03138	2021-12-02 14:07:15.03138	4	1
1695	3	3019	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.036894	2021-12-02 14:07:15.036894	2	5
1696	3	3020	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.042521	2021-12-02 14:07:15.042521	2	7
1697	3	3021	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.048241	2021-12-02 14:07:15.048241	2	18
1698	3	3022	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.053837	2021-12-02 14:07:15.053837	2	19
1699	3	3023	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.05935	2021-12-02 14:07:15.05935	2	20
1700	3	3024	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.065026	2021-12-02 14:07:15.065026	2	21
1701	3	3025	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.070662	2021-12-02 14:07:15.070662	2	22
1702	3	3026	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.076434	2021-12-02 14:07:15.076434	2	23
1703	3	3027	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.082344	2021-12-02 14:07:15.082344	2	24
1704	3	3028	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	3181.0	\N	\N	\N	\N	2021-12-02 14:07:15.08812	2021-12-02 14:07:15.08812	2	25
1705	3	4001	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	4621.0	\N	\N	\N	\N	2021-12-02 14:07:15.09389	2021-12-02 14:07:15.09389	2	19
1706	3	4002	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.6	\N	1	1	\N	4622.0	\N	\N	\N	\N	2021-12-02 14:07:15.099595	2021-12-02 14:07:15.099595	2	26
1707	3	4003	4	11	3	\N	1.5	4301	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	4642.0	\N	\N	\N	\N	2021-12-02 14:07:15.105362	2021-12-02 14:07:15.105362	2	4
1708	3	4004	4	11	3	\N	2	8602	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	7680	USD	1.3	\N	1	1	\N	4644.0	\N	\N	\N	\N	2021-12-02 14:07:15.111204	2021-12-02 14:07:15.111204	2	5
1709	3	4005	4	11	3	\N	3	12880	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	11520	USD	1.6	\N	1	1	\N	4645.0	\N	\N	\N	\N	2021-12-02 14:07:15.117241	2021-12-02 14:07:15.117241	2	6
1710	3	4006	4	11	5	\N	1	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 14:07:15.123226	2021-12-02 14:07:15.123226	2	4
1711	3	4007	4	11	5	\N	1.5	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 14:07:15.129014	2021-12-02 14:07:15.129014	2	5
1712	3	4008	4	11	5	\N	2	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	2	1	\N	4681.0	\N	\N	\N	\N	2021-12-02 14:07:15.13463	2021-12-02 14:07:15.13463	2	6
1713	3	4009	4	12	1	\N	2.3	10820	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	\N	2021-12-02 14:07:15.140175	2021-12-02 14:07:15.140175	2	3
1714	3	4010	4	13	1	\N	2.3	10820	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 14:07:15.145747	2021-12-02 14:07:15.145747	2	3
1715	3	4011	4	14	4	\N	1	300	USD	\N	8	4	2	13	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 14:07:15.151309	2021-12-02 14:07:15.151309	2	3
1716	3	5000	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3	\N	1	1	\N	5121.0	\N	\N	\N	\N	2021-12-02 14:07:15.15726	2021-12-02 14:07:15.15726	2	3
1717	3	5001	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	5122.0	\N	\N	\N	\N	2021-12-02 14:07:15.16284	2021-12-02 14:07:15.16284	2	3
1718	3	5002	5	15	6	\N	1	1400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	5111.0	\N	\N	\N	\N	2021-12-02 14:07:15.168755	2021-12-02 14:07:15.168755	3	10
1719	3	5003	5	15	6	\N	1.3	1882	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	5112.0	\N	\N	\N	\N	2021-12-02 14:07:15.174612	2021-12-02 14:07:15.174612	4	1
1720	3	5004	5	15	6	\N	1.5	2957	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	5113.0	\N	\N	\N	\N	2021-12-02 14:07:15.180562	2021-12-02 14:07:15.180562	4	4
1721	3	5005	5	15	6	\N	1.8	4301	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.2	\N	1	1	\N	5114.0	\N	\N	\N	\N	2021-12-02 14:07:15.186327	2021-12-02 14:07:15.186327	6	13
1722	3	5006	5	15	6	\N	2	6451	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	5115.0	\N	\N	\N	\N	2021-12-02 14:07:15.191951	2021-12-02 14:07:15.191951	7	14
1723	3	5007	5	15	6	\N	2.2	7526	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.8	\N	1	1	\N	5116.0	\N	\N	\N	\N	2021-12-02 14:07:15.197626	2021-12-02 14:07:15.197626	8	5
1724	3	5008	5	15	6	\N	2.3	9094	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	5117.0	\N	\N	\N	\N	2021-12-02 14:07:15.203478	2021-12-02 14:07:15.203478	9	15
1725	3	5009	5	15	6	\N	2.5	11290	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	5118.0	\N	\N	\N	\N	2021-12-02 14:07:15.20912	2021-12-02 14:07:15.20912	10	16
1726	3	5010	5	15	6	\N	3	13574	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	\N	2021-12-02 14:07:15.21505	2021-12-02 14:07:15.21505	11	6
1727	3	5011	5	15	6	\N	3.5	16934	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	\N	2021-12-02 14:07:15.220814	2021-12-02 14:07:15.220814	12	17
1728	3	5012	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.226521	2021-12-02 14:07:15.226521	2	10
1729	3	5013	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.232127	2021-12-02 14:07:15.232127	2	1
1730	3	5014	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.237782	2021-12-02 14:07:15.237782	3	10
1731	3	5015	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.24351	2021-12-02 14:07:15.24351	4	1
1732	3	5016	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.249069	2021-12-02 14:07:15.249069	2	5
1733	3	5017	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.25492	2021-12-02 14:07:15.25492	2	7
1734	3	5018	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.260769	2021-12-02 14:07:15.260769	2	18
1735	3	5019	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.266497	2021-12-02 14:07:15.266497	2	19
1736	3	5020	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.272248	2021-12-02 14:07:15.272248	2	20
1737	3	5021	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.277927	2021-12-02 14:07:15.277927	2	21
1738	3	5022	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.283654	2021-12-02 14:07:15.283654	2	22
1739	3	5023	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.28943	2021-12-02 14:07:15.28943	2	23
1740	3	5024	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.295177	2021-12-02 14:07:15.295177	2	24
1741	3	5025	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	\N	2021-12-02 14:07:15.301087	2021-12-02 14:07:15.301087	2	25
1742	3	5030	5	16	2	\N	0.5	1000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 14:07:15.306838	2021-12-02 14:07:15.306838	2	4
1743	3	5031	5	16	2	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 14:07:15.312502	2021-12-02 14:07:15.312502	2	5
1744	3	5032	5	16	2	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 14:07:15.318204	2021-12-02 14:07:15.318204	2	6
1745	3	5033	5	16	2	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 14:07:15.32387	2021-12-02 14:07:15.32387	2	7
1746	3	5034	5	16	2	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 14:07:15.329454	2021-12-02 14:07:15.329454	2	8
1747	3	5035	5	16	2	\N	1	6500	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 14:07:15.334919	2021-12-02 14:07:15.334919	2	9
1748	3	5036	5	16	2	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	\N	2021-12-02 14:07:15.340436	2021-12-02 14:07:15.340436	2	19
1749	3	5037	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.346101	2021-12-02 14:07:15.346101	2	10
1750	3	5038	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.351789	2021-12-02 14:07:15.351789	2	1
1751	3	5039	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.357567	2021-12-02 14:07:15.357567	2	4
1752	3	5040	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.3633	2021-12-02 14:07:15.3633	2	5
1753	3	5041	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.369059	2021-12-02 14:07:15.369059	2	6
1754	3	5042	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.37483	2021-12-02 14:07:15.37483	2	7
1755	3	5043	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.380675	2021-12-02 14:07:15.380675	2	8
1756	3	5044	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.386736	2021-12-02 14:07:15.386736	2	9
1757	3	5045	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:15.392414	2021-12-02 14:07:15.392414	2	19
1758	3	5046	5	17	1	\N	1	16822	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	1	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 14:07:15.398309	2021-12-02 14:07:15.398309	2	3
1759	3	5047	5	17	1	\N	2	33645	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	2	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 14:07:15.409674	2021-12-02 14:07:15.409674	2	1
1760	3	5048	5	17	1	\N	3	50467	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	3	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 14:07:15.415655	2021-12-02 14:07:15.415655	2	4
1761	3	5049	5	17	1	\N	4	67290	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	4	1	\N	5421.0	\N	\N	\N	\N	2021-12-02 14:07:15.421474	2021-12-02 14:07:15.421474	2	2
1762	3	5050	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	1	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 14:07:15.427278	2021-12-02 14:07:15.427278	2	4
1763	3	5051	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	2	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 14:07:15.433319	2021-12-02 14:07:15.433319	2	5
1764	3	5052	5	17	2	\N	1	14560	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	3	1	\N	5451.0	\N	\N	\N	\N	2021-12-02 14:07:15.438859	2021-12-02 14:07:15.438859	2	6
1765	3	5053	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.44446	2021-12-02 14:07:15.44446	2	3
1766	3	5054	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.450106	2021-12-02 14:07:15.450106	2	1
1767	3	5055	5	17	4	\N	0.6	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.455791	2021-12-02 14:07:15.455791	2	4
1768	3	5056	5	17	4	\N	0.8	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.461451	2021-12-02 14:07:15.461451	2	2
1769	3	5057	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.512909	2021-12-02 14:07:15.512909	2	3
1770	3	5058	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.51975	2021-12-02 14:07:15.51975	2	1
1771	3	5059	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.52569	2021-12-02 14:07:15.52569	2	4
1772	3	5060	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.531281	2021-12-02 14:07:15.531281	2	2
1773	3	5061	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.536921	2021-12-02 14:07:15.536921	2	3
1774	3	5062	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.542843	2021-12-02 14:07:15.542843	2	1
1775	3	5063	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.548632	2021-12-02 14:07:15.548632	2	4
1776	3	5064	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	\N	2021-12-02 14:07:15.554497	2021-12-02 14:07:15.554497	2	2
1777	3	5065	5	18	1	\N	0.5	963	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.560092	2021-12-02 14:07:15.560092	2	3
1778	3	5066	5	18	1	\N	0.5	1926	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.56594	2021-12-02 14:07:15.56594	2	1
1779	3	5067	5	18	1	\N	0.6	2890	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.571564	2021-12-02 14:07:15.571564	2	4
1780	3	5068	5	18	1	\N	0.8	3853	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.577684	2021-12-02 14:07:15.577684	2	2
1781	3	5069	5	18	1	\N	1	4816	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.583592	2021-12-02 14:07:15.583592	2	3
1782	3	5070	5	18	1	\N	1.2	5779	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.589502	2021-12-02 14:07:15.589502	2	5
1783	3	5071	5	18	1	\N	1.4	6742	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.595221	2021-12-02 14:07:15.595221	2	26
1784	3	5072	5	18	1	\N	1.6	7706	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.600744	2021-12-02 14:07:15.600744	2	16
1785	3	5073	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.606588	2021-12-02 14:07:15.606588	2	3
1786	3	5074	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.61211	2021-12-02 14:07:15.61211	2	1
1787	3	5075	5	18	5	\N	0.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.617694	2021-12-02 14:07:15.617694	2	4
1788	3	5076	5	18	5	\N	0.8	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.629668	2021-12-02 14:07:15.629668	2	2
1789	3	5077	5	18	5	\N	1	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.635486	2021-12-02 14:07:15.635486	2	3
1790	3	5078	5	18	5	\N	1.2	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.641227	2021-12-02 14:07:15.641227	2	5
1791	3	5079	5	18	5	\N	1.4	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.647285	2021-12-02 14:07:15.647285	2	26
1792	3	5080	5	18	5	\N	1.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.65305	2021-12-02 14:07:15.65305	2	16
1793	3	5081	5	18	10	\N	0.5	0	USD	\N	11	10	2	17	12	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	\N	2021-12-02 14:07:15.658766	2021-12-02 14:07:15.658766	2	3
1794	3	5082	5	19	1	\N	0.5	1725	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 14:07:15.664464	2021-12-02 14:07:15.664464	2	3
1795	3	5083	5	19	1	\N	0.5	3450	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 14:07:15.670053	2021-12-02 14:07:15.670053	2	1
1796	3	5084	5	19	1	\N	0.5	5174	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 14:07:15.675781	2021-12-02 14:07:15.675781	2	4
1797	3	5085	5	19	1	\N	0.8	6899	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 14:07:15.681364	2021-12-02 14:07:15.681364	2	2
1798	3	5086	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 14:07:15.687142	2021-12-02 14:07:15.687142	2	3
1799	3	5087	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 14:07:15.692938	2021-12-02 14:07:15.692938	2	1
1800	3	5088	5	19	4	\N	0.6	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 14:07:15.698612	2021-12-02 14:07:15.698612	2	4
1801	3	5089	5	19	4	\N	0.8	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	\N	2021-12-02 14:07:15.704163	2021-12-02 14:07:15.704163	2	2
1802	3	5090	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 14:07:15.709825	2021-12-02 14:07:15.709825	2	3
1803	3	5091	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 14:07:15.715328	2021-12-02 14:07:15.715328	2	1
1804	3	5092	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 14:07:15.720788	2021-12-02 14:07:15.720788	2	4
1805	3	5093	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	\N	2021-12-02 14:07:15.726259	2021-12-02 14:07:15.726259	2	2
1806	3	5094	5	20	1	\N	0.5	1456	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.731708	2021-12-02 14:07:15.731708	2	3
1807	3	5095	5	20	1	\N	0.5	2912	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.737202	2021-12-02 14:07:15.737202	2	1
1808	3	5096	5	20	1	\N	0.5	4368	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.742701	2021-12-02 14:07:15.742701	2	4
1809	3	5097	5	20	1	\N	0.5	5824	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.748204	2021-12-02 14:07:15.748204	2	2
1810	3	5098	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.75377	2021-12-02 14:07:15.75377	2	3
1811	3	5099	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.759551	2021-12-02 14:07:15.759551	2	1
1812	3	5100	5	20	4	\N	0.6	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.76517	2021-12-02 14:07:15.76517	2	4
1813	3	5101	5	20	4	\N	0.8	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.770808	2021-12-02 14:07:15.770808	2	2
1814	3	5102	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.776695	2021-12-02 14:07:15.776695	2	3
1815	3	5103	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.782465	2021-12-02 14:07:15.782465	2	1
1816	3	5104	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.788335	2021-12-02 14:07:15.788335	2	4
1817	3	5105	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.794077	2021-12-02 14:07:15.794077	2	2
1818	3	5106	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.799756	2021-12-02 14:07:15.799756	2	3
1819	3	5107	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.805292	2021-12-02 14:07:15.805292	2	1
1820	3	5108	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.811093	2021-12-02 14:07:15.811093	2	4
1821	3	5109	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.81668	2021-12-02 14:07:15.81668	2	2
1822	3	5110	5	21	1	\N	0.5	1021	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.82227	2021-12-02 14:07:15.82227	2	3
1823	3	5111	5	21	1	\N	0.5	2041	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.82795	2021-12-02 14:07:15.82795	2	1
1824	3	5112	5	21	1	\N	0.5	3062	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.833737	2021-12-02 14:07:15.833737	2	4
1825	3	5113	5	21	1	\N	0.5	4083	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.839303	2021-12-02 14:07:15.839303	2	2
1826	3	5114	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.844914	2021-12-02 14:07:15.844914	2	3
1827	3	5115	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.850594	2021-12-02 14:07:15.850594	2	1
1828	3	5116	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.856187	2021-12-02 14:07:15.856187	2	4
1829	3	5117	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.861798	2021-12-02 14:07:15.861798	2	2
1830	3	5118	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.867592	2021-12-02 14:07:15.867592	2	3
1831	3	5119	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.873288	2021-12-02 14:07:15.873288	2	1
1832	3	5120	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.87897	2021-12-02 14:07:15.87897	2	4
1833	3	5121	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.885053	2021-12-02 14:07:15.885053	2	2
1834	3	5122	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.890739	2021-12-02 14:07:15.890739	2	3
1835	3	5123	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.896327	2021-12-02 14:07:15.896327	2	1
1836	3	5124	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.901847	2021-12-02 14:07:15.901847	2	4
1837	3	5125	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	\N	2021-12-02 14:07:15.907337	2021-12-02 14:07:15.907337	2	2
1838	3	5126	5	22	1	\N	0.5	1156	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.912908	2021-12-02 14:07:15.912908	2	3
1839	3	5127	5	22	1	\N	0.6	2313	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.918449	2021-12-02 14:07:15.918449	2	1
1840	3	5128	5	22	1	\N	0.9	3469	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.923854	2021-12-02 14:07:15.923854	2	4
1841	3	5129	5	22	1	\N	1.2	4626	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.929331	2021-12-02 14:07:15.929331	2	2
1842	3	5130	5	22	5	\N	0.5	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.934879	2021-12-02 14:07:15.934879	2	3
1843	3	5131	5	22	5	\N	0.6	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.940395	2021-12-02 14:07:15.940395	2	1
1844	3	5132	5	22	5	\N	0.9	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.946056	2021-12-02 14:07:15.946056	2	4
1845	3	5133	5	22	5	\N	1.2	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.951654	2021-12-02 14:07:15.951654	2	2
1846	3	5134	5	23	1	\N	0.5	800	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.957195	2021-12-02 14:07:15.957195	2	3
1847	3	5135	5	23	1	\N	0.5	1600	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.962842	2021-12-02 14:07:15.962842	2	1
1848	3	5136	5	23	1	\N	0.6	2400	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.968307	2021-12-02 14:07:15.968307	2	4
1849	3	5137	5	23	1	\N	0.8	3200	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.973859	2021-12-02 14:07:15.973859	2	2
1850	3	5138	5	24	1	\N	0.5	1310	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.979498	2021-12-02 14:07:15.979498	2	3
1851	3	5139	5	24	1	\N	0.6	2620	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.985106	2021-12-02 14:07:15.985106	2	1
1852	3	5140	5	24	1	\N	0.9	3929	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.990744	2021-12-02 14:07:15.990744	2	4
1853	3	5141	5	24	1	\N	1.2	5239	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:15.996261	2021-12-02 14:07:15.996261	2	2
1854	3	5142	5	25	1	\N	0.5	1300	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:16.001741	2021-12-02 14:07:16.001741	2	3
1855	3	5143	5	25	1	\N	0.8	2600	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:16.007565	2021-12-02 14:07:16.007565	2	1
1856	3	5144	5	25	1	\N	1	3900	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:16.013265	2021-12-02 14:07:16.013265	2	4
1857	3	5145	5	25	1	\N	1	5200	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:16.018953	2021-12-02 14:07:16.018953	2	2
1858	3	5146	5	24	4	\N	0.5	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:16.024635	2021-12-02 14:07:16.024635	2	3
1859	3	5147	5	24	4	\N	0.6	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:16.030498	2021-12-02 14:07:16.030498	2	1
1860	3	5148	5	24	4	\N	0.9	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:16.036318	2021-12-02 14:07:16.036318	2	4
1861	3	5149	5	24	4	\N	1.2	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	\N	2021-12-02 14:07:16.042218	2021-12-02 14:07:16.042218	2	2
1862	3	5150	5	26	1	\N	1	4189	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	1	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 14:07:16.048028	2021-12-02 14:07:16.048028	2	3
1863	3	5151	5	26	1	\N	2	8378	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	2	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 14:07:16.053646	2021-12-02 14:07:16.053646	2	1
1864	3	5152	5	26	1	\N	3	12567	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	3	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 14:07:16.059435	2021-12-02 14:07:16.059435	2	4
1865	3	5153	5	26	1	\N	4	16756	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	4	1	\N	5221.0	\N	\N	\N	\N	2021-12-02 14:07:16.065293	2021-12-02 14:07:16.065293	2	2
1866	3	5154	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:16.070811	2021-12-02 14:07:16.070811	2	3
1867	3	5155	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:16.076533	2021-12-02 14:07:16.076533	2	1
1868	3	5156	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:16.082198	2021-12-02 14:07:16.082198	2	4
1869	3	5157	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:16.087987	2021-12-02 14:07:16.087987	2	2
1870	3	5158	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:16.093649	2021-12-02 14:07:16.093649	2	3
1871	3	5159	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:16.099296	2021-12-02 14:07:16.099296	2	1
1872	3	5160	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:16.104978	2021-12-02 14:07:16.104978	2	4
1873	3	5161	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:16.110689	2021-12-02 14:07:16.110689	2	2
1874	3	5162	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 14:07:16.11632	2021-12-02 14:07:16.11632	2	3
1875	3	5163	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 14:07:16.121884	2021-12-02 14:07:16.121884	2	1
1876	3	5164	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 14:07:16.127393	2021-12-02 14:07:16.127393	2	4
1877	3	5165	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	\N	2021-12-02 14:07:16.132826	2021-12-02 14:07:16.132826	2	2
1878	3	5166	5	27	1	\N	1	3550	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	1	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 14:07:16.138229	2021-12-02 14:07:16.138229	2	3
1879	3	5167	5	27	1	\N	1.5	7100	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	2	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 14:07:16.143632	2021-12-02 14:07:16.143632	2	1
1880	3	5168	5	27	1	\N	1.5	10650	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	3	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 14:07:16.149097	2021-12-02 14:07:16.149097	2	4
1881	3	5169	5	27	1	\N	2	14200	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	4	1	\N	5222.0	\N	\N	\N	\N	2021-12-02 14:07:16.15458	2021-12-02 14:07:16.15458	2	2
1882	3	5170	5	28	2	\N	0.5	2360	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	\N	2021-12-02 14:07:16.160335	2021-12-02 14:07:16.160335	2	3
1883	3	5171	5	28	2	\N	1	2950	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	\N	2021-12-02 14:07:16.165937	2021-12-02 14:07:16.165937	2	1
1884	3	5172	5	28	2	\N	1.5	3540	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	\N	2021-12-02 14:07:16.171588	2021-12-02 14:07:16.171588	2	4
1885	3	5173	5	28	2	\N	2	7080	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	\N	2021-12-02 14:07:16.177377	2021-12-02 14:07:16.177377	2	5
1886	3	5174	5	28	2	\N	2.2	10620	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	\N	2021-12-02 14:07:16.182833	2021-12-02 14:07:16.182833	2	6
1887	3	5175	5	28	2	\N	2.5	14160	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	\N	2021-12-02 14:07:16.188505	2021-12-02 14:07:16.188505	2	7
1888	3	5176	5	28	2	\N	3	17700	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 14:07:16.194004	2021-12-02 14:07:16.194004	2	8
1889	3	5177	5	28	2	\N	3.6	22420	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 14:07:16.199428	2021-12-02 14:07:16.199428	2	9
1890	3	5178	5	28	2	\N	5	28320	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 14:07:16.20496	2021-12-02 14:07:16.20496	2	19
1891	3	5179	5	28	3	\N	0.5	2360	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	\N	2021-12-02 14:07:16.210345	2021-12-02 14:07:16.210345	2	3
1892	3	5180	5	28	3	\N	1	2950	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	\N	2021-12-02 14:07:16.215803	2021-12-02 14:07:16.215803	2	1
1893	3	5181	5	28	3	\N	1.5	3540	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	\N	2021-12-02 14:07:16.221303	2021-12-02 14:07:16.221303	2	4
1894	3	5182	5	28	3	\N	2	7080	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	\N	2021-12-02 14:07:16.227005	2021-12-02 14:07:16.227005	2	5
1895	3	5183	5	28	3	\N	2.2	10620	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	\N	2021-12-02 14:07:16.232478	2021-12-02 14:07:16.232478	2	6
1896	3	5184	5	28	3	\N	2.5	14160	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	\N	2021-12-02 14:07:16.238137	2021-12-02 14:07:16.238137	2	7
1897	3	5185	5	28	3	\N	3	17700	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 14:07:16.243636	2021-12-02 14:07:16.243636	2	8
1898	3	5186	5	28	3	\N	3.6	22420	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 14:07:16.24934	2021-12-02 14:07:16.24934	2	9
1899	3	5187	5	28	3	\N	5	28320	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	\N	2021-12-02 14:07:16.255057	2021-12-02 14:07:16.255057	2	19
1900	3	5188	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.260734	2021-12-02 14:07:16.260734	2	10
1901	3	5189	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.266282	2021-12-02 14:07:16.266282	2	1
1902	3	5190	5	28	5	\N	0.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.271741	2021-12-02 14:07:16.271741	2	3
1903	3	5191	5	28	5	\N	1.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.277399	2021-12-02 14:07:16.277399	2	4
1904	3	5192	5	28	5	\N	2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.282996	2021-12-02 14:07:16.282996	2	5
1905	3	5193	5	28	5	\N	2.2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.288772	2021-12-02 14:07:16.288772	2	6
1906	3	5194	5	28	5	\N	2.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.294423	2021-12-02 14:07:16.294423	2	7
1907	3	5195	5	28	5	\N	3	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.300148	2021-12-02 14:07:16.300148	2	8
1908	3	5196	5	28	5	\N	3.6	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.305899	2021-12-02 14:07:16.305899	2	9
1909	3	5197	5	28	5	\N	5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	\N	2021-12-02 14:07:16.311651	2021-12-02 14:07:16.311651	2	19
1910	3	5198	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.317453	2021-12-02 14:07:16.317453	2	1
1911	3	5199	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.323104	2021-12-02 14:07:16.323104	2	4
1912	3	5200	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.328645	2021-12-02 14:07:16.328645	2	5
1913	3	5201	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.334183	2021-12-02 14:07:16.334183	2	6
1914	3	5202	5	29	1	\N	0.5	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.339757	2021-12-02 14:07:16.339757	2	7
1915	3	5203	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.345383	2021-12-02 14:07:16.345383	2	8
1916	3	5204	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.351073	2021-12-02 14:07:16.351073	2	9
1917	3	5205	5	29	1	\N	0.6	3172	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	2400	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.356763	2021-12-02 14:07:16.356763	2	19
1918	3	5206	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.362436	2021-12-02 14:07:16.362436	2	10
1919	3	5207	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.368025	2021-12-02 14:07:16.368025	2	1
1920	3	5208	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.373597	2021-12-02 14:07:16.373597	2	4
1921	3	5209	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.379175	2021-12-02 14:07:16.379175	2	5
1922	3	5210	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.384705	2021-12-02 14:07:16.384705	2	6
1923	3	5211	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.390766	2021-12-02 14:07:16.390766	2	7
1924	3	5212	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.396535	2021-12-02 14:07:16.396535	2	8
1925	3	5213	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.402221	2021-12-02 14:07:16.402221	2	9
1926	3	5214	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	5	1	\N	5921.0	\N	\N	\N	\N	2021-12-02 14:07:16.407764	2021-12-02 14:07:16.407764	2	19
1927	3	5215	5	30	1	\N	0.7	1500	USD	\N	22	1	1	27	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5623.0	\N	\N	\N	\N	2021-12-02 14:07:16.413482	2021-12-02 14:07:16.413482	2	3
1928	3	5216	5	30	5	\N	0.5	0	USD	\N	22	5	5	27	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	\N	2021-12-02 14:07:16.419155	2021-12-02 14:07:16.419155	2	3
1929	3	5217	5	30	4	\N	0.5	300	USD	\N	22	4	10	27	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	\N	2021-12-02 14:07:16.425044	2021-12-02 14:07:16.425044	2	3
1930	3	5218	5	12	1	\N	2.3	12768	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	\N	2021-12-02 14:07:16.43077	2021-12-02 14:07:16.43077	2	3
1931	3	5219	5	13	1	\N	2.3	12768	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 14:07:16.436431	2021-12-02 14:07:16.436431	2	3
1932	3	5220	5	14	4	\N	0.6	600	USD	\N	8	4	2	12	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	\N	2021-12-02 14:07:16.442023	2021-12-02 14:07:16.442023	2	3
1933	3	5221	5	31	1	\N	1	1400	USD	\N	23	1	1	28	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	\N	2021-12-02 14:07:16.447751	2021-12-02 14:07:16.447751	2	3
1934	3	5222	5	31	4	\N	1	1400	USD	\N	23	7	1	28	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	\N	2021-12-02 14:07:16.45339	2021-12-02 14:07:16.45339	2	3
1935	3	5223	5	16	1	\N	0.5	1000	USD	\N	9	2	3	15	1	\N	2	\N	\N	0	USD	900	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:16.463878	2021-12-02 14:07:16.463878	2	4
1936	3	5224	5	16	1	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	1800	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:16.471601	2021-12-02 14:07:16.471601	2	5
1937	3	5225	5	16	1	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2700	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:16.477439	2021-12-02 14:07:16.477439	2	6
1938	3	5226	5	16	1	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:16.483207	2021-12-02 14:07:16.483207	2	7
1939	3	5227	5	16	1	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2400	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:16.488973	2021-12-02 14:07:16.488973	2	8
1940	3	5228	5	16	1	\N	1	6000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2800	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:16.494579	2021-12-02 14:07:16.494579	2	18
1941	3	5229	5	16	1	\N	1	7000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3150	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:16.500109	2021-12-02 14:07:16.500109	2	34
1942	3	5230	5	16	1	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:16.505697	2021-12-02 14:07:16.505697	2	19
1943	3	5231	5	15	11	\N	0.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:16.511355	2021-12-02 14:07:16.511355	2	3
1944	3	5232	5	15	11	\N	1	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:16.516988	2021-12-02 14:07:16.516988	2	1
1945	3	5233	5	15	11	\N	1.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:16.522617	2021-12-02 14:07:16.522617	2	4
1946	3	5234	5	15	11	\N	2	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:16.528493	2021-12-02 14:07:16.528493	2	2
1947	3	6000	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 14:07:16.534229	2021-12-02 14:07:16.534229	8	5
1948	3	6001	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 14:07:16.539796	2021-12-02 14:07:16.539796	11	5
1949	3	6002	6	32	12	\N	1.5	8060	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6500	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	\N	2021-12-02 14:07:16.545698	2021-12-02 14:07:16.545698	13	5
1950	3	6003	6	32	12	\N	1.5	12500	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	1.2	\N	1	1	\N	6525.0	\N	\N	\N	\N	2021-12-02 14:07:16.551463	2021-12-02 14:07:16.551463	13	6
1951	3	6004	6	32	12	\N	1.5	15000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	11000	USD	1.5	\N	1	1	\N	6523.0	\N	\N	\N	\N	2021-12-02 14:07:16.557334	2021-12-02 14:07:16.557334	13	7
1952	3	6005	6	32	12	\N	2	20000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	14000	USD	1.7	\N	1	1	\N	6527.0	\N	\N	\N	\N	2021-12-02 14:07:16.563067	2021-12-02 14:07:16.563067	13	8
1953	3	6006	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	1.9	\N	1	1	\N	6528.0	\N	\N	\N	\N	2021-12-02 14:07:16.568924	2021-12-02 14:07:16.568924	13	18
1954	3	6007	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	4	\N	\N	0	USD	22000	USD	2	\N	1	1	\N	6529.0	\N	\N	\N	\N	2021-12-02 14:07:16.574422	2021-12-02 14:07:16.574422	13	34
1955	3	6008	6	32	12	\N	3	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	2.1	\N	1	1	\N	6524.0	\N	\N	\N	\N	2021-12-02 14:07:16.580287	2021-12-02 14:07:16.580287	13	19
1956	3	6009	6	32	8	\N	0.75	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	100	USD	0.1	\N	5	1	\N	6173.0	\N	\N	\N	\N	2021-12-02 14:07:16.585925	2021-12-02 14:07:16.585925	2	5
1957	3	6010	6	32	8	\N	1.3	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	\N	2021-12-02 14:07:16.592026	2021-12-02 14:07:16.592026	2	7
1958	3	6011	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	\N	2021-12-02 14:07:16.597739	2021-12-02 14:07:16.597739	2	19
1959	3	6012	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 14:07:16.603418	2021-12-02 14:07:16.603418	2	21
1960	3	6013	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 14:07:16.609196	2021-12-02 14:07:16.609196	2	23
1961	3	6014	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 14:07:16.614906	2021-12-02 14:07:16.614906	2	5
1962	3	6015	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 14:07:16.620541	2021-12-02 14:07:16.620541	2	39
1963	3	6016	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 14:07:16.626119	2021-12-02 14:07:16.626119	2	40
1964	3	6017	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 14:07:16.632005	2021-12-02 14:07:16.632005	2	41
1965	3	6018	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	\N	2021-12-02 14:07:16.637812	2021-12-02 14:07:16.637812	2	42
1966	3	6019	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.643586	2021-12-02 14:07:16.643586	2	5
1967	3	6020	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.649316	2021-12-02 14:07:16.649316	2	6
1968	3	6021	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.655221	2021-12-02 14:07:16.655221	2	7
1969	3	6022	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.661176	2021-12-02 14:07:16.661176	2	9
1970	3	6023	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.666929	2021-12-02 14:07:16.666929	2	19
1971	3	6024	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.672639	2021-12-02 14:07:16.672639	12	17
1972	3	6025	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.678492	2021-12-02 14:07:16.678492	14	43
1973	3	6026	6	32	14	\N	1.8	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.684308	2021-12-02 14:07:16.684308	15	44
1974	3	6027	6	32	14	\N	2.6	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	\N	2021-12-02 14:07:16.690233	2021-12-02 14:07:16.690233	16	9
1975	3	6032	6	33	2	\N	1	3540	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 14:07:16.696085	2021-12-02 14:07:16.696085	2	4
1976	3	6033	6	33	2	\N	1	7080	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 14:07:16.70183	2021-12-02 14:07:16.70183	2	5
1977	3	6034	6	33	2	\N	1	10620	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 14:07:16.707628	2021-12-02 14:07:16.707628	2	6
1978	3	6035	6	33	2	\N	1	14160	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 14:07:16.713607	2021-12-02 14:07:16.713607	2	7
1979	3	6036	6	33	2	\N	2	17700	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 14:07:16.719623	2021-12-02 14:07:16.719623	2	8
1980	3	6037	6	33	2	\N	2	22420	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 14:07:16.725537	2021-12-02 14:07:16.725537	2	9
1981	3	6038	6	33	2	\N	2	25724	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	\N	2021-12-02 14:07:16.731064	2021-12-02 14:07:16.731064	2	19
1982	3	6039	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.736828	2021-12-02 14:07:16.736828	2	10
1983	3	6040	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.742659	2021-12-02 14:07:16.742659	2	1
1984	3	6041	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.748607	2021-12-02 14:07:16.748607	2	10
1985	3	6042	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.754565	2021-12-02 14:07:16.754565	2	1
1986	3	6043	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.760395	2021-12-02 14:07:16.760395	2	4
1987	3	6044	6	33	5	\N	0.7	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.766303	2021-12-02 14:07:16.766303	2	5
1988	3	6045	6	33	5	\N	0.9	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.822235	2021-12-02 14:07:16.822235	2	6
1989	3	6046	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.831674	2021-12-02 14:07:16.831674	2	7
1990	3	6047	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.837545	2021-12-02 14:07:16.837545	2	8
1991	3	6048	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	\N	2021-12-02 14:07:16.843108	2021-12-02 14:07:16.843108	2	9
1992	3	6049	6	34	1	\N	0.5	3500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 14:07:16.848778	2021-12-02 14:07:16.848778	2	3
1993	3	6050	6	34	1	\N	0.5	7000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 14:07:16.854615	2021-12-02 14:07:16.854615	2	1
1994	3	6051	6	34	1	\N	1	10500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 14:07:16.860343	2021-12-02 14:07:16.860343	2	4
1995	3	6052	6	34	1	\N	1	14000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 14:07:16.866164	2021-12-02 14:07:16.866164	2	2
1996	3	6053	6	34	1	\N	1.5	17500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 14:07:16.87217	2021-12-02 14:07:16.87217	2	3
1997	3	6054	6	34	1	\N	2	21000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	6721.0	\N	\N	\N	\N	2021-12-02 14:07:16.877881	2021-12-02 14:07:16.877881	2	5
1998	3	6055	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.883629	2021-12-02 14:07:16.883629	2	3
1999	3	6056	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.88947	2021-12-02 14:07:16.88947	2	1
2000	3	6057	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.895169	2021-12-02 14:07:16.895169	2	4
2001	3	6058	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.901033	2021-12-02 14:07:16.901033	2	2
2002	3	6059	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.906623	2021-12-02 14:07:16.906623	2	3
2003	3	6060	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.912292	2021-12-02 14:07:16.912292	2	5
2004	3	6061	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.917959	2021-12-02 14:07:16.917959	2	3
2005	3	6062	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.92354	2021-12-02 14:07:16.92354	2	1
2006	3	6063	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.929385	2021-12-02 14:07:16.929385	2	4
2007	3	6064	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.935105	2021-12-02 14:07:16.935105	2	2
2008	3	6065	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.940708	2021-12-02 14:07:16.940708	2	3
2009	3	6066	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.946365	2021-12-02 14:07:16.946365	2	5
2010	3	6067	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.95202	2021-12-02 14:07:16.95202	2	3
2011	3	6068	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.95766	2021-12-02 14:07:16.95766	2	1
2012	3	6069	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.963488	2021-12-02 14:07:16.963488	2	4
2013	3	6070	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.969208	2021-12-02 14:07:16.969208	2	2
2014	3	6071	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.975196	2021-12-02 14:07:16.975196	2	3
2015	3	6072	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	\N	2021-12-02 14:07:16.981027	2021-12-02 14:07:16.981027	2	5
2016	3	7000	7	35	1	\N	7.9	66000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	7.9	\N	1	1	\N	3521.0	\N	\N	\N	\N	2021-12-02 14:07:16.986983	2021-12-02 14:07:16.986983	1	1
2017	3	7001	7	35	1	\N	15.6	132000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	14.9	\N	1	1	\N	3522.0	\N	\N	\N	\N	2021-12-02 14:07:16.992996	2021-12-02 14:07:16.992996	1	2
2018	3	7002	7	35	2	\N	1.5	2880	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	3550.0	\N	\N	\N	\N	2021-12-02 14:07:16.998849	2021-12-02 14:07:16.998849	2	4
2019	3	7003	7	35	2	\N	2	5760	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	3600	USD	1.4	\N	1	1	\N	3551.0	\N	\N	\N	\N	2021-12-02 14:07:17.004442	2021-12-02 14:07:17.004442	2	5
2020	3	7004	7	35	2	\N	2.2	7200	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	5040	USD	1.7	\N	1	1	\N	3552.0	\N	\N	\N	\N	2021-12-02 14:07:17.010087	2021-12-02 14:07:17.010087	2	6
2021	3	7005	7	35	2	\N	2.5	8640	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	6480	USD	2.1	\N	1	1	\N	3553.0	\N	\N	\N	\N	2021-12-02 14:07:17.015974	2021-12-02 14:07:17.015974	2	7
2022	3	7006	7	35	2	\N	2.8	10080	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	10080	USD	2.8	\N	1	1	\N	3554.0	\N	\N	\N	\N	2021-12-02 14:07:17.021878	2021-12-02 14:07:17.021878	2	8
2023	3	7007	7	35	2	\N	3	11520	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	13680	USD	3.5	\N	1	1	\N	3555.0	\N	\N	\N	\N	2021-12-02 14:07:17.027848	2021-12-02 14:07:17.027848	2	9
2024	3	7008	7	35	2	\N	3.2	13000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	17280	USD	4.9	\N	1	1	\N	3556.0	\N	\N	\N	\N	2021-12-02 14:07:17.033506	2021-12-02 14:07:17.033506	2	19
2025	3	7009	7	35	2	\N	3.5	14500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	6.3	\N	1	1	\N	3557.0	\N	\N	\N	\N	2021-12-02 14:07:17.039112	2021-12-02 14:07:17.039112	2	20
2026	3	7010	7	35	2	\N	4	16000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3558.0	\N	\N	\N	\N	2021-12-02 14:07:17.044809	2021-12-02 14:07:17.044809	2	45
2027	3	7011	7	35	2	\N	4.5	17500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	\N	2021-12-02 14:07:17.050677	2021-12-02 14:07:17.050677	2	23
2028	3	7012	7	35	2	\N	7	19000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	\N	2021-12-02 14:07:17.05654	2021-12-02 14:07:17.05654	2	25
2029	3	7013	7	35	3	\N	1	2400	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	1440	USD	0.9	\N	1	1	\N	3541.0	\N	\N	\N	\N	2021-12-02 14:07:17.06217	2021-12-02 14:07:17.06217	2	1
2030	3	7014	7	35	3	\N	1	2880	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	3542.0	\N	\N	\N	\N	2021-12-02 14:07:17.067732	2021-12-02 14:07:17.067732	2	4
2031	3	7015	7	35	3	\N	1.5	5760	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	3544.0	\N	\N	\N	\N	2021-12-02 14:07:17.073432	2021-12-02 14:07:17.073432	2	5
2032	3	7016	7	35	3	\N	1.8	7200	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	3545.0	\N	\N	\N	\N	2021-12-02 14:07:17.07922	2021-12-02 14:07:17.07922	2	6
2033	3	7017	7	35	3	\N	2	8640	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	3546.0	\N	\N	\N	\N	2021-12-02 14:07:17.084962	2021-12-02 14:07:17.084962	2	7
2034	3	7018	7	35	3	\N	2.2	10080	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	3547.0	\N	\N	\N	\N	2021-12-02 14:07:17.090771	2021-12-02 14:07:17.090771	2	8
2035	3	7019	7	35	3	\N	3	11520	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	11520	USD	2.2	\N	1	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 14:07:17.096462	2021-12-02 14:07:17.096462	2	9
2036	3	7020	7	35	4	\N	0.5	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 14:07:17.102027	2021-12-02 14:07:17.102027	2	10
2037	3	7021	7	35	4	\N	1	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 14:07:17.107605	2021-12-02 14:07:17.107605	2	1
2038	3	7022	7	35	5	\N	0.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 14:07:17.113199	2021-12-02 14:07:17.113199	2	4
2039	3	7023	7	35	5	\N	1	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 14:07:17.11869	2021-12-02 14:07:17.11869	2	5
2040	3	7024	7	35	5	\N	1.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 14:07:17.124166	2021-12-02 14:07:17.124166	2	6
2041	3	7025	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 14:07:17.129719	2021-12-02 14:07:17.129719	2	7
2042	3	7026	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	\N	2021-12-02 14:07:17.135428	2021-12-02 14:07:17.135428	2	8
2043	3	7027	7	36	1	\N	1	1800	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 14:07:17.141373	2021-12-02 14:07:17.141373	2	3
2044	3	7028	7	36	4	\N	0.5	0	USD	\N	2	4	2	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 14:07:17.147155	2021-12-02 14:07:17.147155	2	3
2045	3	7029	7	37	1	\N	4	17200	USD	\N	1	1	1	33	1	\N	2	\N	\N	0	USD	0	USD	4	\N	1	1	\N	4521.0	\N	\N	\N	\N	2021-12-02 14:07:17.152876	2021-12-02 14:07:17.152876	2	19
2046	3	7031	7	37	2	\N	1.3	2880	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4551.0	\N	\N	\N	\N	2021-12-02 14:07:17.158638	2021-12-02 14:07:17.158638	2	4
2047	3	7032	7	37	2	\N	1.8	5760	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	4553.0	\N	\N	\N	\N	2021-12-02 14:07:17.164337	2021-12-02 14:07:17.164337	2	5
2048	3	7033	7	37	2	\N	2	8640	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4554.0	\N	\N	\N	\N	2021-12-02 14:07:17.170183	2021-12-02 14:07:17.170183	2	6
2049	3	7034	7	37	2	\N	2.5	11520	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	4555.0	\N	\N	\N	\N	2021-12-02 14:07:17.175944	2021-12-02 14:07:17.175944	2	7
2050	3	7035	7	37	2	\N	3	14400	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.9	\N	1	1	\N	4556.0	\N	\N	\N	\N	2021-12-02 14:07:17.181824	2021-12-02 14:07:17.181824	2	8
2051	3	7036	7	37	3	\N	1	2880	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4543.0	\N	\N	\N	\N	2021-12-02 14:07:17.187857	2021-12-02 14:07:17.187857	2	1
2052	3	7037	7	37	3	\N	1.3	5760	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4544.0	\N	\N	\N	\N	2021-12-02 14:07:17.193851	2021-12-02 14:07:17.193851	2	4
2053	3	7038	7	37	3	\N	1.8	7200	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4545.0	\N	\N	\N	\N	2021-12-02 14:07:17.199962	2021-12-02 14:07:17.199962	2	5
2054	3	7039	7	37	3	\N	2	8640	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	11500	USD	1.7	\N	1	1	\N	4546.0	\N	\N	\N	\N	2021-12-02 14:07:17.205794	2021-12-02 14:07:17.205794	2	6
2055	3	7040	7	37	3	\N	2.5	10080	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4547.0	\N	\N	\N	\N	2021-12-02 14:07:17.211439	2021-12-02 14:07:17.211439	2	7
2056	3	7041	7	37	3	\N	3	11500	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4548.0	\N	\N	\N	\N	2021-12-02 14:07:17.217062	2021-12-02 14:07:17.217062	2	8
2057	3	7042	7	37	4	\N	1	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 14:07:17.222691	2021-12-02 14:07:17.222691	2	10
2058	3	7043	7	37	4	\N	1.2	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 14:07:17.228434	2021-12-02 14:07:17.228434	2	1
2059	3	7044	7	37	5	\N	1	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 14:07:17.234076	2021-12-02 14:07:17.234076	2	4
2060	3	7045	7	37	5	\N	1.2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 14:07:17.239676	2021-12-02 14:07:17.239676	2	5
2061	3	7046	7	37	5	\N	1.8	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 14:07:17.245415	2021-12-02 14:07:17.245415	2	6
2062	3	7047	7	37	5	\N	2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 14:07:17.251132	2021-12-02 14:07:17.251132	2	7
2063	3	7048	7	37	5	\N	2.5	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	\N	2021-12-02 14:07:17.256718	2021-12-02 14:07:17.256718	2	8
2064	3	7049	7	38	1	\N	1	1200	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 14:07:17.262456	2021-12-02 14:07:17.262456	2	3
2065	3	7050	7	38	4	\N	1	0	USD	\N	2	4	9	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	\N	2021-12-02 14:07:17.268133	2021-12-02 14:07:17.268133	2	3
2066	3	7051	7	39	1	\N	1.2	9587	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	1	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 14:07:17.273917	2021-12-02 14:07:17.273917	2	3
2067	3	7052	7	39	1	\N	2.4	19174	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	2	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 14:07:17.279608	2021-12-02 14:07:17.279608	2	1
2068	3	7053	7	39	1	\N	3.6	28760	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	3	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 14:07:17.285422	2021-12-02 14:07:17.285422	2	4
2069	3	7054	7	39	1	\N	4.8	38347	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	4	1	\N	7121.0	\N	\N	\N	\N	2021-12-02 14:07:17.291276	2021-12-02 14:07:17.291276	2	2
2070	3	7055	7	39	3	\N	1	2160	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	2160	USD	0.9	\N	1	1	\N	7141.0	\N	\N	\N	\N	2021-12-02 14:07:17.297176	2021-12-02 14:07:17.297176	2	1
2071	3	7056	7	39	3	\N	1.2	3240	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	3240	USD	1	\N	1	1	\N	7142.0	\N	\N	\N	\N	2021-12-02 14:07:17.303017	2021-12-02 14:07:17.303017	2	4
2072	3	7057	7	39	3	\N	1.8	6480	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	6480	USD	1.2	\N	1	1	\N	7144.0	\N	\N	\N	\N	2021-12-02 14:07:17.308766	2021-12-02 14:07:17.308766	2	5
2073	3	7058	7	39	3	\N	2	9720	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	9720	USD	1.3	\N	1	1	\N	7145.0	\N	\N	\N	\N	2021-12-02 14:07:17.314692	2021-12-02 14:07:17.314692	2	6
2074	3	7059	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 14:07:17.32049	2021-12-02 14:07:17.32049	2	3
2075	3	7060	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	2	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 14:07:17.326222	2021-12-02 14:07:17.326222	2	10
2076	3	7061	7	39	4	\N	0.6	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	3	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 14:07:17.33217	2021-12-02 14:07:17.33217	2	3
2077	3	7062	7	39	4	\N	0.8	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	4	1	\N	7182.0	\N	\N	\N	\N	2021-12-02 14:07:17.337708	2021-12-02 14:07:17.337708	2	1
2078	3	7063	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 14:07:17.34361	2021-12-02 14:07:17.34361	2	4
2079	3	7064	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 14:07:17.349398	2021-12-02 14:07:17.349398	2	5
2080	3	7065	7	39	5	\N	0.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 14:07:17.355154	2021-12-02 14:07:17.355154	2	6
2081	3	7066	7	39	5	\N	0.8	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 14:07:17.364973	2021-12-02 14:07:17.364973	2	7
2082	3	7067	7	40	1	\N	3.3	9600	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7521.0	\N	\N	\N	\N	2021-12-02 14:07:17.373605	2021-12-02 14:07:17.373605	2	3
2083	3	7068	7	40	1	\N	6.6	18000	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	2	1	\N	7521.0	\N	\N	\N	\N	2021-12-02 14:07:17.379524	2021-12-02 14:07:17.379524	2	1
2084	3	7069	7	40	3	\N	0.8	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	7541.0	\N	\N	\N	\N	2021-12-02 14:07:17.385195	2021-12-02 14:07:17.385195	2	3
2085	3	7070	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1	\N	1	1	\N	7542.0	\N	\N	\N	\N	2021-12-02 14:07:17.390924	2021-12-02 14:07:17.390924	2	1
2086	3	7071	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	7543.0	\N	\N	\N	\N	2021-12-02 14:07:17.396751	2021-12-02 14:07:17.396751	2	4
2087	3	7072	7	40	3	\N	1.2	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	7544.0	\N	\N	\N	\N	2021-12-02 14:07:17.402436	2021-12-02 14:07:17.402436	2	5
2088	3	7073	7	40	3	\N	1.4	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.4	\N	1	1	\N	7545.0	\N	\N	\N	\N	2021-12-02 14:07:17.408206	2021-12-02 14:07:17.408206	2	6
2089	3	7074	7	40	3	\N	1.6	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	7546.0	\N	\N	\N	\N	2021-12-02 14:07:17.414026	2021-12-02 14:07:17.414026	2	7
2090	3	7075	7	40	4	\N	0.5	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	7582.0	\N	\N	\N	\N	2021-12-02 14:07:17.419859	2021-12-02 14:07:17.419859	2	3
2091	3	7076	7	40	4	\N	0.8	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	7582.0	\N	\N	\N	\N	2021-12-02 14:07:17.425645	2021-12-02 14:07:17.425645	2	1
2092	3	7077	7	40	5	\N	0.5	0	USD	\N	29	4	9	35	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7581.0	\N	\N	\N	\N	2021-12-02 14:07:17.431517	2021-12-02 14:07:17.431517	2	3
2093	3	7078	7	41	1	\N	8.7	28200	USD	\N	30	1	1	36	1	\N	3	\N	\N	0	USD	0	USD	8.7	\N	1	1	\N	7321.0	\N	\N	\N	\N	2021-12-02 14:07:17.437212	2021-12-02 14:07:17.437212	2	3
2094	3	7079	7	41	2	\N	1	2800	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	2.7	\N	1	1	\N	7351.0	\N	\N	\N	\N	2021-12-02 14:07:17.442994	2021-12-02 14:07:17.442994	2	1
2095	3	7080	7	41	2	\N	1.1	3120	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7352.0	\N	\N	\N	\N	2021-12-02 14:07:17.448819	2021-12-02 14:07:17.448819	2	4
2096	3	7081	7	41	2	\N	1.3	6240	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.9	\N	1	1	\N	7353.0	\N	\N	\N	\N	2021-12-02 14:07:17.454464	2021-12-02 14:07:17.454464	2	5
2097	3	7082	7	41	2	\N	1.6	9360	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	7354.0	\N	\N	\N	\N	2021-12-02 14:07:17.460149	2021-12-02 14:07:17.460149	2	6
2098	3	7083	7	41	3	\N	1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	\N	2021-12-02 14:07:17.465832	2021-12-02 14:07:17.465832	2	1
2099	3	7084	7	41	3	\N	1.1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	\N	2021-12-02 14:07:17.471581	2021-12-02 14:07:17.471581	2	4
2100	3	7085	7	41	3	\N	1.3	9360	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	6240	USD	1.3	\N	1	1	\N	7357.0	\N	\N	\N	\N	2021-12-02 14:07:17.477398	2021-12-02 14:07:17.477398	2	5
2101	3	7086	7	41	3	\N	1.6	12480	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	9360	USD	1.6	\N	1	1	\N	7358.0	\N	\N	\N	\N	2021-12-02 14:07:17.482832	2021-12-02 14:07:17.482832	2	6
2102	3	7087	7	41	4	\N	1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 14:07:17.488558	2021-12-02 14:07:17.488558	2	1
2103	3	7088	7	41	4	\N	1.1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 14:07:17.49436	2021-12-02 14:07:17.49436	2	4
2104	3	7089	7	41	4	\N	1.3	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 14:07:17.500195	2021-12-02 14:07:17.500195	2	5
2105	3	7090	7	41	5	\N	1	0	USD	\N	30	5	9	36	5	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	\N	2021-12-02 14:07:17.505922	2021-12-02 14:07:17.505922	2	3
2106	3	7091	7	42	1	\N	1.5	3600	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 14:07:17.511611	2021-12-02 14:07:17.511611	2	3
2107	3	7092	7	42	1	\N	2.5	7200	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 14:07:17.517592	2021-12-02 14:07:17.517592	2	1
2108	3	7093	7	42	3	\N	0.5	1400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 14:07:17.523632	2021-12-02 14:07:17.523632	2	3
2109	3	7094	7	42	3	\N	1	2400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 14:07:17.529621	2021-12-02 14:07:17.529621	2	1
2110	3	7095	7	42	3	\N	1	3600	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	\N	2021-12-02 14:07:17.535308	2021-12-02 14:07:17.535308	2	4
2111	3	7096	7	42	4	\N	0.5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 14:07:17.541133	2021-12-02 14:07:17.541133	2	3
2112	3	7097	7	42	4	\N	5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 14:07:17.547106	2021-12-02 14:07:17.547106	2	1
2113	3	7098	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 14:07:17.552953	2021-12-02 14:07:17.552953	2	3
2114	3	7099	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 14:07:17.558625	2021-12-02 14:07:17.558625	2	1
2115	3	7100	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 14:07:17.564344	2021-12-02 14:07:17.564344	2	4
2116	3	7101	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	7482.0	\N	\N	\N	\N	2021-12-02 14:07:17.570145	2021-12-02 14:07:17.570145	2	2
2117	3	7102	7	39	5	\N	1	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 14:07:17.575804	2021-12-02 14:07:17.575804	2	8
2118	3	7103	7	39	5	\N	1.2	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 14:07:17.581639	2021-12-02 14:07:17.581639	2	18
2119	3	7104	7	39	5	\N	1.4	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 14:07:17.587342	2021-12-02 14:07:17.587342	2	34
2120	3	7105	7	39	5	\N	1.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	\N	2021-12-02 14:07:17.593095	2021-12-02 14:07:17.593095	2	19
2121	3	7106	7	43	1	\N	4	17200	USD	\N	1	1	1	38	1	\N	2	\N	\N	0	USD	21000	USD	3.8	\N	1	1	\N	2523.0	\N	\N	\N	\N	2021-12-02 14:07:17.599399	2021-12-02 14:07:17.599399	2	19
2122	3	7107	7	43	2	\N	1.3	2880	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	\N	2021-12-02 14:07:17.605293	2021-12-02 14:07:17.605293	2	4
2123	3	7108	7	43	2	\N	1.8	5760	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	\N	2021-12-02 14:07:17.611113	2021-12-02 14:07:17.611113	2	5
2124	3	7109	7	43	2	\N	2	8640	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	\N	2021-12-02 14:07:17.616655	2021-12-02 14:07:17.616655	2	6
2125	3	7110	7	43	2	\N	2.5	11520	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	\N	2021-12-02 14:07:17.622209	2021-12-02 14:07:17.622209	2	7
2126	3	7111	7	43	2	\N	3	14400	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	\N	2021-12-02 14:07:17.628046	2021-12-02 14:07:17.628046	2	8
2127	3	7112	7	43	3	\N	1	2880	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	2550.0	\N	\N	\N	\N	2021-12-02 14:07:17.633957	2021-12-02 14:07:17.633957	2	1
2128	3	7113	7	43	3	\N	1.3	5760	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	\N	2021-12-02 14:07:17.639731	2021-12-02 14:07:17.639731	2	4
2129	3	7114	7	43	3	\N	1.8	7200	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	\N	2021-12-02 14:07:17.645463	2021-12-02 14:07:17.645463	2	5
2130	3	7115	7	43	3	\N	2	8640	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	\N	2021-12-02 14:07:17.651262	2021-12-02 14:07:17.651262	2	6
2131	3	7116	7	43	3	\N	2.5	10080	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	\N	2021-12-02 14:07:17.657007	2021-12-02 14:07:17.657007	2	7
2132	3	7117	7	43	3	\N	3	11500	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	\N	2021-12-02 14:07:17.662793	2021-12-02 14:07:17.662793	2	8
2133	3	7118	7	43	4	\N	1	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 14:07:17.668651	2021-12-02 14:07:17.668651	2	10
2134	3	7119	7	43	4	\N	1.2	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 14:07:17.674336	2021-12-02 14:07:17.674336	2	1
2135	3	7120	7	43	5	\N	1	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 14:07:17.68027	2021-12-02 14:07:17.68027	2	4
2136	3	7121	7	43	5	\N	1.2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 14:07:17.686251	2021-12-02 14:07:17.686251	2	5
2137	3	7122	7	43	5	\N	1.8	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 14:07:17.691943	2021-12-02 14:07:17.691943	2	6
2138	3	7123	7	43	5	\N	2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 14:07:17.697792	2021-12-02 14:07:17.697792	2	7
2139	3	7124	7	43	5	\N	2.5	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	\N	2021-12-02 14:07:17.703528	2021-12-02 14:07:17.703528	2	8
2140	3	8000	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	\N	2021-12-02 14:07:17.709397	2021-12-02 14:07:17.709397	1	1
2141	3	8001	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	\N	2021-12-02 14:07:17.715304	2021-12-02 14:07:17.715304	1	2
2142	3	8002	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 14:07:17.721033	2021-12-02 14:07:17.721033	1	1
2143	3	8003	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 14:07:17.72686	2021-12-02 14:07:17.72686	1	2
2144	3	8004	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 14:07:17.732542	2021-12-02 14:07:17.732542	1	1
2145	3	8005	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	\N	2021-12-02 14:07:17.738257	2021-12-02 14:07:17.738257	1	2
2146	3	8006	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	\N	2021-12-02 14:07:17.744164	2021-12-02 14:07:17.744164	1	1
2147	3	8007	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.749841	2021-12-02 14:07:17.749841	1	2
2148	3	8008	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	\N	2021-12-02 14:07:17.75572	2021-12-02 14:07:17.75572	1	1
2149	3	8009	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.761516	2021-12-02 14:07:17.761516	1	2
2150	3	8010	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.767316	2021-12-02 14:07:17.767316	1	1
2151	3	8011	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.772978	2021-12-02 14:07:17.772978	1	2
2152	3	8012	8	44	22	\N	0.5	0	USD	\N	33	17	16	45	20	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.778725	2021-12-02 14:07:17.778725	1	1
2153	3	8013	8	44	23	\N	0.5	0	USD	\N	4	18	17	46	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.78444	2021-12-02 14:07:17.78444	1	2
2154	3	8014	8	44	23	\N	0.5	0	USD	\N	4	18	17	47	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.790128	2021-12-02 14:07:17.790128	1	16
2155	3	8015	8	44	23	\N	0.5	0	USD	\N	4	18	17	48	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.795802	2021-12-02 14:07:17.795802	1	7
2156	3	8016	8	44	23	\N	0.5	0	USD	\N	4	18	17	49	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.801732	2021-12-02 14:07:17.801732	1	46
2157	3	8017	8	44	23	\N	0.5	0	USD	\N	4	18	17	50	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.807215	2021-12-02 14:07:17.807215	1	1
2158	3	8018	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.812862	2021-12-02 14:07:17.812862	2	3
2159	3	8019	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.818489	2021-12-02 14:07:17.818489	2	1
2160	3	8020	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.824368	2021-12-02 14:07:17.824368	2	4
2161	3	8021	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.830008	2021-12-02 14:07:17.830008	2	2
2162	3	8022	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.835911	2021-12-02 14:07:17.835911	2	3
2163	3	8023	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.841562	2021-12-02 14:07:17.841562	2	5
2164	3	8024	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.847324	2021-12-02 14:07:17.847324	2	26
2165	3	8025	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.853049	2021-12-02 14:07:17.853049	2	16
2166	3	8026	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.85894	2021-12-02 14:07:17.85894	2	6
2167	3	8027	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.864618	2021-12-02 14:07:17.864618	2	10
2168	3	8028	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.870375	2021-12-02 14:07:17.870375	2	12
2169	3	8029	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	\N	2021-12-02 14:07:17.876203	2021-12-02 14:07:17.876203	2	7
2170	3	8030	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 14:07:17.882039	2021-12-02 14:07:17.882039	11	6
2171	3	8031	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 14:07:17.887972	2021-12-02 14:07:17.887972	16	9
2172	3	8032	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 14:07:17.893645	2021-12-02 14:07:17.893645	17	20
2173	3	8033	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	\N	2021-12-02 14:07:17.899328	2021-12-02 14:07:17.899328	18	49
2174	3	8034	9	45	1	\N	0.5	500	USD	\N	34	1	6	52	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	951.0	\N	\N	\N	\N	2021-12-02 14:07:17.905196	2021-12-02 14:07:17.905196	2	3
2175	3	8035	9	46	1	\N	0.5	500	USD	\N	34	1	6	53	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	952.0	\N	\N	\N	\N	2021-12-02 14:07:17.910961	2021-12-02 14:07:17.910961	2	3
2176	3	8036	9	47	1	\N	1	0	USD	\N	35	1	6	54	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.916688	2021-12-02 14:07:17.916688	2	3
2177	3	8037	9	48	1	\N	1	0	USD	\N	36	1	6	55	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.922403	2021-12-02 14:07:17.922403	2	3
2178	3	8038	9	49	1	\N	2	500	USD	\N	37	1	6	56	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.9283	2021-12-02 14:07:17.9283	2	3
2179	3	8039	9	50	1	\N	0.5	0	USD	\N	38	1	6	57	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.933939	2021-12-02 14:07:17.933939	2	3
2180	3	8040	9	51	1	\N	0.5	0	USD	\N	34	1	6	58	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.939662	2021-12-02 14:07:17.939662	2	3
2181	3	8041	9	52	1	\N	0.5	0	USD	\N	39	1	6	59	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.94547	2021-12-02 14:07:17.94547	2	3
2182	3	8042	9	53	1	\N	0.5	0	USD	\N	40	1	6	60	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.951144	2021-12-02 14:07:17.951144	2	3
2183	3	8043	9	54	1	\N	0.5	0	USD	\N	41	1	6	61	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.956654	2021-12-02 14:07:17.956654	2	3
2184	3	8044	9	55	1	\N	0.5	0	USD	\N	42	1	6	62	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.962207	2021-12-02 14:07:17.962207	2	3
2185	3	8045	9	56	1	\N	0.5	0	USD	\N	32	1	6	63	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.967912	2021-12-02 14:07:17.967912	2	3
2186	3	8046	9	57	1	\N	0.5	0	USD	\N	43	1	6	64	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.973759	2021-12-02 14:07:17.973759	2	3
2187	3	8047	9	58	1	\N	2	500	USD	\N	43	1	6	65	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.979715	2021-12-02 14:07:17.979715	2	3
2188	3	8048	9	59	1	\N	0.5	0	USD	\N	44	1	6	66	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	\N	2021-12-02 14:07:17.985594	2021-12-02 14:07:17.985594	2	3
2189	3	8049	9	60	8	\N	0.5	300	USD	\N	45	8	7	67	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 14:07:17.991228	2021-12-02 14:07:17.991228	2	3
2190	3	8050	9	61	8	\N	0.5	0	USD	\N	46	8	7	68	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 14:07:17.996981	2021-12-02 14:07:17.996981	2	3
2191	3	8051	9	62	8	\N	0.5	0	USD	\N	37	8	7	69	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	\N	2021-12-02 14:07:18.002959	2021-12-02 14:07:18.002959	2	3
2192	3	8052	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.008655	2021-12-02 14:07:18.008655	2	3
2193	3	8053	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.014331	2021-12-02 14:07:18.014331	2	1
2194	3	8054	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.020002	2021-12-02 14:07:18.020002	2	4
2195	3	8055	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.025651	2021-12-02 14:07:18.025651	2	2
2196	3	8056	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.031335	2021-12-02 14:07:18.031335	2	3
2197	3	8057	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.037077	2021-12-02 14:07:18.037077	2	5
2198	3	8058	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.04311	2021-12-02 14:07:18.04311	2	26
2199	3	8059	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.049134	2021-12-02 14:07:18.049134	2	16
2200	3	8060	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.055	2021-12-02 14:07:18.055	2	6
2201	3	8061	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.061039	2021-12-02 14:07:18.061039	2	10
2202	3	8062	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.115548	2021-12-02 14:07:18.115548	2	3
2203	3	8063	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.122745	2021-12-02 14:07:18.122745	2	1
2204	3	8064	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.129153	2021-12-02 14:07:18.129153	2	4
2205	3	8065	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.134894	2021-12-02 14:07:18.134894	2	2
2206	3	8066	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.140829	2021-12-02 14:07:18.140829	2	3
2207	3	8067	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.146584	2021-12-02 14:07:18.146584	2	5
2208	3	8068	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.15223	2021-12-02 14:07:18.15223	2	26
2209	3	8069	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.157828	2021-12-02 14:07:18.157828	2	16
2210	3	8070	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.163671	2021-12-02 14:07:18.163671	2	6
2211	3	8071	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.169358	2021-12-02 14:07:18.169358	2	10
2212	3	8072	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.17527	2021-12-02 14:07:18.17527	2	3
2213	3	8073	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.181276	2021-12-02 14:07:18.181276	2	1
2214	3	8074	10	63	27	\N	0.5	1200	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.186982	2021-12-02 14:07:18.186982	2	4
2215	3	8075	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.19296	2021-12-02 14:07:18.19296	2	2
2216	3	8076	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.198848	2021-12-02 14:07:18.198848	2	3
2217	3	8077	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.2049	2021-12-02 14:07:18.2049	2	5
2218	3	8078	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.210671	2021-12-02 14:07:18.210671	2	26
2219	3	8079	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.216438	2021-12-02 14:07:18.216438	2	16
2220	3	8080	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.222226	2021-12-02 14:07:18.222226	2	6
2221	3	8081	10	63	27	\N	2	1500	USD	\N	4	19	1	6	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	\N	2021-12-02 14:07:18.228052	2021-12-02 14:07:18.228052	2	10
2222	3	8090	9	64	28	\N	16	67500	USD	\N	4	6	1	6	24	\N	3	\N	\N	0	USD	67500	USD	16	\N	1	1	\N	9999.0	\N	\N	\N	\N	2021-12-02 14:07:18.234002	2021-12-02 14:07:18.234002	2	3
2223	3	8091	9	64	29	\N	3	157500	USD	\N	4	1	1	6	1	\N	3	\N	\N	0	USD	157500	USD	3	\N	1	1	\N	9999.0	\N	\N	\N	\N	2021-12-02 14:07:18.239805	2021-12-02 14:07:18.239805	2	3
2224	3	8100	11	65	30	\N	1	0	USD	\N	4	5	1	6	25	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	\N	2021-12-02 14:07:18.245801	2021-12-02 14:07:18.245801	2	3
2225	3	8101	11	65	31	\N	0.5	0	USD	\N	4	5	1	6	19	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	\N	2021-12-02 14:07:18.25164	2021-12-02 14:07:18.25164	2	3
2226	3	9001	12	66	1	\N	1.2	10000	USD	\N	47	1	21	72	26	\N	3	\N	\N	0	USD	800	USD	0.3	\N	1	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 14:07:18.257561	2021-12-02 14:07:18.257561	2	3
2227	3	9002	12	66	3	\N	1.2	800	USD	\N	47	3	21	72	27	\N	3	\N	\N	0	USD	800	USD	0.3	\N	2	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 14:07:18.263678	2021-12-02 14:07:18.263678	2	3
2228	3	9003	12	66	32	\N	1.2	800	USD	\N	47	6	9	72	28	\N	3	\N	\N	0	USD	800	USD	0.3	\N	3	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 14:07:18.273685	2021-12-02 14:07:18.273685	2	3
2229	3	9004	12	66	7	\N	1.2	800	USD	\N	47	8	9	72	29	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 14:07:18.281963	2021-12-02 14:07:18.281963	2	3
2230	3	9005	12	66	33	\N	1.2	800	USD	\N	47	10	9	72	30	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 14:07:18.287783	2021-12-02 14:07:18.287783	2	3
2231	3	9006	12	66	34	\N	1.2	800	USD	\N	47	11	9	72	31	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 14:07:18.293567	2021-12-02 14:07:18.293567	2	3
2232	3	9007	12	66	5	\N	1.2	800	USD	\N	47	5	9	72	32	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 14:07:18.299486	2021-12-02 14:07:18.299486	2	3
2233	3	9008	12	66	35	\N	1.2	800	USD	\N	47	20	5	72	33	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	\N	2021-12-02 14:07:18.305139	2021-12-02 14:07:18.305139	2	3
2234	3	9009	12	67	1	\N	1.2	10000	USD	\N	48	1	9	73	26	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 14:07:18.31091	2021-12-02 14:07:18.31091	2	3
2235	3	9010	12	67	2	\N	1.2	3000	USD	\N	48	2	9	73	34	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 14:07:18.316646	2021-12-02 14:07:18.316646	2	3
2236	3	9011	12	67	3	\N	1.2	3000	USD	\N	48	3	9	73	27	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 14:07:18.32248	2021-12-02 14:07:18.32248	2	3
2237	3	9012	12	67	7	\N	1.2	800	USD	\N	48	8	7	73	29	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 14:07:18.328169	2021-12-02 14:07:18.328169	2	3
2238	3	9013	12	67	5	\N	1.2	0	USD	\N	48	5	2	73	32	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 14:07:18.334121	2021-12-02 14:07:18.334121	2	3
2239	3	9014	12	67	36	\N	1.2	200	USD	\N	48	7	9	73	35	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	\N	2021-12-02 14:07:18.339949	2021-12-02 14:07:18.339949	2	3
2240	3	9015	12	68	1	\N	1.2	8000	USD	\N	49	1	9	74	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.345779	2021-12-02 14:07:18.345779	2	3
2241	3	9016	12	68	2	\N	1.2	1000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.351637	2021-12-02 14:07:18.351637	2	4
2242	3	9017	12	68	2	\N	1.2	2000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.35747	2021-12-02 14:07:18.35747	2	5
2243	3	9018	12	68	2	\N	1.2	3000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.36335	2021-12-02 14:07:18.36335	2	6
2244	3	9019	12	68	2	\N	1.2	4000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.369279	2021-12-02 14:07:18.369279	2	7
2245	3	9020	12	68	7	\N	1.2	800	USD	\N	49	8	9	74	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:18.375078	2021-12-02 14:07:18.375078	2	3
2246	3	9021	12	69	2	\N	1.2	800	USD	\N	21	2	9	75	34	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:18.381125	2021-12-02 14:07:18.381125	2	3
2247	3	9022	12	70	1	\N	1.2	8000	USD	\N	50	1	9	76	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.386949	2021-12-02 14:07:18.386949	2	3
2248	3	9023	12	70	2	\N	1.2	1000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.392841	2021-12-02 14:07:18.392841	2	4
2249	3	9024	12	70	2	\N	1.2	2000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.398675	2021-12-02 14:07:18.398675	2	5
2250	3	9025	12	70	2	\N	1.2	3000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.404821	2021-12-02 14:07:18.404821	2	6
2251	3	9026	12	70	2	\N	1.2	4000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	\N	2021-12-02 14:07:18.410835	2021-12-02 14:07:18.410835	2	7
2252	3	9027	12	70	7	\N	1.2	800	USD	\N	50	8	9	76	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	\N	2021-12-02 14:07:18.416696	2021-12-02 14:07:18.416696	2	3
2253	3	9028	12	71	1	\N	1	6500	USD	\N	51	1	9	77	26	\N	3	\N	\N	0	USD	5000	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	\N	2021-12-02 14:07:18.422778	2021-12-02 14:07:18.422778	2	3
2254	3	9029	12	71	33	\N	1	300	USD	\N	51	10	1	77	30	\N	3	\N	\N	0	USD	0	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	\N	2021-12-02 14:07:18.428564	2021-12-02 14:07:18.428564	2	3
2255	3	9030	12	71	5	\N	0.5	300	USD	\N	51	5	2	77	32	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	2	\N	5281.0	\N	\N	\N	\N	2021-12-02 14:07:18.434472	2021-12-02 14:07:18.434472	2	3
2256	3	9031	12	72	1	\N	1	6500	USD	\N	19	1	9	78	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	\N	2021-12-02 14:07:18.440412	2021-12-02 14:07:18.440412	2	3
2257	3	9032	12	72	5	\N	0.5	300	USD	\N	19	5	9	78	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	\N	2021-12-02 14:07:18.446153	2021-12-02 14:07:18.446153	2	3
2258	3	9033	12	73	32	\N	1.4	1920	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.451972	2021-12-02 14:07:18.451972	17	4
2259	3	9034	12	73	32	\N	1.5	2160	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	\N	2021-12-02 14:07:18.457717	2021-12-02 14:07:18.457717	5	2
2260	3	9035	12	73	32	\N	1.6	2400	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	\N	2021-12-02 14:07:18.46338	2021-12-02 14:07:18.46338	6	8
2261	3	9036	12	73	32	\N	1.8	2880	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	\N	2021-12-02 14:07:18.469004	2021-12-02 14:07:18.469004	8	5
2262	3	9037	12	73	7	\N	1.2	800	USD	\N	52	8	9	79	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.474767	2021-12-02 14:07:18.474767	2	3
2263	3	9038	12	73	37	\N	1.5	2800	USD	\N	52	21	9	79	36	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.480473	2021-12-02 14:07:18.480473	2	3
2264	3	9039	12	73	5	\N	1	0	USD	\N	52	5	2	79	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.48633	2021-12-02 14:07:18.48633	2	3
2265	3	9040	12	74	38	\N	0.5	1000	USD	\N	53	22	1	80	37	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.492325	2021-12-02 14:07:18.492325	2	3
2266	3	9041	12	75	39	\N	1.5	1200	USD	\N	54	23	19	81	38	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.498249	2021-12-02 14:07:18.498249	2	3
2267	3	9042	12	75	32	\N	1.4	1920	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.504034	2021-12-02 14:07:18.504034	17	4
2268	3	9043	12	75	32	\N	1.5	2160	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	\N	2021-12-02 14:07:18.509887	2021-12-02 14:07:18.509887	5	2
2269	3	9044	12	75	32	\N	1.6	2400	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	\N	2021-12-02 14:07:18.516014	2021-12-02 14:07:18.516014	6	8
2270	3	9045	12	75	32	\N	1.8	2880	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	\N	2021-12-02 14:07:18.521764	2021-12-02 14:07:18.521764	8	5
2271	3	9046	12	75	7	\N	1.2	800	USD	\N	54	8	22	81	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.527508	2021-12-02 14:07:18.527508	2	3
2272	3	9047	12	75	40	\N	1.2	800	USD	\N	54	18	19	81	39	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.533192	2021-12-02 14:07:18.533192	2	3
2273	3	9048	12	75	5	\N	1	0	USD	\N	54	5	2	81	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.539012	2021-12-02 14:07:18.539012	2	3
2274	3	9049	12	75	36	\N	1	600	USD	\N	54	7	3	81	35	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	\N	2021-12-02 14:07:18.544838	2021-12-02 14:07:18.544838	2	3
2275	3	9050	12	76	32	\N	1	600	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	1900	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 14:07:18.550668	2021-12-02 14:07:18.550668	6	3
2276	3	9051	12	76	32	\N	1.4	1920	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	2400	USD	0.9	\N	1	2	\N	6502.0	\N	\N	\N	\N	2021-12-02 14:07:18.556511	2021-12-02 14:07:18.556511	17	4
2277	3	9052	12	76	32	\N	1.5	2160	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	3500	USD	1.3	\N	1	2	\N	6511.0	\N	\N	\N	\N	2021-12-02 14:07:18.562277	2021-12-02 14:07:18.562277	5	2
2278	3	9053	12	76	32	\N	1.6	2400	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	5500	USD	1.7	\N	1	2	\N	6512.0	\N	\N	\N	\N	2021-12-02 14:07:18.567948	2021-12-02 14:07:18.567948	6	8
2279	3	9054	12	76	32	\N	1.8	2880	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	7500	USD	2.1	\N	1	2	\N	6513.0	\N	\N	\N	\N	2021-12-02 14:07:18.57381	2021-12-02 14:07:18.57381	8	5
2280	3	9055	12	76	40	\N	1.2	800	USD	\N	4	18	19	82	39	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 14:07:18.579446	2021-12-02 14:07:18.579446	2	3
2281	3	9056	12	76	5	\N	1	0	USD	\N	4	5	2	82	32	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 14:07:18.585251	2021-12-02 14:07:18.585251	2	3
2282	3	9057	12	76	36	\N	1	600	USD	\N	4	7	3	82	35	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	\N	2021-12-02 14:07:18.591146	2021-12-02 14:07:18.591146	2	3
2283	3	9058	12	77	1	\N	3	21000	USD	\N	55	1	9	83	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 14:07:18.596878	2021-12-02 14:07:18.596878	23	51
2284	3	9059	12	77	2	\N	1	3000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 14:07:18.602745	2021-12-02 14:07:18.602745	23	4
2285	3	9060	12	77	2	\N	2	6000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.608559	2021-12-02 14:07:18.608559	23	5
2286	3	9061	12	77	2	\N	3	9000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.614163	2021-12-02 14:07:18.614163	23	6
2287	3	9062	12	77	2	\N	3.5	12000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.619705	2021-12-02 14:07:18.619705	23	7
2288	3	9063	12	77	5	\N	1	0	USD	\N	55	5	2	83	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.625462	2021-12-02 14:07:18.625462	2	3
2289	3	9064	12	77	41	\N	1	600	USD	\N	55	4	3	83	40	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.63144	2021-12-02 14:07:18.63144	2	3
2290	3	9065	12	77	36	\N	0.5	300	USD	\N	55	7	3	83	35	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.636963	2021-12-02 14:07:18.636963	2	3
2291	3	9066	12	78	1	\N	3	21000	USD	\N	56	1	3	84	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 14:07:18.642882	2021-12-02 14:07:18.642882	23	51
2292	3	9067	12	78	2	\N	1	3000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 14:07:18.648735	2021-12-02 14:07:18.648735	23	4
2293	3	9068	12	78	2	\N	2	6000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.654391	2021-12-02 14:07:18.654391	23	5
2294	3	9069	12	78	2	\N	3	9000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.660351	2021-12-02 14:07:18.660351	23	6
2295	3	9070	12	78	2	\N	3.5	12000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.666286	2021-12-02 14:07:18.666286	23	7
2296	3	9071	12	78	7	\N	1.2	800	USD	\N	56	8	5	84	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.672006	2021-12-02 14:07:18.672006	2	3
2297	3	9072	12	78	5	\N	1	0	USD	\N	56	5	5	84	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.677967	2021-12-02 14:07:18.677967	2	3
2298	3	9073	12	78	35	\N	1	600	USD	\N	56	20	9	84	33	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.68363	2021-12-02 14:07:18.68363	2	3
2299	3	9074	12	79	1	\N	3	21000	USD	\N	57	1	9	85	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	\N	2021-12-02 14:07:18.689418	2021-12-02 14:07:18.689418	23	51
2300	3	9075	12	79	2	\N	1	3000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	\N	2021-12-02 14:07:18.69505	2021-12-02 14:07:18.69505	23	4
2301	3	9076	12	79	2	\N	2	6000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.700976	2021-12-02 14:07:18.700976	23	5
2302	3	9077	12	79	2	\N	3	9000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.706574	2021-12-02 14:07:18.706574	23	6
2303	3	9078	12	79	2	\N	3.5	12000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	\N	2021-12-02 14:07:18.713601	2021-12-02 14:07:18.713601	23	7
2304	3	9079	12	79	7	\N	1.2	800	USD	\N	57	8	9	85	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.721508	2021-12-02 14:07:18.721508	2	3
2305	3	9080	12	79	5	\N	1	0	USD	\N	57	5	2	85	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.729512	2021-12-02 14:07:18.729512	2	3
2306	3	9081	12	79	42	\N	1	600	USD	\N	57	4	9	85	41	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.736463	2021-12-02 14:07:18.736463	2	3
2307	3	9082	12	79	36	\N	0.5	300	USD	\N	57	7	9	85	35	\N	3	\N	\N	0	USD	500	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	\N	2021-12-02 14:07:18.743861	2021-12-02 14:07:18.743861	2	3
2308	3	9083	12	80	1	\N	1	5000	USD	\N	58	1	9	86	26	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 14:07:18.751454	2021-12-02 14:07:18.751454	2	3
2309	3	9084	12	80	7	\N	0.5	500	USD	\N	58	8	9	86	29	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 14:07:18.759129	2021-12-02 14:07:18.759129	2	3
2310	3	9085	12	80	5	\N	0.5	0	USD	\N	58	5	9	86	32	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	\N	2021-12-02 14:07:18.766549	2021-12-02 14:07:18.766549	2	3
2311	3	9086	12	81	1	\N	1	5000	USD	\N	59	1	9	87	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 14:07:18.774001	2021-12-02 14:07:18.774001	2	3
2312	3	9087	12	81	33	\N	0.5	500	USD	\N	59	10	1	87	30	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 14:07:18.78176	2021-12-02 14:07:18.78176	2	3
2313	3	9088	12	81	5	\N	0.5	0	USD	\N	59	5	2	87	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	\N	2021-12-02 14:07:18.788526	2021-12-02 14:07:18.788526	2	3
2314	4	1001	1	1	1	\N	7.8	57000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	7.8	\N	1	\N	\N	3421	\N	\N	\N	\N	2021-12-02 14:21:07.978981	2021-12-02 14:21:07.978981	\N	\N
2315	4	1002	1	1	1	\N	15.6	114000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	15.6	\N	1	\N	\N	3422	\N	\N	\N	\N	2021-12-02 14:21:08.009768	2021-12-02 14:21:08.009768	\N	\N
2316	4	1003	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	3600	USD	1.1	\N	1	\N	\N	3451	\N	\N	\N	\N	2021-12-02 14:21:08.038885	2021-12-02 14:21:08.038885	\N	\N
2317	4	1004	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	5040	USD	1.4	\N	1	\N	\N	3452	\N	\N	\N	\N	2021-12-02 14:21:08.067776	2021-12-02 14:21:08.067776	\N	\N
2318	4	1005	1	1	2	\N	1.5	3398	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	6480	USD	1.6	\N	1	\N	\N	3453	\N	\N	\N	\N	2021-12-02 14:21:08.097158	2021-12-02 14:21:08.097158	\N	\N
2319	4	1006	1	1	2	\N	2	4248	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	\N	\N	3454	\N	\N	\N	\N	2021-12-02 14:21:08.126367	2021-12-02 14:21:08.126367	\N	\N
2320	4	1007	1	1	2	\N	2.5	5947	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	13680	USD	2.7	\N	1	\N	\N	3455	\N	\N	\N	\N	2021-12-02 14:21:08.154804	2021-12-02 14:21:08.154804	\N	\N
2321	4	1008	1	1	2	\N	2.8	7646	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	17280	USD	3.8	\N	1	\N	\N	3456	\N	\N	\N	\N	2021-12-02 14:21:08.183146	2021-12-02 14:21:08.183146	\N	\N
2322	4	1009	1	1	2	\N	3	10526	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	0	USD	4.9	\N	1	\N	\N	3457	\N	\N	\N	\N	2021-12-02 14:21:08.212061	2021-12-02 14:21:08.212061	\N	\N
2323	4	1010	1	1	3	\N	0.9	1699	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	1440	USD	0.7	\N	1	\N	\N	3441	\N	\N	\N	\N	2021-12-02 14:21:08.239649	2021-12-02 14:21:08.239649	\N	\N
2324	4	1011	1	1	3	\N	0.9	2195	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2160	USD	0.8	\N	1	\N	\N	3442	\N	\N	\N	\N	2021-12-02 14:21:08.268204	2021-12-02 14:21:08.268204	\N	\N
2325	4	1012	1	1	3	\N	1	2549	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2880	USD	0.9	\N	1	\N	\N	3443	\N	\N	\N	\N	2021-12-02 14:21:08.296069	2021-12-02 14:21:08.296069	\N	\N
2326	4	1013	1	1	3	\N	1.5	4248	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	3600	USD	1	\N	1	\N	\N	3444	\N	\N	\N	\N	2021-12-02 14:21:08.325336	2021-12-02 14:21:08.325336	\N	\N
2327	4	1014	1	1	3	\N	1.8	5098	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	\N	\N	3445	\N	\N	\N	\N	2021-12-02 14:21:08.359757	2021-12-02 14:21:08.359757	\N	\N
2328	4	1015	1	1	3	\N	2	5947	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5040	USD	1.3	\N	1	\N	\N	3446	\N	\N	\N	\N	2021-12-02 14:21:08.388711	2021-12-02 14:21:08.388711	\N	\N
2329	4	1016	1	1	3	\N	2.2	6797	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	\N	\N	3447	\N	\N	\N	\N	2021-12-02 14:21:08.41714	2021-12-02 14:21:08.41714	\N	\N
2330	4	1017	1	1	3	\N	2.8	8118	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	6480	USD	1.7	\N	1	\N	\N	3448	\N	\N	\N	\N	2021-12-02 14:21:08.445601	2021-12-02 14:21:08.445601	\N	\N
2331	4	1018	1	1	4	\N	0.5	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	3431	\N	\N	\N	\N	2021-12-02 14:21:08.474706	2021-12-02 14:21:08.474706	\N	\N
2332	4	1019	1	1	4	\N	1	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	3481	\N	\N	\N	\N	2021-12-02 14:21:08.503167	2021-12-02 14:21:08.503167	\N	\N
2333	4	1020	1	1	5	\N	0.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	\N	\N	3481	\N	\N	\N	\N	2021-12-02 14:21:08.569277	2021-12-02 14:21:08.569277	\N	\N
2334	4	1021	1	1	5	\N	0.9	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	3481	\N	\N	\N	\N	2021-12-02 14:21:08.597965	2021-12-02 14:21:08.597965	\N	\N
2335	4	1022	1	1	5	\N	1.5	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3481	\N	\N	\N	\N	2021-12-02 14:21:08.626032	2021-12-02 14:21:08.626032	\N	\N
2336	4	1023	1	1	5	\N	1.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3481	\N	\N	\N	\N	2021-12-02 14:21:08.654813	2021-12-02 14:21:08.654813	\N	\N
2337	4	1024	1	1	5	\N	2	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3481	\N	\N	\N	\N	2021-12-02 14:21:08.683342	2021-12-02 14:21:08.683342	\N	\N
2338	4	1025	1	2	1	\N	6	28500	USD	\N	1	1	1	2	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	\N	\N	2421	\N	\N	\N	\N	2021-12-02 14:21:08.711823	2021-12-02 14:21:08.711823	\N	\N
2339	4	1026	1	3	1	\N	6	28500	USD	\N	1	1	1	3	1	\N	3	\N	\N	0	USD	33000	USD	3.1	\N	1	\N	\N	4457	\N	\N	\N	\N	2021-12-02 14:21:08.739053	2021-12-02 14:21:08.739053	\N	\N
2340	4	1027	1	2	2	\N	1.3	2879	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	\N	\N	2451	\N	\N	\N	\N	2021-12-02 14:21:08.767608	2021-12-02 14:21:08.767608	\N	\N
2341	4	1028	1	2	2	\N	1.5	3398	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.3	\N	1	\N	\N	2452	\N	\N	\N	\N	2021-12-02 14:21:08.796045	2021-12-02 14:21:08.796045	\N	\N
2342	4	1029	1	2	2	\N	2	6797	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	\N	\N	2453	\N	\N	\N	\N	2021-12-02 14:21:08.823599	2021-12-02 14:21:08.823599	\N	\N
2343	4	1030	1	2	2	\N	2.2	10195	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.8	\N	1	\N	\N	2454	\N	\N	\N	\N	2021-12-02 14:21:08.850885	2021-12-02 14:21:08.850885	\N	\N
2344	4	1031	1	2	2	\N	2.5	13594	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	\N	\N	2455	\N	\N	\N	\N	2021-12-02 14:21:08.878508	2021-12-02 14:21:08.878508	\N	\N
2345	4	1032	1	2	2	\N	3	16992	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	\N	\N	2456	\N	\N	\N	\N	2021-12-02 14:21:08.912123	2021-12-02 14:21:08.912123	\N	\N
2346	4	1033	1	2	2	\N	4.5	20390	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	\N	\N	2457	\N	\N	\N	\N	2021-12-02 14:21:08.940108	2021-12-02 14:21:08.940108	\N	\N
2347	4	1034	1	2	3	\N	1.3	2879	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	\N	\N	2442	\N	\N	\N	\N	2021-12-02 14:21:08.968444	2021-12-02 14:21:08.968444	\N	\N
2348	4	1035	1	2	3	\N	1.5	3398	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	\N	\N	2443	\N	\N	\N	\N	2021-12-02 14:21:08.996914	2021-12-02 14:21:08.996914	\N	\N
2349	4	1036	1	2	3	\N	2	6797	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	\N	\N	2444	\N	\N	\N	\N	2021-12-02 14:21:09.024932	2021-12-02 14:21:09.024932	\N	\N
2350	4	1037	1	2	3	\N	2.2	10195	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	\N	\N	2445	\N	\N	\N	\N	2021-12-02 14:21:09.052268	2021-12-02 14:21:09.052268	\N	\N
2351	4	1038	1	2	3	\N	2.5	13594	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	\N	\N	2446	\N	\N	\N	\N	2021-12-02 14:21:09.079173	2021-12-02 14:21:09.079173	\N	\N
2352	4	1039	1	2	3	\N	3	16992	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	\N	\N	2447	\N	\N	\N	\N	2021-12-02 14:21:09.105093	2021-12-02 14:21:09.105093	\N	\N
2353	4	1040	1	2	3	\N	4.5	20390	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	\N	\N	2448	\N	\N	\N	\N	2021-12-02 14:21:09.131126	2021-12-02 14:21:09.131126	\N	\N
2354	4	1041	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.157234	2021-12-02 14:21:09.157234	\N	\N
2355	4	1042	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.183448	2021-12-02 14:21:09.183448	\N	\N
2356	4	1043	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.211351	2021-12-02 14:21:09.211351	\N	\N
2357	4	1044	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.239259	2021-12-02 14:21:09.239259	\N	\N
2358	4	1045	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.267325	2021-12-02 14:21:09.267325	\N	\N
2359	4	1046	1	2	5	\N	0.6	300	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.295433	2021-12-02 14:21:09.295433	\N	\N
2360	4	1047	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.323411	2021-12-02 14:21:09.323411	\N	\N
2361	4	1048	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.351498	2021-12-02 14:21:09.351498	\N	\N
2362	4	1049	2	4	1	\N	1.1	1910	USD	\N	2	1	4	4	1	\N	3	\N	\N	0	USD	5000	USD	0.4	\N	1	\N	\N	7920	\N	\N	\N	\N	2021-12-02 14:21:09.38165	2021-12-02 14:21:09.38165	\N	\N
2363	4	1050	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	\N	\N	7982	\N	\N	\N	\N	2021-12-02 14:21:09.417207	2021-12-02 14:21:09.417207	\N	\N
2364	4	1051	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	7982	\N	\N	\N	\N	2021-12-02 14:21:09.444084	2021-12-02 14:21:09.444084	\N	\N
2365	4	1053	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	7981	\N	\N	\N	\N	2021-12-02 14:21:09.472254	2021-12-02 14:21:09.472254	\N	\N
2366	4	1054	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	\N	\N	7982	\N	\N	\N	\N	2021-12-02 14:21:09.500541	2021-12-02 14:21:09.500541	\N	\N
2367	4	1055	2	5	1	\N	2.5	19000	USD	\N	3	1	1	5	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	\N	\N	2421	\N	\N	\N	\N	2021-12-02 14:21:09.528828	2021-12-02 14:21:09.528828	\N	\N
2368	4	1056	2	5	3	\N	1.2	1410	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	2880	USD	1.2	\N	1	\N	\N	2451	\N	\N	\N	\N	2021-12-02 14:21:09.591994	2021-12-02 14:21:09.591994	\N	\N
2369	4	1057	2	5	3	\N	1	1910	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	4320	USD	1.3	\N	1	\N	\N	2452	\N	\N	\N	\N	2021-12-02 14:21:09.6212	2021-12-02 14:21:09.6212	\N	\N
2370	4	1058	2	5	3	\N	1	2450	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	5760	USD	1.6	\N	1	\N	\N	2453	\N	\N	\N	\N	2021-12-02 14:21:09.649789	2021-12-02 14:21:09.649789	\N	\N
2371	4	1059	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.678524	2021-12-02 14:21:09.678524	\N	\N
2372	4	1060	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.706384	2021-12-02 14:21:09.706384	\N	\N
2373	4	1061	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	2481	\N	\N	\N	\N	2021-12-02 14:21:09.733991	2021-12-02 14:21:09.733991	\N	\N
2374	4	1062	2	6	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	1410	USD	0.8	\N	1	\N	\N	1111	\N	\N	\N	\N	2021-12-02 14:21:09.761751	2021-12-02 14:21:09.761751	\N	\N
2375	4	1063	2	6	6	\N	0.8	1410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	\N	\N	1111	\N	\N	\N	\N	2021-12-02 14:21:09.789711	2021-12-02 14:21:09.789711	\N	\N
2376	4	1064	2	6	6	\N	1	1680	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	\N	\N	1111	\N	\N	\N	\N	2021-12-02 14:21:09.817453	2021-12-02 14:21:09.817453	\N	\N
2377	4	1065	2	6	6	\N	1.4	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	\N	\N	1112	\N	\N	\N	\N	2021-12-02 14:21:09.844905	2021-12-02 14:21:09.844905	\N	\N
2378	4	1066	2	6	6	\N	1.5	2160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	1	\N	1	\N	\N	1113	\N	\N	\N	\N	2021-12-02 14:21:09.872317	2021-12-02 14:21:09.872317	\N	\N
2379	4	1067	2	6	6	\N	1.6	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2160	USD	1	\N	1	\N	\N	1114	\N	\N	\N	\N	2021-12-02 14:21:09.899721	2021-12-02 14:21:09.899721	\N	\N
2380	4	1068	2	6	6	\N	1.8	2880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1.3	\N	1	\N	\N	1115	\N	\N	\N	\N	2021-12-02 14:21:09.927118	2021-12-02 14:21:09.927118	\N	\N
2381	4	1069	2	6	6	\N	2	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2880	USD	1.5	\N	1	\N	\N	1116	\N	\N	\N	\N	2021-12-02 14:21:09.954381	2021-12-02 14:21:09.954381	\N	\N
2382	4	1070	2	6	6	\N	2.4	5410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.8	\N	1	\N	\N	1117	\N	\N	\N	\N	2021-12-02 14:21:09.989173	2021-12-02 14:21:09.989173	\N	\N
2383	4	1071	2	6	6	\N	2.69	6960	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6960	USD	2.2	\N	1	\N	\N	1118	\N	\N	\N	\N	2021-12-02 14:21:10.017715	2021-12-02 14:21:10.017715	\N	\N
2384	4	1072	2	6	6	\N	2.8	8880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8880	USD	2.4	\N	1	\N	\N	1119	\N	\N	\N	\N	2021-12-02 14:21:10.046074	2021-12-02 14:21:10.046074	\N	\N
2385	4	1073	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.07412	2021-12-02 14:21:10.07412	\N	\N
2386	4	1074	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.101711	2021-12-02 14:21:10.101711	\N	\N
2387	4	1075	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.129159	2021-12-02 14:21:10.129159	\N	\N
2388	4	1076	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.156571	2021-12-02 14:21:10.156571	\N	\N
2389	4	1077	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.184102	2021-12-02 14:21:10.184102	\N	\N
2390	4	1078	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	6	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.211984	2021-12-02 14:21:10.211984	\N	\N
2391	4	1079	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	7	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.239412	2021-12-02 14:21:10.239412	\N	\N
2392	4	1080	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	8	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.267112	2021-12-02 14:21:10.267112	\N	\N
2393	4	1081	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.29455	2021-12-02 14:21:10.29455	\N	\N
2394	4	1082	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.321737	2021-12-02 14:21:10.321737	\N	\N
2395	4	1083	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.3491	2021-12-02 14:21:10.3491	\N	\N
2396	4	1084	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.376312	2021-12-02 14:21:10.376312	\N	\N
2397	4	1085	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.403673	2021-12-02 14:21:10.403673	\N	\N
2398	4	1086	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	\N	\N	1181	\N	\N	\N	\N	2021-12-02 14:21:10.430776	2021-12-02 14:21:10.430776	\N	\N
2399	4	1095	1	3	3	\N	1.3	2879	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	\N	\N	4442	\N	\N	\N	\N	2021-12-02 14:21:10.457959	2021-12-02 14:21:10.457959	\N	\N
2400	4	1096	1	3	3	\N	1.5	3398	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	\N	\N	4443	\N	\N	\N	\N	2021-12-02 14:21:10.491413	2021-12-02 14:21:10.491413	\N	\N
2401	4	1097	1	3	3	\N	2	6797	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	\N	\N	4444	\N	\N	\N	\N	2021-12-02 14:21:10.518951	2021-12-02 14:21:10.518951	\N	\N
2402	4	1098	1	3	3	\N	2.2	10195	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	\N	\N	4445	\N	\N	\N	\N	2021-12-02 14:21:10.581635	2021-12-02 14:21:10.581635	\N	\N
2403	4	1099	1	3	3	\N	2.5	13594	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	\N	\N	4446	\N	\N	\N	\N	2021-12-02 14:21:10.610557	2021-12-02 14:21:10.610557	\N	\N
2404	4	1100	1	3	3	\N	3	16992	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	\N	\N	4447	\N	\N	\N	\N	2021-12-02 14:21:10.639112	2021-12-02 14:21:10.639112	\N	\N
2405	4	1101	1	3	3	\N	4.5	20390	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	\N	\N	4448	\N	\N	\N	\N	2021-12-02 14:21:10.666885	2021-12-02 14:21:10.666885	\N	\N
2406	4	1102	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	4481	\N	\N	\N	\N	2021-12-02 14:21:10.6944	2021-12-02 14:21:10.6944	\N	\N
2407	4	1103	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	\N	\N	4481	\N	\N	\N	\N	2021-12-02 14:21:10.722135	2021-12-02 14:21:10.722135	\N	\N
2408	4	1104	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	\N	\N	4481	\N	\N	\N	\N	2021-12-02 14:21:10.750187	2021-12-02 14:21:10.750187	\N	\N
2409	4	1105	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	4481	\N	\N	\N	\N	2021-12-02 14:21:10.778559	2021-12-02 14:21:10.778559	\N	\N
2410	4	1106	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	4481	\N	\N	\N	\N	2021-12-02 14:21:10.807191	2021-12-02 14:21:10.807191	\N	\N
2411	4	1107	1	3	5	\N	0.6	300	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	4481	\N	\N	\N	\N	2021-12-02 14:21:10.834799	2021-12-02 14:21:10.834799	\N	\N
2412	4	1108	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	4481	\N	\N	\N	\N	2021-12-02 14:21:10.863016	2021-12-02 14:21:10.863016	\N	\N
2413	4	1109	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	4481	\N	\N	\N	\N	2021-12-02 14:21:10.890911	2021-12-02 14:21:10.890911	\N	\N
2414	4	2001	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	0	USD	3.8	\N	1	\N	\N	2122	\N	\N	\N	\N	2021-12-02 14:21:10.91879	2021-12-02 14:21:10.91879	\N	\N
2415	4	2002	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	30000	USD	4.2	\N	1	\N	\N	2121	\N	\N	\N	\N	2021-12-02 14:21:10.946544	2021-12-02 14:21:10.946544	\N	\N
2416	4	2003	3	7	6	\N	0.8	1841	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	\N	\N	2111	\N	\N	\N	\N	2021-12-02 14:21:10.974254	2021-12-02 14:21:10.974254	\N	\N
2417	4	2004	3	7	6	\N	1	2266	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	\N	\N	2111	\N	\N	\N	\N	2021-12-02 14:21:11.002175	2021-12-02 14:21:11.002175	\N	\N
2418	4	2005	3	7	6	\N	1.4	2832	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.9	\N	1	\N	\N	2112	\N	\N	\N	\N	2021-12-02 14:21:11.030109	2021-12-02 14:21:11.030109	\N	\N
2419	4	2006	3	7	6	\N	1.5	3729	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	\N	\N	2113	\N	\N	\N	\N	2021-12-02 14:21:11.063619	2021-12-02 14:21:11.063619	\N	\N
2420	4	2007	3	7	6	\N	1.6	4531	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	\N	\N	2114	\N	\N	\N	\N	2021-12-02 14:21:11.091395	2021-12-02 14:21:11.091395	\N	\N
2421	4	2008	3	7	6	\N	1.8	5098	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.4	\N	1	\N	\N	2115	\N	\N	\N	\N	2021-12-02 14:21:11.119728	2021-12-02 14:21:11.119728	\N	\N
2422	4	2009	3	7	6	\N	2	5947	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.7	\N	1	\N	\N	2116	\N	\N	\N	\N	2021-12-02 14:21:11.148434	2021-12-02 14:21:11.148434	\N	\N
2423	4	2010	3	7	6	\N	2.1	6443	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	\N	\N	2117	\N	\N	\N	\N	2021-12-02 14:21:11.176696	2021-12-02 14:21:11.176696	\N	\N
2424	4	2011	3	7	6	\N	2.2	9629	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.4	\N	1	\N	\N	2118	\N	\N	\N	\N	2021-12-02 14:21:11.20509	2021-12-02 14:21:11.20509	\N	\N
2425	4	2012	3	7	6	\N	2.3	10077	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.6	\N	1	\N	\N	2119	\N	\N	\N	\N	2021-12-02 14:21:11.23277	2021-12-02 14:21:11.23277	\N	\N
2426	4	2013	3	7	4	\N	0.3	354	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.260589	2021-12-02 14:21:11.260589	\N	\N
2427	4	2014	3	7	4	\N	0.6	708	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.288406	2021-12-02 14:21:11.288406	\N	\N
2428	4	2015	3	7	4	\N	0.6	354	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.316365	2021-12-02 14:21:11.316365	\N	\N
2429	4	2016	3	7	4	\N	1	708	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.344239	2021-12-02 14:21:11.344239	\N	\N
2430	4	2017	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.371897	2021-12-02 14:21:11.371897	\N	\N
2431	4	2018	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.399822	2021-12-02 14:21:11.399822	\N	\N
2432	4	2019	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.428228	2021-12-02 14:21:11.428228	\N	\N
2433	4	2020	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.456671	2021-12-02 14:21:11.456671	\N	\N
2434	4	2021	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.484859	2021-12-02 14:21:11.484859	\N	\N
2435	4	2022	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.513324	2021-12-02 14:21:11.513324	\N	\N
2436	4	2023	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.541498	2021-12-02 14:21:11.541498	\N	\N
2437	4	2024	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.60834	2021-12-02 14:21:11.60834	\N	\N
2438	4	2025	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.639234	2021-12-02 14:21:11.639234	\N	\N
2439	4	2026	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	2181	\N	\N	\N	\N	2021-12-02 14:21:11.667756	2021-12-02 14:21:11.667756	\N	\N
2440	4	2031	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6	\N	1	\N	\N	2621	\N	\N	\N	\N	2021-12-02 14:21:11.696393	2021-12-02 14:21:11.696393	\N	\N
2441	4	2032	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6.2	\N	1	\N	\N	2622	\N	\N	\N	\N	2021-12-02 14:21:11.724698	2021-12-02 14:21:11.724698	\N	\N
2442	4	2033	4	8	3	\N	1.5	5376	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	4800	USD	1.1	\N	1	\N	\N	2642	\N	\N	\N	\N	2021-12-02 14:21:11.752485	2021-12-02 14:21:11.752485	\N	\N
2443	4	2034	4	8	3	\N	2	10752	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	9600	USD	1.3	\N	1	\N	\N	2644	\N	\N	\N	\N	2021-12-02 14:21:11.780719	2021-12-02 14:21:11.780719	\N	\N
2444	4	2035	4	8	3	\N	3	16128	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	14400	USD	1.6	\N	1	\N	\N	2645	\N	\N	\N	\N	2021-12-02 14:21:11.809131	2021-12-02 14:21:11.809131	\N	\N
2445	4	2036	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	\N	\N	2681	\N	\N	\N	\N	2021-12-02 14:21:11.836841	2021-12-02 14:21:11.836841	\N	\N
2446	4	2037	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	\N	\N	2681	\N	\N	\N	\N	2021-12-02 14:21:11.864671	2021-12-02 14:21:11.864671	\N	\N
2447	4	2038	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	\N	\N	2681	\N	\N	\N	\N	2021-12-02 14:21:11.892518	2021-12-02 14:21:11.892518	\N	\N
2448	4	3001	3	9	1	\N	0.6	1290	USD	\N	6	1	6	9	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	3920	\N	\N	\N	\N	2021-12-02 14:21:11.920552	2021-12-02 14:21:11.920552	\N	\N
2449	4	3002	3	9	7	\N	0.6	1290	USD	\N	6	8	1	9	8	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	3920	\N	\N	\N	\N	2021-12-02 14:21:11.94808	2021-12-02 14:21:11.94808	\N	\N
2450	4	3003	3	10	1	\N	4.5	17840	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3	\N	1	\N	\N	3221	\N	\N	\N	\N	2021-12-02 14:21:11.975601	2021-12-02 14:21:11.975601	\N	\N
2451	4	3004	3	10	1	\N	4.5	0	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3.2	\N	1	\N	\N	3121	\N	\N	\N	\N	2021-12-02 14:21:12.003598	2021-12-02 14:21:12.003598	\N	\N
2452	4	3005	3	10	6	\N	0.8	1560	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.7	\N	1	\N	\N	3111	\N	\N	\N	\N	2021-12-02 14:21:12.032136	2021-12-02 14:21:12.032136	\N	\N
2453	4	3006	3	10	6	\N	1	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.8	\N	1	\N	\N	3112	\N	\N	\N	\N	2021-12-02 14:21:12.059601	2021-12-02 14:21:12.059601	\N	\N
2454	4	3007	3	10	6	\N	1.4	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1	\N	1	\N	\N	3113	\N	\N	\N	\N	2021-12-02 14:21:12.087689	2021-12-02 14:21:12.087689	\N	\N
2455	4	3008	3	10	6	\N	1.5	3160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.3	\N	1	\N	\N	3114	\N	\N	\N	\N	2021-12-02 14:21:12.115475	2021-12-02 14:21:12.115475	\N	\N
2456	4	3009	3	10	6	\N	1.6	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	4320	USD	1.5	\N	1	\N	\N	3115	\N	\N	\N	\N	2021-12-02 14:21:12.148915	2021-12-02 14:21:12.148915	\N	\N
2457	4	3010	3	10	6	\N	1.8	4320	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5040	USD	1.8	\N	1	\N	\N	3116	\N	\N	\N	\N	2021-12-02 14:21:12.176958	2021-12-02 14:21:12.176958	\N	\N
2458	4	3011	3	10	6	\N	2	5040	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2.2	\N	1	\N	\N	3117	\N	\N	\N	\N	2021-12-02 14:21:12.204746	2021-12-02 14:21:12.204746	\N	\N
2459	4	3012	3	10	6	\N	2.1	5460	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	11520	USD	2.6	\N	1	\N	\N	3118	\N	\N	\N	\N	2021-12-02 14:21:12.23288	2021-12-02 14:21:12.23288	\N	\N
2460	4	3013	3	10	6	\N	2.2	8160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	\N	\N	3119	\N	\N	\N	\N	2021-12-02 14:21:12.260944	2021-12-02 14:21:12.260944	\N	\N
2461	4	3014	3	10	6	\N	2.3	8540	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	\N	\N	3119	\N	\N	\N	\N	2021-12-02 14:21:12.289253	2021-12-02 14:21:12.289253	\N	\N
2462	4	3015	3	10	4	\N	1	600	USD	\N	4	4	5	6	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.317113	2021-12-02 14:21:12.317113	\N	\N
2463	4	3016	3	10	4	\N	0.6	600	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	300	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.344971	2021-12-02 14:21:12.344971	\N	\N
2464	4	3017	3	10	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.373463	2021-12-02 14:21:12.373463	\N	\N
2465	4	3018	3	10	4	\N	1	600	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.401653	2021-12-02 14:21:12.401653	\N	\N
2466	4	3019	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.429616	2021-12-02 14:21:12.429616	\N	\N
2467	4	3020	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.457095	2021-12-02 14:21:12.457095	\N	\N
2468	4	3021	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.484814	2021-12-02 14:21:12.484814	\N	\N
2469	4	3022	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.512754	2021-12-02 14:21:12.512754	\N	\N
2470	4	3023	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.540518	2021-12-02 14:21:12.540518	\N	\N
2471	4	3024	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.599695	2021-12-02 14:21:12.599695	\N	\N
2472	4	3025	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.628591	2021-12-02 14:21:12.628591	\N	\N
2473	4	3026	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.656431	2021-12-02 14:21:12.656431	\N	\N
2474	4	3027	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.691012	2021-12-02 14:21:12.691012	\N	\N
2475	4	3028	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	\N	\N	3181	\N	\N	\N	\N	2021-12-02 14:21:12.719794	2021-12-02 14:21:12.719794	\N	\N
2476	4	4001	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	\N	\N	4621	\N	\N	\N	\N	2021-12-02 14:21:12.748851	2021-12-02 14:21:12.748851	\N	\N
2477	4	4002	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.6	\N	1	\N	\N	4622	\N	\N	\N	\N	2021-12-02 14:21:12.777206	2021-12-02 14:21:12.777206	\N	\N
2478	4	4003	4	11	3	\N	1.5	4301	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	\N	\N	4642	\N	\N	\N	\N	2021-12-02 14:21:12.805285	2021-12-02 14:21:12.805285	\N	\N
2479	4	4004	4	11	3	\N	2	8602	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	7680	USD	1.3	\N	1	\N	\N	4644	\N	\N	\N	\N	2021-12-02 14:21:12.833658	2021-12-02 14:21:12.833658	\N	\N
2480	4	4005	4	11	3	\N	3	12880	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	11520	USD	1.6	\N	1	\N	\N	4645	\N	\N	\N	\N	2021-12-02 14:21:12.861757	2021-12-02 14:21:12.861757	\N	\N
2481	4	4006	4	11	5	\N	1	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	\N	\N	4681	\N	\N	\N	\N	2021-12-02 14:21:12.889606	2021-12-02 14:21:12.889606	\N	\N
2482	4	4007	4	11	5	\N	1.5	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	\N	\N	4681	\N	\N	\N	\N	2021-12-02 14:21:12.917504	2021-12-02 14:21:12.917504	\N	\N
2483	4	4008	4	11	5	\N	2	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	2	\N	\N	4681	\N	\N	\N	\N	2021-12-02 14:21:12.945724	2021-12-02 14:21:12.945724	\N	\N
2484	4	4009	4	12	1	\N	2.3	10820	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	\N	\N	4721	\N	\N	\N	\N	2021-12-02 14:21:12.974505	2021-12-02 14:21:12.974505	\N	\N
2485	4	4010	4	13	1	\N	2.3	10820	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	\N	\N	4722	\N	\N	\N	\N	2021-12-02 14:21:13.002752	2021-12-02 14:21:13.002752	\N	\N
2486	4	4011	4	14	4	\N	1	300	USD	\N	8	4	2	13	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	\N	\N	4722	\N	\N	\N	\N	2021-12-02 14:21:13.031144	2021-12-02 14:21:13.031144	\N	\N
2487	4	5000	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3	\N	1	\N	\N	5121	\N	\N	\N	\N	2021-12-02 14:21:13.05911	2021-12-02 14:21:13.05911	\N	\N
2488	4	5001	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3.2	\N	1	\N	\N	5122	\N	\N	\N	\N	2021-12-02 14:21:13.087328	2021-12-02 14:21:13.087328	\N	\N
2489	4	5002	5	15	6	\N	1	1400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	\N	\N	5111	\N	\N	\N	\N	2021-12-02 14:21:13.11505	2021-12-02 14:21:13.11505	\N	\N
2490	4	5003	5	15	6	\N	1.3	1882	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	\N	\N	5112	\N	\N	\N	\N	2021-12-02 14:21:13.143152	2021-12-02 14:21:13.143152	\N	\N
2491	4	5004	5	15	6	\N	1.5	2957	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	\N	\N	5113	\N	\N	\N	\N	2021-12-02 14:21:13.171306	2021-12-02 14:21:13.171306	\N	\N
2492	4	5005	5	15	6	\N	1.8	4301	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.2	\N	1	\N	\N	5114	\N	\N	\N	\N	2021-12-02 14:21:13.199609	2021-12-02 14:21:13.199609	\N	\N
2493	4	5006	5	15	6	\N	2	6451	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	\N	\N	5115	\N	\N	\N	\N	2021-12-02 14:21:13.233197	2021-12-02 14:21:13.233197	\N	\N
2494	4	5007	5	15	6	\N	2.2	7526	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.8	\N	1	\N	\N	5116	\N	\N	\N	\N	2021-12-02 14:21:13.260153	2021-12-02 14:21:13.260153	\N	\N
2495	4	5008	5	15	6	\N	2.3	9094	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	\N	\N	5117	\N	\N	\N	\N	2021-12-02 14:21:13.287472	2021-12-02 14:21:13.287472	\N	\N
2496	4	5009	5	15	6	\N	2.5	11290	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	\N	\N	5118	\N	\N	\N	\N	2021-12-02 14:21:13.314702	2021-12-02 14:21:13.314702	\N	\N
2497	4	5010	5	15	6	\N	3	13574	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	\N	\N	5119	\N	\N	\N	\N	2021-12-02 14:21:13.341374	2021-12-02 14:21:13.341374	\N	\N
2498	4	5011	5	15	6	\N	3.5	16934	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	\N	\N	5119	\N	\N	\N	\N	2021-12-02 14:21:13.369105	2021-12-02 14:21:13.369105	\N	\N
2499	4	5012	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.396086	2021-12-02 14:21:13.396086	\N	\N
2500	4	5013	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.42259	2021-12-02 14:21:13.42259	\N	\N
2501	4	5014	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.449698	2021-12-02 14:21:13.449698	\N	\N
2502	4	5015	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.476594	2021-12-02 14:21:13.476594	\N	\N
2503	4	5016	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.503314	2021-12-02 14:21:13.503314	\N	\N
2504	4	5017	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.529963	2021-12-02 14:21:13.529963	\N	\N
2505	4	5018	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.556925	2021-12-02 14:21:13.556925	\N	\N
2506	4	5019	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.616727	2021-12-02 14:21:13.616727	\N	\N
2507	4	5020	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.64421	2021-12-02 14:21:13.64421	\N	\N
2508	4	5021	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.671471	2021-12-02 14:21:13.671471	\N	\N
2509	4	5022	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.698923	2021-12-02 14:21:13.698923	\N	\N
2510	4	5023	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.726603	2021-12-02 14:21:13.726603	\N	\N
2511	4	5024	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.760413	2021-12-02 14:21:13.760413	\N	\N
2512	4	5025	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	\N	\N	5181	\N	\N	\N	\N	2021-12-02 14:21:13.787071	2021-12-02 14:21:13.787071	\N	\N
2513	4	5030	5	16	2	\N	0.5	1000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	5728	\N	\N	\N	\N	2021-12-02 14:21:13.814281	2021-12-02 14:21:13.814281	\N	\N
2514	4	5031	5	16	2	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	5728	\N	\N	\N	\N	2021-12-02 14:21:13.841372	2021-12-02 14:21:13.841372	\N	\N
2515	4	5032	5	16	2	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	5728	\N	\N	\N	\N	2021-12-02 14:21:13.868231	2021-12-02 14:21:13.868231	\N	\N
2516	4	5033	5	16	2	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	5728	\N	\N	\N	\N	2021-12-02 14:21:13.895086	2021-12-02 14:21:13.895086	\N	\N
2517	4	5034	5	16	2	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	5728	\N	\N	\N	\N	2021-12-02 14:21:13.921564	2021-12-02 14:21:13.921564	\N	\N
2518	4	5035	5	16	2	\N	1	6500	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	5728	\N	\N	\N	\N	2021-12-02 14:21:13.948701	2021-12-02 14:21:13.948701	\N	\N
2519	4	5036	5	16	2	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	5728	\N	\N	\N	\N	2021-12-02 14:21:13.975187	2021-12-02 14:21:13.975187	\N	\N
2520	4	5037	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.002027	2021-12-02 14:21:14.002027	\N	\N
2521	4	5038	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.029528	2021-12-02 14:21:14.029528	\N	\N
2522	4	5039	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.056134	2021-12-02 14:21:14.056134	\N	\N
2523	4	5040	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.082845	2021-12-02 14:21:14.082845	\N	\N
2524	4	5041	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.10969	2021-12-02 14:21:14.10969	\N	\N
2525	4	5042	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.136319	2021-12-02 14:21:14.136319	\N	\N
2526	4	5043	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.162821	2021-12-02 14:21:14.162821	\N	\N
2527	4	5044	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.189656	2021-12-02 14:21:14.189656	\N	\N
2528	4	5045	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:14.216378	2021-12-02 14:21:14.216378	\N	\N
2529	4	5046	5	17	1	\N	1	16822	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	1	\N	\N	5421	\N	\N	\N	\N	2021-12-02 14:21:14.24339	2021-12-02 14:21:14.24339	\N	\N
2530	4	5047	5	17	1	\N	2	33645	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	2	\N	\N	5421	\N	\N	\N	\N	2021-12-02 14:21:14.275618	2021-12-02 14:21:14.275618	\N	\N
2531	4	5048	5	17	1	\N	3	50467	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	3	\N	\N	5421	\N	\N	\N	\N	2021-12-02 14:21:14.302327	2021-12-02 14:21:14.302327	\N	\N
2532	4	5049	5	17	1	\N	4	67290	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	4	\N	\N	5421	\N	\N	\N	\N	2021-12-02 14:21:14.328874	2021-12-02 14:21:14.328874	\N	\N
2533	4	5050	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	1	\N	\N	5451	\N	\N	\N	\N	2021-12-02 14:21:14.356095	2021-12-02 14:21:14.356095	\N	\N
2534	4	5051	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	2	\N	\N	5451	\N	\N	\N	\N	2021-12-02 14:21:14.382828	2021-12-02 14:21:14.382828	\N	\N
2535	4	5052	5	17	2	\N	1	14560	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	3	\N	\N	5451	\N	\N	\N	\N	2021-12-02 14:21:14.409635	2021-12-02 14:21:14.409635	\N	\N
2536	4	5053	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.436197	2021-12-02 14:21:14.436197	\N	\N
2537	4	5054	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.462639	2021-12-02 14:21:14.462639	\N	\N
2538	4	5055	5	17	4	\N	0.6	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.489033	2021-12-02 14:21:14.489033	\N	\N
2539	4	5056	5	17	4	\N	0.8	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.515584	2021-12-02 14:21:14.515584	\N	\N
2540	4	5057	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.542392	2021-12-02 14:21:14.542392	\N	\N
2541	4	5058	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.601973	2021-12-02 14:21:14.601973	\N	\N
2542	4	5059	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.6295	2021-12-02 14:21:14.6295	\N	\N
2543	4	5060	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.656609	2021-12-02 14:21:14.656609	\N	\N
2544	4	5061	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.682836	2021-12-02 14:21:14.682836	\N	\N
2545	4	5062	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.70934	2021-12-02 14:21:14.70934	\N	\N
2546	4	5063	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.735879	2021-12-02 14:21:14.735879	\N	\N
2547	4	5064	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	5481	\N	\N	\N	\N	2021-12-02 14:21:14.762687	2021-12-02 14:21:14.762687	\N	\N
2548	4	5065	5	18	1	\N	0.5	963	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:14.796041	2021-12-02 14:21:14.796041	\N	\N
2549	4	5066	5	18	1	\N	0.5	1926	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:14.823096	2021-12-02 14:21:14.823096	\N	\N
2550	4	5067	5	18	1	\N	0.6	2890	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:14.850122	2021-12-02 14:21:14.850122	\N	\N
2551	4	5068	5	18	1	\N	0.8	3853	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:14.877159	2021-12-02 14:21:14.877159	\N	\N
2552	4	5069	5	18	1	\N	1	4816	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:14.904137	2021-12-02 14:21:14.904137	\N	\N
2553	4	5070	5	18	1	\N	1.2	5779	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:14.930752	2021-12-02 14:21:14.930752	\N	\N
2554	4	5071	5	18	1	\N	1.4	6742	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:14.9567	2021-12-02 14:21:14.9567	\N	\N
2555	4	5072	5	18	1	\N	1.6	7706	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:14.982928	2021-12-02 14:21:14.982928	\N	\N
2556	4	5073	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.009335	2021-12-02 14:21:15.009335	\N	\N
2557	4	5074	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.036237	2021-12-02 14:21:15.036237	\N	\N
2558	4	5075	5	18	5	\N	0.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.062433	2021-12-02 14:21:15.062433	\N	\N
2559	4	5076	5	18	5	\N	0.8	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.08918	2021-12-02 14:21:15.08918	\N	\N
2560	4	5077	5	18	5	\N	1	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.115452	2021-12-02 14:21:15.115452	\N	\N
2561	4	5078	5	18	5	\N	1.2	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.141661	2021-12-02 14:21:15.141661	\N	\N
2562	4	5079	5	18	5	\N	1.4	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.168167	2021-12-02 14:21:15.168167	\N	\N
2563	4	5080	5	18	5	\N	1.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.194616	2021-12-02 14:21:15.194616	\N	\N
2564	4	5081	5	18	10	\N	0.5	0	USD	\N	11	10	2	17	12	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	\N	\N	5522	\N	\N	\N	\N	2021-12-02 14:21:15.221272	2021-12-02 14:21:15.221272	\N	\N
2565	4	5082	5	19	1	\N	0.5	1725	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	1	\N	\N	5523	\N	\N	\N	\N	2021-12-02 14:21:15.247838	2021-12-02 14:21:15.247838	\N	\N
2566	4	5083	5	19	1	\N	0.5	3450	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	2	\N	\N	5523	\N	\N	\N	\N	2021-12-02 14:21:15.273804	2021-12-02 14:21:15.273804	\N	\N
2567	4	5084	5	19	1	\N	0.5	5174	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	3	\N	\N	5523	\N	\N	\N	\N	2021-12-02 14:21:15.305949	2021-12-02 14:21:15.305949	\N	\N
2568	4	5085	5	19	1	\N	0.8	6899	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	4	\N	\N	5523	\N	\N	\N	\N	2021-12-02 14:21:15.332741	2021-12-02 14:21:15.332741	\N	\N
2569	4	5086	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	\N	\N	5523	\N	\N	\N	\N	2021-12-02 14:21:15.359327	2021-12-02 14:21:15.359327	\N	\N
2570	4	5087	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	5523	\N	\N	\N	\N	2021-12-02 14:21:15.386053	2021-12-02 14:21:15.386053	\N	\N
2571	4	5088	5	19	4	\N	0.6	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	3	\N	\N	5523	\N	\N	\N	\N	2021-12-02 14:21:15.412701	2021-12-02 14:21:15.412701	\N	\N
2572	4	5089	5	19	4	\N	0.8	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	\N	\N	5523	\N	\N	\N	\N	2021-12-02 14:21:15.439423	2021-12-02 14:21:15.439423	\N	\N
2573	4	5090	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	5581	\N	\N	\N	\N	2021-12-02 14:21:15.465974	2021-12-02 14:21:15.465974	\N	\N
2574	4	5091	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5581	\N	\N	\N	\N	2021-12-02 14:21:15.492565	2021-12-02 14:21:15.492565	\N	\N
2575	4	5092	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5581	\N	\N	\N	\N	2021-12-02 14:21:15.551246	2021-12-02 14:21:15.551246	\N	\N
2576	4	5093	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5581	\N	\N	\N	\N	2021-12-02 14:21:15.578238	2021-12-02 14:21:15.578238	\N	\N
2577	4	5094	5	20	1	\N	0.5	1456	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.605582	2021-12-02 14:21:15.605582	\N	\N
2578	4	5095	5	20	1	\N	0.5	2912	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.632965	2021-12-02 14:21:15.632965	\N	\N
2579	4	5096	5	20	1	\N	0.5	4368	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.659473	2021-12-02 14:21:15.659473	\N	\N
2580	4	5097	5	20	1	\N	0.5	5824	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.686286	2021-12-02 14:21:15.686286	\N	\N
2581	4	5098	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.712943	2021-12-02 14:21:15.712943	\N	\N
2582	4	5099	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.739733	2021-12-02 14:21:15.739733	\N	\N
2583	4	5100	5	20	4	\N	0.6	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.765951	2021-12-02 14:21:15.765951	\N	\N
2584	4	5101	5	20	4	\N	0.8	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.792127	2021-12-02 14:21:15.792127	\N	\N
2585	4	5102	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.824145	2021-12-02 14:21:15.824145	\N	\N
2586	4	5103	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.850634	2021-12-02 14:21:15.850634	\N	\N
2587	4	5104	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.877339	2021-12-02 14:21:15.877339	\N	\N
2588	4	5105	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.904171	2021-12-02 14:21:15.904171	\N	\N
2589	4	5106	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.930898	2021-12-02 14:21:15.930898	\N	\N
2590	4	5107	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.957579	2021-12-02 14:21:15.957579	\N	\N
2591	4	5108	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:15.984769	2021-12-02 14:21:15.984769	\N	\N
2592	4	5109	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.011274	2021-12-02 14:21:16.011274	\N	\N
2593	4	5110	5	21	1	\N	0.5	1021	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.038415	2021-12-02 14:21:16.038415	\N	\N
2594	4	5111	5	21	1	\N	0.5	2041	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.065171	2021-12-02 14:21:16.065171	\N	\N
2595	4	5112	5	21	1	\N	0.5	3062	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.091945	2021-12-02 14:21:16.091945	\N	\N
2596	4	5113	5	21	1	\N	0.5	4083	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.118443	2021-12-02 14:21:16.118443	\N	\N
2597	4	5114	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.144719	2021-12-02 14:21:16.144719	\N	\N
2598	4	5115	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.171527	2021-12-02 14:21:16.171527	\N	\N
2599	4	5116	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.198347	2021-12-02 14:21:16.198347	\N	\N
2600	4	5117	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.22524	2021-12-02 14:21:16.22524	\N	\N
2601	4	5118	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.252224	2021-12-02 14:21:16.252224	\N	\N
2602	4	5119	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.278767	2021-12-02 14:21:16.278767	\N	\N
2603	4	5120	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.305464	2021-12-02 14:21:16.305464	\N	\N
2604	4	5121	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.338385	2021-12-02 14:21:16.338385	\N	\N
2605	4	5122	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.365179	2021-12-02 14:21:16.365179	\N	\N
2606	4	5123	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.391569	2021-12-02 14:21:16.391569	\N	\N
2607	4	5124	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.418209	2021-12-02 14:21:16.418209	\N	\N
2608	4	5125	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5621	\N	\N	\N	\N	2021-12-02 14:21:16.445781	2021-12-02 14:21:16.445781	\N	\N
2609	4	5126	5	22	1	\N	0.5	1156	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.472703	2021-12-02 14:21:16.472703	\N	\N
2610	4	5127	5	22	1	\N	0.6	2313	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.532321	2021-12-02 14:21:16.532321	\N	\N
2611	4	5128	5	22	1	\N	0.9	3469	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.560036	2021-12-02 14:21:16.560036	\N	\N
2612	4	5129	5	22	1	\N	1.2	4626	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.587844	2021-12-02 14:21:16.587844	\N	\N
2613	4	5130	5	22	5	\N	0.5	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.615566	2021-12-02 14:21:16.615566	\N	\N
2614	4	5131	5	22	5	\N	0.6	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.642785	2021-12-02 14:21:16.642785	\N	\N
2615	4	5132	5	22	5	\N	0.9	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.669804	2021-12-02 14:21:16.669804	\N	\N
2616	4	5133	5	22	5	\N	1.2	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.696526	2021-12-02 14:21:16.696526	\N	\N
2617	4	5134	5	23	1	\N	0.5	800	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.723975	2021-12-02 14:21:16.723975	\N	\N
2618	4	5135	5	23	1	\N	0.5	1600	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.751651	2021-12-02 14:21:16.751651	\N	\N
2619	4	5136	5	23	1	\N	0.6	2400	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.778588	2021-12-02 14:21:16.778588	\N	\N
2620	4	5137	5	23	1	\N	0.8	3200	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.805172	2021-12-02 14:21:16.805172	\N	\N
2621	4	5138	5	24	1	\N	0.5	1310	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.832032	2021-12-02 14:21:16.832032	\N	\N
2622	4	5139	5	24	1	\N	0.6	2620	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.865098	2021-12-02 14:21:16.865098	\N	\N
2623	4	5140	5	24	1	\N	0.9	3929	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.892098	2021-12-02 14:21:16.892098	\N	\N
2624	4	5141	5	24	1	\N	1.2	5239	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.919264	2021-12-02 14:21:16.919264	\N	\N
2625	4	5142	5	25	1	\N	0.5	1300	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.946305	2021-12-02 14:21:16.946305	\N	\N
2626	4	5143	5	25	1	\N	0.8	2600	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.972926	2021-12-02 14:21:16.972926	\N	\N
2627	4	5144	5	25	1	\N	1	3900	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:16.999651	2021-12-02 14:21:16.999651	\N	\N
2628	4	5145	5	25	1	\N	1	5200	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:17.026513	2021-12-02 14:21:17.026513	\N	\N
2629	4	5146	5	24	4	\N	0.5	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	1	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:17.053024	2021-12-02 14:21:17.053024	\N	\N
2630	4	5147	5	24	4	\N	0.6	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	2	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:17.080057	2021-12-02 14:21:17.080057	\N	\N
2631	4	5148	5	24	4	\N	0.9	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	3	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:17.106372	2021-12-02 14:21:17.106372	\N	\N
2632	4	5149	5	24	4	\N	1.2	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	4	\N	\N	5524	\N	\N	\N	\N	2021-12-02 14:21:17.132685	2021-12-02 14:21:17.132685	\N	\N
2633	4	5150	5	26	1	\N	1	4189	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	1	\N	\N	5221	\N	\N	\N	\N	2021-12-02 14:21:17.159303	2021-12-02 14:21:17.159303	\N	\N
2634	4	5151	5	26	1	\N	2	8378	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	2	\N	\N	5221	\N	\N	\N	\N	2021-12-02 14:21:17.186206	2021-12-02 14:21:17.186206	\N	\N
2635	4	5152	5	26	1	\N	3	12567	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	3	\N	\N	5221	\N	\N	\N	\N	2021-12-02 14:21:17.212756	2021-12-02 14:21:17.212756	\N	\N
2636	4	5153	5	26	1	\N	4	16756	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	4	\N	\N	5221	\N	\N	\N	\N	2021-12-02 14:21:17.239586	2021-12-02 14:21:17.239586	\N	\N
2637	4	5154	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:17.266847	2021-12-02 14:21:17.266847	\N	\N
2638	4	5155	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:17.294102	2021-12-02 14:21:17.294102	\N	\N
2639	4	5156	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:17.320901	2021-12-02 14:21:17.320901	\N	\N
2640	4	5157	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:17.34825	2021-12-02 14:21:17.34825	\N	\N
2641	4	5158	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:17.380572	2021-12-02 14:21:17.380572	\N	\N
2642	4	5159	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:17.407241	2021-12-02 14:21:17.407241	\N	\N
2643	4	5160	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:17.434135	2021-12-02 14:21:17.434135	\N	\N
2644	4	5161	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:17.493305	2021-12-02 14:21:17.493305	\N	\N
2645	4	5162	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	5271	\N	\N	\N	\N	2021-12-02 14:21:17.521056	2021-12-02 14:21:17.521056	\N	\N
2646	4	5163	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	5271	\N	\N	\N	\N	2021-12-02 14:21:17.548519	2021-12-02 14:21:17.548519	\N	\N
2647	4	5164	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	5271	\N	\N	\N	\N	2021-12-02 14:21:17.575598	2021-12-02 14:21:17.575598	\N	\N
2648	4	5165	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	5271	\N	\N	\N	\N	2021-12-02 14:21:17.602608	2021-12-02 14:21:17.602608	\N	\N
2649	4	5166	5	27	1	\N	1	3550	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	1	\N	\N	5222	\N	\N	\N	\N	2021-12-02 14:21:17.629675	2021-12-02 14:21:17.629675	\N	\N
2650	4	5167	5	27	1	\N	1.5	7100	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	2	\N	\N	5222	\N	\N	\N	\N	2021-12-02 14:21:17.656846	2021-12-02 14:21:17.656846	\N	\N
2651	4	5168	5	27	1	\N	1.5	10650	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	3	\N	\N	5222	\N	\N	\N	\N	2021-12-02 14:21:17.685044	2021-12-02 14:21:17.685044	\N	\N
2652	4	5169	5	27	1	\N	2	14200	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	4	\N	\N	5222	\N	\N	\N	\N	2021-12-02 14:21:17.712722	2021-12-02 14:21:17.712722	\N	\N
2653	4	5170	5	28	2	\N	0.5	2360	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	\N	\N	5141	\N	\N	\N	\N	2021-12-02 14:21:17.739994	2021-12-02 14:21:17.739994	\N	\N
2654	4	5171	5	28	2	\N	1	2950	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	\N	\N	5142	\N	\N	\N	\N	2021-12-02 14:21:17.766917	2021-12-02 14:21:17.766917	\N	\N
2655	4	5172	5	28	2	\N	1.5	3540	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	\N	\N	5143	\N	\N	\N	\N	2021-12-02 14:21:17.793774	2021-12-02 14:21:17.793774	\N	\N
2656	4	5173	5	28	2	\N	2	7080	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	\N	\N	5144	\N	\N	\N	\N	2021-12-02 14:21:17.820223	2021-12-02 14:21:17.820223	\N	\N
2657	4	5174	5	28	2	\N	2.2	10620	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	\N	\N	5145	\N	\N	\N	\N	2021-12-02 14:21:17.846722	2021-12-02 14:21:17.846722	\N	\N
2658	4	5175	5	28	2	\N	2.5	14160	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	\N	\N	5146	\N	\N	\N	\N	2021-12-02 14:21:17.873843	2021-12-02 14:21:17.873843	\N	\N
2659	4	5176	5	28	2	\N	3	17700	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	\N	\N	5147	\N	\N	\N	\N	2021-12-02 14:21:17.906807	2021-12-02 14:21:17.906807	\N	\N
2660	4	5177	5	28	2	\N	3.6	22420	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	\N	\N	5147	\N	\N	\N	\N	2021-12-02 14:21:17.933905	2021-12-02 14:21:17.933905	\N	\N
2661	4	5178	5	28	2	\N	5	28320	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	\N	\N	5147	\N	\N	\N	\N	2021-12-02 14:21:17.961272	2021-12-02 14:21:17.961272	\N	\N
2662	4	5179	5	28	3	\N	0.5	2360	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	\N	\N	5141	\N	\N	\N	\N	2021-12-02 14:21:17.988953	2021-12-02 14:21:17.988953	\N	\N
2663	4	5180	5	28	3	\N	1	2950	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	\N	\N	5142	\N	\N	\N	\N	2021-12-02 14:21:18.016086	2021-12-02 14:21:18.016086	\N	\N
2664	4	5181	5	28	3	\N	1.5	3540	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	\N	\N	5143	\N	\N	\N	\N	2021-12-02 14:21:18.043563	2021-12-02 14:21:18.043563	\N	\N
2665	4	5182	5	28	3	\N	2	7080	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	\N	\N	5144	\N	\N	\N	\N	2021-12-02 14:21:18.070864	2021-12-02 14:21:18.070864	\N	\N
2666	4	5183	5	28	3	\N	2.2	10620	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	\N	\N	5145	\N	\N	\N	\N	2021-12-02 14:21:18.097899	2021-12-02 14:21:18.097899	\N	\N
2667	4	5184	5	28	3	\N	2.5	14160	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	\N	\N	5146	\N	\N	\N	\N	2021-12-02 14:21:18.124302	2021-12-02 14:21:18.124302	\N	\N
2668	4	5185	5	28	3	\N	3	17700	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	\N	\N	5147	\N	\N	\N	\N	2021-12-02 14:21:18.150498	2021-12-02 14:21:18.150498	\N	\N
2669	4	5186	5	28	3	\N	3.6	22420	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	\N	\N	5147	\N	\N	\N	\N	2021-12-02 14:21:18.177308	2021-12-02 14:21:18.177308	\N	\N
2670	4	5187	5	28	3	\N	5	28320	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	\N	\N	5147	\N	\N	\N	\N	2021-12-02 14:21:18.20404	2021-12-02 14:21:18.20404	\N	\N
2671	4	5188	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.230513	2021-12-02 14:21:18.230513	\N	\N
2672	4	5189	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.25675	2021-12-02 14:21:18.25675	\N	\N
2673	4	5190	5	28	5	\N	0.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.283412	2021-12-02 14:21:18.283412	\N	\N
2674	4	5191	5	28	5	\N	1.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.310075	2021-12-02 14:21:18.310075	\N	\N
2675	4	5192	5	28	5	\N	2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.336527	2021-12-02 14:21:18.336527	\N	\N
2676	4	5193	5	28	5	\N	2.2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.363145	2021-12-02 14:21:18.363145	\N	\N
2677	4	5194	5	28	5	\N	2.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.389854	2021-12-02 14:21:18.389854	\N	\N
2678	4	5195	5	28	5	\N	3	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.421898	2021-12-02 14:21:18.421898	\N	\N
2679	4	5196	5	28	5	\N	3.6	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.481428	2021-12-02 14:21:18.481428	\N	\N
2680	4	5197	5	28	5	\N	5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	\N	\N	5131	\N	\N	\N	\N	2021-12-02 14:21:18.509433	2021-12-02 14:21:18.509433	\N	\N
2681	4	5198	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.536966	2021-12-02 14:21:18.536966	\N	\N
2682	4	5199	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.563857	2021-12-02 14:21:18.563857	\N	\N
2683	4	5200	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.590636	2021-12-02 14:21:18.590636	\N	\N
2684	4	5201	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.617405	2021-12-02 14:21:18.617405	\N	\N
2685	4	5202	5	29	1	\N	0.5	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.643974	2021-12-02 14:21:18.643974	\N	\N
2686	4	5203	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.671252	2021-12-02 14:21:18.671252	\N	\N
2687	4	5204	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.698025	2021-12-02 14:21:18.698025	\N	\N
2688	4	5205	5	29	1	\N	0.6	3172	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	2400	USD	0.3	\N	2	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.7247	2021-12-02 14:21:18.7247	\N	\N
2689	4	5206	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.750939	2021-12-02 14:21:18.750939	\N	\N
2690	4	5207	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.77744	2021-12-02 14:21:18.77744	\N	\N
2691	4	5208	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.803557	2021-12-02 14:21:18.803557	\N	\N
2692	4	5209	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.829682	2021-12-02 14:21:18.829682	\N	\N
2693	4	5210	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.856205	2021-12-02 14:21:18.856205	\N	\N
2694	4	5211	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.882215	2021-12-02 14:21:18.882215	\N	\N
2695	4	5212	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.908327	2021-12-02 14:21:18.908327	\N	\N
2696	4	5213	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.941056	2021-12-02 14:21:18.941056	\N	\N
2697	4	5214	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	5	\N	\N	5921	\N	\N	\N	\N	2021-12-02 14:21:18.967781	2021-12-02 14:21:18.967781	\N	\N
2698	4	5215	5	30	1	\N	0.7	1500	USD	\N	22	1	1	27	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	5623	\N	\N	\N	\N	2021-12-02 14:21:18.994333	2021-12-02 14:21:18.994333	\N	\N
2699	4	5216	5	30	5	\N	0.5	0	USD	\N	22	5	5	27	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5682	\N	\N	\N	\N	2021-12-02 14:21:19.02046	2021-12-02 14:21:19.02046	\N	\N
2700	4	5217	5	30	4	\N	0.5	300	USD	\N	22	4	10	27	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5682	\N	\N	\N	\N	2021-12-02 14:21:19.048252	2021-12-02 14:21:19.048252	\N	\N
2701	4	5218	5	12	1	\N	2.3	12768	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	\N	\N	4721	\N	\N	\N	\N	2021-12-02 14:21:19.075958	2021-12-02 14:21:19.075958	\N	\N
2702	4	5219	5	13	1	\N	2.3	12768	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	\N	\N	4722	\N	\N	\N	\N	2021-12-02 14:21:19.104052	2021-12-02 14:21:19.104052	\N	\N
2703	4	5220	5	14	4	\N	0.6	600	USD	\N	8	4	2	12	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	\N	\N	4722	\N	\N	\N	\N	2021-12-02 14:21:19.132048	2021-12-02 14:21:19.132048	\N	\N
2704	4	5221	5	31	1	\N	1	1400	USD	\N	23	1	1	28	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5622	\N	\N	\N	\N	2021-12-02 14:21:19.160474	2021-12-02 14:21:19.160474	\N	\N
2705	4	5222	5	31	4	\N	1	1400	USD	\N	23	7	1	28	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	5622	\N	\N	\N	\N	2021-12-02 14:21:19.18861	2021-12-02 14:21:19.18861	\N	\N
2706	4	5223	5	16	1	\N	0.5	1000	USD	\N	9	2	3	15	1	\N	2	\N	\N	0	USD	900	USD	0.5	\N	1	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:19.216565	2021-12-02 14:21:19.216565	\N	\N
2707	4	5224	5	16	1	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	1800	USD	0.5	\N	1	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:19.24473	2021-12-02 14:21:19.24473	\N	\N
2708	4	5225	5	16	1	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2700	USD	0.5	\N	1	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:19.273267	2021-12-02 14:21:19.273267	\N	\N
2709	4	5226	5	16	1	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	1	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:19.301147	2021-12-02 14:21:19.301147	\N	\N
2710	4	5227	5	16	1	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2400	USD	0.5	\N	2	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:19.328711	2021-12-02 14:21:19.328711	\N	\N
2711	4	5228	5	16	1	\N	1	6000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2800	USD	0.5	\N	2	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:19.356373	2021-12-02 14:21:19.356373	\N	\N
2712	4	5229	5	16	1	\N	1	7000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3150	USD	0.5	\N	2	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:19.383837	2021-12-02 14:21:19.383837	\N	\N
2713	4	5230	5	16	1	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	2	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:19.443051	2021-12-02 14:21:19.443051	\N	\N
2714	4	5231	5	15	11	\N	0.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:19.471551	2021-12-02 14:21:19.471551	\N	\N
2715	4	5232	5	15	11	\N	1	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:19.506481	2021-12-02 14:21:19.506481	\N	\N
2716	4	5233	5	15	11	\N	1.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:19.534512	2021-12-02 14:21:19.534512	\N	\N
2717	4	5234	5	15	11	\N	2	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:19.562375	2021-12-02 14:21:19.562375	\N	\N
2718	4	6000	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6000	USD	0.9	\N	1	\N	\N	6526	\N	\N	\N	\N	2021-12-02 14:21:19.590323	2021-12-02 14:21:19.590323	\N	\N
2719	4	6001	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	0.9	\N	1	\N	\N	6526	\N	\N	\N	\N	2021-12-02 14:21:19.618062	2021-12-02 14:21:19.618062	\N	\N
2720	4	6002	6	32	12	\N	1.5	8060	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6500	USD	0.9	\N	1	\N	\N	6526	\N	\N	\N	\N	2021-12-02 14:21:19.64582	2021-12-02 14:21:19.64582	\N	\N
2721	4	6003	6	32	12	\N	1.5	12500	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	1.2	\N	1	\N	\N	6525	\N	\N	\N	\N	2021-12-02 14:21:19.674561	2021-12-02 14:21:19.674561	\N	\N
2722	4	6004	6	32	12	\N	1.5	15000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	11000	USD	1.5	\N	1	\N	\N	6523	\N	\N	\N	\N	2021-12-02 14:21:19.703617	2021-12-02 14:21:19.703617	\N	\N
2723	4	6005	6	32	12	\N	2	20000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	14000	USD	1.7	\N	1	\N	\N	6527	\N	\N	\N	\N	2021-12-02 14:21:19.731819	2021-12-02 14:21:19.731819	\N	\N
2724	4	6006	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	1.9	\N	1	\N	\N	6528	\N	\N	\N	\N	2021-12-02 14:21:19.759398	2021-12-02 14:21:19.759398	\N	\N
2725	4	6007	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	4	\N	\N	0	USD	22000	USD	2	\N	1	\N	\N	6529	\N	\N	\N	\N	2021-12-02 14:21:19.786983	2021-12-02 14:21:19.786983	\N	\N
2726	4	6008	6	32	12	\N	3	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	2.1	\N	1	\N	\N	6524	\N	\N	\N	\N	2021-12-02 14:21:19.814858	2021-12-02 14:21:19.814858	\N	\N
2727	4	6009	6	32	8	\N	0.75	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	100	USD	0.1	\N	5	\N	\N	6173	\N	\N	\N	\N	2021-12-02 14:21:19.842579	2021-12-02 14:21:19.842579	\N	\N
2728	4	6010	6	32	8	\N	1.3	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	\N	\N	6533	\N	\N	\N	\N	2021-12-02 14:21:19.870198	2021-12-02 14:21:19.870198	\N	\N
2729	4	6011	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	\N	\N	6533	\N	\N	\N	\N	2021-12-02 14:21:19.89794	2021-12-02 14:21:19.89794	\N	\N
2730	4	6012	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	\N	\N	6534	\N	\N	\N	\N	2021-12-02 14:21:19.925019	2021-12-02 14:21:19.925019	\N	\N
2731	4	6013	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	\N	\N	6534	\N	\N	\N	\N	2021-12-02 14:21:19.952455	2021-12-02 14:21:19.952455	\N	\N
2732	4	6014	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	\N	\N	6534	\N	\N	\N	\N	2021-12-02 14:21:19.980458	2021-12-02 14:21:19.980458	\N	\N
2733	4	6015	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	\N	\N	6534	\N	\N	\N	\N	2021-12-02 14:21:20.013886	2021-12-02 14:21:20.013886	\N	\N
2734	4	6016	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	\N	\N	6534	\N	\N	\N	\N	2021-12-02 14:21:20.041583	2021-12-02 14:21:20.041583	\N	\N
2735	4	6017	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	\N	\N	6534	\N	\N	\N	\N	2021-12-02 14:21:20.06953	2021-12-02 14:21:20.06953	\N	\N
2736	4	6018	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	\N	\N	6534	\N	\N	\N	\N	2021-12-02 14:21:20.097556	2021-12-02 14:21:20.097556	\N	\N
2737	4	6019	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.125394	2021-12-02 14:21:20.125394	\N	\N
2738	4	6020	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.153008	2021-12-02 14:21:20.153008	\N	\N
2739	4	6021	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.180504	2021-12-02 14:21:20.180504	\N	\N
2740	4	6022	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.208426	2021-12-02 14:21:20.208426	\N	\N
2741	4	6023	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.23651	2021-12-02 14:21:20.23651	\N	\N
2742	4	6024	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.264243	2021-12-02 14:21:20.264243	\N	\N
2743	4	6025	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.292371	2021-12-02 14:21:20.292371	\N	\N
2744	4	6026	6	32	14	\N	1.8	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.319941	2021-12-02 14:21:20.319941	\N	\N
2745	4	6027	6	32	14	\N	2.6	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	\N	\N	6172	\N	\N	\N	\N	2021-12-02 14:21:20.347434	2021-12-02 14:21:20.347434	\N	\N
2746	4	6032	6	33	2	\N	1	3540	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	\N	\N	6352	\N	\N	\N	\N	2021-12-02 14:21:20.374478	2021-12-02 14:21:20.374478	\N	\N
2747	4	6033	6	33	2	\N	1	7080	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	\N	\N	6352	\N	\N	\N	\N	2021-12-02 14:21:20.402266	2021-12-02 14:21:20.402266	\N	\N
2748	4	6034	6	33	2	\N	1	10620	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	\N	\N	6352	\N	\N	\N	\N	2021-12-02 14:21:20.463586	2021-12-02 14:21:20.463586	\N	\N
2749	4	6035	6	33	2	\N	1	14160	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	\N	\N	6352	\N	\N	\N	\N	2021-12-02 14:21:20.492613	2021-12-02 14:21:20.492613	\N	\N
2750	4	6036	6	33	2	\N	2	17700	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	\N	\N	6352	\N	\N	\N	\N	2021-12-02 14:21:20.521178	2021-12-02 14:21:20.521178	\N	\N
2751	4	6037	6	33	2	\N	2	22420	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	\N	\N	6352	\N	\N	\N	\N	2021-12-02 14:21:20.549256	2021-12-02 14:21:20.549256	\N	\N
2752	4	6038	6	33	2	\N	2	25724	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	\N	\N	6352	\N	\N	\N	\N	2021-12-02 14:21:20.582755	2021-12-02 14:21:20.582755	\N	\N
2753	4	6039	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.611163	2021-12-02 14:21:20.611163	\N	\N
2754	4	6040	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.639357	2021-12-02 14:21:20.639357	\N	\N
2755	4	6041	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.668371	2021-12-02 14:21:20.668371	\N	\N
2756	4	6042	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.69619	2021-12-02 14:21:20.69619	\N	\N
2757	4	6043	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.723502	2021-12-02 14:21:20.723502	\N	\N
2758	4	6044	6	33	5	\N	0.7	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.750967	2021-12-02 14:21:20.750967	\N	\N
2759	4	6045	6	33	5	\N	0.9	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.778807	2021-12-02 14:21:20.778807	\N	\N
2760	4	6046	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.806649	2021-12-02 14:21:20.806649	\N	\N
2761	4	6047	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.834119	2021-12-02 14:21:20.834119	\N	\N
2762	4	6048	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	6571	\N	\N	\N	\N	2021-12-02 14:21:20.86182	2021-12-02 14:21:20.86182	\N	\N
2763	4	6049	6	34	1	\N	0.5	3500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	6721	\N	\N	\N	\N	2021-12-02 14:21:20.889321	2021-12-02 14:21:20.889321	\N	\N
2764	4	6050	6	34	1	\N	0.5	7000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	6721	\N	\N	\N	\N	2021-12-02 14:21:20.917155	2021-12-02 14:21:20.917155	\N	\N
2765	4	6051	6	34	1	\N	1	10500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	\N	\N	6721	\N	\N	\N	\N	2021-12-02 14:21:20.944894	2021-12-02 14:21:20.944894	\N	\N
2766	4	6052	6	34	1	\N	1	14000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	7	\N	\N	6721	\N	\N	\N	\N	2021-12-02 14:21:20.973065	2021-12-02 14:21:20.973065	\N	\N
2767	4	6053	6	34	1	\N	1.5	17500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	\N	\N	6721	\N	\N	\N	\N	2021-12-02 14:21:21.000932	2021-12-02 14:21:21.000932	\N	\N
2768	4	6054	6	34	1	\N	2	21000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	9	\N	\N	6721	\N	\N	\N	\N	2021-12-02 14:21:21.028566	2021-12-02 14:21:21.028566	\N	\N
2769	4	6055	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.056237	2021-12-02 14:21:21.056237	\N	\N
2770	4	6056	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.089971	2021-12-02 14:21:21.089971	\N	\N
2771	4	6057	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.117642	2021-12-02 14:21:21.117642	\N	\N
2772	4	6058	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.145386	2021-12-02 14:21:21.145386	\N	\N
2773	4	6059	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.173484	2021-12-02 14:21:21.173484	\N	\N
2774	4	6060	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.201198	2021-12-02 14:21:21.201198	\N	\N
2775	4	6061	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.228684	2021-12-02 14:21:21.228684	\N	\N
2776	4	6062	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.256515	2021-12-02 14:21:21.256515	\N	\N
2777	4	6063	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.284346	2021-12-02 14:21:21.284346	\N	\N
2778	4	6064	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.312216	2021-12-02 14:21:21.312216	\N	\N
2779	4	6065	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.339557	2021-12-02 14:21:21.339557	\N	\N
2780	4	6066	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.367433	2021-12-02 14:21:21.367433	\N	\N
2781	4	6067	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.395206	2021-12-02 14:21:21.395206	\N	\N
2782	4	6068	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.455659	2021-12-02 14:21:21.455659	\N	\N
2783	4	6069	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.485131	2021-12-02 14:21:21.485131	\N	\N
2784	4	6070	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.513427	2021-12-02 14:21:21.513427	\N	\N
2785	4	6071	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.541639	2021-12-02 14:21:21.541639	\N	\N
2786	4	6072	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	6722	\N	\N	\N	\N	2021-12-02 14:21:21.569547	2021-12-02 14:21:21.569547	\N	\N
2787	4	7000	7	35	1	\N	7.9	66000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	7.9	\N	1	\N	\N	3521	\N	\N	\N	\N	2021-12-02 14:21:21.597329	2021-12-02 14:21:21.597329	\N	\N
2788	4	7001	7	35	1	\N	15.6	132000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	14.9	\N	1	\N	\N	3522	\N	\N	\N	\N	2021-12-02 14:21:21.625087	2021-12-02 14:21:21.625087	\N	\N
2789	4	7002	7	35	2	\N	1.5	2880	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	\N	\N	3550	\N	\N	\N	\N	2021-12-02 14:21:21.659058	2021-12-02 14:21:21.659058	\N	\N
2790	4	7003	7	35	2	\N	2	5760	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	3600	USD	1.4	\N	1	\N	\N	3551	\N	\N	\N	\N	2021-12-02 14:21:21.686795	2021-12-02 14:21:21.686795	\N	\N
2791	4	7004	7	35	2	\N	2.2	7200	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	5040	USD	1.7	\N	1	\N	\N	3552	\N	\N	\N	\N	2021-12-02 14:21:21.715272	2021-12-02 14:21:21.715272	\N	\N
2792	4	7005	7	35	2	\N	2.5	8640	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	6480	USD	2.1	\N	1	\N	\N	3553	\N	\N	\N	\N	2021-12-02 14:21:21.742994	2021-12-02 14:21:21.742994	\N	\N
2793	4	7006	7	35	2	\N	2.8	10080	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	10080	USD	2.8	\N	1	\N	\N	3554	\N	\N	\N	\N	2021-12-02 14:21:21.770896	2021-12-02 14:21:21.770896	\N	\N
2794	4	7007	7	35	2	\N	3	11520	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	13680	USD	3.5	\N	1	\N	\N	3555	\N	\N	\N	\N	2021-12-02 14:21:21.798918	2021-12-02 14:21:21.798918	\N	\N
2795	4	7008	7	35	2	\N	3.2	13000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	17280	USD	4.9	\N	1	\N	\N	3556	\N	\N	\N	\N	2021-12-02 14:21:21.826985	2021-12-02 14:21:21.826985	\N	\N
2796	4	7009	7	35	2	\N	3.5	14500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	6.3	\N	1	\N	\N	3557	\N	\N	\N	\N	2021-12-02 14:21:21.85504	2021-12-02 14:21:21.85504	\N	\N
2797	4	7010	7	35	2	\N	4	16000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	7.8	\N	1	\N	\N	3558	\N	\N	\N	\N	2021-12-02 14:21:21.882349	2021-12-02 14:21:21.882349	\N	\N
2798	4	7011	7	35	2	\N	4.5	17500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	\N	\N	3559	\N	\N	\N	\N	2021-12-02 14:21:21.909749	2021-12-02 14:21:21.909749	\N	\N
2799	4	7012	7	35	2	\N	7	19000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	\N	\N	3559	\N	\N	\N	\N	2021-12-02 14:21:21.93755	2021-12-02 14:21:21.93755	\N	\N
2800	4	7013	7	35	3	\N	1	2400	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	1440	USD	0.9	\N	1	\N	\N	3541	\N	\N	\N	\N	2021-12-02 14:21:21.965202	2021-12-02 14:21:21.965202	\N	\N
2801	4	7014	7	35	3	\N	1	2880	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	\N	\N	3542	\N	\N	\N	\N	2021-12-02 14:21:21.992628	2021-12-02 14:21:21.992628	\N	\N
2802	4	7015	7	35	3	\N	1.5	5760	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	\N	\N	3544	\N	\N	\N	\N	2021-12-02 14:21:22.019959	2021-12-02 14:21:22.019959	\N	\N
2803	4	7016	7	35	3	\N	1.8	7200	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	\N	\N	3545	\N	\N	\N	\N	2021-12-02 14:21:22.047335	2021-12-02 14:21:22.047335	\N	\N
2804	4	7017	7	35	3	\N	2	8640	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	\N	\N	3546	\N	\N	\N	\N	2021-12-02 14:21:22.074738	2021-12-02 14:21:22.074738	\N	\N
2805	4	7018	7	35	3	\N	2.2	10080	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	\N	\N	3547	\N	\N	\N	\N	2021-12-02 14:21:22.102409	2021-12-02 14:21:22.102409	\N	\N
2806	4	7019	7	35	3	\N	3	11520	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	11520	USD	2.2	\N	1	\N	\N	3548	\N	\N	\N	\N	2021-12-02 14:21:22.130313	2021-12-02 14:21:22.130313	\N	\N
2807	4	7020	7	35	4	\N	0.5	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	3581	\N	\N	\N	\N	2021-12-02 14:21:22.163217	2021-12-02 14:21:22.163217	\N	\N
2808	4	7021	7	35	4	\N	1	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	3581	\N	\N	\N	\N	2021-12-02 14:21:22.190707	2021-12-02 14:21:22.190707	\N	\N
2809	4	7022	7	35	5	\N	0.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	3581	\N	\N	\N	\N	2021-12-02 14:21:22.219351	2021-12-02 14:21:22.219351	\N	\N
2810	4	7023	7	35	5	\N	1	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	3581	\N	\N	\N	\N	2021-12-02 14:21:22.247345	2021-12-02 14:21:22.247345	\N	\N
2811	4	7024	7	35	5	\N	1.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	3581	\N	\N	\N	\N	2021-12-02 14:21:22.274974	2021-12-02 14:21:22.274974	\N	\N
2812	4	7025	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	3581	\N	\N	\N	\N	2021-12-02 14:21:22.302238	2021-12-02 14:21:22.302238	\N	\N
2813	4	7026	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	3581	\N	\N	\N	\N	2021-12-02 14:21:22.329759	2021-12-02 14:21:22.329759	\N	\N
2814	4	7027	7	36	1	\N	1	1800	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	\N	\N	3548	\N	\N	\N	\N	2021-12-02 14:21:22.356245	2021-12-02 14:21:22.356245	\N	\N
2815	4	7028	7	36	4	\N	0.5	0	USD	\N	2	4	2	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	\N	\N	3548	\N	\N	\N	\N	2021-12-02 14:21:22.38274	2021-12-02 14:21:22.38274	\N	\N
2816	4	7029	7	37	1	\N	4	17200	USD	\N	1	1	1	33	1	\N	2	\N	\N	0	USD	0	USD	4	\N	1	\N	\N	4521	\N	\N	\N	\N	2021-12-02 14:21:22.409474	2021-12-02 14:21:22.409474	\N	\N
2817	4	7031	7	37	2	\N	1.3	2880	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	\N	\N	4551	\N	\N	\N	\N	2021-12-02 14:21:22.469533	2021-12-02 14:21:22.469533	\N	\N
2818	4	7032	7	37	2	\N	1.8	5760	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	\N	\N	4553	\N	\N	\N	\N	2021-12-02 14:21:22.497475	2021-12-02 14:21:22.497475	\N	\N
2819	4	7033	7	37	2	\N	2	8640	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	\N	\N	4554	\N	\N	\N	\N	2021-12-02 14:21:22.524618	2021-12-02 14:21:22.524618	\N	\N
2820	4	7034	7	37	2	\N	2.5	11520	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	\N	\N	4555	\N	\N	\N	\N	2021-12-02 14:21:22.55166	2021-12-02 14:21:22.55166	\N	\N
2821	4	7035	7	37	2	\N	3	14400	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.9	\N	1	\N	\N	4556	\N	\N	\N	\N	2021-12-02 14:21:22.578587	2021-12-02 14:21:22.578587	\N	\N
2822	4	7036	7	37	3	\N	1	2880	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	\N	\N	4543	\N	\N	\N	\N	2021-12-02 14:21:22.605289	2021-12-02 14:21:22.605289	\N	\N
2823	4	7037	7	37	3	\N	1.3	5760	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	\N	\N	4544	\N	\N	\N	\N	2021-12-02 14:21:22.632162	2021-12-02 14:21:22.632162	\N	\N
2824	4	7038	7	37	3	\N	1.8	7200	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	\N	\N	4545	\N	\N	\N	\N	2021-12-02 14:21:22.659193	2021-12-02 14:21:22.659193	\N	\N
2825	4	7039	7	37	3	\N	2	8640	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	11500	USD	1.7	\N	1	\N	\N	4546	\N	\N	\N	\N	2021-12-02 14:21:22.685612	2021-12-02 14:21:22.685612	\N	\N
2826	4	7040	7	37	3	\N	2.5	10080	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	\N	\N	4547	\N	\N	\N	\N	2021-12-02 14:21:22.718394	2021-12-02 14:21:22.718394	\N	\N
2827	4	7041	7	37	3	\N	3	11500	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	\N	\N	4548	\N	\N	\N	\N	2021-12-02 14:21:22.745392	2021-12-02 14:21:22.745392	\N	\N
2828	4	7042	7	37	4	\N	1	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	4582	\N	\N	\N	\N	2021-12-02 14:21:22.772723	2021-12-02 14:21:22.772723	\N	\N
2829	4	7043	7	37	4	\N	1.2	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	\N	\N	4582	\N	\N	\N	\N	2021-12-02 14:21:22.79992	2021-12-02 14:21:22.79992	\N	\N
2830	4	7044	7	37	5	\N	1	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	\N	\N	4582	\N	\N	\N	\N	2021-12-02 14:21:22.827244	2021-12-02 14:21:22.827244	\N	\N
2831	4	7045	7	37	5	\N	1.2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	4582	\N	\N	\N	\N	2021-12-02 14:21:22.853924	2021-12-02 14:21:22.853924	\N	\N
2832	4	7046	7	37	5	\N	1.8	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	4582	\N	\N	\N	\N	2021-12-02 14:21:22.880529	2021-12-02 14:21:22.880529	\N	\N
2833	4	7047	7	37	5	\N	2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	4582	\N	\N	\N	\N	2021-12-02 14:21:22.907176	2021-12-02 14:21:22.907176	\N	\N
2834	4	7048	7	37	5	\N	2.5	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	4582	\N	\N	\N	\N	2021-12-02 14:21:22.933853	2021-12-02 14:21:22.933853	\N	\N
2835	4	7049	7	38	1	\N	1	1200	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	\N	\N	3548	\N	\N	\N	\N	2021-12-02 14:21:22.960317	2021-12-02 14:21:22.960317	\N	\N
2836	4	7050	7	38	4	\N	1	0	USD	\N	2	4	9	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	\N	\N	3548	\N	\N	\N	\N	2021-12-02 14:21:22.987137	2021-12-02 14:21:22.987137	\N	\N
2837	4	7051	7	39	1	\N	1.2	9587	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	1	\N	\N	7121	\N	\N	\N	\N	2021-12-02 14:21:23.013981	2021-12-02 14:21:23.013981	\N	\N
2838	4	7052	7	39	1	\N	2.4	19174	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	2	\N	\N	7121	\N	\N	\N	\N	2021-12-02 14:21:23.040848	2021-12-02 14:21:23.040848	\N	\N
2839	4	7053	7	39	1	\N	3.6	28760	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	3	\N	\N	7121	\N	\N	\N	\N	2021-12-02 14:21:23.068286	2021-12-02 14:21:23.068286	\N	\N
2840	4	7054	7	39	1	\N	4.8	38347	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	4	\N	\N	7121	\N	\N	\N	\N	2021-12-02 14:21:23.094914	2021-12-02 14:21:23.094914	\N	\N
2841	4	7055	7	39	3	\N	1	2160	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	2160	USD	0.9	\N	1	\N	\N	7141	\N	\N	\N	\N	2021-12-02 14:21:23.121275	2021-12-02 14:21:23.121275	\N	\N
2842	4	7056	7	39	3	\N	1.2	3240	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	3240	USD	1	\N	1	\N	\N	7142	\N	\N	\N	\N	2021-12-02 14:21:23.147752	2021-12-02 14:21:23.147752	\N	\N
2843	4	7057	7	39	3	\N	1.8	6480	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	6480	USD	1.2	\N	1	\N	\N	7144	\N	\N	\N	\N	2021-12-02 14:21:23.174316	2021-12-02 14:21:23.174316	\N	\N
2844	4	7058	7	39	3	\N	2	9720	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	9720	USD	1.3	\N	1	\N	\N	7145	\N	\N	\N	\N	2021-12-02 14:21:23.206991	2021-12-02 14:21:23.206991	\N	\N
2845	4	7059	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	\N	\N	7182	\N	\N	\N	\N	2021-12-02 14:21:23.233829	2021-12-02 14:21:23.233829	\N	\N
2846	4	7060	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	2	\N	\N	7182	\N	\N	\N	\N	2021-12-02 14:21:23.260979	2021-12-02 14:21:23.260979	\N	\N
2847	4	7061	7	39	4	\N	0.6	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	3	\N	\N	7182	\N	\N	\N	\N	2021-12-02 14:21:23.287997	2021-12-02 14:21:23.287997	\N	\N
2848	4	7062	7	39	4	\N	0.8	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	4	\N	\N	7182	\N	\N	\N	\N	2021-12-02 14:21:23.315197	2021-12-02 14:21:23.315197	\N	\N
2849	4	7063	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	7181	\N	\N	\N	\N	2021-12-02 14:21:23.341742	2021-12-02 14:21:23.341742	\N	\N
2850	4	7064	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	7181	\N	\N	\N	\N	2021-12-02 14:21:23.368486	2021-12-02 14:21:23.368486	\N	\N
2851	4	7065	7	39	5	\N	0.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	7181	\N	\N	\N	\N	2021-12-02 14:21:23.426392	2021-12-02 14:21:23.426392	\N	\N
2852	4	7066	7	39	5	\N	0.8	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	\N	\N	7181	\N	\N	\N	\N	2021-12-02 14:21:23.454244	2021-12-02 14:21:23.454244	\N	\N
2853	4	7067	7	40	1	\N	3.3	9600	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	1	\N	\N	7521	\N	\N	\N	\N	2021-12-02 14:21:23.481711	2021-12-02 14:21:23.481711	\N	\N
2854	4	7068	7	40	1	\N	6.6	18000	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	2	\N	\N	7521	\N	\N	\N	\N	2021-12-02 14:21:23.508655	2021-12-02 14:21:23.508655	\N	\N
2855	4	7069	7	40	3	\N	0.8	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	\N	\N	7541	\N	\N	\N	\N	2021-12-02 14:21:23.535464	2021-12-02 14:21:23.535464	\N	\N
2856	4	7070	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1	\N	1	\N	\N	7542	\N	\N	\N	\N	2021-12-02 14:21:23.562489	2021-12-02 14:21:23.562489	\N	\N
2857	4	7071	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	\N	\N	7543	\N	\N	\N	\N	2021-12-02 14:21:23.589747	2021-12-02 14:21:23.589747	\N	\N
2858	4	7072	7	40	3	\N	1.2	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	\N	\N	7544	\N	\N	\N	\N	2021-12-02 14:21:23.61709	2021-12-02 14:21:23.61709	\N	\N
2859	4	7073	7	40	3	\N	1.4	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.4	\N	1	\N	\N	7545	\N	\N	\N	\N	2021-12-02 14:21:23.644413	2021-12-02 14:21:23.644413	\N	\N
2860	4	7074	7	40	3	\N	1.6	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	\N	\N	7546	\N	\N	\N	\N	2021-12-02 14:21:23.671604	2021-12-02 14:21:23.671604	\N	\N
2861	4	7075	7	40	4	\N	0.5	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	2	\N	\N	7582	\N	\N	\N	\N	2021-12-02 14:21:23.698339	2021-12-02 14:21:23.698339	\N	\N
2862	4	7076	7	40	4	\N	0.8	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	4	\N	\N	7582	\N	\N	\N	\N	2021-12-02 14:21:23.725135	2021-12-02 14:21:23.725135	\N	\N
2863	4	7077	7	40	5	\N	0.5	0	USD	\N	29	4	9	35	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	7581	\N	\N	\N	\N	2021-12-02 14:21:23.757706	2021-12-02 14:21:23.757706	\N	\N
2864	4	7078	7	41	1	\N	8.7	28200	USD	\N	30	1	1	36	1	\N	3	\N	\N	0	USD	0	USD	8.7	\N	1	\N	\N	7321	\N	\N	\N	\N	2021-12-02 14:21:23.78485	2021-12-02 14:21:23.78485	\N	\N
2865	4	7079	7	41	2	\N	1	2800	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	2.7	\N	1	\N	\N	7351	\N	\N	\N	\N	2021-12-02 14:21:23.811792	2021-12-02 14:21:23.811792	\N	\N
2866	4	7080	7	41	2	\N	1.1	3120	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.3	\N	1	\N	\N	7352	\N	\N	\N	\N	2021-12-02 14:21:23.838413	2021-12-02 14:21:23.838413	\N	\N
2867	4	7081	7	41	2	\N	1.3	6240	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.9	\N	1	\N	\N	7353	\N	\N	\N	\N	2021-12-02 14:21:23.865551	2021-12-02 14:21:23.865551	\N	\N
2868	4	7082	7	41	2	\N	1.6	9360	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	\N	\N	7354	\N	\N	\N	\N	2021-12-02 14:21:23.892113	2021-12-02 14:21:23.892113	\N	\N
2869	4	7083	7	41	3	\N	1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	\N	\N	7356	\N	\N	\N	\N	2021-12-02 14:21:23.918647	2021-12-02 14:21:23.918647	\N	\N
2870	4	7084	7	41	3	\N	1.1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	\N	\N	7356	\N	\N	\N	\N	2021-12-02 14:21:23.945687	2021-12-02 14:21:23.945687	\N	\N
2871	4	7085	7	41	3	\N	1.3	9360	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	6240	USD	1.3	\N	1	\N	\N	7357	\N	\N	\N	\N	2021-12-02 14:21:23.97275	2021-12-02 14:21:23.97275	\N	\N
2872	4	7086	7	41	3	\N	1.6	12480	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	9360	USD	1.6	\N	1	\N	\N	7358	\N	\N	\N	\N	2021-12-02 14:21:23.999489	2021-12-02 14:21:23.999489	\N	\N
2873	4	7087	7	41	4	\N	1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	\N	\N	7381	\N	\N	\N	\N	2021-12-02 14:21:24.02597	2021-12-02 14:21:24.02597	\N	\N
2874	4	7088	7	41	4	\N	1.1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	7381	\N	\N	\N	\N	2021-12-02 14:21:24.052342	2021-12-02 14:21:24.052342	\N	\N
2875	4	7089	7	41	4	\N	1.3	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	7381	\N	\N	\N	\N	2021-12-02 14:21:24.078979	2021-12-02 14:21:24.078979	\N	\N
2876	4	7090	7	41	5	\N	1	0	USD	\N	30	5	9	36	5	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	7381	\N	\N	\N	\N	2021-12-02 14:21:24.105471	2021-12-02 14:21:24.105471	\N	\N
2877	4	7091	7	42	1	\N	1.5	3600	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	7421	\N	\N	\N	\N	2021-12-02 14:21:24.132374	2021-12-02 14:21:24.132374	\N	\N
2878	4	7092	7	42	1	\N	2.5	7200	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	7421	\N	\N	\N	\N	2021-12-02 14:21:24.159146	2021-12-02 14:21:24.159146	\N	\N
2879	4	7093	7	42	3	\N	0.5	1400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	7421	\N	\N	\N	\N	2021-12-02 14:21:24.18606	2021-12-02 14:21:24.18606	\N	\N
2880	4	7094	7	42	3	\N	1	2400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	7421	\N	\N	\N	\N	2021-12-02 14:21:24.212822	2021-12-02 14:21:24.212822	\N	\N
2881	4	7095	7	42	3	\N	1	3600	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	7421	\N	\N	\N	\N	2021-12-02 14:21:24.245876	2021-12-02 14:21:24.245876	\N	\N
2882	4	7096	7	42	4	\N	0.5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	7482	\N	\N	\N	\N	2021-12-02 14:21:24.271934	2021-12-02 14:21:24.271934	\N	\N
2883	4	7097	7	42	4	\N	5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	7482	\N	\N	\N	\N	2021-12-02 14:21:24.297432	2021-12-02 14:21:24.297432	\N	\N
2884	4	7098	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	7482	\N	\N	\N	\N	2021-12-02 14:21:24.322621	2021-12-02 14:21:24.322621	\N	\N
2885	4	7099	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	7482	\N	\N	\N	\N	2021-12-02 14:21:24.347742	2021-12-02 14:21:24.347742	\N	\N
2886	4	7100	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	\N	\N	7482	\N	\N	\N	\N	2021-12-02 14:21:24.404703	2021-12-02 14:21:24.404703	\N	\N
2887	4	7101	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	\N	\N	7482	\N	\N	\N	\N	2021-12-02 14:21:24.430837	2021-12-02 14:21:24.430837	\N	\N
2888	4	7102	7	39	5	\N	1	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	7181	\N	\N	\N	\N	2021-12-02 14:21:24.457958	2021-12-02 14:21:24.457958	\N	\N
2889	4	7103	7	39	5	\N	1.2	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	7181	\N	\N	\N	\N	2021-12-02 14:21:24.484944	2021-12-02 14:21:24.484944	\N	\N
2890	4	7104	7	39	5	\N	1.4	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	7181	\N	\N	\N	\N	2021-12-02 14:21:24.511864	2021-12-02 14:21:24.511864	\N	\N
2891	4	7105	7	39	5	\N	1.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	7181	\N	\N	\N	\N	2021-12-02 14:21:24.53865	2021-12-02 14:21:24.53865	\N	\N
2892	4	7106	7	43	1	\N	4	17200	USD	\N	1	1	1	38	1	\N	2	\N	\N	0	USD	21000	USD	3.8	\N	1	\N	\N	2523	\N	\N	\N	\N	2021-12-02 14:21:24.565102	2021-12-02 14:21:24.565102	\N	\N
2893	4	7107	7	43	2	\N	1.3	2880	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	\N	\N	2542	\N	\N	\N	\N	2021-12-02 14:21:24.592287	2021-12-02 14:21:24.592287	\N	\N
2894	4	7108	7	43	2	\N	1.8	5760	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	\N	\N	2544	\N	\N	\N	\N	2021-12-02 14:21:24.619451	2021-12-02 14:21:24.619451	\N	\N
2895	4	7109	7	43	2	\N	2	8640	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	\N	\N	2545	\N	\N	\N	\N	2021-12-02 14:21:24.646099	2021-12-02 14:21:24.646099	\N	\N
2896	4	7110	7	43	2	\N	2.5	11520	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	\N	\N	2546	\N	\N	\N	\N	2021-12-02 14:21:24.672852	2021-12-02 14:21:24.672852	\N	\N
2897	4	7111	7	43	2	\N	3	14400	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	\N	\N	2547	\N	\N	\N	\N	2021-12-02 14:21:24.69967	2021-12-02 14:21:24.69967	\N	\N
2898	4	7112	7	43	3	\N	1	2880	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	\N	\N	2550	\N	\N	\N	\N	2021-12-02 14:21:24.726261	2021-12-02 14:21:24.726261	\N	\N
2899	4	7113	7	43	3	\N	1.3	5760	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	\N	\N	2542	\N	\N	\N	\N	2021-12-02 14:21:24.753095	2021-12-02 14:21:24.753095	\N	\N
2900	4	7114	7	43	3	\N	1.8	7200	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	\N	\N	2544	\N	\N	\N	\N	2021-12-02 14:21:24.786291	2021-12-02 14:21:24.786291	\N	\N
2901	4	7115	7	43	3	\N	2	8640	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	\N	\N	2545	\N	\N	\N	\N	2021-12-02 14:21:24.813785	2021-12-02 14:21:24.813785	\N	\N
2902	4	7116	7	43	3	\N	2.5	10080	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	\N	\N	2546	\N	\N	\N	\N	2021-12-02 14:21:24.841015	2021-12-02 14:21:24.841015	\N	\N
2903	4	7117	7	43	3	\N	3	11500	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	\N	\N	2547	\N	\N	\N	\N	2021-12-02 14:21:24.868187	2021-12-02 14:21:24.868187	\N	\N
2904	4	7118	7	43	4	\N	1	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2582	\N	\N	\N	\N	2021-12-02 14:21:24.895231	2021-12-02 14:21:24.895231	\N	\N
2905	4	7119	7	43	4	\N	1.2	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2582	\N	\N	\N	\N	2021-12-02 14:21:24.922089	2021-12-02 14:21:24.922089	\N	\N
2906	4	7120	7	43	5	\N	1	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2582	\N	\N	\N	\N	2021-12-02 14:21:24.948933	2021-12-02 14:21:24.948933	\N	\N
2907	4	7121	7	43	5	\N	1.2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2582	\N	\N	\N	\N	2021-12-02 14:21:24.975322	2021-12-02 14:21:24.975322	\N	\N
2908	4	7122	7	43	5	\N	1.8	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2582	\N	\N	\N	\N	2021-12-02 14:21:25.002089	2021-12-02 14:21:25.002089	\N	\N
2909	4	7123	7	43	5	\N	2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2582	\N	\N	\N	\N	2021-12-02 14:21:25.028602	2021-12-02 14:21:25.028602	\N	\N
2910	4	7124	7	43	5	\N	2.5	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2582	\N	\N	\N	\N	2021-12-02 14:21:25.05489	2021-12-02 14:21:25.05489	\N	\N
2911	4	8000	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	986	\N	\N	\N	\N	2021-12-02 14:21:25.081867	2021-12-02 14:21:25.081867	\N	\N
2912	4	8001	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	986	\N	\N	\N	\N	2021-12-02 14:21:25.108294	2021-12-02 14:21:25.108294	\N	\N
2913	4	8002	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	959	\N	\N	\N	\N	2021-12-02 14:21:25.134753	2021-12-02 14:21:25.134753	\N	\N
2914	4	8003	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	959	\N	\N	\N	\N	2021-12-02 14:21:25.161278	2021-12-02 14:21:25.161278	\N	\N
2915	4	8004	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	959	\N	\N	\N	\N	2021-12-02 14:21:25.187796	2021-12-02 14:21:25.187796	\N	\N
2916	4	8005	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	\N	\N	959	\N	\N	\N	\N	2021-12-02 14:21:25.214608	2021-12-02 14:21:25.214608	\N	\N
2917	4	8006	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	913	\N	\N	\N	\N	2021-12-02 14:21:25.241384	2021-12-02 14:21:25.241384	\N	\N
2918	4	8007	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.274999	2021-12-02 14:21:25.274999	\N	\N
2919	4	8008	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	913	\N	\N	\N	\N	2021-12-02 14:21:25.301199	2021-12-02 14:21:25.301199	\N	\N
2920	4	8009	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.328175	2021-12-02 14:21:25.328175	\N	\N
2921	4	8010	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.387114	2021-12-02 14:21:25.387114	\N	\N
2922	4	8011	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.415004	2021-12-02 14:21:25.415004	\N	\N
2923	4	8012	8	44	22	\N	0.5	0	USD	\N	33	17	16	45	20	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.442567	2021-12-02 14:21:25.442567	\N	\N
2924	4	8013	8	44	23	\N	0.5	0	USD	\N	4	18	17	46	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.469742	2021-12-02 14:21:25.469742	\N	\N
2925	4	8014	8	44	23	\N	0.5	0	USD	\N	4	18	17	47	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.496733	2021-12-02 14:21:25.496733	\N	\N
2926	4	8015	8	44	23	\N	0.5	0	USD	\N	4	18	17	48	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.523505	2021-12-02 14:21:25.523505	\N	\N
2927	4	8016	8	44	23	\N	0.5	0	USD	\N	4	18	17	49	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.550501	2021-12-02 14:21:25.550501	\N	\N
2928	4	8017	8	44	23	\N	0.5	0	USD	\N	4	18	17	50	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.577671	2021-12-02 14:21:25.577671	\N	\N
2929	4	8018	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.604613	2021-12-02 14:21:25.604613	\N	\N
2930	4	8019	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.631226	2021-12-02 14:21:25.631226	\N	\N
2931	4	8020	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.657614	2021-12-02 14:21:25.657614	\N	\N
2932	4	8021	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.684989	2021-12-02 14:21:25.684989	\N	\N
2933	4	8022	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.711892	2021-12-02 14:21:25.711892	\N	\N
2934	4	8023	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.738596	2021-12-02 14:21:25.738596	\N	\N
2935	4	8024	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.765536	2021-12-02 14:21:25.765536	\N	\N
2936	4	8025	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.792425	2021-12-02 14:21:25.792425	\N	\N
2937	4	8026	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.825354	2021-12-02 14:21:25.825354	\N	\N
2938	4	8027	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.852667	2021-12-02 14:21:25.852667	\N	\N
2939	4	8028	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.88013	2021-12-02 14:21:25.88013	\N	\N
2940	4	8029	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	\N	\N	914	\N	\N	\N	\N	2021-12-02 14:21:25.907007	2021-12-02 14:21:25.907007	\N	\N
2941	4	8030	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	6142	\N	\N	\N	\N	2021-12-02 14:21:25.933802	2021-12-02 14:21:25.933802	\N	\N
2942	4	8031	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	6142	\N	\N	\N	\N	2021-12-02 14:21:25.960245	2021-12-02 14:21:25.960245	\N	\N
2943	4	8032	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	6142	\N	\N	\N	\N	2021-12-02 14:21:25.986798	2021-12-02 14:21:25.986798	\N	\N
2944	4	8033	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	\N	\N	6142	\N	\N	\N	\N	2021-12-02 14:21:26.013744	2021-12-02 14:21:26.013744	\N	\N
2945	4	8034	9	45	1	\N	0.5	500	USD	\N	34	1	6	52	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	\N	\N	951	\N	\N	\N	\N	2021-12-02 14:21:26.040635	2021-12-02 14:21:26.040635	\N	\N
2946	4	8035	9	46	1	\N	0.5	500	USD	\N	34	1	6	53	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	\N	\N	952	\N	\N	\N	\N	2021-12-02 14:21:26.067635	2021-12-02 14:21:26.067635	\N	\N
2947	4	8036	9	47	1	\N	1	0	USD	\N	35	1	6	54	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.094512	2021-12-02 14:21:26.094512	\N	\N
2948	4	8037	9	48	1	\N	1	0	USD	\N	36	1	6	55	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.121114	2021-12-02 14:21:26.121114	\N	\N
2949	4	8038	9	49	1	\N	2	500	USD	\N	37	1	6	56	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.14775	2021-12-02 14:21:26.14775	\N	\N
2950	4	8039	9	50	1	\N	0.5	0	USD	\N	38	1	6	57	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.174316	2021-12-02 14:21:26.174316	\N	\N
2951	4	8040	9	51	1	\N	0.5	0	USD	\N	34	1	6	58	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.20126	2021-12-02 14:21:26.20126	\N	\N
2952	4	8041	9	52	1	\N	0.5	0	USD	\N	39	1	6	59	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.227578	2021-12-02 14:21:26.227578	\N	\N
2953	4	8042	9	53	1	\N	0.5	0	USD	\N	40	1	6	60	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.254012	2021-12-02 14:21:26.254012	\N	\N
2954	4	8043	9	54	1	\N	0.5	0	USD	\N	41	1	6	61	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.280591	2021-12-02 14:21:26.280591	\N	\N
2955	4	8044	9	55	1	\N	0.5	0	USD	\N	42	1	6	62	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.345311	2021-12-02 14:21:26.345311	\N	\N
2956	4	8045	9	56	1	\N	0.5	0	USD	\N	32	1	6	63	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.374258	2021-12-02 14:21:26.374258	\N	\N
2957	4	8046	9	57	1	\N	0.5	0	USD	\N	43	1	6	64	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.40193	2021-12-02 14:21:26.40193	\N	\N
2958	4	8047	9	58	1	\N	2	500	USD	\N	43	1	6	65	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.429342	2021-12-02 14:21:26.429342	\N	\N
2959	4	8048	9	59	1	\N	0.5	0	USD	\N	44	1	6	66	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	\N	\N	956	\N	\N	\N	\N	2021-12-02 14:21:26.456385	2021-12-02 14:21:26.456385	\N	\N
2960	4	8049	9	60	8	\N	0.5	300	USD	\N	45	8	7	67	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	985	\N	\N	\N	\N	2021-12-02 14:21:26.483634	2021-12-02 14:21:26.483634	\N	\N
2961	4	8050	9	61	8	\N	0.5	0	USD	\N	46	8	7	68	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	985	\N	\N	\N	\N	2021-12-02 14:21:26.510533	2021-12-02 14:21:26.510533	\N	\N
2962	4	8051	9	62	8	\N	0.5	0	USD	\N	37	8	7	69	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	985	\N	\N	\N	\N	2021-12-02 14:21:26.537879	2021-12-02 14:21:26.537879	\N	\N
2963	4	8052	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.564876	2021-12-02 14:21:26.564876	\N	\N
2964	4	8053	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.59163	2021-12-02 14:21:26.59163	\N	\N
2965	4	8054	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.618447	2021-12-02 14:21:26.618447	\N	\N
2966	4	8055	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.645124	2021-12-02 14:21:26.645124	\N	\N
2967	4	8056	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.672108	2021-12-02 14:21:26.672108	\N	\N
2968	4	8057	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.699279	2021-12-02 14:21:26.699279	\N	\N
2969	4	8058	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.726216	2021-12-02 14:21:26.726216	\N	\N
2970	4	8059	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.752428	2021-12-02 14:21:26.752428	\N	\N
2971	4	8060	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.77874	2021-12-02 14:21:26.77874	\N	\N
2972	4	8061	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.804893	2021-12-02 14:21:26.804893	\N	\N
2973	4	8062	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.831187	2021-12-02 14:21:26.831187	\N	\N
2974	4	8063	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.863484	2021-12-02 14:21:26.863484	\N	\N
2975	4	8064	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.890001	2021-12-02 14:21:26.890001	\N	\N
2976	4	8065	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.916545	2021-12-02 14:21:26.916545	\N	\N
2977	4	8066	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.943059	2021-12-02 14:21:26.943059	\N	\N
2978	4	8067	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.969383	2021-12-02 14:21:26.969383	\N	\N
2979	4	8068	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:26.996998	2021-12-02 14:21:26.996998	\N	\N
2980	4	8069	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.024532	2021-12-02 14:21:27.024532	\N	\N
2981	4	8070	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.050855	2021-12-02 14:21:27.050855	\N	\N
2982	4	8071	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.077594	2021-12-02 14:21:27.077594	\N	\N
2983	4	8072	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.104126	2021-12-02 14:21:27.104126	\N	\N
2984	4	8073	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.130654	2021-12-02 14:21:27.130654	\N	\N
2985	4	8074	10	63	27	\N	0.5	1200	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.157588	2021-12-02 14:21:27.157588	\N	\N
2986	4	8075	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.184069	2021-12-02 14:21:27.184069	\N	\N
2987	4	8076	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.210562	2021-12-02 14:21:27.210562	\N	\N
2988	4	8077	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.237119	2021-12-02 14:21:27.237119	\N	\N
2989	4	8078	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.263441	2021-12-02 14:21:27.263441	\N	\N
2990	4	8079	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.323096	2021-12-02 14:21:27.323096	\N	\N
2991	4	8080	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.350282	2021-12-02 14:21:27.350282	\N	\N
2992	4	8081	10	63	27	\N	2	1500	USD	\N	4	19	1	6	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	\N	\N	911	\N	\N	\N	\N	2021-12-02 14:21:27.383817	2021-12-02 14:21:27.383817	\N	\N
2993	4	8090	9	64	28	\N	16	67500	USD	\N	4	6	1	6	24	\N	3	\N	\N	0	USD	67500	USD	16	\N	1	\N	\N	9999	\N	\N	\N	\N	2021-12-02 14:21:27.410512	2021-12-02 14:21:27.410512	\N	\N
2994	4	8091	9	64	29	\N	3	157500	USD	\N	4	1	1	6	1	\N	3	\N	\N	0	USD	157500	USD	3	\N	1	\N	\N	9999	\N	\N	\N	\N	2021-12-02 14:21:27.437072	2021-12-02 14:21:27.437072	\N	\N
2995	4	8100	11	65	30	\N	1	0	USD	\N	4	5	1	6	25	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	909	\N	\N	\N	\N	2021-12-02 14:21:27.463537	2021-12-02 14:21:27.463537	\N	\N
2996	4	8101	11	65	31	\N	0.5	0	USD	\N	4	5	1	6	19	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	\N	\N	909	\N	\N	\N	\N	2021-12-02 14:21:27.490411	2021-12-02 14:21:27.490411	\N	\N
2997	4	9001	12	66	1	\N	1.2	10000	USD	\N	47	1	21	72	26	\N	3	\N	\N	0	USD	800	USD	0.3	\N	1	\N	\N	2326	\N	\N	\N	\N	2021-12-02 14:21:27.517205	2021-12-02 14:21:27.517205	\N	\N
2998	4	9002	12	66	3	\N	1.2	800	USD	\N	47	3	21	72	27	\N	3	\N	\N	0	USD	800	USD	0.3	\N	2	\N	\N	2326	\N	\N	\N	\N	2021-12-02 14:21:27.544141	2021-12-02 14:21:27.544141	\N	\N
2999	4	9003	12	66	32	\N	1.2	800	USD	\N	47	6	9	72	28	\N	3	\N	\N	0	USD	800	USD	0.3	\N	3	\N	\N	2326	\N	\N	\N	\N	2021-12-02 14:21:27.570902	2021-12-02 14:21:27.570902	\N	\N
3000	4	9004	12	66	7	\N	1.2	800	USD	\N	47	8	9	72	29	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	\N	\N	2326	\N	\N	\N	\N	2021-12-02 14:21:27.597892	2021-12-02 14:21:27.597892	\N	\N
3001	4	9005	12	66	33	\N	1.2	800	USD	\N	47	10	9	72	30	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	\N	\N	2326	\N	\N	\N	\N	2021-12-02 14:21:27.624761	2021-12-02 14:21:27.624761	\N	\N
3002	4	9006	12	66	34	\N	1.2	800	USD	\N	47	11	9	72	31	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	\N	\N	2326	\N	\N	\N	\N	2021-12-02 14:21:27.651485	2021-12-02 14:21:27.651485	\N	\N
3003	4	9007	12	66	5	\N	1.2	800	USD	\N	47	5	9	72	32	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	\N	\N	2326	\N	\N	\N	\N	2021-12-02 14:21:27.678147	2021-12-02 14:21:27.678147	\N	\N
3004	4	9008	12	66	35	\N	1.2	800	USD	\N	47	20	5	72	33	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	\N	\N	2326	\N	\N	\N	\N	2021-12-02 14:21:27.704392	2021-12-02 14:21:27.704392	\N	\N
3005	4	9009	12	67	1	\N	1.2	10000	USD	\N	48	1	9	73	26	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	\N	\N	6970	\N	\N	\N	\N	2021-12-02 14:21:27.731181	2021-12-02 14:21:27.731181	\N	\N
3006	4	9010	12	67	2	\N	1.2	3000	USD	\N	48	2	9	73	34	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	\N	\N	6970	\N	\N	\N	\N	2021-12-02 14:21:27.757926	2021-12-02 14:21:27.757926	\N	\N
3007	4	9011	12	67	3	\N	1.2	3000	USD	\N	48	3	9	73	27	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	\N	\N	6970	\N	\N	\N	\N	2021-12-02 14:21:27.784493	2021-12-02 14:21:27.784493	\N	\N
3008	4	9012	12	67	7	\N	1.2	800	USD	\N	48	8	7	73	29	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	\N	\N	6970	\N	\N	\N	\N	2021-12-02 14:21:27.810916	2021-12-02 14:21:27.810916	\N	\N
3009	4	9013	12	67	5	\N	1.2	0	USD	\N	48	5	2	73	32	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	\N	\N	6970	\N	\N	\N	\N	2021-12-02 14:21:27.837239	2021-12-02 14:21:27.837239	\N	\N
3010	4	9014	12	67	36	\N	1.2	200	USD	\N	48	7	9	73	35	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	\N	\N	6970	\N	\N	\N	\N	2021-12-02 14:21:27.863764	2021-12-02 14:21:27.863764	\N	\N
3011	4	9015	12	68	1	\N	1.2	8000	USD	\N	49	1	9	74	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:27.896339	2021-12-02 14:21:27.896339	\N	\N
3012	4	9016	12	68	2	\N	1.2	1000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:27.923033	2021-12-02 14:21:27.923033	\N	\N
3013	4	9017	12	68	2	\N	1.2	2000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:27.94959	2021-12-02 14:21:27.94959	\N	\N
3014	4	9018	12	68	2	\N	1.2	3000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:27.976263	2021-12-02 14:21:27.976263	\N	\N
3015	4	9019	12	68	2	\N	1.2	4000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:28.00289	2021-12-02 14:21:28.00289	\N	\N
3016	4	9020	12	68	7	\N	1.2	800	USD	\N	49	8	9	74	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:28.029945	2021-12-02 14:21:28.029945	\N	\N
3017	4	9021	12	69	2	\N	1.2	800	USD	\N	21	2	9	75	34	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:28.056431	2021-12-02 14:21:28.056431	\N	\N
3018	4	9022	12	70	1	\N	1.2	8000	USD	\N	50	1	9	76	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:28.082931	2021-12-02 14:21:28.082931	\N	\N
3019	4	9023	12	70	2	\N	1.2	1000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:28.109582	2021-12-02 14:21:28.109582	\N	\N
3020	4	9024	12	70	2	\N	1.2	2000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:28.136005	2021-12-02 14:21:28.136005	\N	\N
3021	4	9025	12	70	2	\N	1.2	3000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:28.162485	2021-12-02 14:21:28.162485	\N	\N
3022	4	9026	12	70	2	\N	1.2	4000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	\N	\N	5722	\N	\N	\N	\N	2021-12-02 14:21:28.188719	2021-12-02 14:21:28.188719	\N	\N
3023	4	9027	12	70	7	\N	1.2	800	USD	\N	50	8	9	76	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	\N	\N	5731	\N	\N	\N	\N	2021-12-02 14:21:28.247164	2021-12-02 14:21:28.247164	\N	\N
3024	4	9028	12	71	1	\N	1	6500	USD	\N	51	1	9	77	26	\N	3	\N	\N	0	USD	5000	USD	0.9	\N	1	\N	\N	5221	\N	\N	\N	\N	2021-12-02 14:21:28.274494	2021-12-02 14:21:28.274494	\N	\N
3025	4	9029	12	71	33	\N	1	300	USD	\N	51	10	1	77	30	\N	3	\N	\N	0	USD	0	USD	0.9	\N	1	\N	\N	5221	\N	\N	\N	\N	2021-12-02 14:21:28.301895	2021-12-02 14:21:28.301895	\N	\N
3026	4	9030	12	71	5	\N	0.5	300	USD	\N	51	5	2	77	32	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	\N	\N	5281	\N	\N	\N	\N	2021-12-02 14:21:28.32872	2021-12-02 14:21:28.32872	\N	\N
3027	4	9031	12	72	1	\N	1	6500	USD	\N	19	1	9	78	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	5222	\N	\N	\N	\N	2021-12-02 14:21:28.355145	2021-12-02 14:21:28.355145	\N	\N
3028	4	9032	12	72	5	\N	0.5	300	USD	\N	19	5	9	78	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	\N	\N	5222	\N	\N	\N	\N	2021-12-02 14:21:28.38173	2021-12-02 14:21:28.38173	\N	\N
3029	4	9033	12	73	32	\N	1.4	1920	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.414906	2021-12-02 14:21:28.414906	\N	\N
3030	4	9034	12	73	32	\N	1.5	2160	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	\N	\N	3312	\N	\N	\N	\N	2021-12-02 14:21:28.442284	2021-12-02 14:21:28.442284	\N	\N
3031	4	9035	12	73	32	\N	1.6	2400	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	\N	\N	3313	\N	\N	\N	\N	2021-12-02 14:21:28.469313	2021-12-02 14:21:28.469313	\N	\N
3032	4	9036	12	73	32	\N	1.8	2880	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	\N	\N	3314	\N	\N	\N	\N	2021-12-02 14:21:28.496678	2021-12-02 14:21:28.496678	\N	\N
3033	4	9037	12	73	7	\N	1.2	800	USD	\N	52	8	9	79	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.523806	2021-12-02 14:21:28.523806	\N	\N
3034	4	9038	12	73	37	\N	1.5	2800	USD	\N	52	21	9	79	36	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.550604	2021-12-02 14:21:28.550604	\N	\N
3035	4	9039	12	73	5	\N	1	0	USD	\N	52	5	2	79	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.577603	2021-12-02 14:21:28.577603	\N	\N
3036	4	9040	12	74	38	\N	0.5	1000	USD	\N	53	22	1	80	37	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.604617	2021-12-02 14:21:28.604617	\N	\N
3037	4	9041	12	75	39	\N	1.5	1200	USD	\N	54	23	19	81	38	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.631874	2021-12-02 14:21:28.631874	\N	\N
3038	4	9042	12	75	32	\N	1.4	1920	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.659051	2021-12-02 14:21:28.659051	\N	\N
3039	4	9043	12	75	32	\N	1.5	2160	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	\N	\N	3312	\N	\N	\N	\N	2021-12-02 14:21:28.685989	2021-12-02 14:21:28.685989	\N	\N
3040	4	9044	12	75	32	\N	1.6	2400	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	\N	\N	3313	\N	\N	\N	\N	2021-12-02 14:21:28.712492	2021-12-02 14:21:28.712492	\N	\N
3041	4	9045	12	75	32	\N	1.8	2880	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	\N	\N	3314	\N	\N	\N	\N	2021-12-02 14:21:28.738682	2021-12-02 14:21:28.738682	\N	\N
3042	4	9046	12	75	7	\N	1.2	800	USD	\N	54	8	22	81	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.764641	2021-12-02 14:21:28.764641	\N	\N
3043	4	9047	12	75	40	\N	1.2	800	USD	\N	54	18	19	81	39	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.791527	2021-12-02 14:21:28.791527	\N	\N
3044	4	9048	12	75	5	\N	1	0	USD	\N	54	5	2	81	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.818048	2021-12-02 14:21:28.818048	\N	\N
3045	4	9049	12	75	36	\N	1	600	USD	\N	54	7	3	81	35	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	\N	\N	3311	\N	\N	\N	\N	2021-12-02 14:21:28.844384	2021-12-02 14:21:28.844384	\N	\N
3046	4	9050	12	76	32	\N	1	600	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	1900	USD	0.4	\N	1	\N	\N	6501	\N	\N	\N	\N	2021-12-02 14:21:28.871287	2021-12-02 14:21:28.871287	\N	\N
3047	4	9051	12	76	32	\N	1.4	1920	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	2400	USD	0.9	\N	1	\N	\N	6502	\N	\N	\N	\N	2021-12-02 14:21:28.898257	2021-12-02 14:21:28.898257	\N	\N
3048	4	9052	12	76	32	\N	1.5	2160	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	3500	USD	1.3	\N	1	\N	\N	6511	\N	\N	\N	\N	2021-12-02 14:21:28.930732	2021-12-02 14:21:28.930732	\N	\N
3049	4	9053	12	76	32	\N	1.6	2400	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	5500	USD	1.7	\N	1	\N	\N	6512	\N	\N	\N	\N	2021-12-02 14:21:28.95791	2021-12-02 14:21:28.95791	\N	\N
3050	4	9054	12	76	32	\N	1.8	2880	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	7500	USD	2.1	\N	1	\N	\N	6513	\N	\N	\N	\N	2021-12-02 14:21:28.984763	2021-12-02 14:21:28.984763	\N	\N
3051	4	9055	12	76	40	\N	1.2	800	USD	\N	4	18	19	82	39	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	\N	\N	6501	\N	\N	\N	\N	2021-12-02 14:21:29.012395	2021-12-02 14:21:29.012395	\N	\N
3052	4	9056	12	76	5	\N	1	0	USD	\N	4	5	2	82	32	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	\N	\N	6501	\N	\N	\N	\N	2021-12-02 14:21:29.039396	2021-12-02 14:21:29.039396	\N	\N
3053	4	9057	12	76	36	\N	1	600	USD	\N	4	7	3	82	35	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	\N	\N	6501	\N	\N	\N	\N	2021-12-02 14:21:29.066256	2021-12-02 14:21:29.066256	\N	\N
3054	4	9058	12	77	1	\N	3	21000	USD	\N	55	1	9	83	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	\N	\N	6243	\N	\N	\N	\N	2021-12-02 14:21:29.092909	2021-12-02 14:21:29.092909	\N	\N
3055	4	9059	12	77	2	\N	1	3000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	\N	\N	6241	\N	\N	\N	\N	2021-12-02 14:21:29.119364	2021-12-02 14:21:29.119364	\N	\N
3056	4	9060	12	77	2	\N	2	6000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.145747	2021-12-02 14:21:29.145747	\N	\N
3057	4	9061	12	77	2	\N	3	9000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.172216	2021-12-02 14:21:29.172216	\N	\N
3058	4	9062	12	77	2	\N	3.5	12000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.231577	2021-12-02 14:21:29.231577	\N	\N
3059	4	9063	12	77	5	\N	1	0	USD	\N	55	5	2	83	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.259095	2021-12-02 14:21:29.259095	\N	\N
3060	4	9064	12	77	41	\N	1	600	USD	\N	55	4	3	83	40	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.286743	2021-12-02 14:21:29.286743	\N	\N
3061	4	9065	12	77	36	\N	0.5	300	USD	\N	55	7	3	83	35	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.313471	2021-12-02 14:21:29.313471	\N	\N
3062	4	9066	12	78	1	\N	3	21000	USD	\N	56	1	3	84	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	\N	\N	6243	\N	\N	\N	\N	2021-12-02 14:21:29.340071	2021-12-02 14:21:29.340071	\N	\N
3063	4	9067	12	78	2	\N	1	3000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	\N	\N	6241	\N	\N	\N	\N	2021-12-02 14:21:29.366767	2021-12-02 14:21:29.366767	\N	\N
3064	4	9068	12	78	2	\N	2	6000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.393654	2021-12-02 14:21:29.393654	\N	\N
3065	4	9069	12	78	2	\N	3	9000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.421487	2021-12-02 14:21:29.421487	\N	\N
3066	4	9070	12	78	2	\N	3.5	12000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.454535	2021-12-02 14:21:29.454535	\N	\N
3067	4	9071	12	78	7	\N	1.2	800	USD	\N	56	8	5	84	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.481259	2021-12-02 14:21:29.481259	\N	\N
3068	4	9072	12	78	5	\N	1	0	USD	\N	56	5	5	84	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.508291	2021-12-02 14:21:29.508291	\N	\N
3069	4	9073	12	78	35	\N	1	600	USD	\N	56	20	9	84	33	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.535627	2021-12-02 14:21:29.535627	\N	\N
3070	4	9074	12	79	1	\N	3	21000	USD	\N	57	1	9	85	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	\N	\N	6243	\N	\N	\N	\N	2021-12-02 14:21:29.56218	2021-12-02 14:21:29.56218	\N	\N
3071	4	9075	12	79	2	\N	1	3000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	\N	\N	6241	\N	\N	\N	\N	2021-12-02 14:21:29.588863	2021-12-02 14:21:29.588863	\N	\N
3072	4	9076	12	79	2	\N	2	6000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.616084	2021-12-02 14:21:29.616084	\N	\N
3073	4	9077	12	79	2	\N	3	9000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.642841	2021-12-02 14:21:29.642841	\N	\N
3074	4	9078	12	79	2	\N	3.5	12000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	\N	\N	6242	\N	\N	\N	\N	2021-12-02 14:21:29.669951	2021-12-02 14:21:29.669951	\N	\N
3075	4	9079	12	79	7	\N	1.2	800	USD	\N	57	8	9	85	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.696673	2021-12-02 14:21:29.696673	\N	\N
3076	4	9080	12	79	5	\N	1	0	USD	\N	57	5	2	85	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.723333	2021-12-02 14:21:29.723333	\N	\N
3077	4	9081	12	79	42	\N	1	600	USD	\N	57	4	9	85	41	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.750215	2021-12-02 14:21:29.750215	\N	\N
3078	4	9082	12	79	36	\N	0.5	300	USD	\N	57	7	9	85	35	\N	3	\N	\N	0	USD	500	USD	0.5	\N	2	\N	\N	6281	\N	\N	\N	\N	2021-12-02 14:21:29.776903	2021-12-02 14:21:29.776903	\N	\N
3079	4	9083	12	80	1	\N	1	5000	USD	\N	58	1	9	86	26	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	\N	\N	3920	\N	\N	\N	\N	2021-12-02 14:21:29.803735	2021-12-02 14:21:29.803735	\N	\N
3080	4	9084	12	80	7	\N	0.5	500	USD	\N	58	8	9	86	29	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	\N	\N	3920	\N	\N	\N	\N	2021-12-02 14:21:29.830077	2021-12-02 14:21:29.830077	\N	\N
3081	4	9085	12	80	5	\N	0.5	0	USD	\N	58	5	9	86	32	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	\N	\N	3920	\N	\N	\N	\N	2021-12-02 14:21:29.856332	2021-12-02 14:21:29.856332	\N	\N
3082	4	9086	12	81	1	\N	1	5000	USD	\N	59	1	9	87	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2424	\N	\N	\N	\N	2021-12-02 14:21:29.883049	2021-12-02 14:21:29.883049	\N	\N
3083	4	9087	12	81	33	\N	0.5	500	USD	\N	59	10	1	87	30	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	\N	\N	2424	\N	\N	\N	\N	2021-12-02 14:21:29.910011	2021-12-02 14:21:29.910011	\N	\N
3084	4	9088	12	81	5	\N	7	0	USD	\N	59	5	2	87	32	\N	3	\N	\N	0	USD	0	USD	0.7	\N	7	\N	\N	2424	\N	\N	\N	\N	2021-12-02 14:21:29.936556	2021-12-02 14:21:29.936556	\N	\N
\.


--
-- Data for Name: customer_repair_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_repair_lists (id, customer_id, name, is_active, created_at, updated_at) FROM stdin;
3	2	Maersk Version 1	t	2021-12-02 14:07:14.094563	2021-12-02 14:07:14.094563
4	1	Version 3	f	2021-12-02 14:20:35.961292	2021-12-03 07:03:29.740213
2	1	Version 3	f	2021-12-02 13:37:00.735349	2021-12-03 07:11:26.816753
1	1	Norman Version 1	f	2021-12-02 13:14:25.059574	2021-12-03 07:13:45.976447
5	1	Norman Version 3	t	2021-12-03 07:11:26.822883	2021-12-03 07:13:45.979431
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, full_name, owner_name, billing_name, hourly_rate_cents, hourly_rate_currency, gst, pst, city_id, province_id, address, zipcode, customer_type, is_active, created_at, updated_at, billing_type, approval_type) FROM stdin;
1	nishanth@umm.digital	$2a$12$t.yhHzf8mPyMUmTPmI.0b.HcbMivoIIcqZ5XHlfOr0EthmjWOoeVG	\N	\N	\N	Norman	Norman	Biller	12000	USD	12	12	5	5	New Street	765321	\N	t	2021-12-02 13:14:25.046506	2021-12-02 13:14:25.046506	\N	\N
2	maersk@test.com	$2a$12$/QIcEBBVQEzmOce2EMDRqeA0BSM1m81kYaavz81kwnDtwxrrwg0aa	\N	\N	\N	Maersk	Manager Maersk	Maersk Inc.	2500	USD	20	\N	3	3	Big town	ZXB441R	\N	t	2021-12-02 14:07:14.089972	2021-12-02 14:07:14.089972	\N	\N
\.


--
-- Data for Name: dams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dams (id, name, created_at, updated_at, description) FROM stdin;
3	CU	2021-12-02 12:49:10.140423	2021-12-02 12:49:10.140423	\N
7	LO	2021-12-02 12:49:10.155106	2021-12-02 12:49:10.155106	\N
8	FZ	2021-12-02 12:49:10.158965	2021-12-02 12:49:10.158965	\N
9	CK	2021-12-02 12:49:10.16266	2021-12-02 12:49:10.16266	\N
10	DH	2021-12-02 12:49:10.166581	2021-12-02 12:49:10.166581	\N
11	DL	2021-12-02 12:49:10.170277	2021-12-02 12:49:10.170277	\N
12	DB	2021-12-02 12:49:10.173863	2021-12-02 12:49:10.173863	\N
13	ML	2021-12-02 12:49:10.177566	2021-12-02 12:49:10.177566	\N
14	DY	2021-12-02 12:49:10.181232	2021-12-02 12:49:10.181232	\N
15	OS	2021-12-02 12:49:10.184921	2021-12-02 12:49:10.184921	\N
16	OD	2021-12-02 12:49:10.18856	2021-12-02 12:49:10.18856	\N
18	SR	2021-12-02 12:49:10.195754	2021-12-02 12:49:10.195754	\N
19	CO	2021-12-02 12:49:10.199415	2021-12-02 12:49:10.199415	\N
20	RP	2021-12-02 12:49:10.21582	2021-12-02 12:49:10.21582	\N
21	CD	2021-12-02 12:49:10.221145	2021-12-02 12:49:10.221145	\N
22	PH	2021-12-02 12:49:10.224845	2021-12-02 12:49:10.224845	\N
17	FQ	2021-12-02 12:49:10.192203	2021-12-02 12:49:10.257079	Malt Can Preparation
5	DT	2021-12-02 12:49:10.147632	2021-12-02 12:49:10.528377	Front Corner Post – Straighten
6	MS	2021-12-02 12:49:10.151442	2021-12-02 12:49:10.266683	Decals - Replace - Up to three digits (number)
4	HO	2021-12-02 12:49:10.143954	2021-12-02 12:49:10.542115	Side Panel - Insert - 450x200x1.6 mm (or 2.0 mm for first panel)
2	BT	2021-12-02 12:49:10.136953	2021-12-02 12:49:10.443322	Front Header Incl. Extension Plates - Straighten
1	BR	2021-12-02 12:49:10.132919	2021-12-02 12:49:10.496405	Front Sill - Section - 150 mm
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, created_at, updated_at) FROM stdin;
1	Replace	2021-12-02 12:49:10.55489	2021-12-02 12:49:10.55489
2	Section	2021-12-02 12:49:10.558924	2021-12-02 12:49:10.558924
3	Insert	2021-12-02 12:49:10.562792	2021-12-02 12:49:10.562792
4	Straighten And Weld	2021-12-02 12:49:10.566641	2021-12-02 12:49:10.566641
5	Straighten	2021-12-02 12:49:10.570227	2021-12-02 12:49:10.570227
6	Insert/Patch	2021-12-02 12:49:10.573747	2021-12-02 12:49:10.573747
7	Weld	2021-12-02 12:49:10.577338	2021-12-02 12:49:10.577338
8	Resecure	2021-12-02 12:49:10.580964	2021-12-02 12:49:10.580964
9	Outer	2021-12-02 12:49:10.584512	2021-12-02 12:49:10.584512
10	Fasten	2021-12-02 12:49:10.588217	2021-12-02 12:49:10.588217
11	Free Up	2021-12-02 12:49:10.591893	2021-12-02 12:49:10.591893
12	Remove And Refit	2021-12-02 12:49:10.595424	2021-12-02 12:49:10.595424
13	Section/Replace	2021-12-02 12:49:10.599108	2021-12-02 12:49:10.599108
14	Seal/Reseal	2021-12-02 12:49:10.60268	2021-12-02 12:49:10.60268
15	Grind/Sanding	2021-12-02 12:49:10.606356	2021-12-02 12:49:10.606356
16	Remove	2021-12-02 12:49:10.612422	2021-12-02 12:49:10.612422
17	Sweeping	2021-12-02 12:49:10.615942	2021-12-02 12:49:10.615942
18	Washing	2021-12-02 12:49:10.619751	2021-12-02 12:49:10.619751
19	Chemical Clean	2021-12-02 12:49:10.623471	2021-12-02 12:49:10.623471
20	Deodorize	2021-12-02 12:49:10.627151	2021-12-02 12:49:10.627151
21	Upgrade	2021-12-02 12:49:10.630862	2021-12-02 12:49:10.630862
22	Refasten	2021-12-02 12:49:10.634475	2021-12-02 12:49:10.634475
23	Food Upgrade	2021-12-02 12:49:10.638111	2021-12-02 12:49:10.638111
24	Paint	2021-12-02 12:49:10.642016	2021-12-02 12:49:10.642016
25	Inspection	2021-12-02 12:49:10.64562	2021-12-02 12:49:10.64562
26	REPLACE	2021-12-02 12:49:10.649328	2021-12-02 12:49:10.649328
27	INSERT	2021-12-02 12:49:10.65335	2021-12-02 12:49:10.65335
28	PATCH	2021-12-02 12:49:10.656999	2021-12-02 12:49:10.656999
29	RESECURE	2021-12-02 12:49:10.66087	2021-12-02 12:49:10.66087
30	REMOVE AND REFIT	2021-12-02 12:49:10.664496	2021-12-02 12:49:10.664496
31	SEAL	2021-12-02 12:49:10.668098	2021-12-02 12:49:10.668098
32	STRAIGHTEN	2021-12-02 12:49:10.672073	2021-12-02 12:49:10.672073
33	STRAIGHTEN AND RESECURE	2021-12-02 12:49:10.675666	2021-12-02 12:49:10.675666
34	SECTION	2021-12-02 12:49:10.679288	2021-12-02 12:49:10.679288
35	WELD	2021-12-02 12:49:10.68316	2021-12-02 12:49:10.68316
36	PATCH & FOAM	2021-12-02 12:49:10.686884	2021-12-02 12:49:10.686884
37	FOAM	2021-12-02 12:49:10.690358	2021-12-02 12:49:10.690358
38	ABRADE AND PAINT	2021-12-02 12:49:10.693887	2021-12-02 12:49:10.693887
39	SURFACE PREPARATION AND PAINT	2021-12-02 12:49:10.697405	2021-12-02 12:49:10.697405
40	STRAIGHTEN AND WELD	2021-12-02 12:49:10.700899	2021-12-02 12:49:10.700899
41	STRAIGHTEN & WELD	2021-12-02 12:49:10.717453	2021-12-02 12:49:10.717453
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, title, created_by, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: lengths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lengths (id, name, created_at, updated_at) FROM stdin;
1	20.0	2021-12-02 12:49:09.089732	2021-12-02 12:49:09.089732
2	40.0	2021-12-02 12:49:09.093608	2021-12-02 12:49:09.093608
3	15.0	2021-12-02 12:49:09.099724	2021-12-02 12:49:09.099724
4	30.0	2021-12-02 12:49:09.103416	2021-12-02 12:49:09.103416
5	60.0	2021-12-02 12:49:09.106875	2021-12-02 12:49:09.106875
6	90.0	2021-12-02 12:49:09.110635	2021-12-02 12:49:09.110635
7	120.0	2021-12-02 12:49:09.114232	2021-12-02 12:49:09.114232
8	150.0	2021-12-02 12:49:09.117888	2021-12-02 12:49:09.117888
9	200.0	2021-12-02 12:49:09.121422	2021-12-02 12:49:09.121422
10	10.0	2021-12-02 12:49:09.125047	2021-12-02 12:49:09.125047
11	1.0	2021-12-02 12:49:09.128652	2021-12-02 12:49:09.128652
12	110.0	2021-12-02 12:49:09.132304	2021-12-02 12:49:09.132304
13	45.0	2021-12-02 12:49:09.136118	2021-12-02 12:49:09.136118
14	55.0	2021-12-02 12:49:09.139696	2021-12-02 12:49:09.139696
15	65.0	2021-12-02 12:49:09.143213	2021-12-02 12:49:09.143213
16	80.0	2021-12-02 12:49:09.146671	2021-12-02 12:49:09.146671
17	100.0	2021-12-02 12:49:09.150222	2021-12-02 12:49:09.150222
18	180.0	2021-12-02 12:49:09.153839	2021-12-02 12:49:09.153839
19	240.0	2021-12-02 12:49:09.157368	2021-12-02 12:49:09.157368
20	300.0	2021-12-02 12:49:09.161153	2021-12-02 12:49:09.161153
21	360.0	2021-12-02 12:49:09.164765	2021-12-02 12:49:09.164765
22	420.0	2021-12-02 12:49:09.168328	2021-12-02 12:49:09.168328
23	480.0	2021-12-02 12:49:09.189041	2021-12-02 12:49:09.189041
24	540.0	2021-12-02 12:49:09.193126	2021-12-02 12:49:09.193126
25	600.0	2021-12-02 12:49:09.197034	2021-12-02 12:49:09.197034
26	270.0	2021-12-02 12:49:09.200954	2021-12-02 12:49:09.200954
27	2.0	2021-12-02 12:49:09.204572	2021-12-02 12:49:09.204572
28	3.0	2021-12-02 12:49:09.208247	2021-12-02 12:49:09.208247
29	4.0	2021-12-02 12:49:09.211957	2021-12-02 12:49:09.211957
30	5.0	2021-12-02 12:49:09.215742	2021-12-02 12:49:09.215742
31	6.0	2021-12-02 12:49:09.219464	2021-12-02 12:49:09.219464
32	7.0	2021-12-02 12:49:09.223419	2021-12-02 12:49:09.223419
33	8.0	2021-12-02 12:49:09.227126	2021-12-02 12:49:09.227126
34	210.0	2021-12-02 12:49:09.230949	2021-12-02 12:49:09.230949
35	12.0	2021-12-02 12:49:09.234564	2021-12-02 12:49:09.234564
36	24.0	2021-12-02 12:49:09.238223	2021-12-02 12:49:09.238223
37	36.0	2021-12-02 12:49:09.242023	2021-12-02 12:49:09.242023
38	48.0	2021-12-02 12:49:09.245722	2021-12-02 12:49:09.245722
39	72.0	2021-12-02 12:49:09.249523	2021-12-02 12:49:09.249523
40	84.0	2021-12-02 12:49:09.253194	2021-12-02 12:49:09.253194
41	96.0	2021-12-02 12:49:09.256787	2021-12-02 12:49:09.256787
42	108.0	2021-12-02 12:49:09.260377	2021-12-02 12:49:09.260377
43	140.0	2021-12-02 12:49:09.26387	2021-12-02 12:49:09.26387
44	170.0	2021-12-02 12:49:09.267444	2021-12-02 12:49:09.267444
45	390.0	2021-12-02 12:49:09.271485	2021-12-02 12:49:09.271485
46	16.0	2021-12-02 12:49:09.275245	2021-12-02 12:49:09.275245
47	9.0	2021-12-02 12:49:09.279021	2021-12-02 12:49:09.279021
48	11.0	2021-12-02 12:49:09.28556	2021-12-02 12:49:09.28556
49	400.0	2021-12-02 12:49:09.289256	2021-12-02 12:49:09.289256
50	50.0	2021-12-02 12:49:09.292918	2021-12-02 12:49:09.292918
51	550.0	2021-12-02 12:49:09.296597	2021-12-02 12:49:09.296597
\.


--
-- Data for Name: mode_numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mode_numbers (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, revoked_at, created_at, scopes, previous_refresh_token) FROM stdin;
1	1	\N	p11M46NQbPmPBCbiZrEe-ZN1qvMLOAcS3qkCeqQZli8	9018de49488b45f3e59c34a9bca6922ab6b62862c93dfca65e19db6b07bd1d9b	7200	\N	2021-12-02 12:52:33.289405	admin	
2	1	\N	ZoFaL0V_dN6En0j4p8ETJlZLIFXlFdprcy252hbreoM	b7c1d6968900798578da25cb2b4931193550fcd28dad5a7a44d9a38b053b4108	7200	\N	2021-12-02 13:13:32.456969	admin	
3	1	\N	1E0zJl4-pK6_1PBx9f9BEbMxoWMPL1KwtVug0uMBh0A	0090b8e137a8f0cb6b2c857818c95a1eeccea31004437e0f9c51a9e4a593a842	7200	\N	2021-12-02 13:20:56.908464	admin	
4	1	\N	ZEHcijNBdAnzcMcjnkvM1lUujkhYT1svqzLdnStp4g4	42729b6268817b84179bb3f20d6462e7d50fc3b3bcbc1712634e34aa93b23cb6	7200	\N	2021-12-02 13:28:23.872646	admin	
6	1	\N	awaa4wd74Gk6hBW3nHT4pCPdcppwjwkmx2D7yrXiXOo	2de82bc0cd71b4a6f1f754f368cbcc01957b3625fdf25548ed35b397d308d29c	7200	\N	2021-12-02 13:56:40.625907	admin	
7	1	\N	trnsjB6cvh42PVe8PfWQfUxMprU1Qz6ygxGzzUP2ATM	6e31b724da37d39edacb74a1a4bbdc0df91fe8bdf41d8a968fb288df70efe0b2	7200	\N	2021-12-02 15:02:01.794536	admin	
11	1	\N	pyLd1Zr3G_zwpa69HgifjBfuRPVbJ5JJEeVINX8dy84	a3d76565a8dbd4957c24d008985efeeb5da2de393b862d4b9d6913b29f2b3fc2	7200	\N	2021-12-02 15:54:20.415588	admin	
12	1	\N	OSLYgZGRNR7obMRLDOYtHGIpwVB2vfyezOybn5BU_Cw	4ffeebe22191cada596e827b824bbef3ccd5291e618f75192acdc5e82b2a77dd	7200	\N	2021-12-02 22:02:11.022409	admin	
13	1	\N	fQUs5EZClmeXRf_24Glr7tTO2qVN5wsIaISxfVI_LpU	5ac5637c2ff2f0c7efca513d8462cb09af2849e222157a5ba734233cd3c5aac1	7200	\N	2021-12-03 05:20:10.551179	admin	
14	1	\N	MLQkif8A8-fQPTJ38H5JvSeE2EovCfkA_ODnri3uDgg	af58e867f3b4ebb90686ee906eecaf4ecb450142729f82ff3163578253723ad7	7200	\N	2021-12-03 05:41:39.564053	admin	
15	1	\N	a1zNmJKteS6UHZgm1cM5z7vxLWg3ReLIeA2XVlcQpso	4b9772cd262ebf6840061b4ae69d7ebffe9a72aa590b64a5cdc5c85eddf3381b	7200	\N	2021-12-03 12:11:43.395434	admin	
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, name, created_at, updated_at) FROM stdin;
1	Faroese	2021-12-02 12:49:11.934598	2021-12-02 12:49:11.934598
2	Nigeriens	2021-12-02 12:49:11.95716	2021-12-02 12:49:11.95716
3	Israelis	2021-12-02 12:49:11.96553	2021-12-02 12:49:11.96553
4	Iranians (Persians)	2021-12-02 12:49:11.973827	2021-12-02 12:49:11.973827
5	Tibetans	2021-12-02 12:49:11.982547	2021-12-02 12:49:11.982547
\.


--
-- Data for Name: repair_list_item_uploads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repair_list_item_uploads (id, attachment, created_at, updated_at) FROM stdin;
2	Repair-list-version-1__10_.csv	2021-12-02 13:36:21.621235	2021-12-02 13:36:21.621235
\.


--
-- Data for Name: repair_list_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repair_list_items (id, repair_list_id, uid, container_repair_area_id, container_damaged_area_id, repair_type_id, is_non_mearsk_not_applicable, non_mearsk_hours, non_mearsk_material_cost_cents, non_mearsk_material_cost_currency, non_mearsk_description, comp_id, rep_id, dam_id, component_id, event_id, location, unit_id, non_mearsk_id_source, is_mearsk_not_applicable, mearsk_max_material_cost_cents, mearsk_max_material_cost_currency, mearsk_unit_material_cost_cents, mearsk_unit_material_cost_currency, mearsk_hours_per_unit, mesrsk_max_pieces, mearsk_units, repair_mode_id, mode_number_id, repair_code, combined, mearsk_description, mearsk_id_source, created_at, updated_at, deleted_at, length_id, width_id) FROM stdin;
1	1	1001	1	1	1	\N	7.8	57000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3421.0	\N	\N	\N	2021-12-02 12:49:12.383001	2021-12-02 12:49:12.383001	\N	1	1
2	1	1002	1	1	1	\N	15.6	114000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	15.6	\N	1	1	\N	3422.0	\N	\N	\N	2021-12-02 12:49:12.408198	2021-12-02 12:49:12.408198	\N	2	1
3	1	1003	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	3600	USD	1.1	\N	1	1	\N	3451.0	\N	\N	\N	2021-12-02 12:49:12.432966	2021-12-02 12:49:12.432966	\N	3	2
4	1	1004	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	5040	USD	1.4	\N	1	1	\N	3452.0	\N	\N	\N	2021-12-02 12:49:12.457034	2021-12-02 12:49:12.457034	\N	1	2
5	1	1005	1	1	2	\N	1.5	3398	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	6480	USD	1.6	\N	1	1	\N	3453.0	\N	\N	\N	2021-12-02 12:49:12.481123	2021-12-02 12:49:12.481123	\N	4	2
6	1	1006	1	1	2	\N	2	4248	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	3454.0	\N	\N	\N	2021-12-02 12:49:12.505417	2021-12-02 12:49:12.505417	\N	5	2
7	1	1007	1	1	2	\N	2.5	5947	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	13680	USD	2.7	\N	1	1	\N	3455.0	\N	\N	\N	2021-12-02 12:49:12.529341	2021-12-02 12:49:12.529341	\N	6	2
8	1	1008	1	1	2	\N	2.8	7646	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	17280	USD	3.8	\N	1	1	\N	3456.0	\N	\N	\N	2021-12-02 12:49:12.552782	2021-12-02 12:49:12.552782	\N	7	2
9	1	1009	1	1	2	\N	3	10526	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	0	USD	4.9	\N	1	1	\N	3457.0	\N	\N	\N	2021-12-02 12:49:12.576176	2021-12-02 12:49:12.576176	\N	8	2
10	1	1010	1	1	3	\N	0.9	1699	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	1440	USD	0.7	\N	1	1	\N	3441.0	\N	\N	\N	2021-12-02 12:49:12.599877	2021-12-02 12:49:12.599877	\N	3	2
11	1	1011	1	1	3	\N	0.9	2195	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2160	USD	0.8	\N	1	1	\N	3442.0	\N	\N	\N	2021-12-02 12:49:12.623206	2021-12-02 12:49:12.623206	\N	1	2
12	1	1012	1	1	3	\N	1	2549	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2880	USD	0.9	\N	1	1	\N	3443.0	\N	\N	\N	2021-12-02 12:49:12.647025	2021-12-02 12:49:12.647025	\N	4	2
13	1	1013	1	1	3	\N	1.5	4248	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	3600	USD	1	\N	1	1	\N	3444.0	\N	\N	\N	2021-12-02 12:49:12.670318	2021-12-02 12:49:12.670318	\N	5	2
14	1	1014	1	1	3	\N	1.8	5098	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	3445.0	\N	\N	\N	2021-12-02 12:49:12.693678	2021-12-02 12:49:12.693678	\N	6	2
15	1	1015	1	1	3	\N	2	5947	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5040	USD	1.3	\N	1	1	\N	3446.0	\N	\N	\N	2021-12-02 12:49:12.717032	2021-12-02 12:49:12.717032	\N	7	2
16	1	1016	1	1	3	\N	2.2	6797	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	3447.0	\N	\N	\N	2021-12-02 12:49:12.740333	2021-12-02 12:49:12.740333	\N	8	2
17	1	1017	1	1	3	\N	2.8	8118	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	6480	USD	1.7	\N	1	1	\N	3448.0	\N	\N	\N	2021-12-02 12:49:12.763785	2021-12-02 12:49:12.763785	\N	9	2
18	1	1018	1	1	4	\N	0.5	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	3431.0	\N	\N	\N	2021-12-02 12:49:12.787197	2021-12-02 12:49:12.787197	\N	10	2
19	1	1019	1	1	4	\N	1	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	3481.0	\N	\N	\N	2021-12-02 12:49:12.810436	2021-12-02 12:49:12.810436	\N	1	2
20	1	1020	1	1	5	\N	0.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	3481.0	\N	\N	\N	2021-12-02 12:49:12.833434	2021-12-02 12:49:12.833434	\N	1	2
21	1	1021	1	1	5	\N	0.9	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	3481.0	\N	\N	\N	2021-12-02 12:49:12.856459	2021-12-02 12:49:12.856459	\N	4	2
22	1	1022	1	1	5	\N	1.5	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	2021-12-02 12:49:12.879691	2021-12-02 12:49:12.879691	\N	5	2
23	1	1023	1	1	5	\N	1.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	2021-12-02 12:49:12.902891	2021-12-02 12:49:12.902891	\N	6	2
24	1	1024	1	1	5	\N	2	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	2021-12-02 12:49:12.967385	2021-12-02 12:49:12.967385	\N	7	2
25	1	1025	1	2	1	\N	6	28500	USD	\N	1	1	1	2	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	2021-12-02 12:49:12.990354	2021-12-02 12:49:12.990354	\N	3	2
26	1	1026	1	3	1	\N	6	28500	USD	\N	1	1	1	3	1	\N	3	\N	\N	0	USD	33000	USD	3.1	\N	1	1	\N	4457.0	\N	\N	\N	2021-12-02 12:49:13.014008	2021-12-02 12:49:13.014008	\N	3	2
27	1	1027	1	2	2	\N	1.3	2879	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	2021-12-02 12:49:13.036746	2021-12-02 12:49:13.036746	\N	1	2
28	1	1028	1	2	2	\N	1.5	3398	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	2021-12-02 12:49:13.059772	2021-12-02 12:49:13.059772	\N	4	2
29	1	1029	1	2	2	\N	2	6797	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	2021-12-02 12:49:13.08333	2021-12-02 12:49:13.08333	\N	5	2
30	1	1030	1	2	2	\N	2.2	10195	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.8	\N	1	1	\N	2454.0	\N	\N	\N	2021-12-02 12:49:13.106283	2021-12-02 12:49:13.106283	\N	6	2
31	1	1031	1	2	2	\N	2.5	13594	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	2455.0	\N	\N	\N	2021-12-02 12:49:13.1289	2021-12-02 12:49:13.1289	\N	7	2
32	1	1032	1	2	2	\N	3	16992	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	2456.0	\N	\N	\N	2021-12-02 12:49:13.151082	2021-12-02 12:49:13.151082	\N	8	2
33	1	1033	1	2	2	\N	4.5	20390	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	2457.0	\N	\N	\N	2021-12-02 12:49:13.174259	2021-12-02 12:49:13.174259	\N	9	2
34	1	1034	1	2	3	\N	1.3	2879	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2442.0	\N	\N	\N	2021-12-02 12:49:13.196759	2021-12-02 12:49:13.196759	\N	1	2
35	1	1035	1	2	3	\N	1.5	3398	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	2443.0	\N	\N	\N	2021-12-02 12:49:13.219162	2021-12-02 12:49:13.219162	\N	4	2
36	1	1036	1	2	3	\N	2	6797	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2444.0	\N	\N	\N	2021-12-02 12:49:13.241407	2021-12-02 12:49:13.241407	\N	5	2
37	1	1037	1	2	3	\N	2.2	10195	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	2445.0	\N	\N	\N	2021-12-02 12:49:13.265769	2021-12-02 12:49:13.265769	\N	6	2
38	1	1038	1	2	3	\N	2.5	13594	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	2446.0	\N	\N	\N	2021-12-02 12:49:13.298523	2021-12-02 12:49:13.298523	\N	7	2
39	1	1039	1	2	3	\N	3	16992	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	2447.0	\N	\N	\N	2021-12-02 12:49:13.333454	2021-12-02 12:49:13.333454	\N	8	2
40	1	1040	1	2	3	\N	4.5	20390	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	2448.0	\N	\N	\N	2021-12-02 12:49:13.367018	2021-12-02 12:49:13.367018	\N	9	2
41	1	1041	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.397443	2021-12-02 12:49:13.397443	\N	10	2
42	1	1042	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.427227	2021-12-02 12:49:13.427227	\N	1	2
43	1	1043	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.456122	2021-12-02 12:49:13.456122	\N	1	2
44	1	1044	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.480883	2021-12-02 12:49:13.480883	\N	4	2
45	1	1045	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.50576	2021-12-02 12:49:13.50576	\N	5	2
46	1	1046	1	2	5	\N	0.6	300	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.533313	2021-12-02 12:49:13.533313	\N	6	2
47	1	1047	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.557457	2021-12-02 12:49:13.557457	\N	7	2
48	1	1048	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.582079	2021-12-02 12:49:13.582079	\N	8	2
49	1	1049	2	4	1	\N	1.1	1910	USD	\N	2	1	4	4	1	\N	3	\N	\N	0	USD	5000	USD	0.4	\N	1	1	\N	7920.0	\N	\N	\N	2021-12-02 12:49:13.607045	2021-12-02 12:49:13.607045	\N	3	2
50	1	1050	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	2021-12-02 12:49:13.638213	2021-12-02 12:49:13.638213	\N	10	3
51	1	1051	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	2021-12-02 12:49:13.713997	2021-12-02 12:49:13.713997	\N	1	4
52	1	1053	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7981.0	\N	\N	\N	2021-12-02 12:49:13.737132	2021-12-02 12:49:13.737132	\N	10	3
53	1	1054	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	2021-12-02 12:49:13.759833	2021-12-02 12:49:13.759833	\N	1	4
54	1	1055	2	5	1	\N	2.5	19000	USD	\N	3	1	1	5	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	2021-12-02 12:49:13.782513	2021-12-02 12:49:13.782513	\N	3	2
55	1	1056	2	5	3	\N	1.2	1410	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	2880	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	2021-12-02 12:49:13.805228	2021-12-02 12:49:13.805228	\N	10	3
56	1	1057	2	5	3	\N	1	1910	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	4320	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	2021-12-02 12:49:13.828278	2021-12-02 12:49:13.828278	\N	1	4
57	1	1058	2	5	3	\N	1	2450	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	5760	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	2021-12-02 12:49:13.851087	2021-12-02 12:49:13.851087	\N	4	4
58	1	1059	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.873616	2021-12-02 12:49:13.873616	\N	10	3
59	1	1060	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.895631	2021-12-02 12:49:13.895631	\N	1	4
60	1	1061	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 12:49:13.917508	2021-12-02 12:49:13.917508	\N	4	4
61	1	1062	2	6	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	1410	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	2021-12-02 12:49:13.939912	2021-12-02 12:49:13.939912	\N	12	5
62	1	1063	2	6	6	\N	0.8	1410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	2021-12-02 12:49:13.962682	2021-12-02 12:49:13.962682	\N	10	3
63	1	1064	2	6	6	\N	1	1680	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	2021-12-02 12:49:13.984598	2021-12-02 12:49:13.984598	\N	1	4
64	1	1065	2	6	6	\N	1.4	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	1112.0	\N	\N	\N	2021-12-02 12:49:14.006421	2021-12-02 12:49:14.006421	\N	4	4
65	1	1066	2	6	6	\N	1.5	2160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	1	\N	1	1	\N	1113.0	\N	\N	\N	2021-12-02 12:49:14.028811	2021-12-02 12:49:14.028811	\N	13	6
66	1	1067	2	6	6	\N	1.6	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2160	USD	1	\N	1	1	\N	1114.0	\N	\N	\N	2021-12-02 12:49:14.05143	2021-12-02 12:49:14.05143	\N	14	7
67	1	1068	2	6	6	\N	1.8	2880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	1115.0	\N	\N	\N	2021-12-02 12:49:14.074021	2021-12-02 12:49:14.074021	\N	5	8
68	1	1069	2	6	6	\N	2	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2880	USD	1.5	\N	1	1	\N	1116.0	\N	\N	\N	2021-12-02 12:49:14.096485	2021-12-02 12:49:14.096485	\N	15	9
69	1	1070	2	6	6	\N	2.4	5410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.8	\N	1	1	\N	1117.0	\N	\N	\N	2021-12-02 12:49:14.119027	2021-12-02 12:49:14.119027	\N	16	10
70	1	1071	2	6	6	\N	2.69	6960	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6960	USD	2.2	\N	1	1	\N	1118.0	\N	\N	\N	2021-12-02 12:49:14.141282	2021-12-02 12:49:14.141282	\N	6	11
71	1	1072	2	6	6	\N	2.8	8880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8880	USD	2.4	\N	1	1	\N	1119.0	\N	\N	\N	2021-12-02 12:49:14.163382	2021-12-02 12:49:14.163382	\N	17	12
72	1	1073	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.185941	2021-12-02 12:49:14.185941	\N	10	2
73	1	1074	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.208301	2021-12-02 12:49:14.208301	\N	1	2
74	1	1075	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.230776	2021-12-02 12:49:14.230776	\N	10	3
75	1	1076	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.253294	2021-12-02 12:49:14.253294	\N	1	4
76	1	1077	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.275911	2021-12-02 12:49:14.275911	\N	5	2
77	1	1078	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.298548	2021-12-02 12:49:14.298548	\N	7	2
78	1	1079	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.321127	2021-12-02 12:49:14.321127	\N	18	2
79	1	1080	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.374324	2021-12-02 12:49:14.374324	\N	19	2
80	1	1081	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.398417	2021-12-02 12:49:14.398417	\N	20	2
81	1	1082	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.421239	2021-12-02 12:49:14.421239	\N	21	2
82	1	1083	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.44441	2021-12-02 12:49:14.44441	\N	22	2
83	1	1084	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.467262	2021-12-02 12:49:14.467262	\N	23	2
84	1	1085	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.489827	2021-12-02 12:49:14.489827	\N	24	2
85	1	1086	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 12:49:14.51224	2021-12-02 12:49:14.51224	\N	25	2
86	1	1095	1	3	3	\N	1.3	2879	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	4442.0	\N	\N	\N	2021-12-02 12:49:14.534835	2021-12-02 12:49:14.534835	\N	1	2
87	1	1096	1	3	3	\N	1.5	3398	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4443.0	\N	\N	\N	2021-12-02 12:49:14.558055	2021-12-02 12:49:14.558055	\N	4	2
88	1	1097	1	3	3	\N	2	6797	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4444.0	\N	\N	\N	2021-12-02 12:49:14.580413	2021-12-02 12:49:14.580413	\N	5	2
89	1	1098	1	3	3	\N	2.2	10195	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4445.0	\N	\N	\N	2021-12-02 12:49:14.608133	2021-12-02 12:49:14.608133	\N	6	2
90	1	1099	1	3	3	\N	2.5	13594	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	4446.0	\N	\N	\N	2021-12-02 12:49:14.631207	2021-12-02 12:49:14.631207	\N	7	2
91	1	1100	1	3	3	\N	3	16992	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4447.0	\N	\N	\N	2021-12-02 12:49:14.65381	2021-12-02 12:49:14.65381	\N	8	2
92	1	1101	1	3	3	\N	4.5	20390	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4448.0	\N	\N	\N	2021-12-02 12:49:14.676205	2021-12-02 12:49:14.676205	\N	9	2
93	1	1102	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 12:49:14.698749	2021-12-02 12:49:14.698749	\N	10	2
94	1	1103	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 12:49:14.721508	2021-12-02 12:49:14.721508	\N	1	2
95	1	1104	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 12:49:14.743751	2021-12-02 12:49:14.743751	\N	1	2
96	1	1105	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 12:49:14.765765	2021-12-02 12:49:14.765765	\N	4	2
97	1	1106	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 12:49:14.787827	2021-12-02 12:49:14.787827	\N	5	2
98	1	1107	1	3	5	\N	0.6	300	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 12:49:14.810243	2021-12-02 12:49:14.810243	\N	6	2
99	1	1108	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 12:49:14.832608	2021-12-02 12:49:14.832608	\N	7	2
100	1	1109	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 12:49:14.85504	2021-12-02 12:49:14.85504	\N	8	2
101	1	2001	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	0	USD	3.8	\N	1	1	\N	2122.0	\N	\N	\N	2021-12-02 12:49:14.877317	2021-12-02 12:49:14.877317	\N	19	13
102	1	2002	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	30000	USD	4.2	\N	1	1	\N	2121.0	\N	\N	\N	2021-12-02 12:49:14.899904	2021-12-02 12:49:14.899904	\N	26	13
103	1	2003	3	7	6	\N	0.8	1841	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	2021-12-02 12:49:14.922709	2021-12-02 12:49:14.922709	\N	10	3
104	1	2004	3	7	6	\N	1	2266	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	2021-12-02 12:49:14.945507	2021-12-02 12:49:14.945507	\N	1	4
105	1	2005	3	7	6	\N	1.4	2832	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.9	\N	1	1	\N	2112.0	\N	\N	\N	2021-12-02 12:49:14.968434	2021-12-02 12:49:14.968434	\N	4	4
106	1	2006	3	7	6	\N	1.5	3729	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	2113.0	\N	\N	\N	2021-12-02 12:49:14.991209	2021-12-02 12:49:14.991209	\N	13	6
107	1	2007	3	7	6	\N	1.6	4531	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	2114.0	\N	\N	\N	2021-12-02 12:49:15.045843	2021-12-02 12:49:15.045843	\N	14	7
108	1	2008	3	7	6	\N	1.8	5098	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.4	\N	1	1	\N	2115.0	\N	\N	\N	2021-12-02 12:49:15.068707	2021-12-02 12:49:15.068707	\N	5	8
109	1	2009	3	7	6	\N	2	5947	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.7	\N	1	1	\N	2116.0	\N	\N	\N	2021-12-02 12:49:15.092831	2021-12-02 12:49:15.092831	\N	15	9
110	1	2010	3	7	6	\N	2.1	6443	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	2117.0	\N	\N	\N	2021-12-02 12:49:15.115938	2021-12-02 12:49:15.115938	\N	16	10
111	1	2011	3	7	6	\N	2.2	9629	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.4	\N	1	1	\N	2118.0	\N	\N	\N	2021-12-02 12:49:15.13899	2021-12-02 12:49:15.13899	\N	6	11
112	1	2012	3	7	6	\N	2.3	10077	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.6	\N	1	1	\N	2119.0	\N	\N	\N	2021-12-02 12:49:15.161655	2021-12-02 12:49:15.161655	\N	17	12
113	1	2013	3	7	4	\N	0.3	354	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.184471	2021-12-02 12:49:15.184471	\N	10	2
114	1	2014	3	7	4	\N	0.6	708	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.20747	2021-12-02 12:49:15.20747	\N	1	2
115	1	2015	3	7	4	\N	0.6	354	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.229946	2021-12-02 12:49:15.229946	\N	10	3
116	1	2016	3	7	4	\N	1	708	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.256865	2021-12-02 12:49:15.256865	\N	1	4
117	1	2017	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.278973	2021-12-02 12:49:15.278973	\N	5	2
118	1	2018	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.301565	2021-12-02 12:49:15.301565	\N	7	2
119	1	2019	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.323524	2021-12-02 12:49:15.323524	\N	18	2
120	1	2020	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.345558	2021-12-02 12:49:15.345558	\N	19	2
121	1	2021	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.367727	2021-12-02 12:49:15.367727	\N	20	2
122	1	2022	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.389968	2021-12-02 12:49:15.389968	\N	21	2
123	1	2023	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.412178	2021-12-02 12:49:15.412178	\N	22	2
124	1	2024	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.434816	2021-12-02 12:49:15.434816	\N	23	2
125	1	2025	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.457358	2021-12-02 12:49:15.457358	\N	24	2
126	1	2026	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 12:49:15.479947	2021-12-02 12:49:15.479947	\N	25	2
127	1	2031	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6	\N	1	1	\N	2621.0	\N	\N	\N	2021-12-02 12:49:15.502548	2021-12-02 12:49:15.502548	\N	19	2
128	1	2032	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6.2	\N	1	1	\N	2622.0	\N	\N	\N	2021-12-02 12:49:15.524498	2021-12-02 12:49:15.524498	\N	26	2
129	1	2033	4	8	3	\N	1.5	5376	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	4800	USD	1.1	\N	1	1	\N	2642.0	\N	\N	\N	2021-12-02 12:49:15.546563	2021-12-02 12:49:15.546563	\N	4	2
130	1	2034	4	8	3	\N	2	10752	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	9600	USD	1.3	\N	1	1	\N	2644.0	\N	\N	\N	2021-12-02 12:49:15.569109	2021-12-02 12:49:15.569109	\N	5	2
131	1	2035	4	8	3	\N	3	16128	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	14400	USD	1.6	\N	1	1	\N	2645.0	\N	\N	\N	2021-12-02 12:49:15.591866	2021-12-02 12:49:15.591866	\N	6	2
132	1	2036	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	2021-12-02 12:49:15.614263	2021-12-02 12:49:15.614263	\N	4	2
133	1	2037	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	2021-12-02 12:49:15.636033	2021-12-02 12:49:15.636033	\N	5	2
134	1	2038	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	2021-12-02 12:49:15.658193	2021-12-02 12:49:15.658193	\N	6	2
135	1	3001	3	9	1	\N	0.6	1290	USD	\N	6	1	6	9	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	2021-12-02 12:49:15.711951	2021-12-02 12:49:15.711951	\N	3	2
136	1	3002	3	9	7	\N	0.6	1290	USD	\N	6	8	1	9	8	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	2021-12-02 12:49:15.735097	2021-12-02 12:49:15.735097	\N	3	2
137	1	3003	3	10	1	\N	4.5	17840	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3	\N	1	1	\N	3221.0	\N	\N	\N	2021-12-02 12:49:15.758294	2021-12-02 12:49:15.758294	\N	19	13
138	1	3004	3	10	1	\N	4.5	0	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	3121.0	\N	\N	\N	2021-12-02 12:49:15.781308	2021-12-02 12:49:15.781308	\N	26	13
139	1	3005	3	10	6	\N	0.8	1560	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.7	\N	1	1	\N	3111.0	\N	\N	\N	2021-12-02 12:49:15.803778	2021-12-02 12:49:15.803778	\N	10	3
140	1	3006	3	10	6	\N	1	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.8	\N	1	1	\N	3112.0	\N	\N	\N	2021-12-02 12:49:15.826431	2021-12-02 12:49:15.826431	\N	1	4
141	1	3007	3	10	6	\N	1.4	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1	\N	1	1	\N	3113.0	\N	\N	\N	2021-12-02 12:49:15.849272	2021-12-02 12:49:15.849272	\N	4	4
142	1	3008	3	10	6	\N	1.5	3160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.3	\N	1	1	\N	3114.0	\N	\N	\N	2021-12-02 12:49:15.872255	2021-12-02 12:49:15.872255	\N	13	6
143	1	3009	3	10	6	\N	1.6	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	4320	USD	1.5	\N	1	1	\N	3115.0	\N	\N	\N	2021-12-02 12:49:15.894553	2021-12-02 12:49:15.894553	\N	14	7
144	1	3010	3	10	6	\N	1.8	4320	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5040	USD	1.8	\N	1	1	\N	3116.0	\N	\N	\N	2021-12-02 12:49:15.916894	2021-12-02 12:49:15.916894	\N	5	8
145	1	3011	3	10	6	\N	2	5040	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2.2	\N	1	1	\N	3117.0	\N	\N	\N	2021-12-02 12:49:15.939222	2021-12-02 12:49:15.939222	\N	15	9
146	1	3012	3	10	6	\N	2.1	5460	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	11520	USD	2.6	\N	1	1	\N	3118.0	\N	\N	\N	2021-12-02 12:49:15.961884	2021-12-02 12:49:15.961884	\N	16	10
147	1	3013	3	10	6	\N	2.2	8160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	2021-12-02 12:49:15.984224	2021-12-02 12:49:15.984224	\N	6	11
148	1	3014	3	10	6	\N	2.3	8540	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	2021-12-02 12:49:16.006124	2021-12-02 12:49:16.006124	\N	17	12
149	1	3015	3	10	4	\N	1	600	USD	\N	4	4	5	6	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.028387	2021-12-02 12:49:16.028387	\N	10	2
150	1	3016	3	10	4	\N	0.6	600	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	300	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.050908	2021-12-02 12:49:16.050908	\N	1	2
151	1	3017	3	10	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.073254	2021-12-02 12:49:16.073254	\N	10	3
152	1	3018	3	10	4	\N	1	600	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.095666	2021-12-02 12:49:16.095666	\N	1	4
153	1	3019	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.118213	2021-12-02 12:49:16.118213	\N	5	2
154	1	3020	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.14033	2021-12-02 12:49:16.14033	\N	7	2
155	1	3021	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.162536	2021-12-02 12:49:16.162536	\N	18	2
156	1	3022	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.185133	2021-12-02 12:49:16.185133	\N	19	2
157	1	3023	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.207946	2021-12-02 12:49:16.207946	\N	20	2
158	1	3024	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.230443	2021-12-02 12:49:16.230443	\N	21	2
159	1	3025	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.253069	2021-12-02 12:49:16.253069	\N	22	2
160	1	3026	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.274982	2021-12-02 12:49:16.274982	\N	23	2
161	1	3027	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.297414	2021-12-02 12:49:16.297414	\N	24	2
162	1	3028	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	3181.0	\N	\N	\N	2021-12-02 12:49:16.319859	2021-12-02 12:49:16.319859	\N	25	2
163	1	4001	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	4621.0	\N	\N	\N	2021-12-02 12:49:16.373671	2021-12-02 12:49:16.373671	\N	19	2
164	1	4002	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.6	\N	1	1	\N	4622.0	\N	\N	\N	2021-12-02 12:49:16.396609	2021-12-02 12:49:16.396609	\N	26	2
165	1	4003	4	11	3	\N	1.5	4301	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	4642.0	\N	\N	\N	2021-12-02 12:49:16.419592	2021-12-02 12:49:16.419592	\N	4	2
166	1	4004	4	11	3	\N	2	8602	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	7680	USD	1.3	\N	1	1	\N	4644.0	\N	\N	\N	2021-12-02 12:49:16.442117	2021-12-02 12:49:16.442117	\N	5	2
167	1	4005	4	11	3	\N	3	12880	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	11520	USD	1.6	\N	1	1	\N	4645.0	\N	\N	\N	2021-12-02 12:49:16.464724	2021-12-02 12:49:16.464724	\N	6	2
168	1	4006	4	11	5	\N	1	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	2021-12-02 12:49:16.487386	2021-12-02 12:49:16.487386	\N	4	2
169	1	4007	4	11	5	\N	1.5	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	2021-12-02 12:49:16.509621	2021-12-02 12:49:16.509621	\N	5	2
170	1	4008	4	11	5	\N	2	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	2	1	\N	4681.0	\N	\N	\N	2021-12-02 12:49:16.531594	2021-12-02 12:49:16.531594	\N	6	2
171	1	4009	4	12	1	\N	2.3	10820	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	2021-12-02 12:49:16.553944	2021-12-02 12:49:16.553944	\N	3	2
172	1	4010	4	13	1	\N	2.3	10820	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	2021-12-02 12:49:16.57693	2021-12-02 12:49:16.57693	\N	3	2
173	1	4011	4	14	4	\N	1	300	USD	\N	8	4	2	13	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	2021-12-02 12:49:16.599355	2021-12-02 12:49:16.599355	\N	3	2
174	1	5000	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3	\N	1	1	\N	5121.0	\N	\N	\N	2021-12-02 12:49:16.621346	2021-12-02 12:49:16.621346	\N	3	2
175	1	5001	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	5122.0	\N	\N	\N	2021-12-02 12:49:16.643116	2021-12-02 12:49:16.643116	\N	3	2
176	1	5002	5	15	6	\N	1	1400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	5111.0	\N	\N	\N	2021-12-02 12:49:16.665346	2021-12-02 12:49:16.665346	\N	10	3
177	1	5003	5	15	6	\N	1.3	1882	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	5112.0	\N	\N	\N	2021-12-02 12:49:16.688729	2021-12-02 12:49:16.688729	\N	1	4
178	1	5004	5	15	6	\N	1.5	2957	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	5113.0	\N	\N	\N	2021-12-02 12:49:16.71068	2021-12-02 12:49:16.71068	\N	4	4
179	1	5005	5	15	6	\N	1.8	4301	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.2	\N	1	1	\N	5114.0	\N	\N	\N	2021-12-02 12:49:16.732642	2021-12-02 12:49:16.732642	\N	13	6
180	1	5006	5	15	6	\N	2	6451	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	5115.0	\N	\N	\N	2021-12-02 12:49:16.75521	2021-12-02 12:49:16.75521	\N	14	7
181	1	5007	5	15	6	\N	2.2	7526	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.8	\N	1	1	\N	5116.0	\N	\N	\N	2021-12-02 12:49:16.777206	2021-12-02 12:49:16.777206	\N	5	8
182	1	5008	5	15	6	\N	2.3	9094	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	5117.0	\N	\N	\N	2021-12-02 12:49:16.799339	2021-12-02 12:49:16.799339	\N	15	9
183	1	5009	5	15	6	\N	2.5	11290	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	5118.0	\N	\N	\N	2021-12-02 12:49:16.821463	2021-12-02 12:49:16.821463	\N	16	10
184	1	5010	5	15	6	\N	3	13574	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	2021-12-02 12:49:16.843803	2021-12-02 12:49:16.843803	\N	6	11
185	1	5011	5	15	6	\N	3.5	16934	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	2021-12-02 12:49:16.866399	2021-12-02 12:49:16.866399	\N	17	12
186	1	5012	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:16.888382	2021-12-02 12:49:16.888382	\N	10	2
187	1	5013	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:16.910255	2021-12-02 12:49:16.910255	\N	1	2
188	1	5014	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:16.932165	2021-12-02 12:49:16.932165	\N	10	3
189	1	5015	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:16.95437	2021-12-02 12:49:16.95437	\N	1	4
190	1	5016	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:16.976703	2021-12-02 12:49:16.976703	\N	5	2
191	1	5017	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.030089	2021-12-02 12:49:17.030089	\N	7	2
192	1	5018	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.052733	2021-12-02 12:49:17.052733	\N	18	2
193	1	5019	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.075389	2021-12-02 12:49:17.075389	\N	19	2
194	1	5020	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.097812	2021-12-02 12:49:17.097812	\N	20	2
195	1	5021	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.119944	2021-12-02 12:49:17.119944	\N	21	2
196	1	5022	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.142355	2021-12-02 12:49:17.142355	\N	22	2
197	1	5023	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.165166	2021-12-02 12:49:17.165166	\N	23	2
198	1	5024	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.187847	2021-12-02 12:49:17.187847	\N	24	2
199	1	5025	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 12:49:17.210272	2021-12-02 12:49:17.210272	\N	25	2
200	1	5030	5	16	2	\N	0.5	1000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 12:49:17.232606	2021-12-02 12:49:17.232606	\N	4	2
201	1	5031	5	16	2	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 12:49:17.255291	2021-12-02 12:49:17.255291	\N	5	2
202	1	5032	5	16	2	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 12:49:17.277549	2021-12-02 12:49:17.277549	\N	6	2
203	1	5033	5	16	2	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 12:49:17.300118	2021-12-02 12:49:17.300118	\N	7	2
204	1	5034	5	16	2	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 12:49:17.322523	2021-12-02 12:49:17.322523	\N	8	2
205	1	5035	5	16	2	\N	1	6500	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 12:49:17.344867	2021-12-02 12:49:17.344867	\N	9	2
206	1	5036	5	16	2	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 12:49:17.366886	2021-12-02 12:49:17.366886	\N	19	2
207	1	5037	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.389241	2021-12-02 12:49:17.389241	\N	10	2
208	1	5038	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.411761	2021-12-02 12:49:17.411761	\N	1	2
209	1	5039	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.434574	2021-12-02 12:49:17.434574	\N	4	2
210	1	5040	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.457314	2021-12-02 12:49:17.457314	\N	5	2
211	1	5041	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.480422	2021-12-02 12:49:17.480422	\N	6	2
212	1	5042	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.503285	2021-12-02 12:49:17.503285	\N	7	2
213	1	5043	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.526073	2021-12-02 12:49:17.526073	\N	8	2
214	1	5044	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.548763	2021-12-02 12:49:17.548763	\N	9	2
215	1	5045	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:17.571167	2021-12-02 12:49:17.571167	\N	19	2
216	1	5046	5	17	1	\N	1	16822	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	1	1	\N	5421.0	\N	\N	\N	2021-12-02 12:49:17.593677	2021-12-02 12:49:17.593677	\N	3	2
217	1	5047	5	17	1	\N	2	33645	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	2	1	\N	5421.0	\N	\N	\N	2021-12-02 12:49:17.616563	2021-12-02 12:49:17.616563	\N	1	2
218	1	5048	5	17	1	\N	3	50467	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	3	1	\N	5421.0	\N	\N	\N	2021-12-02 12:49:17.638699	2021-12-02 12:49:17.638699	\N	4	2
219	1	5049	5	17	1	\N	4	67290	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	4	1	\N	5421.0	\N	\N	\N	2021-12-02 12:49:17.693323	2021-12-02 12:49:17.693323	\N	2	2
220	1	5050	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	1	1	\N	5451.0	\N	\N	\N	2021-12-02 12:49:17.716097	2021-12-02 12:49:17.716097	\N	4	2
221	1	5051	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	2	1	\N	5451.0	\N	\N	\N	2021-12-02 12:49:17.739922	2021-12-02 12:49:17.739922	\N	5	2
222	1	5052	5	17	2	\N	1	14560	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	3	1	\N	5451.0	\N	\N	\N	2021-12-02 12:49:17.763416	2021-12-02 12:49:17.763416	\N	6	2
223	1	5053	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.786603	2021-12-02 12:49:17.786603	\N	3	2
224	1	5054	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.80906	2021-12-02 12:49:17.80906	\N	1	2
225	1	5055	5	17	4	\N	0.6	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.831798	2021-12-02 12:49:17.831798	\N	4	2
226	1	5056	5	17	4	\N	0.8	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.854283	2021-12-02 12:49:17.854283	\N	2	2
227	1	5057	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.876904	2021-12-02 12:49:17.876904	\N	3	2
228	1	5058	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.90042	2021-12-02 12:49:17.90042	\N	1	2
229	1	5059	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.922753	2021-12-02 12:49:17.922753	\N	4	2
230	1	5060	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.945486	2021-12-02 12:49:17.945486	\N	2	2
231	1	5061	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.968032	2021-12-02 12:49:17.968032	\N	3	2
232	1	5062	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:17.990472	2021-12-02 12:49:17.990472	\N	1	2
233	1	5063	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:18.01316	2021-12-02 12:49:18.01316	\N	4	2
234	1	5064	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	2021-12-02 12:49:18.035355	2021-12-02 12:49:18.035355	\N	2	2
235	1	5065	5	18	1	\N	0.5	963	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.058154	2021-12-02 12:49:18.058154	\N	3	2
236	1	5066	5	18	1	\N	0.5	1926	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.08046	2021-12-02 12:49:18.08046	\N	1	2
237	1	5067	5	18	1	\N	0.6	2890	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.10352	2021-12-02 12:49:18.10352	\N	4	2
238	1	5068	5	18	1	\N	0.8	3853	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.125495	2021-12-02 12:49:18.125495	\N	2	2
239	1	5069	5	18	1	\N	1	4816	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.148503	2021-12-02 12:49:18.148503	\N	3	2
240	1	5070	5	18	1	\N	1.2	5779	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.171348	2021-12-02 12:49:18.171348	\N	5	2
241	1	5071	5	18	1	\N	1.4	6742	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.204704	2021-12-02 12:49:18.204704	\N	26	2
242	1	5072	5	18	1	\N	1.6	7706	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.228736	2021-12-02 12:49:18.228736	\N	16	2
243	1	5073	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.251534	2021-12-02 12:49:18.251534	\N	3	2
244	1	5074	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.274038	2021-12-02 12:49:18.274038	\N	1	2
245	1	5075	5	18	5	\N	0.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.296502	2021-12-02 12:49:18.296502	\N	4	2
246	1	5076	5	18	5	\N	0.8	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.318936	2021-12-02 12:49:18.318936	\N	2	2
247	1	5077	5	18	5	\N	1	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.376107	2021-12-02 12:49:18.376107	\N	3	2
248	1	5078	5	18	5	\N	1.2	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.399987	2021-12-02 12:49:18.399987	\N	5	2
249	1	5079	5	18	5	\N	1.4	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.423601	2021-12-02 12:49:18.423601	\N	26	2
250	1	5080	5	18	5	\N	1.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.44664	2021-12-02 12:49:18.44664	\N	16	2
251	1	5081	5	18	10	\N	0.5	0	USD	\N	11	10	2	17	12	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 12:49:18.470186	2021-12-02 12:49:18.470186	\N	3	2
252	1	5082	5	19	1	\N	0.5	1725	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	2021-12-02 12:49:18.493741	2021-12-02 12:49:18.493741	\N	3	2
253	1	5083	5	19	1	\N	0.5	3450	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	2021-12-02 12:49:18.516545	2021-12-02 12:49:18.516545	\N	1	2
254	1	5084	5	19	1	\N	0.5	5174	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	2021-12-02 12:49:18.538906	2021-12-02 12:49:18.538906	\N	4	2
255	1	5085	5	19	1	\N	0.8	6899	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	2021-12-02 12:49:18.562324	2021-12-02 12:49:18.562324	\N	2	2
256	1	5086	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	2021-12-02 12:49:18.584542	2021-12-02 12:49:18.584542	\N	3	2
257	1	5087	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	2021-12-02 12:49:18.607096	2021-12-02 12:49:18.607096	\N	1	2
258	1	5088	5	19	4	\N	0.6	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	2021-12-02 12:49:18.629386	2021-12-02 12:49:18.629386	\N	4	2
259	1	5089	5	19	4	\N	0.8	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	2021-12-02 12:49:18.652243	2021-12-02 12:49:18.652243	\N	2	2
260	1	5090	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5581.0	\N	\N	\N	2021-12-02 12:49:18.675525	2021-12-02 12:49:18.675525	\N	3	2
261	1	5091	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	2021-12-02 12:49:18.698071	2021-12-02 12:49:18.698071	\N	1	2
262	1	5092	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	2021-12-02 12:49:18.720762	2021-12-02 12:49:18.720762	\N	4	2
263	1	5093	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	2021-12-02 12:49:18.743079	2021-12-02 12:49:18.743079	\N	2	2
264	1	5094	5	20	1	\N	0.5	1456	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.766346	2021-12-02 12:49:18.766346	\N	3	2
265	1	5095	5	20	1	\N	0.5	2912	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.788479	2021-12-02 12:49:18.788479	\N	1	2
266	1	5096	5	20	1	\N	0.5	4368	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.81058	2021-12-02 12:49:18.81058	\N	4	2
267	1	5097	5	20	1	\N	0.5	5824	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.832704	2021-12-02 12:49:18.832704	\N	2	2
268	1	5098	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.856098	2021-12-02 12:49:18.856098	\N	3	2
269	1	5099	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.879453	2021-12-02 12:49:18.879453	\N	1	2
270	1	5100	5	20	4	\N	0.6	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.902105	2021-12-02 12:49:18.902105	\N	4	2
271	1	5101	5	20	4	\N	0.8	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.924266	2021-12-02 12:49:18.924266	\N	2	2
272	1	5102	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.946992	2021-12-02 12:49:18.946992	\N	3	2
273	1	5103	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.970028	2021-12-02 12:49:18.970028	\N	1	2
274	1	5104	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:18.992634	2021-12-02 12:49:18.992634	\N	4	2
275	1	5105	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.046763	2021-12-02 12:49:19.046763	\N	2	2
276	1	5106	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.070036	2021-12-02 12:49:19.070036	\N	3	2
277	1	5107	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.093357	2021-12-02 12:49:19.093357	\N	1	2
278	1	5108	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.116345	2021-12-02 12:49:19.116345	\N	4	2
279	1	5109	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.1386	2021-12-02 12:49:19.1386	\N	2	2
280	1	5110	5	21	1	\N	0.5	1021	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.161006	2021-12-02 12:49:19.161006	\N	3	2
281	1	5111	5	21	1	\N	0.5	2041	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.183358	2021-12-02 12:49:19.183358	\N	1	2
282	1	5112	5	21	1	\N	0.5	3062	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.206313	2021-12-02 12:49:19.206313	\N	4	2
283	1	5113	5	21	1	\N	0.5	4083	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.228936	2021-12-02 12:49:19.228936	\N	2	2
284	1	5114	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.251847	2021-12-02 12:49:19.251847	\N	3	2
285	1	5115	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.274592	2021-12-02 12:49:19.274592	\N	1	2
286	1	5116	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.297619	2021-12-02 12:49:19.297619	\N	4	2
287	1	5117	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.320383	2021-12-02 12:49:19.320383	\N	2	2
288	1	5118	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.342843	2021-12-02 12:49:19.342843	\N	3	2
289	1	5119	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.365574	2021-12-02 12:49:19.365574	\N	1	2
290	1	5120	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.388916	2021-12-02 12:49:19.388916	\N	4	2
291	1	5121	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.411935	2021-12-02 12:49:19.411935	\N	2	2
292	1	5122	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.43473	2021-12-02 12:49:19.43473	\N	3	2
293	1	5123	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.45737	2021-12-02 12:49:19.45737	\N	1	2
294	1	5124	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.479828	2021-12-02 12:49:19.479828	\N	4	2
295	1	5125	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 12:49:19.50267	2021-12-02 12:49:19.50267	\N	2	2
296	1	5126	5	22	1	\N	0.5	1156	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.525997	2021-12-02 12:49:19.525997	\N	3	2
297	1	5127	5	22	1	\N	0.6	2313	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.549279	2021-12-02 12:49:19.549279	\N	1	2
298	1	5128	5	22	1	\N	0.9	3469	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.572153	2021-12-02 12:49:19.572153	\N	4	2
299	1	5129	5	22	1	\N	1.2	4626	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.594925	2021-12-02 12:49:19.594925	\N	2	2
300	1	5130	5	22	5	\N	0.5	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.617606	2021-12-02 12:49:19.617606	\N	3	2
301	1	5131	5	22	5	\N	0.6	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.640142	2021-12-02 12:49:19.640142	\N	1	2
302	1	5132	5	22	5	\N	0.9	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.663444	2021-12-02 12:49:19.663444	\N	4	2
303	1	5133	5	22	5	\N	1.2	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.718239	2021-12-02 12:49:19.718239	\N	2	2
304	1	5134	5	23	1	\N	0.5	800	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.741374	2021-12-02 12:49:19.741374	\N	3	2
305	1	5135	5	23	1	\N	0.5	1600	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.764874	2021-12-02 12:49:19.764874	\N	1	2
306	1	5136	5	23	1	\N	0.6	2400	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.788373	2021-12-02 12:49:19.788373	\N	4	2
307	1	5137	5	23	1	\N	0.8	3200	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.811705	2021-12-02 12:49:19.811705	\N	2	2
308	1	5138	5	24	1	\N	0.5	1310	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.834941	2021-12-02 12:49:19.834941	\N	3	2
309	1	5139	5	24	1	\N	0.6	2620	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.857813	2021-12-02 12:49:19.857813	\N	1	2
310	1	5140	5	24	1	\N	0.9	3929	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.879813	2021-12-02 12:49:19.879813	\N	4	2
311	1	5141	5	24	1	\N	1.2	5239	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.902117	2021-12-02 12:49:19.902117	\N	2	2
312	1	5142	5	25	1	\N	0.5	1300	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.924566	2021-12-02 12:49:19.924566	\N	3	2
313	1	5143	5	25	1	\N	0.8	2600	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.947769	2021-12-02 12:49:19.947769	\N	1	2
314	1	5144	5	25	1	\N	1	3900	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.971185	2021-12-02 12:49:19.971185	\N	4	2
315	1	5145	5	25	1	\N	1	5200	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:19.994002	2021-12-02 12:49:19.994002	\N	2	2
316	1	5146	5	24	4	\N	0.5	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:20.016558	2021-12-02 12:49:20.016558	\N	3	2
317	1	5147	5	24	4	\N	0.6	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:20.038815	2021-12-02 12:49:20.038815	\N	1	2
318	1	5148	5	24	4	\N	0.9	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:20.06124	2021-12-02 12:49:20.06124	\N	4	2
319	1	5149	5	24	4	\N	1.2	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 12:49:20.083908	2021-12-02 12:49:20.083908	\N	2	2
320	1	5150	5	26	1	\N	1	4189	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	1	1	\N	5221.0	\N	\N	\N	2021-12-02 12:49:20.106494	2021-12-02 12:49:20.106494	\N	3	2
321	1	5151	5	26	1	\N	2	8378	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	2	1	\N	5221.0	\N	\N	\N	2021-12-02 12:49:20.129412	2021-12-02 12:49:20.129412	\N	1	2
322	1	5152	5	26	1	\N	3	12567	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	3	1	\N	5221.0	\N	\N	\N	2021-12-02 12:49:20.151966	2021-12-02 12:49:20.151966	\N	4	2
323	1	5153	5	26	1	\N	4	16756	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	4	1	\N	5221.0	\N	\N	\N	2021-12-02 12:49:20.173896	2021-12-02 12:49:20.173896	\N	2	2
324	1	5154	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	2021-12-02 12:49:20.196889	2021-12-02 12:49:20.196889	\N	3	2
325	1	5155	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	2021-12-02 12:49:20.219447	2021-12-02 12:49:20.219447	\N	1	2
326	1	5156	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	2021-12-02 12:49:20.242406	2021-12-02 12:49:20.242406	\N	4	2
327	1	5157	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	2021-12-02 12:49:20.264904	2021-12-02 12:49:20.264904	\N	2	2
328	1	5158	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	2021-12-02 12:49:20.287117	2021-12-02 12:49:20.287117	\N	3	2
329	1	5159	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	2021-12-02 12:49:20.309898	2021-12-02 12:49:20.309898	\N	1	2
330	1	5160	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	2021-12-02 12:49:20.332566	2021-12-02 12:49:20.332566	\N	4	2
331	1	5161	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	2021-12-02 12:49:20.386839	2021-12-02 12:49:20.386839	\N	2	2
332	1	5162	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	2021-12-02 12:49:20.410731	2021-12-02 12:49:20.410731	\N	3	2
333	1	5163	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	2021-12-02 12:49:20.434004	2021-12-02 12:49:20.434004	\N	1	2
334	1	5164	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	2021-12-02 12:49:20.456514	2021-12-02 12:49:20.456514	\N	4	2
335	1	5165	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	2021-12-02 12:49:20.480224	2021-12-02 12:49:20.480224	\N	2	2
336	1	5166	5	27	1	\N	1	3550	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	1	1	\N	5222.0	\N	\N	\N	2021-12-02 12:49:20.502864	2021-12-02 12:49:20.502864	\N	3	2
337	1	5167	5	27	1	\N	1.5	7100	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	2	1	\N	5222.0	\N	\N	\N	2021-12-02 12:49:20.525716	2021-12-02 12:49:20.525716	\N	1	2
338	1	5168	5	27	1	\N	1.5	10650	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	3	1	\N	5222.0	\N	\N	\N	2021-12-02 12:49:20.547525	2021-12-02 12:49:20.547525	\N	4	2
339	1	5169	5	27	1	\N	2	14200	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	4	1	\N	5222.0	\N	\N	\N	2021-12-02 12:49:20.569769	2021-12-02 12:49:20.569769	\N	2	2
340	1	5170	5	28	2	\N	0.5	2360	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	2021-12-02 12:49:20.59258	2021-12-02 12:49:20.59258	\N	3	2
341	1	5171	5	28	2	\N	1	2950	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	2021-12-02 12:49:20.614488	2021-12-02 12:49:20.614488	\N	1	2
342	1	5172	5	28	2	\N	1.5	3540	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	2021-12-02 12:49:20.637074	2021-12-02 12:49:20.637074	\N	4	2
343	1	5173	5	28	2	\N	2	7080	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	2021-12-02 12:49:20.65983	2021-12-02 12:49:20.65983	\N	5	2
344	1	5174	5	28	2	\N	2.2	10620	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	2021-12-02 12:49:20.682735	2021-12-02 12:49:20.682735	\N	6	2
345	1	5175	5	28	2	\N	2.5	14160	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	2021-12-02 12:49:20.70539	2021-12-02 12:49:20.70539	\N	7	2
346	1	5176	5	28	2	\N	3	17700	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 12:49:20.728244	2021-12-02 12:49:20.728244	\N	8	2
347	1	5177	5	28	2	\N	3.6	22420	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 12:49:20.75073	2021-12-02 12:49:20.75073	\N	9	2
348	1	5178	5	28	2	\N	5	28320	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 12:49:20.772765	2021-12-02 12:49:20.772765	\N	19	2
349	1	5179	5	28	3	\N	0.5	2360	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	2021-12-02 12:49:20.795096	2021-12-02 12:49:20.795096	\N	3	2
350	1	5180	5	28	3	\N	1	2950	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	2021-12-02 12:49:20.817483	2021-12-02 12:49:20.817483	\N	1	2
351	1	5181	5	28	3	\N	1.5	3540	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	2021-12-02 12:49:20.839989	2021-12-02 12:49:20.839989	\N	4	2
352	1	5182	5	28	3	\N	2	7080	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	2021-12-02 12:49:20.862908	2021-12-02 12:49:20.862908	\N	5	2
353	1	5183	5	28	3	\N	2.2	10620	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	2021-12-02 12:49:20.885295	2021-12-02 12:49:20.885295	\N	6	2
354	1	5184	5	28	3	\N	2.5	14160	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	2021-12-02 12:49:20.90792	2021-12-02 12:49:20.90792	\N	7	2
355	1	5185	5	28	3	\N	3	17700	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 12:49:20.930476	2021-12-02 12:49:20.930476	\N	8	2
356	1	5186	5	28	3	\N	3.6	22420	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 12:49:20.952738	2021-12-02 12:49:20.952738	\N	9	2
357	1	5187	5	28	3	\N	5	28320	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 12:49:20.975671	2021-12-02 12:49:20.975671	\N	19	2
358	1	5188	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:20.997763	2021-12-02 12:49:20.997763	\N	10	2
359	1	5189	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.052059	2021-12-02 12:49:21.052059	\N	1	2
360	1	5190	5	28	5	\N	0.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.07513	2021-12-02 12:49:21.07513	\N	3	2
361	1	5191	5	28	5	\N	1.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.097542	2021-12-02 12:49:21.097542	\N	4	2
362	1	5192	5	28	5	\N	2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.120341	2021-12-02 12:49:21.120341	\N	5	2
363	1	5193	5	28	5	\N	2.2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.143501	2021-12-02 12:49:21.143501	\N	6	2
364	1	5194	5	28	5	\N	2.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.16634	2021-12-02 12:49:21.16634	\N	7	2
365	1	5195	5	28	5	\N	3	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.189615	2021-12-02 12:49:21.189615	\N	8	2
366	1	5196	5	28	5	\N	3.6	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.212573	2021-12-02 12:49:21.212573	\N	9	2
367	1	5197	5	28	5	\N	5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	2021-12-02 12:49:21.235288	2021-12-02 12:49:21.235288	\N	19	2
368	1	5198	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.257662	2021-12-02 12:49:21.257662	\N	1	2
369	1	5199	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.280154	2021-12-02 12:49:21.280154	\N	4	2
370	1	5200	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.303263	2021-12-02 12:49:21.303263	\N	5	2
371	1	5201	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.325943	2021-12-02 12:49:21.325943	\N	6	2
372	1	5202	5	29	1	\N	0.5	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.348391	2021-12-02 12:49:21.348391	\N	7	2
373	1	5203	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.371221	2021-12-02 12:49:21.371221	\N	8	2
374	1	5204	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.393741	2021-12-02 12:49:21.393741	\N	9	2
375	1	5205	5	29	1	\N	0.6	3172	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	2400	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.416353	2021-12-02 12:49:21.416353	\N	19	2
376	1	5206	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.438686	2021-12-02 12:49:21.438686	\N	10	2
377	1	5207	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.461129	2021-12-02 12:49:21.461129	\N	1	2
378	1	5208	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.484304	2021-12-02 12:49:21.484304	\N	4	2
379	1	5209	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.506956	2021-12-02 12:49:21.506956	\N	5	2
380	1	5210	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.529997	2021-12-02 12:49:21.529997	\N	6	2
381	1	5211	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.552404	2021-12-02 12:49:21.552404	\N	7	2
382	1	5212	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.574968	2021-12-02 12:49:21.574968	\N	8	2
383	1	5213	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.597546	2021-12-02 12:49:21.597546	\N	9	2
384	1	5214	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	5	1	\N	5921.0	\N	\N	\N	2021-12-02 12:49:21.619797	2021-12-02 12:49:21.619797	\N	19	2
385	1	5215	5	30	1	\N	0.7	1500	USD	\N	22	1	1	27	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5623.0	\N	\N	\N	2021-12-02 12:49:21.642018	2021-12-02 12:49:21.642018	\N	3	2
386	1	5216	5	30	5	\N	0.5	0	USD	\N	22	5	5	27	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	2021-12-02 12:49:21.664518	2021-12-02 12:49:21.664518	\N	3	2
387	1	5217	5	30	4	\N	0.5	300	USD	\N	22	4	10	27	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	2021-12-02 12:49:21.719615	2021-12-02 12:49:21.719615	\N	3	2
388	1	5218	5	12	1	\N	2.3	12768	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	2021-12-02 12:49:21.743117	2021-12-02 12:49:21.743117	\N	3	2
389	1	5219	5	13	1	\N	2.3	12768	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	2021-12-02 12:49:21.766462	2021-12-02 12:49:21.766462	\N	3	2
390	1	5220	5	14	4	\N	0.6	600	USD	\N	8	4	2	12	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	2021-12-02 12:49:21.789801	2021-12-02 12:49:21.789801	\N	3	2
391	1	5221	5	31	1	\N	1	1400	USD	\N	23	1	1	28	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	2021-12-02 12:49:21.812609	2021-12-02 12:49:21.812609	\N	3	2
392	1	5222	5	31	4	\N	1	1400	USD	\N	23	7	1	28	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	2021-12-02 12:49:21.835466	2021-12-02 12:49:21.835466	\N	3	2
393	1	5223	5	16	1	\N	0.5	1000	USD	\N	9	2	3	15	1	\N	2	\N	\N	0	USD	900	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	2021-12-02 12:49:21.858289	2021-12-02 12:49:21.858289	\N	4	2
394	1	5224	5	16	1	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	1800	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	2021-12-02 12:49:21.880974	2021-12-02 12:49:21.880974	\N	5	2
395	1	5225	5	16	1	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2700	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	2021-12-02 12:49:21.903592	2021-12-02 12:49:21.903592	\N	6	2
396	1	5226	5	16	1	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	2021-12-02 12:49:21.925768	2021-12-02 12:49:21.925768	\N	7	2
397	1	5227	5	16	1	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2400	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	2021-12-02 12:49:21.948158	2021-12-02 12:49:21.948158	\N	8	2
398	1	5228	5	16	1	\N	1	6000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2800	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	2021-12-02 12:49:21.970587	2021-12-02 12:49:21.970587	\N	18	2
399	1	5229	5	16	1	\N	1	7000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3150	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	2021-12-02 12:49:21.992907	2021-12-02 12:49:21.992907	\N	34	2
400	1	5230	5	16	1	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	2021-12-02 12:49:22.014943	2021-12-02 12:49:22.014943	\N	19	2
401	1	5231	5	15	11	\N	0.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:22.037292	2021-12-02 12:49:22.037292	\N	3	2
402	1	5232	5	15	11	\N	1	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:22.059531	2021-12-02 12:49:22.059531	\N	1	2
403	1	5233	5	15	11	\N	1.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:22.081701	2021-12-02 12:49:22.081701	\N	4	2
404	1	5234	5	15	11	\N	2	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	2021-12-02 12:49:22.103794	2021-12-02 12:49:22.103794	\N	2	2
405	1	6000	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	2021-12-02 12:49:22.126315	2021-12-02 12:49:22.126315	\N	5	8
406	1	6001	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	2021-12-02 12:49:22.14863	2021-12-02 12:49:22.14863	\N	5	11
407	1	6002	6	32	12	\N	1.5	8060	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6500	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	2021-12-02 12:49:22.171109	2021-12-02 12:49:22.171109	\N	5	13
408	1	6003	6	32	12	\N	1.5	12500	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	1.2	\N	1	1	\N	6525.0	\N	\N	\N	2021-12-02 12:49:22.193317	2021-12-02 12:49:22.193317	\N	6	13
409	1	6004	6	32	12	\N	1.5	15000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	11000	USD	1.5	\N	1	1	\N	6523.0	\N	\N	\N	2021-12-02 12:49:22.217821	2021-12-02 12:49:22.217821	\N	7	13
410	1	6005	6	32	12	\N	2	20000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	14000	USD	1.7	\N	1	1	\N	6527.0	\N	\N	\N	2021-12-02 12:49:22.240094	2021-12-02 12:49:22.240094	\N	8	13
411	1	6006	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	1.9	\N	1	1	\N	6528.0	\N	\N	\N	2021-12-02 12:49:22.262579	2021-12-02 12:49:22.262579	\N	18	13
412	1	6007	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	4	\N	\N	0	USD	22000	USD	2	\N	1	1	\N	6529.0	\N	\N	\N	2021-12-02 12:49:22.285446	2021-12-02 12:49:22.285446	\N	34	13
413	1	6008	6	32	12	\N	3	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	2.1	\N	1	1	\N	6524.0	\N	\N	\N	2021-12-02 12:49:22.307556	2021-12-02 12:49:22.307556	\N	19	13
414	1	6009	6	32	8	\N	0.75	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	100	USD	0.1	\N	5	1	\N	6173.0	\N	\N	\N	2021-12-02 12:49:22.330298	2021-12-02 12:49:22.330298	\N	5	2
415	1	6010	6	32	8	\N	1.3	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	2021-12-02 12:49:22.385112	2021-12-02 12:49:22.385112	\N	7	2
416	1	6011	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	2021-12-02 12:49:22.4087	2021-12-02 12:49:22.4087	\N	19	2
417	1	6012	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 12:49:22.431611	2021-12-02 12:49:22.431611	\N	21	2
418	1	6013	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 12:49:22.454334	2021-12-02 12:49:22.454334	\N	23	2
419	1	6014	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 12:49:22.477891	2021-12-02 12:49:22.477891	\N	5	2
420	1	6015	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 12:49:22.500909	2021-12-02 12:49:22.500909	\N	39	2
421	1	6016	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 12:49:22.522889	2021-12-02 12:49:22.522889	\N	40	2
422	1	6017	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 12:49:22.545148	2021-12-02 12:49:22.545148	\N	41	2
423	1	6018	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 12:49:22.56725	2021-12-02 12:49:22.56725	\N	42	2
424	1	6019	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.589744	2021-12-02 12:49:22.589744	\N	5	2
425	1	6020	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.61221	2021-12-02 12:49:22.61221	\N	6	2
426	1	6021	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.634827	2021-12-02 12:49:22.634827	\N	7	2
427	1	6022	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.656942	2021-12-02 12:49:22.656942	\N	9	2
428	1	6023	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.679233	2021-12-02 12:49:22.679233	\N	19	2
429	1	6024	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.701741	2021-12-02 12:49:22.701741	\N	17	12
430	1	6025	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.723867	2021-12-02 12:49:22.723867	\N	43	14
431	1	6026	6	32	14	\N	1.8	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.746416	2021-12-02 12:49:22.746416	\N	44	15
432	1	6027	6	32	14	\N	2.6	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 12:49:22.769812	2021-12-02 12:49:22.769812	\N	9	16
433	1	6032	6	33	2	\N	1	3540	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 12:49:22.792411	2021-12-02 12:49:22.792411	\N	4	2
434	1	6033	6	33	2	\N	1	7080	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 12:49:22.814908	2021-12-02 12:49:22.814908	\N	5	2
435	1	6034	6	33	2	\N	1	10620	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 12:49:22.837047	2021-12-02 12:49:22.837047	\N	6	2
436	1	6035	6	33	2	\N	1	14160	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 12:49:22.859892	2021-12-02 12:49:22.859892	\N	7	2
437	1	6036	6	33	2	\N	2	17700	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 12:49:22.882595	2021-12-02 12:49:22.882595	\N	8	2
438	1	6037	6	33	2	\N	2	22420	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 12:49:22.905938	2021-12-02 12:49:22.905938	\N	9	2
439	1	6038	6	33	2	\N	2	25724	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 12:49:22.928258	2021-12-02 12:49:22.928258	\N	19	2
440	1	6039	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:22.951004	2021-12-02 12:49:22.951004	\N	10	2
441	1	6040	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:22.973451	2021-12-02 12:49:22.973451	\N	1	2
442	1	6041	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:22.995867	2021-12-02 12:49:22.995867	\N	10	2
443	1	6042	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:23.050205	2021-12-02 12:49:23.050205	\N	1	2
444	1	6043	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:23.072532	2021-12-02 12:49:23.072532	\N	4	2
445	1	6044	6	33	5	\N	0.7	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:23.094512	2021-12-02 12:49:23.094512	\N	5	2
446	1	6045	6	33	5	\N	0.9	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:23.117109	2021-12-02 12:49:23.117109	\N	6	2
447	1	6046	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:23.13978	2021-12-02 12:49:23.13978	\N	7	2
448	1	6047	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:23.162481	2021-12-02 12:49:23.162481	\N	8	2
449	1	6048	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 12:49:23.184258	2021-12-02 12:49:23.184258	\N	9	2
450	1	6049	6	34	1	\N	0.5	3500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	6721.0	\N	\N	\N	2021-12-02 12:49:23.206436	2021-12-02 12:49:23.206436	\N	3	2
451	1	6050	6	34	1	\N	0.5	7000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	6721.0	\N	\N	\N	2021-12-02 12:49:23.228439	2021-12-02 12:49:23.228439	\N	1	2
452	1	6051	6	34	1	\N	1	10500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	6721.0	\N	\N	\N	2021-12-02 12:49:23.250695	2021-12-02 12:49:23.250695	\N	4	2
453	1	6052	6	34	1	\N	1	14000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	6721.0	\N	\N	\N	2021-12-02 12:49:23.272689	2021-12-02 12:49:23.272689	\N	2	2
454	1	6053	6	34	1	\N	1.5	17500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	6721.0	\N	\N	\N	2021-12-02 12:49:23.29463	2021-12-02 12:49:23.29463	\N	3	2
455	1	6054	6	34	1	\N	2	21000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	6721.0	\N	\N	\N	2021-12-02 12:49:23.316481	2021-12-02 12:49:23.316481	\N	5	2
456	1	6055	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.337965	2021-12-02 12:49:23.337965	\N	3	2
457	1	6056	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.359672	2021-12-02 12:49:23.359672	\N	1	2
458	1	6057	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.381609	2021-12-02 12:49:23.381609	\N	4	2
459	1	6058	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.403098	2021-12-02 12:49:23.403098	\N	2	2
460	1	6059	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.424823	2021-12-02 12:49:23.424823	\N	3	2
461	1	6060	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.446693	2021-12-02 12:49:23.446693	\N	5	2
462	1	6061	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.468643	2021-12-02 12:49:23.468643	\N	3	2
463	1	6062	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.49098	2021-12-02 12:49:23.49098	\N	1	2
464	1	6063	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.513037	2021-12-02 12:49:23.513037	\N	4	2
465	1	6064	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.53485	2021-12-02 12:49:23.53485	\N	2	2
466	1	6065	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.556869	2021-12-02 12:49:23.556869	\N	3	2
467	1	6066	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.578841	2021-12-02 12:49:23.578841	\N	5	2
468	1	6067	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.601426	2021-12-02 12:49:23.601426	\N	3	2
469	1	6068	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.623546	2021-12-02 12:49:23.623546	\N	1	2
470	1	6069	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.645374	2021-12-02 12:49:23.645374	\N	4	2
471	1	6070	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.699017	2021-12-02 12:49:23.699017	\N	2	2
472	1	6071	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.721515	2021-12-02 12:49:23.721515	\N	3	2
473	1	6072	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	2021-12-02 12:49:23.743663	2021-12-02 12:49:23.743663	\N	5	2
474	1	7000	7	35	1	\N	7.9	66000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	7.9	\N	1	1	\N	3521.0	\N	\N	\N	2021-12-02 12:49:23.76638	2021-12-02 12:49:23.76638	\N	1	1
475	1	7001	7	35	1	\N	15.6	132000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	14.9	\N	1	1	\N	3522.0	\N	\N	\N	2021-12-02 12:49:23.789525	2021-12-02 12:49:23.789525	\N	2	1
476	1	7002	7	35	2	\N	1.5	2880	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	3550.0	\N	\N	\N	2021-12-02 12:49:23.811924	2021-12-02 12:49:23.811924	\N	4	2
477	1	7003	7	35	2	\N	2	5760	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	3600	USD	1.4	\N	1	1	\N	3551.0	\N	\N	\N	2021-12-02 12:49:23.834443	2021-12-02 12:49:23.834443	\N	5	2
478	1	7004	7	35	2	\N	2.2	7200	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	5040	USD	1.7	\N	1	1	\N	3552.0	\N	\N	\N	2021-12-02 12:49:23.857043	2021-12-02 12:49:23.857043	\N	6	2
479	1	7005	7	35	2	\N	2.5	8640	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	6480	USD	2.1	\N	1	1	\N	3553.0	\N	\N	\N	2021-12-02 12:49:23.879325	2021-12-02 12:49:23.879325	\N	7	2
480	1	7006	7	35	2	\N	2.8	10080	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	10080	USD	2.8	\N	1	1	\N	3554.0	\N	\N	\N	2021-12-02 12:49:23.902256	2021-12-02 12:49:23.902256	\N	8	2
481	1	7007	7	35	2	\N	3	11520	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	13680	USD	3.5	\N	1	1	\N	3555.0	\N	\N	\N	2021-12-02 12:49:23.924681	2021-12-02 12:49:23.924681	\N	9	2
482	1	7008	7	35	2	\N	3.2	13000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	17280	USD	4.9	\N	1	1	\N	3556.0	\N	\N	\N	2021-12-02 12:49:23.946788	2021-12-02 12:49:23.946788	\N	19	2
483	1	7009	7	35	2	\N	3.5	14500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	6.3	\N	1	1	\N	3557.0	\N	\N	\N	2021-12-02 12:49:23.969307	2021-12-02 12:49:23.969307	\N	20	2
484	1	7010	7	35	2	\N	4	16000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3558.0	\N	\N	\N	2021-12-02 12:49:23.992079	2021-12-02 12:49:23.992079	\N	45	2
485	1	7011	7	35	2	\N	4.5	17500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	2021-12-02 12:49:24.014513	2021-12-02 12:49:24.014513	\N	23	2
486	1	7012	7	35	2	\N	7	19000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	2021-12-02 12:49:24.036861	2021-12-02 12:49:24.036861	\N	25	2
487	1	7013	7	35	3	\N	1	2400	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	1440	USD	0.9	\N	1	1	\N	3541.0	\N	\N	\N	2021-12-02 12:49:24.059114	2021-12-02 12:49:24.059114	\N	1	2
488	1	7014	7	35	3	\N	1	2880	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	3542.0	\N	\N	\N	2021-12-02 12:49:24.081613	2021-12-02 12:49:24.081613	\N	4	2
489	1	7015	7	35	3	\N	1.5	5760	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	3544.0	\N	\N	\N	2021-12-02 12:49:24.103882	2021-12-02 12:49:24.103882	\N	5	2
490	1	7016	7	35	3	\N	1.8	7200	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	3545.0	\N	\N	\N	2021-12-02 12:49:24.126377	2021-12-02 12:49:24.126377	\N	6	2
491	1	7017	7	35	3	\N	2	8640	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	3546.0	\N	\N	\N	2021-12-02 12:49:24.148843	2021-12-02 12:49:24.148843	\N	7	2
492	1	7018	7	35	3	\N	2.2	10080	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	3547.0	\N	\N	\N	2021-12-02 12:49:24.171734	2021-12-02 12:49:24.171734	\N	8	2
493	1	7019	7	35	3	\N	3	11520	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	11520	USD	2.2	\N	1	1	\N	3548.0	\N	\N	\N	2021-12-02 12:49:24.194689	2021-12-02 12:49:24.194689	\N	9	2
494	1	7020	7	35	4	\N	0.5	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	2021-12-02 12:49:24.217316	2021-12-02 12:49:24.217316	\N	10	2
495	1	7021	7	35	4	\N	1	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	2021-12-02 12:49:24.239596	2021-12-02 12:49:24.239596	\N	1	2
496	1	7022	7	35	5	\N	0.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	2021-12-02 12:49:24.26197	2021-12-02 12:49:24.26197	\N	4	2
497	1	7023	7	35	5	\N	1	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	2021-12-02 12:49:24.284246	2021-12-02 12:49:24.284246	\N	5	2
498	1	7024	7	35	5	\N	1.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	2021-12-02 12:49:24.30677	2021-12-02 12:49:24.30677	\N	6	2
499	1	7025	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	2021-12-02 12:49:24.361041	2021-12-02 12:49:24.361041	\N	7	2
500	1	7026	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	2021-12-02 12:49:24.384681	2021-12-02 12:49:24.384681	\N	8	2
501	1	7027	7	36	1	\N	1	1800	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	2021-12-02 12:49:24.407487	2021-12-02 12:49:24.407487	\N	3	2
502	1	7028	7	36	4	\N	0.5	0	USD	\N	2	4	2	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	2021-12-02 12:49:24.430272	2021-12-02 12:49:24.430272	\N	3	2
503	1	7029	7	37	1	\N	4	17200	USD	\N	1	1	1	33	1	\N	2	\N	\N	0	USD	0	USD	4	\N	1	1	\N	4521.0	\N	\N	\N	2021-12-02 12:49:24.452945	2021-12-02 12:49:24.452945	\N	19	2
504	1	7031	7	37	2	\N	1.3	2880	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4551.0	\N	\N	\N	2021-12-02 12:49:24.476544	2021-12-02 12:49:24.476544	\N	4	2
505	1	7032	7	37	2	\N	1.8	5760	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	4553.0	\N	\N	\N	2021-12-02 12:49:24.498958	2021-12-02 12:49:24.498958	\N	5	2
506	1	7033	7	37	2	\N	2	8640	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4554.0	\N	\N	\N	2021-12-02 12:49:24.52142	2021-12-02 12:49:24.52142	\N	6	2
507	1	7034	7	37	2	\N	2.5	11520	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	4555.0	\N	\N	\N	2021-12-02 12:49:24.544524	2021-12-02 12:49:24.544524	\N	7	2
508	1	7035	7	37	2	\N	3	14400	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.9	\N	1	1	\N	4556.0	\N	\N	\N	2021-12-02 12:49:24.566574	2021-12-02 12:49:24.566574	\N	8	2
509	1	7036	7	37	3	\N	1	2880	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4543.0	\N	\N	\N	2021-12-02 12:49:24.589247	2021-12-02 12:49:24.589247	\N	1	2
510	1	7037	7	37	3	\N	1.3	5760	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4544.0	\N	\N	\N	2021-12-02 12:49:24.611272	2021-12-02 12:49:24.611272	\N	4	2
511	1	7038	7	37	3	\N	1.8	7200	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4545.0	\N	\N	\N	2021-12-02 12:49:24.633663	2021-12-02 12:49:24.633663	\N	5	2
512	1	7039	7	37	3	\N	2	8640	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	11500	USD	1.7	\N	1	1	\N	4546.0	\N	\N	\N	2021-12-02 12:49:24.655955	2021-12-02 12:49:24.655955	\N	6	2
513	1	7040	7	37	3	\N	2.5	10080	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4547.0	\N	\N	\N	2021-12-02 12:49:24.677862	2021-12-02 12:49:24.677862	\N	7	2
514	1	7041	7	37	3	\N	3	11500	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4548.0	\N	\N	\N	2021-12-02 12:49:24.700319	2021-12-02 12:49:24.700319	\N	8	2
515	1	7042	7	37	4	\N	1	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	2021-12-02 12:49:24.722415	2021-12-02 12:49:24.722415	\N	10	2
516	1	7043	7	37	4	\N	1.2	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	2021-12-02 12:49:24.744937	2021-12-02 12:49:24.744937	\N	1	2
517	1	7044	7	37	5	\N	1	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	2021-12-02 12:49:24.767263	2021-12-02 12:49:24.767263	\N	4	2
518	1	7045	7	37	5	\N	1.2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	2021-12-02 12:49:24.789983	2021-12-02 12:49:24.789983	\N	5	2
519	1	7046	7	37	5	\N	1.8	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	2021-12-02 12:49:24.812577	2021-12-02 12:49:24.812577	\N	6	2
520	1	7047	7	37	5	\N	2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	2021-12-02 12:49:24.834848	2021-12-02 12:49:24.834848	\N	7	2
521	1	7048	7	37	5	\N	2.5	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	2021-12-02 12:49:24.857254	2021-12-02 12:49:24.857254	\N	8	2
522	1	7049	7	38	1	\N	1	1200	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	2021-12-02 12:49:24.879569	2021-12-02 12:49:24.879569	\N	3	2
523	1	7050	7	38	4	\N	1	0	USD	\N	2	4	9	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	2021-12-02 12:49:24.902455	2021-12-02 12:49:24.902455	\N	3	2
524	1	7051	7	39	1	\N	1.2	9587	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	1	1	\N	7121.0	\N	\N	\N	2021-12-02 12:49:24.925202	2021-12-02 12:49:24.925202	\N	3	2
525	1	7052	7	39	1	\N	2.4	19174	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	2	1	\N	7121.0	\N	\N	\N	2021-12-02 12:49:24.94812	2021-12-02 12:49:24.94812	\N	1	2
526	1	7053	7	39	1	\N	3.6	28760	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	3	1	\N	7121.0	\N	\N	\N	2021-12-02 12:49:24.971024	2021-12-02 12:49:24.971024	\N	4	2
527	1	7054	7	39	1	\N	4.8	38347	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	4	1	\N	7121.0	\N	\N	\N	2021-12-02 12:49:25.027458	2021-12-02 12:49:25.027458	\N	2	2
528	1	7055	7	39	3	\N	1	2160	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	2160	USD	0.9	\N	1	1	\N	7141.0	\N	\N	\N	2021-12-02 12:49:25.05026	2021-12-02 12:49:25.05026	\N	1	2
529	1	7056	7	39	3	\N	1.2	3240	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	3240	USD	1	\N	1	1	\N	7142.0	\N	\N	\N	2021-12-02 12:49:25.073944	2021-12-02 12:49:25.073944	\N	4	2
530	1	7057	7	39	3	\N	1.8	6480	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	6480	USD	1.2	\N	1	1	\N	7144.0	\N	\N	\N	2021-12-02 12:49:25.097445	2021-12-02 12:49:25.097445	\N	5	2
531	1	7058	7	39	3	\N	2	9720	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	9720	USD	1.3	\N	1	1	\N	7145.0	\N	\N	\N	2021-12-02 12:49:25.120468	2021-12-02 12:49:25.120468	\N	6	2
532	1	7059	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	7182.0	\N	\N	\N	2021-12-02 12:49:25.143221	2021-12-02 12:49:25.143221	\N	3	2
533	1	7060	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	2	1	\N	7182.0	\N	\N	\N	2021-12-02 12:49:25.165923	2021-12-02 12:49:25.165923	\N	10	2
534	1	7061	7	39	4	\N	0.6	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	3	1	\N	7182.0	\N	\N	\N	2021-12-02 12:49:25.188201	2021-12-02 12:49:25.188201	\N	3	2
535	1	7062	7	39	4	\N	0.8	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	4	1	\N	7182.0	\N	\N	\N	2021-12-02 12:49:25.21124	2021-12-02 12:49:25.21124	\N	1	2
536	1	7063	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	2021-12-02 12:49:25.233567	2021-12-02 12:49:25.233567	\N	4	2
537	1	7064	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	2021-12-02 12:49:25.256088	2021-12-02 12:49:25.256088	\N	5	2
538	1	7065	7	39	5	\N	0.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	2021-12-02 12:49:25.278702	2021-12-02 12:49:25.278702	\N	6	2
539	1	7066	7	39	5	\N	0.8	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	2021-12-02 12:49:25.301015	2021-12-02 12:49:25.301015	\N	7	2
540	1	7067	7	40	1	\N	3.3	9600	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7521.0	\N	\N	\N	2021-12-02 12:49:25.323529	2021-12-02 12:49:25.323529	\N	3	2
541	1	7068	7	40	1	\N	6.6	18000	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	2	1	\N	7521.0	\N	\N	\N	2021-12-02 12:49:25.346244	2021-12-02 12:49:25.346244	\N	1	2
542	1	7069	7	40	3	\N	0.8	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	7541.0	\N	\N	\N	2021-12-02 12:49:25.368849	2021-12-02 12:49:25.368849	\N	3	2
543	1	7070	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1	\N	1	1	\N	7542.0	\N	\N	\N	2021-12-02 12:49:25.390949	2021-12-02 12:49:25.390949	\N	1	2
544	1	7071	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	7543.0	\N	\N	\N	2021-12-02 12:49:25.413841	2021-12-02 12:49:25.413841	\N	4	2
545	1	7072	7	40	3	\N	1.2	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	7544.0	\N	\N	\N	2021-12-02 12:49:25.436423	2021-12-02 12:49:25.436423	\N	5	2
546	1	7073	7	40	3	\N	1.4	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.4	\N	1	1	\N	7545.0	\N	\N	\N	2021-12-02 12:49:25.45892	2021-12-02 12:49:25.45892	\N	6	2
547	1	7074	7	40	3	\N	1.6	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	7546.0	\N	\N	\N	2021-12-02 12:49:25.482845	2021-12-02 12:49:25.482845	\N	7	2
548	1	7075	7	40	4	\N	0.5	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	7582.0	\N	\N	\N	2021-12-02 12:49:25.505027	2021-12-02 12:49:25.505027	\N	3	2
549	1	7076	7	40	4	\N	0.8	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	7582.0	\N	\N	\N	2021-12-02 12:49:25.527738	2021-12-02 12:49:25.527738	\N	1	2
550	1	7077	7	40	5	\N	0.5	0	USD	\N	29	4	9	35	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7581.0	\N	\N	\N	2021-12-02 12:49:25.549979	2021-12-02 12:49:25.549979	\N	3	2
551	1	7078	7	41	1	\N	8.7	28200	USD	\N	30	1	1	36	1	\N	3	\N	\N	0	USD	0	USD	8.7	\N	1	1	\N	7321.0	\N	\N	\N	2021-12-02 12:49:25.572741	2021-12-02 12:49:25.572741	\N	3	2
552	1	7079	7	41	2	\N	1	2800	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	2.7	\N	1	1	\N	7351.0	\N	\N	\N	2021-12-02 12:49:25.594884	2021-12-02 12:49:25.594884	\N	1	2
553	1	7080	7	41	2	\N	1.1	3120	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7352.0	\N	\N	\N	2021-12-02 12:49:25.61707	2021-12-02 12:49:25.61707	\N	4	2
554	1	7081	7	41	2	\N	1.3	6240	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.9	\N	1	1	\N	7353.0	\N	\N	\N	2021-12-02 12:49:25.667336	2021-12-02 12:49:25.667336	\N	5	2
555	1	7082	7	41	2	\N	1.6	9360	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	7354.0	\N	\N	\N	2021-12-02 12:49:25.696566	2021-12-02 12:49:25.696566	\N	6	2
556	1	7083	7	41	3	\N	1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	2021-12-02 12:49:25.720344	2021-12-02 12:49:25.720344	\N	1	2
557	1	7084	7	41	3	\N	1.1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	2021-12-02 12:49:25.743845	2021-12-02 12:49:25.743845	\N	4	2
558	1	7085	7	41	3	\N	1.3	9360	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	6240	USD	1.3	\N	1	1	\N	7357.0	\N	\N	\N	2021-12-02 12:49:25.76704	2021-12-02 12:49:25.76704	\N	5	2
559	1	7086	7	41	3	\N	1.6	12480	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	9360	USD	1.6	\N	1	1	\N	7358.0	\N	\N	\N	2021-12-02 12:49:25.790336	2021-12-02 12:49:25.790336	\N	6	2
560	1	7087	7	41	4	\N	1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	7381.0	\N	\N	\N	2021-12-02 12:49:25.812704	2021-12-02 12:49:25.812704	\N	1	2
561	1	7088	7	41	4	\N	1.1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	2021-12-02 12:49:25.835473	2021-12-02 12:49:25.835473	\N	4	2
562	1	7089	7	41	4	\N	1.3	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	2021-12-02 12:49:25.858435	2021-12-02 12:49:25.858435	\N	5	2
563	1	7090	7	41	5	\N	1	0	USD	\N	30	5	9	36	5	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	2021-12-02 12:49:25.881408	2021-12-02 12:49:25.881408	\N	3	2
564	1	7091	7	42	1	\N	1.5	3600	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 12:49:25.904033	2021-12-02 12:49:25.904033	\N	3	2
565	1	7092	7	42	1	\N	2.5	7200	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 12:49:25.926694	2021-12-02 12:49:25.926694	\N	1	2
566	1	7093	7	42	3	\N	0.5	1400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 12:49:25.948896	2021-12-02 12:49:25.948896	\N	3	2
567	1	7094	7	42	3	\N	1	2400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 12:49:25.971396	2021-12-02 12:49:25.971396	\N	1	2
568	1	7095	7	42	3	\N	1	3600	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 12:49:25.993486	2021-12-02 12:49:25.993486	\N	4	2
569	1	7096	7	42	4	\N	0.5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	2021-12-02 12:49:26.015066	2021-12-02 12:49:26.015066	\N	3	2
570	1	7097	7	42	4	\N	5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	2021-12-02 12:49:26.036943	2021-12-02 12:49:26.036943	\N	1	2
571	1	7098	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	2021-12-02 12:49:26.058819	2021-12-02 12:49:26.058819	\N	3	2
572	1	7099	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	2021-12-02 12:49:26.079803	2021-12-02 12:49:26.079803	\N	1	2
573	1	7100	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	7482.0	\N	\N	\N	2021-12-02 12:49:26.101238	2021-12-02 12:49:26.101238	\N	4	2
574	1	7101	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	7482.0	\N	\N	\N	2021-12-02 12:49:26.122578	2021-12-02 12:49:26.122578	\N	2	2
575	1	7102	7	39	5	\N	1	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	2021-12-02 12:49:26.144925	2021-12-02 12:49:26.144925	\N	8	2
576	1	7103	7	39	5	\N	1.2	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	2021-12-02 12:49:26.167354	2021-12-02 12:49:26.167354	\N	18	2
577	1	7104	7	39	5	\N	1.4	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	2021-12-02 12:49:26.189525	2021-12-02 12:49:26.189525	\N	34	2
578	1	7105	7	39	5	\N	1.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	2021-12-02 12:49:26.211372	2021-12-02 12:49:26.211372	\N	19	2
579	1	7106	7	43	1	\N	4	17200	USD	\N	1	1	1	38	1	\N	2	\N	\N	0	USD	21000	USD	3.8	\N	1	1	\N	2523.0	\N	\N	\N	2021-12-02 12:49:26.233245	2021-12-02 12:49:26.233245	\N	19	2
580	1	7107	7	43	2	\N	1.3	2880	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	2021-12-02 12:49:26.255189	2021-12-02 12:49:26.255189	\N	4	2
581	1	7108	7	43	2	\N	1.8	5760	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	2021-12-02 12:49:26.278027	2021-12-02 12:49:26.278027	\N	5	2
582	1	7109	7	43	2	\N	2	8640	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	2021-12-02 12:49:26.300628	2021-12-02 12:49:26.300628	\N	6	2
583	1	7110	7	43	2	\N	2.5	11520	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	2021-12-02 12:49:26.356881	2021-12-02 12:49:26.356881	\N	7	2
584	1	7111	7	43	2	\N	3	14400	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	2021-12-02 12:49:26.381285	2021-12-02 12:49:26.381285	\N	8	2
585	1	7112	7	43	3	\N	1	2880	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	2550.0	\N	\N	\N	2021-12-02 12:49:26.405092	2021-12-02 12:49:26.405092	\N	1	2
586	1	7113	7	43	3	\N	1.3	5760	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	2021-12-02 12:49:26.428896	2021-12-02 12:49:26.428896	\N	4	2
587	1	7114	7	43	3	\N	1.8	7200	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	2021-12-02 12:49:26.452108	2021-12-02 12:49:26.452108	\N	5	2
588	1	7115	7	43	3	\N	2	8640	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	2021-12-02 12:49:26.475095	2021-12-02 12:49:26.475095	\N	6	2
589	1	7116	7	43	3	\N	2.5	10080	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	2021-12-02 12:49:26.498272	2021-12-02 12:49:26.498272	\N	7	2
590	1	7117	7	43	3	\N	3	11500	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	2021-12-02 12:49:26.520945	2021-12-02 12:49:26.520945	\N	8	2
591	1	7118	7	43	4	\N	1	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 12:49:26.543027	2021-12-02 12:49:26.543027	\N	10	2
592	1	7119	7	43	4	\N	1.2	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 12:49:26.565383	2021-12-02 12:49:26.565383	\N	1	2
593	1	7120	7	43	5	\N	1	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 12:49:26.587719	2021-12-02 12:49:26.587719	\N	4	2
594	1	7121	7	43	5	\N	1.2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 12:49:26.609525	2021-12-02 12:49:26.609525	\N	5	2
595	1	7122	7	43	5	\N	1.8	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 12:49:26.631715	2021-12-02 12:49:26.631715	\N	6	2
596	1	7123	7	43	5	\N	2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 12:49:26.653847	2021-12-02 12:49:26.653847	\N	7	2
597	1	7124	7	43	5	\N	2.5	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 12:49:26.676106	2021-12-02 12:49:26.676106	\N	8	2
598	1	8000	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	2021-12-02 12:49:26.698869	2021-12-02 12:49:26.698869	\N	1	1
599	1	8001	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	2021-12-02 12:49:26.721386	2021-12-02 12:49:26.721386	\N	2	1
600	1	8002	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	2021-12-02 12:49:26.743438	2021-12-02 12:49:26.743438	\N	1	1
601	1	8003	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	2021-12-02 12:49:26.7659	2021-12-02 12:49:26.7659	\N	2	1
602	1	8004	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	2021-12-02 12:49:26.7887	2021-12-02 12:49:26.7887	\N	1	1
603	1	8005	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	2021-12-02 12:49:26.810602	2021-12-02 12:49:26.810602	\N	2	1
604	1	8006	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	2021-12-02 12:49:26.832997	2021-12-02 12:49:26.832997	\N	1	1
605	1	8007	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:26.85528	2021-12-02 12:49:26.85528	\N	2	1
606	1	8008	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	2021-12-02 12:49:26.877385	2021-12-02 12:49:26.877385	\N	1	1
607	1	8009	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:26.899747	2021-12-02 12:49:26.899747	\N	2	1
608	1	8010	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:26.92157	2021-12-02 12:49:26.92157	\N	1	1
609	1	8011	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:26.943898	2021-12-02 12:49:26.943898	\N	2	1
610	1	8012	8	44	22	\N	0.5	0	USD	\N	33	17	16	45	20	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:26.966755	2021-12-02 12:49:26.966755	\N	1	1
611	1	8013	8	44	23	\N	0.5	0	USD	\N	4	18	17	46	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.021087	2021-12-02 12:49:27.021087	\N	2	1
612	1	8014	8	44	23	\N	0.5	0	USD	\N	4	18	17	47	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.043838	2021-12-02 12:49:27.043838	\N	16	1
613	1	8015	8	44	23	\N	0.5	0	USD	\N	4	18	17	48	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.066487	2021-12-02 12:49:27.066487	\N	7	1
614	1	8016	8	44	23	\N	0.5	0	USD	\N	4	18	17	49	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.088878	2021-12-02 12:49:27.088878	\N	46	1
615	1	8017	8	44	23	\N	0.5	0	USD	\N	4	18	17	50	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.111201	2021-12-02 12:49:27.111201	\N	1	1
616	1	8018	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.133734	2021-12-02 12:49:27.133734	\N	3	2
617	1	8019	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.1564	2021-12-02 12:49:27.1564	\N	1	2
618	1	8020	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.179241	2021-12-02 12:49:27.179241	\N	4	2
619	1	8021	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.201703	2021-12-02 12:49:27.201703	\N	2	2
620	1	8022	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.22386	2021-12-02 12:49:27.22386	\N	3	2
621	1	8023	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.246917	2021-12-02 12:49:27.246917	\N	5	2
622	1	8024	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.269399	2021-12-02 12:49:27.269399	\N	26	2
623	1	8025	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.291467	2021-12-02 12:49:27.291467	\N	16	2
624	1	8026	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.313451	2021-12-02 12:49:27.313451	\N	6	2
625	1	8027	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.335567	2021-12-02 12:49:27.335567	\N	10	2
626	1	8028	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.358211	2021-12-02 12:49:27.358211	\N	12	2
627	1	8029	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 12:49:27.380615	2021-12-02 12:49:27.380615	\N	7	2
628	1	8030	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	2021-12-02 12:49:27.402907	2021-12-02 12:49:27.402907	\N	6	11
629	1	8031	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	2021-12-02 12:49:27.425216	2021-12-02 12:49:27.425216	\N	9	16
630	1	8032	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	2021-12-02 12:49:27.447595	2021-12-02 12:49:27.447595	\N	20	17
631	1	8033	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	2021-12-02 12:49:27.4695	2021-12-02 12:49:27.4695	\N	49	18
632	1	8034	9	45	1	\N	0.5	500	USD	\N	34	1	6	52	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	951.0	\N	\N	\N	2021-12-02 12:49:27.491841	2021-12-02 12:49:27.491841	\N	3	2
633	1	8035	9	46	1	\N	0.5	500	USD	\N	34	1	6	53	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	952.0	\N	\N	\N	2021-12-02 12:49:27.514711	2021-12-02 12:49:27.514711	\N	3	2
634	1	8036	9	47	1	\N	1	0	USD	\N	35	1	6	54	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.537408	2021-12-02 12:49:27.537408	\N	3	2
635	1	8037	9	48	1	\N	1	0	USD	\N	36	1	6	55	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.560342	2021-12-02 12:49:27.560342	\N	3	2
636	1	8038	9	49	1	\N	2	500	USD	\N	37	1	6	56	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.582894	2021-12-02 12:49:27.582894	\N	3	2
637	1	8039	9	50	1	\N	0.5	0	USD	\N	38	1	6	57	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.604489	2021-12-02 12:49:27.604489	\N	3	2
638	1	8040	9	51	1	\N	0.5	0	USD	\N	34	1	6	58	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.627072	2021-12-02 12:49:27.627072	\N	3	2
639	1	8041	9	52	1	\N	0.5	0	USD	\N	39	1	6	59	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.681829	2021-12-02 12:49:27.681829	\N	3	2
640	1	8042	9	53	1	\N	0.5	0	USD	\N	40	1	6	60	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.704911	2021-12-02 12:49:27.704911	\N	3	2
641	1	8043	9	54	1	\N	0.5	0	USD	\N	41	1	6	61	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.728529	2021-12-02 12:49:27.728529	\N	3	2
642	1	8044	9	55	1	\N	0.5	0	USD	\N	42	1	6	62	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.751016	2021-12-02 12:49:27.751016	\N	3	2
643	1	8045	9	56	1	\N	0.5	0	USD	\N	32	1	6	63	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.773866	2021-12-02 12:49:27.773866	\N	3	2
644	1	8046	9	57	1	\N	0.5	0	USD	\N	43	1	6	64	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.796332	2021-12-02 12:49:27.796332	\N	3	2
645	1	8047	9	58	1	\N	2	500	USD	\N	43	1	6	65	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.81861	2021-12-02 12:49:27.81861	\N	3	2
646	1	8048	9	59	1	\N	0.5	0	USD	\N	44	1	6	66	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 12:49:27.841891	2021-12-02 12:49:27.841891	\N	3	2
647	1	8049	9	60	8	\N	0.5	300	USD	\N	45	8	7	67	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	2021-12-02 12:49:27.864065	2021-12-02 12:49:27.864065	\N	3	2
648	1	8050	9	61	8	\N	0.5	0	USD	\N	46	8	7	68	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	2021-12-02 12:49:27.886555	2021-12-02 12:49:27.886555	\N	3	2
649	1	8051	9	62	8	\N	0.5	0	USD	\N	37	8	7	69	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	2021-12-02 12:49:27.908454	2021-12-02 12:49:27.908454	\N	3	2
650	1	8052	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:27.931159	2021-12-02 12:49:27.931159	\N	3	2
651	1	8053	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:27.954349	2021-12-02 12:49:27.954349	\N	1	2
652	1	8054	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:27.9767	2021-12-02 12:49:27.9767	\N	4	2
653	1	8055	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:27.9991	2021-12-02 12:49:27.9991	\N	2	2
654	1	8056	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.021545	2021-12-02 12:49:28.021545	\N	3	2
655	1	8057	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.044415	2021-12-02 12:49:28.044415	\N	5	2
656	1	8058	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.066941	2021-12-02 12:49:28.066941	\N	26	2
657	1	8059	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.089798	2021-12-02 12:49:28.089798	\N	16	2
658	1	8060	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.112312	2021-12-02 12:49:28.112312	\N	6	2
659	1	8061	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.135026	2021-12-02 12:49:28.135026	\N	10	2
660	1	8062	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.157378	2021-12-02 12:49:28.157378	\N	3	2
661	1	8063	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.179885	2021-12-02 12:49:28.179885	\N	1	2
662	1	8064	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.201736	2021-12-02 12:49:28.201736	\N	4	2
663	1	8065	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.223756	2021-12-02 12:49:28.223756	\N	2	2
664	1	8066	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.245965	2021-12-02 12:49:28.245965	\N	3	2
665	1	8067	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.268677	2021-12-02 12:49:28.268677	\N	5	2
666	1	8068	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.291665	2021-12-02 12:49:28.291665	\N	26	2
667	1	8069	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.346514	2021-12-02 12:49:28.346514	\N	16	2
668	1	8070	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.369869	2021-12-02 12:49:28.369869	\N	6	2
669	1	8071	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.393173	2021-12-02 12:49:28.393173	\N	10	2
670	1	8072	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.416477	2021-12-02 12:49:28.416477	\N	3	2
671	1	8073	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.439195	2021-12-02 12:49:28.439195	\N	1	2
672	1	8074	10	63	27	\N	0.5	1200	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.461326	2021-12-02 12:49:28.461326	\N	4	2
673	1	8075	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.483899	2021-12-02 12:49:28.483899	\N	2	2
674	1	8076	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.506937	2021-12-02 12:49:28.506937	\N	3	2
675	1	8077	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.529857	2021-12-02 12:49:28.529857	\N	5	2
676	1	8078	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.553198	2021-12-02 12:49:28.553198	\N	26	2
677	1	8079	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.575989	2021-12-02 12:49:28.575989	\N	16	2
678	1	8080	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.598007	2021-12-02 12:49:28.598007	\N	6	2
679	1	8081	10	63	27	\N	2	1500	USD	\N	4	19	1	6	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 12:49:28.620391	2021-12-02 12:49:28.620391	\N	10	2
680	1	8090	9	64	28	\N	16	67500	USD	\N	4	6	1	6	24	\N	3	\N	\N	0	USD	67500	USD	16	\N	1	1	\N	9999.0	\N	\N	\N	2021-12-02 12:49:28.642487	2021-12-02 12:49:28.642487	\N	3	2
681	1	8091	9	64	29	\N	3	157500	USD	\N	4	1	1	6	1	\N	3	\N	\N	0	USD	157500	USD	3	\N	1	1	\N	9999.0	\N	\N	\N	2021-12-02 12:49:28.664836	2021-12-02 12:49:28.664836	\N	3	2
682	1	8100	11	65	30	\N	1	0	USD	\N	4	5	1	6	25	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	2021-12-02 12:49:28.687104	2021-12-02 12:49:28.687104	\N	3	2
683	1	8101	11	65	31	\N	0.5	0	USD	\N	4	5	1	6	19	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	2021-12-02 12:49:28.709768	2021-12-02 12:49:28.709768	\N	3	2
684	1	9001	12	66	1	\N	1.2	10000	USD	\N	47	1	21	72	26	\N	3	\N	\N	0	USD	800	USD	0.3	\N	1	2	\N	2326.0	\N	\N	\N	2021-12-02 12:49:28.732247	2021-12-02 12:49:28.732247	\N	3	2
685	1	9002	12	66	3	\N	1.2	800	USD	\N	47	3	21	72	27	\N	3	\N	\N	0	USD	800	USD	0.3	\N	2	2	\N	2326.0	\N	\N	\N	2021-12-02 12:49:28.755125	2021-12-02 12:49:28.755125	\N	3	2
686	1	9003	12	66	32	\N	1.2	800	USD	\N	47	6	9	72	28	\N	3	\N	\N	0	USD	800	USD	0.3	\N	3	2	\N	2326.0	\N	\N	\N	2021-12-02 12:49:28.777425	2021-12-02 12:49:28.777425	\N	3	2
687	1	9004	12	66	7	\N	1.2	800	USD	\N	47	8	9	72	29	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 12:49:28.799995	2021-12-02 12:49:28.799995	\N	3	2
688	1	9005	12	66	33	\N	1.2	800	USD	\N	47	10	9	72	30	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 12:49:28.822678	2021-12-02 12:49:28.822678	\N	3	2
689	1	9006	12	66	34	\N	1.2	800	USD	\N	47	11	9	72	31	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 12:49:28.845705	2021-12-02 12:49:28.845705	\N	3	2
690	1	9007	12	66	5	\N	1.2	800	USD	\N	47	5	9	72	32	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 12:49:28.868059	2021-12-02 12:49:28.868059	\N	3	2
691	1	9008	12	66	35	\N	1.2	800	USD	\N	47	20	5	72	33	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 12:49:28.890347	2021-12-02 12:49:28.890347	\N	3	2
692	1	9009	12	67	1	\N	1.2	10000	USD	\N	48	1	9	73	26	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 12:49:28.912605	2021-12-02 12:49:28.912605	\N	3	2
693	1	9010	12	67	2	\N	1.2	3000	USD	\N	48	2	9	73	34	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 12:49:28.935004	2021-12-02 12:49:28.935004	\N	3	2
694	1	9011	12	67	3	\N	1.2	3000	USD	\N	48	3	9	73	27	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 12:49:28.991771	2021-12-02 12:49:28.991771	\N	3	2
695	1	9012	12	67	7	\N	1.2	800	USD	\N	48	8	7	73	29	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 12:49:29.014245	2021-12-02 12:49:29.014245	\N	3	2
696	1	9013	12	67	5	\N	1.2	0	USD	\N	48	5	2	73	32	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 12:49:29.037705	2021-12-02 12:49:29.037705	\N	3	2
697	1	9014	12	67	36	\N	1.2	200	USD	\N	48	7	9	73	35	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 12:49:29.061129	2021-12-02 12:49:29.061129	\N	3	2
698	1	9015	12	68	1	\N	1.2	8000	USD	\N	49	1	9	74	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.084094	2021-12-02 12:49:29.084094	\N	3	2
699	1	9016	12	68	2	\N	1.2	1000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.106502	2021-12-02 12:49:29.106502	\N	4	2
700	1	9017	12	68	2	\N	1.2	2000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.129094	2021-12-02 12:49:29.129094	\N	5	2
701	1	9018	12	68	2	\N	1.2	3000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.151763	2021-12-02 12:49:29.151763	\N	6	2
702	1	9019	12	68	2	\N	1.2	4000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.174577	2021-12-02 12:49:29.174577	\N	7	2
703	1	9020	12	68	7	\N	1.2	800	USD	\N	49	8	9	74	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	2021-12-02 12:49:29.197535	2021-12-02 12:49:29.197535	\N	3	2
704	1	9021	12	69	2	\N	1.2	800	USD	\N	21	2	9	75	34	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	2021-12-02 12:49:29.220169	2021-12-02 12:49:29.220169	\N	3	2
705	1	9022	12	70	1	\N	1.2	8000	USD	\N	50	1	9	76	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.243095	2021-12-02 12:49:29.243095	\N	3	2
706	1	9023	12	70	2	\N	1.2	1000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.265549	2021-12-02 12:49:29.265549	\N	4	2
707	1	9024	12	70	2	\N	1.2	2000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.288806	2021-12-02 12:49:29.288806	\N	5	2
708	1	9025	12	70	2	\N	1.2	3000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.311082	2021-12-02 12:49:29.311082	\N	6	2
709	1	9026	12	70	2	\N	1.2	4000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	2021-12-02 12:49:29.333434	2021-12-02 12:49:29.333434	\N	7	2
710	1	9027	12	70	7	\N	1.2	800	USD	\N	50	8	9	76	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	2021-12-02 12:49:29.355479	2021-12-02 12:49:29.355479	\N	3	2
711	1	9028	12	71	1	\N	1	6500	USD	\N	51	1	9	77	26	\N	3	\N	\N	0	USD	5000	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	2021-12-02 12:49:29.377445	2021-12-02 12:49:29.377445	\N	3	2
712	1	9029	12	71	33	\N	1	300	USD	\N	51	10	1	77	30	\N	3	\N	\N	0	USD	0	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	2021-12-02 12:49:29.39996	2021-12-02 12:49:29.39996	\N	3	2
713	1	9030	12	71	5	\N	0.5	300	USD	\N	51	5	2	77	32	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	2	\N	5281.0	\N	\N	\N	2021-12-02 12:49:29.42247	2021-12-02 12:49:29.42247	\N	3	2
714	1	9031	12	72	1	\N	1	6500	USD	\N	19	1	9	78	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	2021-12-02 12:49:29.444698	2021-12-02 12:49:29.444698	\N	3	2
715	1	9032	12	72	5	\N	0.5	300	USD	\N	19	5	9	78	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	2021-12-02 12:49:29.467016	2021-12-02 12:49:29.467016	\N	3	2
716	1	9033	12	73	32	\N	1.4	1920	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.491491	2021-12-02 12:49:29.491491	\N	4	17
717	1	9034	12	73	32	\N	1.5	2160	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	2021-12-02 12:49:29.514231	2021-12-02 12:49:29.514231	\N	2	5
718	1	9035	12	73	32	\N	1.6	2400	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	2021-12-02 12:49:29.537012	2021-12-02 12:49:29.537012	\N	8	6
719	1	9036	12	73	32	\N	1.8	2880	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	2021-12-02 12:49:29.559706	2021-12-02 12:49:29.559706	\N	5	8
720	1	9037	12	73	7	\N	1.2	800	USD	\N	52	8	9	79	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.582508	2021-12-02 12:49:29.582508	\N	3	2
721	1	9038	12	73	37	\N	1.5	2800	USD	\N	52	21	9	79	36	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.604923	2021-12-02 12:49:29.604923	\N	3	2
722	1	9039	12	73	5	\N	1	0	USD	\N	52	5	2	79	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.658606	2021-12-02 12:49:29.658606	\N	3	2
723	1	9040	12	74	38	\N	0.5	1000	USD	\N	53	22	1	80	37	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.681537	2021-12-02 12:49:29.681537	\N	3	2
724	1	9041	12	75	39	\N	1.5	1200	USD	\N	54	23	19	81	38	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.704774	2021-12-02 12:49:29.704774	\N	3	2
725	1	9042	12	75	32	\N	1.4	1920	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.727853	2021-12-02 12:49:29.727853	\N	4	17
726	1	9043	12	75	32	\N	1.5	2160	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	2021-12-02 12:49:29.750603	2021-12-02 12:49:29.750603	\N	2	5
727	1	9044	12	75	32	\N	1.6	2400	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	2021-12-02 12:49:29.773966	2021-12-02 12:49:29.773966	\N	8	6
728	1	9045	12	75	32	\N	1.8	2880	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	2021-12-02 12:49:29.796491	2021-12-02 12:49:29.796491	\N	5	8
729	1	9046	12	75	7	\N	1.2	800	USD	\N	54	8	22	81	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.819256	2021-12-02 12:49:29.819256	\N	3	2
730	1	9047	12	75	40	\N	1.2	800	USD	\N	54	18	19	81	39	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.841345	2021-12-02 12:49:29.841345	\N	3	2
731	1	9048	12	75	5	\N	1	0	USD	\N	54	5	2	81	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.863797	2021-12-02 12:49:29.863797	\N	3	2
732	1	9049	12	75	36	\N	1	600	USD	\N	54	7	3	81	35	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 12:49:29.88572	2021-12-02 12:49:29.88572	\N	3	2
733	1	9050	12	76	32	\N	1	600	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	1900	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	2021-12-02 12:49:29.908392	2021-12-02 12:49:29.908392	\N	3	6
734	1	9051	12	76	32	\N	1.4	1920	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	2400	USD	0.9	\N	1	2	\N	6502.0	\N	\N	\N	2021-12-02 12:49:29.930601	2021-12-02 12:49:29.930601	\N	4	17
735	1	9052	12	76	32	\N	1.5	2160	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	3500	USD	1.3	\N	1	2	\N	6511.0	\N	\N	\N	2021-12-02 12:49:29.953393	2021-12-02 12:49:29.953393	\N	2	5
736	1	9053	12	76	32	\N	1.6	2400	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	5500	USD	1.7	\N	1	2	\N	6512.0	\N	\N	\N	2021-12-02 12:49:29.975803	2021-12-02 12:49:29.975803	\N	8	6
737	1	9054	12	76	32	\N	1.8	2880	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	7500	USD	2.1	\N	1	2	\N	6513.0	\N	\N	\N	2021-12-02 12:49:29.998847	2021-12-02 12:49:29.998847	\N	5	8
738	1	9055	12	76	40	\N	1.2	800	USD	\N	4	18	19	82	39	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	2021-12-02 12:49:30.021154	2021-12-02 12:49:30.021154	\N	3	2
739	1	9056	12	76	5	\N	1	0	USD	\N	4	5	2	82	32	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	2021-12-02 12:49:30.043657	2021-12-02 12:49:30.043657	\N	3	2
740	1	9057	12	76	36	\N	1	600	USD	\N	4	7	3	82	35	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	2021-12-02 12:49:30.066066	2021-12-02 12:49:30.066066	\N	3	2
741	1	9058	12	77	1	\N	3	21000	USD	\N	55	1	9	83	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	2021-12-02 12:49:30.088944	2021-12-02 12:49:30.088944	\N	51	23
742	1	9059	12	77	2	\N	1	3000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	2021-12-02 12:49:30.111548	2021-12-02 12:49:30.111548	\N	4	23
743	1	9060	12	77	2	\N	2	6000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.134085	2021-12-02 12:49:30.134085	\N	5	23
744	1	9061	12	77	2	\N	3	9000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.156381	2021-12-02 12:49:30.156381	\N	6	23
745	1	9062	12	77	2	\N	3.5	12000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.179095	2021-12-02 12:49:30.179095	\N	7	23
746	1	9063	12	77	5	\N	1	0	USD	\N	55	5	2	83	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.201017	2021-12-02 12:49:30.201017	\N	3	2
747	1	9064	12	77	41	\N	1	600	USD	\N	55	4	3	83	40	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.223088	2021-12-02 12:49:30.223088	\N	3	2
748	1	9065	12	77	36	\N	0.5	300	USD	\N	55	7	3	83	35	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.245767	2021-12-02 12:49:30.245767	\N	3	2
749	1	9066	12	78	1	\N	3	21000	USD	\N	56	1	3	84	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	2021-12-02 12:49:30.26816	2021-12-02 12:49:30.26816	\N	51	23
750	1	9067	12	78	2	\N	1	3000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	2021-12-02 12:49:30.324456	2021-12-02 12:49:30.324456	\N	4	23
751	1	9068	12	78	2	\N	2	6000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.348018	2021-12-02 12:49:30.348018	\N	5	23
752	1	9069	12	78	2	\N	3	9000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.372095	2021-12-02 12:49:30.372095	\N	6	23
753	1	9070	12	78	2	\N	3.5	12000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.395757	2021-12-02 12:49:30.395757	\N	7	23
754	1	9071	12	78	7	\N	1.2	800	USD	\N	56	8	5	84	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.418981	2021-12-02 12:49:30.418981	\N	3	2
755	1	9072	12	78	5	\N	1	0	USD	\N	56	5	5	84	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.441707	2021-12-02 12:49:30.441707	\N	3	2
756	1	9073	12	78	35	\N	1	600	USD	\N	56	20	9	84	33	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.463945	2021-12-02 12:49:30.463945	\N	3	2
757	1	9074	12	79	1	\N	3	21000	USD	\N	57	1	9	85	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	2021-12-02 12:49:30.48674	2021-12-02 12:49:30.48674	\N	51	23
758	1	9075	12	79	2	\N	1	3000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	2021-12-02 12:49:30.509793	2021-12-02 12:49:30.509793	\N	4	23
759	1	9076	12	79	2	\N	2	6000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.532299	2021-12-02 12:49:30.532299	\N	5	23
760	1	9077	12	79	2	\N	3	9000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.555315	2021-12-02 12:49:30.555315	\N	6	23
761	1	9078	12	79	2	\N	3.5	12000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 12:49:30.578047	2021-12-02 12:49:30.578047	\N	7	23
762	1	9079	12	79	7	\N	1.2	800	USD	\N	57	8	9	85	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.601948	2021-12-02 12:49:30.601948	\N	3	2
763	1	9080	12	79	5	\N	1	0	USD	\N	57	5	2	85	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.624386	2021-12-02 12:49:30.624386	\N	3	2
764	1	9081	12	79	42	\N	1	600	USD	\N	57	4	9	85	41	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.647161	2021-12-02 12:49:30.647161	\N	3	2
765	1	9082	12	79	36	\N	0.5	300	USD	\N	57	7	9	85	35	\N	3	\N	\N	0	USD	500	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 12:49:30.670112	2021-12-02 12:49:30.670112	\N	3	2
766	1	9083	12	80	1	\N	1	5000	USD	\N	58	1	9	86	26	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	2021-12-02 12:49:30.692029	2021-12-02 12:49:30.692029	\N	3	2
767	1	9084	12	80	7	\N	0.5	500	USD	\N	58	8	9	86	29	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	2021-12-02 12:49:30.714099	2021-12-02 12:49:30.714099	\N	3	2
768	1	9085	12	80	5	\N	0.5	0	USD	\N	58	5	9	86	32	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	2021-12-02 12:49:30.736458	2021-12-02 12:49:30.736458	\N	3	2
769	1	9086	12	81	1	\N	1	5000	USD	\N	59	1	9	87	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	2021-12-02 12:49:30.759192	2021-12-02 12:49:30.759192	\N	3	2
770	1	9087	12	81	33	\N	0.5	500	USD	\N	59	10	1	87	30	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	2021-12-02 12:49:30.782821	2021-12-02 12:49:30.782821	\N	3	2
771	1	9088	12	81	5	\N	0.5	0	USD	\N	59	5	2	87	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	2021-12-02 12:49:30.805905	2021-12-02 12:49:30.805905	\N	3	2
772	2	1001	1	1	1	\N	7.8	57000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3421.0	\N	\N	\N	2021-12-02 13:35:59.650423	2021-12-02 13:35:59.650423	\N	1	1
773	2	1002	1	1	1	\N	15.6	114000	USD	\N	1	1	1	1	1	\N	1	\N	\N	0	USD	0	USD	15.6	\N	1	1	\N	3422.0	\N	\N	\N	2021-12-02 13:35:59.681402	2021-12-02 13:35:59.681402	\N	2	1
774	2	1003	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	3600	USD	1.1	\N	1	1	\N	3451.0	\N	\N	\N	2021-12-02 13:35:59.711923	2021-12-02 13:35:59.711923	\N	3	2
775	2	1004	1	1	2	\N	1	2549	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	5040	USD	1.4	\N	1	1	\N	3452.0	\N	\N	\N	2021-12-02 13:35:59.742062	2021-12-02 13:35:59.742062	\N	1	2
776	2	1005	1	1	2	\N	1.5	3398	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	6480	USD	1.6	\N	1	1	\N	3453.0	\N	\N	\N	2021-12-02 13:35:59.771611	2021-12-02 13:35:59.771611	\N	4	2
777	2	1006	1	1	2	\N	2	4248	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	3454.0	\N	\N	\N	2021-12-02 13:35:59.801482	2021-12-02 13:35:59.801482	\N	5	2
778	2	1007	1	1	2	\N	2.5	5947	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	13680	USD	2.7	\N	1	1	\N	3455.0	\N	\N	\N	2021-12-02 13:35:59.830623	2021-12-02 13:35:59.830623	\N	6	2
779	2	1008	1	1	2	\N	2.8	7646	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	17280	USD	3.8	\N	1	1	\N	3456.0	\N	\N	\N	2021-12-02 13:35:59.859063	2021-12-02 13:35:59.859063	\N	7	2
780	2	1009	1	1	2	\N	3	10526	USD	\N	1	2	1	1	2	\N	2	\N	\N	0	USD	0	USD	4.9	\N	1	1	\N	3457.0	\N	\N	\N	2021-12-02 13:35:59.88689	2021-12-02 13:35:59.88689	\N	8	2
781	2	1010	1	1	3	\N	0.9	1699	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	1440	USD	0.7	\N	1	1	\N	3441.0	\N	\N	\N	2021-12-02 13:35:59.915236	2021-12-02 13:35:59.915236	\N	3	2
782	2	1011	1	1	3	\N	0.9	2195	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2160	USD	0.8	\N	1	1	\N	3442.0	\N	\N	\N	2021-12-02 13:35:59.943894	2021-12-02 13:35:59.943894	\N	1	2
783	2	1012	1	1	3	\N	1	2549	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	2880	USD	0.9	\N	1	1	\N	3443.0	\N	\N	\N	2021-12-02 13:35:59.97213	2021-12-02 13:35:59.97213	\N	4	2
784	2	1013	1	1	3	\N	1.5	4248	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	3600	USD	1	\N	1	1	\N	3444.0	\N	\N	\N	2021-12-02 13:36:00.000277	2021-12-02 13:36:00.000277	\N	5	2
785	2	1014	1	1	3	\N	1.8	5098	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	3445.0	\N	\N	\N	2021-12-02 13:36:00.029065	2021-12-02 13:36:00.029065	\N	6	2
786	2	1015	1	1	3	\N	2	5947	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5040	USD	1.3	\N	1	1	\N	3446.0	\N	\N	\N	2021-12-02 13:36:00.063191	2021-12-02 13:36:00.063191	\N	7	2
787	2	1016	1	1	3	\N	2.2	6797	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	3447.0	\N	\N	\N	2021-12-02 13:36:00.091282	2021-12-02 13:36:00.091282	\N	8	2
788	2	1017	1	1	3	\N	2.8	8118	USD	\N	1	3	1	1	3	\N	2	\N	\N	0	USD	6480	USD	1.7	\N	1	1	\N	3448.0	\N	\N	\N	2021-12-02 13:36:00.119569	2021-12-02 13:36:00.119569	\N	9	2
789	2	1018	1	1	4	\N	0.5	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	3431.0	\N	\N	\N	2021-12-02 13:36:00.147402	2021-12-02 13:36:00.147402	\N	10	2
790	2	1019	1	1	4	\N	1	354	USD	\N	1	4	2	1	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	3481.0	\N	\N	\N	2021-12-02 13:36:00.175225	2021-12-02 13:36:00.175225	\N	1	2
791	2	1020	1	1	5	\N	0.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	3481.0	\N	\N	\N	2021-12-02 13:36:00.203029	2021-12-02 13:36:00.203029	\N	1	2
792	2	1021	1	1	5	\N	0.9	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	3481.0	\N	\N	\N	2021-12-02 13:36:00.230642	2021-12-02 13:36:00.230642	\N	4	2
793	2	1022	1	1	5	\N	1.5	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	2021-12-02 13:36:00.258365	2021-12-02 13:36:00.258365	\N	5	2
794	2	1023	1	1	5	\N	1.8	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	2021-12-02 13:36:00.285963	2021-12-02 13:36:00.285963	\N	6	2
795	2	1024	1	1	5	\N	2	0	USD	\N	1	5	2	1	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3481.0	\N	\N	\N	2021-12-02 13:36:00.313452	2021-12-02 13:36:00.313452	\N	7	2
796	2	1025	1	2	1	\N	6	28500	USD	\N	1	1	1	2	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	2021-12-02 13:36:00.341535	2021-12-02 13:36:00.341535	\N	3	2
797	2	1026	1	3	1	\N	6	28500	USD	\N	1	1	1	3	1	\N	3	\N	\N	0	USD	33000	USD	3.1	\N	1	1	\N	4457.0	\N	\N	\N	2021-12-02 13:36:00.427284	2021-12-02 13:36:00.427284	\N	3	2
798	2	1027	1	2	2	\N	1.3	2879	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	2021-12-02 13:36:00.456106	2021-12-02 13:36:00.456106	\N	1	2
799	2	1028	1	2	2	\N	1.5	3398	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	2021-12-02 13:36:00.485201	2021-12-02 13:36:00.485201	\N	4	2
800	2	1029	1	2	2	\N	2	6797	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	2021-12-02 13:36:00.51406	2021-12-02 13:36:00.51406	\N	5	2
801	2	1030	1	2	2	\N	2.2	10195	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	1.8	\N	1	1	\N	2454.0	\N	\N	\N	2021-12-02 13:36:00.542794	2021-12-02 13:36:00.542794	\N	6	2
802	2	1031	1	2	2	\N	2.5	13594	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	2455.0	\N	\N	\N	2021-12-02 13:36:00.571007	2021-12-02 13:36:00.571007	\N	7	2
803	2	1032	1	2	2	\N	3	16992	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	2456.0	\N	\N	\N	2021-12-02 13:36:00.598008	2021-12-02 13:36:00.598008	\N	8	2
804	2	1033	1	2	2	\N	4.5	20390	USD	\N	1	2	1	2	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	2457.0	\N	\N	\N	2021-12-02 13:36:00.625131	2021-12-02 13:36:00.625131	\N	9	2
805	2	1034	1	2	3	\N	1.3	2879	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2442.0	\N	\N	\N	2021-12-02 13:36:00.658155	2021-12-02 13:36:00.658155	\N	1	2
806	2	1035	1	2	3	\N	1.5	3398	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	2443.0	\N	\N	\N	2021-12-02 13:36:00.685834	2021-12-02 13:36:00.685834	\N	4	2
807	2	1036	1	2	3	\N	2	6797	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2444.0	\N	\N	\N	2021-12-02 13:36:00.713795	2021-12-02 13:36:00.713795	\N	5	2
808	2	1037	1	2	3	\N	2.2	10195	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	2445.0	\N	\N	\N	2021-12-02 13:36:00.741605	2021-12-02 13:36:00.741605	\N	6	2
809	2	1038	1	2	3	\N	2.5	13594	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	2446.0	\N	\N	\N	2021-12-02 13:36:00.768904	2021-12-02 13:36:00.768904	\N	7	2
810	2	1039	1	2	3	\N	3	16992	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	2447.0	\N	\N	\N	2021-12-02 13:36:00.796243	2021-12-02 13:36:00.796243	\N	8	2
811	2	1040	1	2	3	\N	4.5	20390	USD	\N	1	3	1	2	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	2448.0	\N	\N	\N	2021-12-02 13:36:00.823474	2021-12-02 13:36:00.823474	\N	9	2
812	2	1041	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:00.850503	2021-12-02 13:36:00.850503	\N	10	2
813	2	1042	1	2	4	\N	0.6	354	USD	\N	1	4	3	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:00.877417	2021-12-02 13:36:00.877417	\N	1	2
814	2	1043	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:00.904313	2021-12-02 13:36:00.904313	\N	1	2
815	2	1044	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:00.931304	2021-12-02 13:36:00.931304	\N	4	2
816	2	1045	1	2	5	\N	0.6	0	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:00.958126	2021-12-02 13:36:00.958126	\N	5	2
817	2	1046	1	2	5	\N	0.6	300	USD	\N	1	5	2	2	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:00.984868	2021-12-02 13:36:00.984868	\N	6	2
818	2	1047	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:01.011568	2021-12-02 13:36:01.011568	\N	7	2
819	2	1048	1	2	5	\N	0.6	600	USD	\N	1	5	2	2	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:01.038233	2021-12-02 13:36:01.038233	\N	8	2
820	2	1049	2	4	1	\N	1.1	1910	USD	\N	2	1	4	4	1	\N	3	\N	\N	0	USD	5000	USD	0.4	\N	1	1	\N	7920.0	\N	\N	\N	2021-12-02 13:36:01.064913	2021-12-02 13:36:01.064913	\N	3	2
821	2	1050	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	2021-12-02 13:36:01.091593	2021-12-02 13:36:01.091593	\N	10	3
822	2	1051	2	4	4	\N	0.5	300	USD	\N	2	4	3	4	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	2021-12-02 13:36:01.118647	2021-12-02 13:36:01.118647	\N	1	4
823	2	1053	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7981.0	\N	\N	\N	2021-12-02 13:36:01.151045	2021-12-02 13:36:01.151045	\N	10	3
824	2	1054	2	4	5	\N	0.5	0	USD	\N	2	5	2	4	5	\N	2	\N	\N	0	USD	100	USD	0.2	\N	4	1	\N	7982.0	\N	\N	\N	2021-12-02 13:36:01.186254	2021-12-02 13:36:01.186254	\N	1	4
825	2	1055	2	5	1	\N	2.5	19000	USD	\N	3	1	1	5	1	\N	3	\N	\N	0	USD	33000	USD	3.4	\N	1	1	\N	2421.0	\N	\N	\N	2021-12-02 13:36:01.213153	2021-12-02 13:36:01.213153	\N	3	2
826	2	1056	2	5	3	\N	1.2	1410	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	2880	USD	1.2	\N	1	1	\N	2451.0	\N	\N	\N	2021-12-02 13:36:01.24049	2021-12-02 13:36:01.24049	\N	10	3
827	2	1057	2	5	3	\N	1	1910	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	4320	USD	1.3	\N	1	1	\N	2452.0	\N	\N	\N	2021-12-02 13:36:01.267772	2021-12-02 13:36:01.267772	\N	1	4
828	2	1058	2	5	3	\N	1	2450	USD	\N	3	3	3	5	3	\N	2	\N	\N	0	USD	5760	USD	1.6	\N	1	1	\N	2453.0	\N	\N	\N	2021-12-02 13:36:01.294786	2021-12-02 13:36:01.294786	\N	4	4
829	2	1059	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:01.321911	2021-12-02 13:36:01.321911	\N	10	3
830	2	1060	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:01.348916	2021-12-02 13:36:01.348916	\N	1	4
831	2	1061	2	5	4	\N	1	600	USD	\N	3	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	2481.0	\N	\N	\N	2021-12-02 13:36:01.428353	2021-12-02 13:36:01.428353	\N	4	4
832	2	1062	2	6	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	1410	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	2021-12-02 13:36:01.456364	2021-12-02 13:36:01.456364	\N	12	5
833	2	1063	2	6	6	\N	0.8	1410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	2021-12-02 13:36:01.48445	2021-12-02 13:36:01.48445	\N	10	3
834	2	1064	2	6	6	\N	1	1680	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	1111.0	\N	\N	\N	2021-12-02 13:36:01.51296	2021-12-02 13:36:01.51296	\N	1	4
835	2	1065	2	6	6	\N	1.4	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	1112.0	\N	\N	\N	2021-12-02 13:36:01.541067	2021-12-02 13:36:01.541067	\N	4	4
836	2	1066	2	6	6	\N	1.5	2160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	1	\N	1	1	\N	1113.0	\N	\N	\N	2021-12-02 13:36:01.569051	2021-12-02 13:36:01.569051	\N	13	6
837	2	1067	2	6	6	\N	1.6	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2160	USD	1	\N	1	1	\N	1114.0	\N	\N	\N	2021-12-02 13:36:01.596665	2021-12-02 13:36:01.596665	\N	14	7
838	2	1068	2	6	6	\N	1.8	2880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	1115.0	\N	\N	\N	2021-12-02 13:36:01.623942	2021-12-02 13:36:01.623942	\N	5	8
839	2	1069	2	6	6	\N	2	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2880	USD	1.5	\N	1	1	\N	1116.0	\N	\N	\N	2021-12-02 13:36:01.651254	2021-12-02 13:36:01.651254	\N	15	9
840	2	1070	2	6	6	\N	2.4	5410	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.8	\N	1	1	\N	1117.0	\N	\N	\N	2021-12-02 13:36:01.679406	2021-12-02 13:36:01.679406	\N	16	10
841	2	1071	2	6	6	\N	2.69	6960	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6960	USD	2.2	\N	1	1	\N	1118.0	\N	\N	\N	2021-12-02 13:36:01.706956	2021-12-02 13:36:01.706956	\N	6	11
842	2	1072	2	6	6	\N	2.8	8880	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8880	USD	2.4	\N	1	1	\N	1119.0	\N	\N	\N	2021-12-02 13:36:01.740728	2021-12-02 13:36:01.740728	\N	17	12
843	2	1073	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.768139	2021-12-02 13:36:01.768139	\N	10	2
844	2	1074	2	6	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.795542	2021-12-02 13:36:01.795542	\N	1	2
845	2	1075	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.822676	2021-12-02 13:36:01.822676	\N	10	3
846	2	1076	2	6	4	\N	0.5	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.849744	2021-12-02 13:36:01.849744	\N	1	4
847	2	1077	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.877212	2021-12-02 13:36:01.877212	\N	5	2
848	2	1078	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.904181	2021-12-02 13:36:01.904181	\N	7	2
849	2	1079	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.931369	2021-12-02 13:36:01.931369	\N	18	2
850	2	1080	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.957984	2021-12-02 13:36:01.957984	\N	19	2
851	2	1081	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:01.98506	2021-12-02 13:36:01.98506	\N	20	2
852	2	1082	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:02.012175	2021-12-02 13:36:02.012175	\N	21	2
853	2	1083	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:02.039149	2021-12-02 13:36:02.039149	\N	22	2
854	2	1084	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:02.06592	2021-12-02 13:36:02.06592	\N	23	2
855	2	1085	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:02.092586	2021-12-02 13:36:02.092586	\N	24	2
856	2	1086	2	6	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	1181.0	\N	\N	\N	2021-12-02 13:36:02.119382	2021-12-02 13:36:02.119382	\N	25	2
857	2	1095	1	3	3	\N	1.3	2879	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	4442.0	\N	\N	\N	2021-12-02 13:36:02.146311	2021-12-02 13:36:02.146311	\N	1	2
858	2	1096	1	3	3	\N	1.5	3398	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4443.0	\N	\N	\N	2021-12-02 13:36:02.173067	2021-12-02 13:36:02.173067	\N	4	2
859	2	1097	1	3	3	\N	2	6797	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4444.0	\N	\N	\N	2021-12-02 13:36:02.199644	2021-12-02 13:36:02.199644	\N	5	2
860	2	1098	1	3	3	\N	2.2	10195	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4445.0	\N	\N	\N	2021-12-02 13:36:02.232285	2021-12-02 13:36:02.232285	\N	6	2
861	2	1099	1	3	3	\N	2.5	13594	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	11520	USD	1.7	\N	1	1	\N	4446.0	\N	\N	\N	2021-12-02 13:36:02.259599	2021-12-02 13:36:02.259599	\N	7	2
862	2	1100	1	3	3	\N	3	16992	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4447.0	\N	\N	\N	2021-12-02 13:36:02.286457	2021-12-02 13:36:02.286457	\N	8	2
863	2	1101	1	3	3	\N	4.5	20390	USD	\N	1	3	1	7	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4448.0	\N	\N	\N	2021-12-02 13:36:02.313611	2021-12-02 13:36:02.313611	\N	9	2
864	2	1102	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 13:36:02.341025	2021-12-02 13:36:02.341025	\N	10	2
865	2	1103	1	3	4	\N	0.6	354	USD	\N	1	4	3	7	4	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 13:36:02.368089	2021-12-02 13:36:02.368089	\N	1	2
866	2	1104	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	300	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 13:36:02.44803	2021-12-02 13:36:02.44803	\N	1	2
867	2	1105	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 13:36:02.476277	2021-12-02 13:36:02.476277	\N	4	2
868	2	1106	1	3	5	\N	0.6	0	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 13:36:02.50412	2021-12-02 13:36:02.50412	\N	5	2
869	2	1107	1	3	5	\N	0.6	300	USD	\N	1	5	2	7	5	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 13:36:02.531867	2021-12-02 13:36:02.531867	\N	6	2
870	2	1108	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 13:36:02.559324	2021-12-02 13:36:02.559324	\N	7	2
871	2	1109	1	3	5	\N	0.6	600	USD	\N	1	5	2	7	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	4481.0	\N	\N	\N	2021-12-02 13:36:02.5863	2021-12-02 13:36:02.5863	\N	8	2
872	2	2001	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	0	USD	3.8	\N	1	1	\N	2122.0	\N	\N	\N	2021-12-02 13:36:02.613139	2021-12-02 13:36:02.613139	\N	19	13
873	2	2002	3	7	1	\N	4.5	28500	USD	\N	4	1	4	6	1	\N	2	\N	\N	0	USD	30000	USD	4.2	\N	1	1	\N	2121.0	\N	\N	\N	2021-12-02 13:36:02.640055	2021-12-02 13:36:02.640055	\N	26	13
874	2	2003	3	7	6	\N	0.8	1841	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	2021-12-02 13:36:02.667179	2021-12-02 13:36:02.667179	\N	10	3
875	2	2004	3	7	6	\N	1	2266	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	2111.0	\N	\N	\N	2021-12-02 13:36:02.693752	2021-12-02 13:36:02.693752	\N	1	4
876	2	2005	3	7	6	\N	1.4	2832	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.9	\N	1	1	\N	2112.0	\N	\N	\N	2021-12-02 13:36:02.7203	2021-12-02 13:36:02.7203	\N	4	4
877	2	2006	3	7	6	\N	1.5	3729	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	2113.0	\N	\N	\N	2021-12-02 13:36:02.747427	2021-12-02 13:36:02.747427	\N	13	6
878	2	2007	3	7	6	\N	1.6	4531	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	2114.0	\N	\N	\N	2021-12-02 13:36:02.779985	2021-12-02 13:36:02.779985	\N	14	7
879	2	2008	3	7	6	\N	1.8	5098	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.4	\N	1	1	\N	2115.0	\N	\N	\N	2021-12-02 13:36:02.808599	2021-12-02 13:36:02.808599	\N	5	8
880	2	2009	3	7	6	\N	2	5947	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.7	\N	1	1	\N	2116.0	\N	\N	\N	2021-12-02 13:36:02.835979	2021-12-02 13:36:02.835979	\N	15	9
881	2	2010	3	7	6	\N	2.1	6443	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	2117.0	\N	\N	\N	2021-12-02 13:36:02.863479	2021-12-02 13:36:02.863479	\N	16	10
882	2	2011	3	7	6	\N	2.2	9629	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.4	\N	1	1	\N	2118.0	\N	\N	\N	2021-12-02 13:36:02.890988	2021-12-02 13:36:02.890988	\N	6	11
883	2	2012	3	7	6	\N	2.3	10077	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.6	\N	1	1	\N	2119.0	\N	\N	\N	2021-12-02 13:36:02.918179	2021-12-02 13:36:02.918179	\N	17	12
884	2	2013	3	7	4	\N	0.3	354	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:02.945435	2021-12-02 13:36:02.945435	\N	10	2
885	2	2014	3	7	4	\N	0.6	708	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:02.972771	2021-12-02 13:36:02.972771	\N	1	2
886	2	2015	3	7	4	\N	0.6	354	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:02.999735	2021-12-02 13:36:02.999735	\N	10	3
887	2	2016	3	7	4	\N	1	708	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.02649	2021-12-02 13:36:03.02649	\N	1	4
888	2	2017	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.053604	2021-12-02 13:36:03.053604	\N	5	2
889	2	2018	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.080752	2021-12-02 13:36:03.080752	\N	7	2
890	2	2019	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.107517	2021-12-02 13:36:03.107517	\N	18	2
891	2	2020	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.134484	2021-12-02 13:36:03.134484	\N	19	2
892	2	2021	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.161171	2021-12-02 13:36:03.161171	\N	20	2
893	2	2022	3	7	5	\N	0.5	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.188362	2021-12-02 13:36:03.188362	\N	21	2
894	2	2023	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.215015	2021-12-02 13:36:03.215015	\N	22	2
895	2	2024	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.242111	2021-12-02 13:36:03.242111	\N	23	2
896	2	2025	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.269191	2021-12-02 13:36:03.269191	\N	24	2
897	2	2026	3	7	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	2181.0	\N	\N	\N	2021-12-02 13:36:03.301444	2021-12-02 13:36:03.301444	\N	25	2
898	2	2031	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6	\N	1	1	\N	2621.0	\N	\N	\N	2021-12-02 13:36:03.32836	2021-12-02 13:36:03.32836	\N	19	2
899	2	2032	4	8	1	\N	8	43008	USD	\N	5	1	5	8	1	\N	2	\N	\N	0	USD	0	USD	6.2	\N	1	1	\N	2622.0	\N	\N	\N	2021-12-02 13:36:03.355716	2021-12-02 13:36:03.355716	\N	26	2
900	2	2033	4	8	3	\N	1.5	5376	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	4800	USD	1.1	\N	1	1	\N	2642.0	\N	\N	\N	2021-12-02 13:36:03.431367	2021-12-02 13:36:03.431367	\N	4	2
901	2	2034	4	8	3	\N	2	10752	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	9600	USD	1.3	\N	1	1	\N	2644.0	\N	\N	\N	2021-12-02 13:36:03.459431	2021-12-02 13:36:03.459431	\N	5	2
902	2	2035	4	8	3	\N	3	16128	USD	\N	5	3	5	8	3	\N	2	\N	\N	0	USD	14400	USD	1.6	\N	1	1	\N	2645.0	\N	\N	\N	2021-12-02 13:36:03.487137	2021-12-02 13:36:03.487137	\N	6	2
903	2	2036	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	2021-12-02 13:36:03.515577	2021-12-02 13:36:03.515577	\N	4	2
904	2	2037	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	2021-12-02 13:36:03.543286	2021-12-02 13:36:03.543286	\N	5	2
905	2	2038	4	8	5	\N	1.5	300	USD	\N	5	5	5	8	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	2681.0	\N	\N	\N	2021-12-02 13:36:03.570784	2021-12-02 13:36:03.570784	\N	6	2
906	2	3001	3	9	1	\N	0.6	1290	USD	\N	6	1	6	9	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	2021-12-02 13:36:03.598432	2021-12-02 13:36:03.598432	\N	3	2
907	2	3002	3	9	7	\N	0.6	1290	USD	\N	6	8	1	9	8	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	3920.0	\N	\N	\N	2021-12-02 13:36:03.625961	2021-12-02 13:36:03.625961	\N	3	2
908	2	3003	3	10	1	\N	4.5	17840	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3	\N	1	1	\N	3221.0	\N	\N	\N	2021-12-02 13:36:03.653564	2021-12-02 13:36:03.653564	\N	19	13
909	2	3004	3	10	1	\N	4.5	0	USD	\N	4	1	5	6	1	\N	2	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	3121.0	\N	\N	\N	2021-12-02 13:36:03.681553	2021-12-02 13:36:03.681553	\N	26	13
910	2	3005	3	10	6	\N	0.8	1560	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.7	\N	1	1	\N	3111.0	\N	\N	\N	2021-12-02 13:36:03.708685	2021-12-02 13:36:03.708685	\N	10	3
911	2	3006	3	10	6	\N	1	1920	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1920	USD	0.8	\N	1	1	\N	3112.0	\N	\N	\N	2021-12-02 13:36:03.736085	2021-12-02 13:36:03.736085	\N	1	4
912	2	3007	3	10	6	\N	1.4	2400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2400	USD	1	\N	1	1	\N	3113.0	\N	\N	\N	2021-12-02 13:36:03.763473	2021-12-02 13:36:03.763473	\N	4	4
913	2	3008	3	10	6	\N	1.5	3160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.3	\N	1	1	\N	3114.0	\N	\N	\N	2021-12-02 13:36:03.790278	2021-12-02 13:36:03.790278	\N	13	6
914	2	3009	3	10	6	\N	1.6	3840	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	4320	USD	1.5	\N	1	1	\N	3115.0	\N	\N	\N	2021-12-02 13:36:03.8172	2021-12-02 13:36:03.8172	\N	14	7
915	2	3010	3	10	6	\N	1.8	4320	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5040	USD	1.8	\N	1	1	\N	3116.0	\N	\N	\N	2021-12-02 13:36:03.850615	2021-12-02 13:36:03.850615	\N	5	8
916	2	3011	3	10	6	\N	2	5040	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2.2	\N	1	1	\N	3117.0	\N	\N	\N	2021-12-02 13:36:03.878246	2021-12-02 13:36:03.878246	\N	15	9
917	2	3012	3	10	6	\N	2.1	5460	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	11520	USD	2.6	\N	1	1	\N	3118.0	\N	\N	\N	2021-12-02 13:36:03.906027	2021-12-02 13:36:03.906027	\N	16	10
918	2	3013	3	10	6	\N	2.2	8160	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	2021-12-02 13:36:03.933715	2021-12-02 13:36:03.933715	\N	6	11
919	2	3014	3	10	6	\N	2.3	8540	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15840	USD	3.1	\N	1	1	\N	3119.0	\N	\N	\N	2021-12-02 13:36:03.961039	2021-12-02 13:36:03.961039	\N	17	12
920	2	3015	3	10	4	\N	1	600	USD	\N	4	4	5	6	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:03.988131	2021-12-02 13:36:03.988131	\N	10	2
921	2	3016	3	10	4	\N	0.6	600	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	300	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.015142	2021-12-02 13:36:04.015142	\N	1	2
922	2	3017	3	10	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.041899	2021-12-02 13:36:04.041899	\N	10	3
923	2	3018	3	10	4	\N	1	600	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.069283	2021-12-02 13:36:04.069283	\N	1	4
924	2	3019	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.096554	2021-12-02 13:36:04.096554	\N	5	2
925	2	3020	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.123769	2021-12-02 13:36:04.123769	\N	7	2
926	2	3021	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.150693	2021-12-02 13:36:04.150693	\N	18	2
927	2	3022	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.177448	2021-12-02 13:36:04.177448	\N	19	2
928	2	3023	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.204662	2021-12-02 13:36:04.204662	\N	20	2
929	2	3024	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.231433	2021-12-02 13:36:04.231433	\N	21	2
930	2	3025	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.258028	2021-12-02 13:36:04.258028	\N	22	2
931	2	3026	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.284778	2021-12-02 13:36:04.284778	\N	23	2
932	2	3027	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.311366	2021-12-02 13:36:04.311366	\N	24	2
933	2	3028	3	10	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	3181.0	\N	\N	\N	2021-12-02 13:36:04.33842	2021-12-02 13:36:04.33842	\N	25	2
934	2	4001	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	4621.0	\N	\N	\N	2021-12-02 13:36:04.371815	2021-12-02 13:36:04.371815	\N	19	2
935	2	4002	4	11	1	\N	8	43008	USD	\N	5	1	5	10	9	\N	2	\N	\N	0	USD	0	USD	4.6	\N	1	1	\N	4622.0	\N	\N	\N	2021-12-02 13:36:04.447084	2021-12-02 13:36:04.447084	\N	26	2
936	2	4003	4	11	3	\N	1.5	4301	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	3840	USD	1.1	\N	1	1	\N	4642.0	\N	\N	\N	2021-12-02 13:36:04.47725	2021-12-02 13:36:04.47725	\N	4	2
937	2	4004	4	11	3	\N	2	8602	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	7680	USD	1.3	\N	1	1	\N	4644.0	\N	\N	\N	2021-12-02 13:36:04.507087	2021-12-02 13:36:04.507087	\N	5	2
938	2	4005	4	11	3	\N	3	12880	USD	\N	7	3	2	11	3	\N	2	\N	\N	0	USD	11520	USD	1.6	\N	1	1	\N	4645.0	\N	\N	\N	2021-12-02 13:36:04.536767	2021-12-02 13:36:04.536767	\N	6	2
939	2	4006	4	11	5	\N	1	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	2021-12-02 13:36:04.565491	2021-12-02 13:36:04.565491	\N	4	2
940	2	4007	4	11	5	\N	1.5	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4681.0	\N	\N	\N	2021-12-02 13:36:04.594458	2021-12-02 13:36:04.594458	\N	5	2
941	2	4008	4	11	5	\N	2	0	USD	\N	7	5	2	11	5	\N	2	\N	\N	0	USD	0	USD	1.5	\N	2	1	\N	4681.0	\N	\N	\N	2021-12-02 13:36:04.622947	2021-12-02 13:36:04.622947	\N	6	2
942	2	4009	4	12	1	\N	2.3	10820	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	2021-12-02 13:36:04.651918	2021-12-02 13:36:04.651918	\N	3	2
943	2	4010	4	13	1	\N	2.3	10820	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	2021-12-02 13:36:04.681438	2021-12-02 13:36:04.681438	\N	3	2
944	2	4011	4	14	4	\N	1	300	USD	\N	8	4	2	13	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	2021-12-02 13:36:04.71044	2021-12-02 13:36:04.71044	\N	3	2
945	2	5000	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3	\N	1	1	\N	5121.0	\N	\N	\N	2021-12-02 13:36:04.739016	2021-12-02 13:36:04.739016	\N	3	2
946	2	5001	5	15	1	\N	2	26000	USD	\N	4	1	5	14	1	\N	3	\N	\N	0	USD	0	USD	3.2	\N	1	1	\N	5122.0	\N	\N	\N	2021-12-02 13:36:04.767442	2021-12-02 13:36:04.767442	\N	3	2
947	2	5002	5	15	6	\N	1	1400	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	0	USD	0.8	\N	1	1	\N	5111.0	\N	\N	\N	2021-12-02 13:36:04.795723	2021-12-02 13:36:04.795723	\N	10	3
948	2	5003	5	15	6	\N	1.3	1882	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	1680	USD	0.8	\N	1	1	\N	5112.0	\N	\N	\N	2021-12-02 13:36:04.824703	2021-12-02 13:36:04.824703	\N	1	4
949	2	5004	5	15	6	\N	1.5	2957	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	2640	USD	0.9	\N	1	1	\N	5113.0	\N	\N	\N	2021-12-02 13:36:04.853506	2021-12-02 13:36:04.853506	\N	4	4
950	2	5005	5	15	6	\N	1.8	4301	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	3840	USD	1.2	\N	1	1	\N	5114.0	\N	\N	\N	2021-12-02 13:36:04.88189	2021-12-02 13:36:04.88189	\N	13	6
951	2	5006	5	15	6	\N	2	6451	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	5760	USD	1.5	\N	1	1	\N	5115.0	\N	\N	\N	2021-12-02 13:36:04.910644	2021-12-02 13:36:04.910644	\N	14	7
952	2	5007	5	15	6	\N	2.2	7526	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	6720	USD	1.8	\N	1	1	\N	5116.0	\N	\N	\N	2021-12-02 13:36:04.945065	2021-12-02 13:36:04.945065	\N	5	8
953	2	5008	5	15	6	\N	2.3	9094	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	8160	USD	2	\N	1	1	\N	5117.0	\N	\N	\N	2021-12-02 13:36:04.973655	2021-12-02 13:36:04.973655	\N	15	9
954	2	5009	5	15	6	\N	2.5	11290	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	10080	USD	2.2	\N	1	1	\N	5118.0	\N	\N	\N	2021-12-02 13:36:05.002505	2021-12-02 13:36:05.002505	\N	16	10
955	2	5010	5	15	6	\N	3	13574	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	2021-12-02 13:36:05.030716	2021-12-02 13:36:05.030716	\N	6	11
956	2	5011	5	15	6	\N	3.5	16934	USD	\N	4	6	4	6	6	\N	2	\N	\N	0	USD	15120	USD	2.4	\N	1	1	\N	5119.0	\N	\N	\N	2021-12-02 13:36:05.059015	2021-12-02 13:36:05.059015	\N	17	12
957	2	5012	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:05.087858	2021-12-02 13:36:05.087858	\N	10	2
958	2	5013	5	15	4	\N	0.5	300	USD	\N	4	7	4	6	7	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:05.145854	2021-12-02 13:36:05.145854	\N	1	2
959	2	5014	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	1	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:05.213575	2021-12-02 13:36:05.213575	\N	10	3
960	2	5015	5	15	4	\N	0.6	300	USD	\N	4	4	4	6	4	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:05.34464	2021-12-02 13:36:05.34464	\N	1	4
961	2	5016	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:05.601141	2021-12-02 13:36:05.601141	\N	5	2
962	2	5017	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:05.736677	2021-12-02 13:36:05.736677	\N	7	2
963	2	5018	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:06.180361	2021-12-02 13:36:06.180361	\N	18	2
964	2	5019	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:06.377816	2021-12-02 13:36:06.377816	\N	19	2
965	2	5020	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:06.569965	2021-12-02 13:36:06.569965	\N	20	2
966	2	5021	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:06.662725	2021-12-02 13:36:06.662725	\N	21	2
967	2	5022	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:06.862179	2021-12-02 13:36:06.862179	\N	22	2
968	2	5023	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:07.187558	2021-12-02 13:36:07.187558	\N	23	2
969	2	5024	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:07.842858	2021-12-02 13:36:07.842858	\N	24	2
970	2	5025	5	15	5	\N	1	0	USD	\N	4	5	5	6	5	\N	2	\N	\N	0	USD	0	USD	0.4	\N	2	1	\N	5181.0	\N	\N	\N	2021-12-02 13:36:08.38521	2021-12-02 13:36:08.38521	\N	25	2
971	2	5030	5	16	2	\N	0.5	1000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 13:36:08.558701	2021-12-02 13:36:08.558701	\N	4	2
972	2	5031	5	16	2	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 13:36:09.059187	2021-12-02 13:36:09.059187	\N	5	2
973	2	5032	5	16	2	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 13:36:09.658826	2021-12-02 13:36:09.658826	\N	6	2
974	2	5033	5	16	2	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 13:36:10.027906	2021-12-02 13:36:10.027906	\N	7	2
975	2	5034	5	16	2	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 13:36:10.317567	2021-12-02 13:36:10.317567	\N	8	2
976	2	5035	5	16	2	\N	1	6500	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 13:36:11.059349	2021-12-02 13:36:11.059349	\N	9	2
977	2	5036	5	16	2	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	5728.0	\N	\N	\N	2021-12-02 13:36:11.351303	2021-12-02 13:36:11.351303	\N	19	2
978	2	5037	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:11.721997	2021-12-02 13:36:11.721997	\N	10	2
979	2	5038	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:12.619204	2021-12-02 13:36:12.619204	\N	1	2
980	2	5039	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:12.953191	2021-12-02 13:36:12.953191	\N	4	2
981	2	5040	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:13.279668	2021-12-02 13:36:13.279668	\N	5	2
982	2	5041	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:13.488819	2021-12-02 13:36:13.488819	\N	6	2
983	2	5042	5	16	8	\N	0.5	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:13.850681	2021-12-02 13:36:13.850681	\N	7	2
984	2	5043	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:14.478923	2021-12-02 13:36:14.478923	\N	8	2
985	2	5044	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:15.24774	2021-12-02 13:36:15.24774	\N	9	2
986	2	5045	5	16	8	\N	1	500	USD	\N	9	8	7	15	10	\N	2	\N	\N	0	USD	100	USD	0.1	\N	4	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:15.817984	2021-12-02 13:36:15.817984	\N	19	2
987	2	5046	5	17	1	\N	1	16822	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	1	1	\N	5421.0	\N	\N	\N	2021-12-02 13:36:16.610916	2021-12-02 13:36:16.610916	\N	3	2
988	2	5047	5	17	1	\N	2	33645	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	2	1	\N	5421.0	\N	\N	\N	2021-12-02 13:36:16.73899	2021-12-02 13:36:16.73899	\N	1	2
989	2	5048	5	17	1	\N	3	50467	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	3	1	\N	5421.0	\N	\N	\N	2021-12-02 13:36:16.832019	2021-12-02 13:36:16.832019	\N	4	2
990	2	5049	5	17	1	\N	4	67290	USD	\N	10	1	1	16	1	\N	3	\N	\N	0	USD	15024	USD	0.7	\N	4	1	\N	5421.0	\N	\N	\N	2021-12-02 13:36:16.912535	2021-12-02 13:36:16.912535	\N	2	2
991	2	5050	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	1	1	\N	5451.0	\N	\N	\N	2021-12-02 13:36:17.004104	2021-12-02 13:36:17.004104	\N	4	2
992	2	5051	5	17	2	\N	0.7	7000	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	2	1	\N	5451.0	\N	\N	\N	2021-12-02 13:36:17.287498	2021-12-02 13:36:17.287498	\N	5	2
993	2	5052	5	17	2	\N	1	14560	USD	\N	10	2	1	16	2	\N	2	\N	\N	0	USD	6252	USD	0.3	\N	3	1	\N	5451.0	\N	\N	\N	2021-12-02 13:36:17.351351	2021-12-02 13:36:17.351351	\N	6	2
994	2	5053	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:17.41064	2021-12-02 13:36:17.41064	\N	3	2
995	2	5054	5	17	4	\N	0.5	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:17.475047	2021-12-02 13:36:17.475047	\N	1	2
996	2	5055	5	17	4	\N	0.6	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:17.598403	2021-12-02 13:36:17.598403	\N	4	2
997	2	5056	5	17	4	\N	0.8	300	USD	\N	10	4	5	16	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:17.664449	2021-12-02 13:36:17.664449	\N	2	2
998	2	5057	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:17.731615	2021-12-02 13:36:17.731615	\N	3	2
999	2	5058	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:17.793051	2021-12-02 13:36:17.793051	\N	1	2
1000	2	5059	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:17.862315	2021-12-02 13:36:17.862315	\N	4	2
1001	2	5060	5	17	5	\N	0.5	0	USD	\N	10	5	2	16	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:18.359108	2021-12-02 13:36:18.359108	\N	2	2
1002	2	5061	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:18.426453	2021-12-02 13:36:18.426453	\N	3	2
1003	2	5062	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:18.502039	2021-12-02 13:36:18.502039	\N	1	2
1004	2	5063	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	3	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:18.575953	2021-12-02 13:36:18.575953	\N	4	2
1005	2	5064	5	17	9	\N	0.5	0	USD	\N	10	9	8	16	11	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	5481.0	\N	\N	\N	2021-12-02 13:36:18.710221	2021-12-02 13:36:18.710221	\N	2	2
1006	2	5065	5	18	1	\N	0.5	963	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:18.833162	2021-12-02 13:36:18.833162	\N	3	2
1007	2	5066	5	18	1	\N	0.5	1926	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:18.976692	2021-12-02 13:36:18.976692	\N	1	2
1008	2	5067	5	18	1	\N	0.6	2890	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:19.173751	2021-12-02 13:36:19.173751	\N	4	2
1009	2	5068	5	18	1	\N	0.8	3853	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:19.313717	2021-12-02 13:36:19.313717	\N	2	2
1010	2	5069	5	18	1	\N	1	4816	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:19.455695	2021-12-02 13:36:19.455695	\N	3	2
1011	2	5070	5	18	1	\N	1.2	5779	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:19.708566	2021-12-02 13:36:19.708566	\N	5	2
1012	2	5071	5	18	1	\N	1.4	6742	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:19.870353	2021-12-02 13:36:19.870353	\N	26	2
1013	2	5072	5	18	1	\N	1.6	7706	USD	\N	11	1	1	17	1	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.155328	2021-12-02 13:36:20.155328	\N	16	2
1014	2	5073	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.281901	2021-12-02 13:36:20.281901	\N	3	2
1015	2	5074	5	18	5	\N	0.5	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.312073	2021-12-02 13:36:20.312073	\N	1	2
1016	2	5075	5	18	5	\N	0.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.339568	2021-12-02 13:36:20.339568	\N	4	2
1017	2	5076	5	18	5	\N	0.8	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	2	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.366657	2021-12-02 13:36:20.366657	\N	2	2
1018	2	5077	5	18	5	\N	1	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.394024	2021-12-02 13:36:20.394024	\N	3	2
1019	2	5078	5	18	5	\N	1.2	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	3	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.421111	2021-12-02 13:36:20.421111	\N	5	2
1020	2	5079	5	18	5	\N	1.4	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.448476	2021-12-02 13:36:20.448476	\N	26	2
1021	2	5080	5	18	5	\N	1.6	0	USD	\N	11	5	2	17	5	\N	3	\N	\N	0	USD	864	USD	0.2	\N	4	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.475873	2021-12-02 13:36:20.475873	\N	16	2
1022	2	5081	5	18	10	\N	0.5	0	USD	\N	11	10	2	17	12	\N	3	\N	\N	0	USD	864	USD	0.2	\N	1	1	\N	5522.0	\N	\N	\N	2021-12-02 13:36:20.50314	2021-12-02 13:36:20.50314	\N	3	2
1023	2	5082	5	19	1	\N	0.5	1725	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	2021-12-02 13:36:20.530377	2021-12-02 13:36:20.530377	\N	3	2
1024	2	5083	5	19	1	\N	0.5	3450	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	2021-12-02 13:36:20.557441	2021-12-02 13:36:20.557441	\N	1	2
1025	2	5084	5	19	1	\N	0.5	5174	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	2021-12-02 13:36:20.584614	2021-12-02 13:36:20.584614	\N	4	2
1026	2	5085	5	19	1	\N	0.8	6899	USD	\N	12	1	1	18	1	\N	3	\N	\N	0	USD	1284	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	2021-12-02 13:36:20.611487	2021-12-02 13:36:20.611487	\N	2	2
1027	2	5086	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	5523.0	\N	\N	\N	2021-12-02 13:36:20.638294	2021-12-02 13:36:20.638294	\N	3	2
1028	2	5087	5	19	4	\N	0.5	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5523.0	\N	\N	\N	2021-12-02 13:36:20.665843	2021-12-02 13:36:20.665843	\N	1	2
1029	2	5088	5	19	4	\N	0.6	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	3	1	\N	5523.0	\N	\N	\N	2021-12-02 13:36:20.693095	2021-12-02 13:36:20.693095	\N	4	2
1030	2	5089	5	19	4	\N	0.8	300	USD	\N	12	4	9	18	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5523.0	\N	\N	\N	2021-12-02 13:36:20.766541	2021-12-02 13:36:20.766541	\N	2	2
1031	2	5090	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5581.0	\N	\N	\N	2021-12-02 13:36:20.794558	2021-12-02 13:36:20.794558	\N	3	2
1032	2	5091	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	2021-12-02 13:36:20.822079	2021-12-02 13:36:20.822079	\N	1	2
1033	2	5092	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	2021-12-02 13:36:20.855347	2021-12-02 13:36:20.855347	\N	4	2
1034	2	5093	5	19	5	\N	0.5	0	USD	\N	12	5	2	18	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5581.0	\N	\N	\N	2021-12-02 13:36:20.88277	2021-12-02 13:36:20.88277	\N	2	2
1035	2	5094	5	20	1	\N	0.5	1456	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:20.910077	2021-12-02 13:36:20.910077	\N	3	2
1036	2	5095	5	20	1	\N	0.5	2912	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:20.937711	2021-12-02 13:36:20.937711	\N	1	2
1037	2	5096	5	20	1	\N	0.5	4368	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:20.96473	2021-12-02 13:36:20.96473	\N	4	2
1038	2	5097	5	20	1	\N	0.5	5824	USD	\N	13	1	1	19	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:20.992065	2021-12-02 13:36:20.992065	\N	2	2
1039	2	5098	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.019196	2021-12-02 13:36:21.019196	\N	3	2
1040	2	5099	5	20	4	\N	0.5	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.046332	2021-12-02 13:36:21.046332	\N	1	2
1041	2	5100	5	20	4	\N	0.6	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.073596	2021-12-02 13:36:21.073596	\N	4	2
1042	2	5101	5	20	4	\N	0.8	300	USD	\N	13	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.100514	2021-12-02 13:36:21.100514	\N	2	2
1043	2	5102	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.12735	2021-12-02 13:36:21.12735	\N	3	2
1044	2	5103	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.154216	2021-12-02 13:36:21.154216	\N	1	2
1045	2	5104	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.181113	2021-12-02 13:36:21.181113	\N	4	2
1046	2	5105	5	20	5	\N	0.5	0	USD	\N	13	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.207994	2021-12-02 13:36:21.207994	\N	2	2
1047	2	5106	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.242249	2021-12-02 13:36:21.242249	\N	3	2
1048	2	5107	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.269782	2021-12-02 13:36:21.269782	\N	1	2
1049	2	5108	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.296716	2021-12-02 13:36:21.296716	\N	4	2
1050	2	5109	5	20	8	\N	0.5	354	USD	\N	13	8	7	19	10	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.323669	2021-12-02 13:36:21.323669	\N	2	2
1051	2	5110	5	21	1	\N	0.5	1021	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.353693	2021-12-02 13:36:21.353693	\N	3	2
1052	2	5111	5	21	1	\N	0.5	2041	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.382873	2021-12-02 13:36:21.382873	\N	1	2
1053	2	5112	5	21	1	\N	0.5	3062	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.409655	2021-12-02 13:36:21.409655	\N	4	2
1054	2	5113	5	21	1	\N	0.5	4083	USD	\N	14	1	1	19	1	\N	3	\N	\N	0	USD	865	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.436169	2021-12-02 13:36:21.436169	\N	2	2
1055	2	5114	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.463616	2021-12-02 13:36:21.463616	\N	3	2
1056	2	5115	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.510746	2021-12-02 13:36:21.510746	\N	1	2
1057	2	5116	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.537673	2021-12-02 13:36:21.537673	\N	4	2
1058	2	5117	5	21	4	\N	0.5	354	USD	\N	14	4	9	19	4	\N	3	\N	\N	0	USD	300	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.578954	2021-12-02 13:36:21.578954	\N	2	2
1059	2	5118	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.607799	2021-12-02 13:36:21.607799	\N	3	2
1060	2	5119	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.790477	2021-12-02 13:36:21.790477	\N	1	2
1062	2	5120	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.835352	2021-12-02 13:36:21.835352	\N	4	2
1063	2	5121	5	21	5	\N	0.5	0	USD	\N	14	5	2	19	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.863738	2021-12-02 13:36:21.863738	\N	2	2
1064	2	5122	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.892528	2021-12-02 13:36:21.892528	\N	3	2
1065	2	5123	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.921358	2021-12-02 13:36:21.921358	\N	1	2
1066	2	5124	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.94968	2021-12-02 13:36:21.94968	\N	4	2
1067	2	5125	5	21	8	\N	0.5	0	USD	\N	14	8	7	19	10	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5621.0	\N	\N	\N	2021-12-02 13:36:21.977482	2021-12-02 13:36:21.977482	\N	2	2
1068	2	5126	5	22	1	\N	0.5	1156	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.005889	2021-12-02 13:36:22.005889	\N	3	2
1069	2	5127	5	22	1	\N	0.6	2313	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.039849	2021-12-02 13:36:22.039849	\N	1	2
1070	2	5128	5	22	1	\N	0.9	3469	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.068609	2021-12-02 13:36:22.068609	\N	4	2
1071	2	5129	5	22	1	\N	1.2	4626	USD	\N	15	1	1	20	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.145163	2021-12-02 13:36:22.145163	\N	2	2
1072	2	5130	5	22	5	\N	0.5	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.173591	2021-12-02 13:36:22.173591	\N	3	2
1073	2	5131	5	22	5	\N	0.6	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.201847	2021-12-02 13:36:22.201847	\N	1	2
1074	2	5132	5	22	5	\N	0.9	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.229994	2021-12-02 13:36:22.229994	\N	4	2
1075	2	5133	5	22	5	\N	1.2	0	USD	\N	15	5	2	20	5	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.257765	2021-12-02 13:36:22.257765	\N	2	2
1076	2	5134	5	23	1	\N	0.5	800	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.285328	2021-12-02 13:36:22.285328	\N	3	2
1077	2	5135	5	23	1	\N	0.5	1600	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.312909	2021-12-02 13:36:22.312909	\N	1	2
1078	2	5136	5	23	1	\N	0.6	2400	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.339947	2021-12-02 13:36:22.339947	\N	4	2
1079	2	5137	5	23	1	\N	0.8	3200	USD	\N	16	1	1	21	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.367266	2021-12-02 13:36:22.367266	\N	2	2
1080	2	5138	5	24	1	\N	0.5	1310	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.394695	2021-12-02 13:36:22.394695	\N	3	2
1081	2	5139	5	24	1	\N	0.6	2620	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.421831	2021-12-02 13:36:22.421831	\N	1	2
1082	2	5140	5	24	1	\N	0.9	3929	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.449224	2021-12-02 13:36:22.449224	\N	4	2
1083	2	5141	5	24	1	\N	1.2	5239	USD	\N	17	1	1	22	1	\N	3	\N	\N	0	USD	984	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.476474	2021-12-02 13:36:22.476474	\N	2	2
1084	2	5142	5	25	1	\N	0.5	1300	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.503473	2021-12-02 13:36:22.503473	\N	3	2
1085	2	5143	5	25	1	\N	0.8	2600	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.617189	2021-12-02 13:36:22.617189	\N	1	2
1086	2	5144	5	25	1	\N	1	3900	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.645007	2021-12-02 13:36:22.645007	\N	4	2
1087	2	5145	5	25	1	\N	1	5200	USD	\N	17	1	1	23	1	\N	3	\N	\N	0	USD	100	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.678083	2021-12-02 13:36:22.678083	\N	2	2
1088	2	5146	5	24	4	\N	0.5	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	1	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.705966	2021-12-02 13:36:22.705966	\N	3	2
1089	2	5147	5	24	4	\N	0.6	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	2	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.733301	2021-12-02 13:36:22.733301	\N	1	2
1090	2	5148	5	24	4	\N	0.9	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	3	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.76055	2021-12-02 13:36:22.76055	\N	4	2
1091	2	5149	5	24	4	\N	1.2	354	USD	\N	17	4	9	22	4	\N	3	\N	\N	0	USD	300	USD	0.3	\N	4	1	\N	5524.0	\N	\N	\N	2021-12-02 13:36:22.788528	2021-12-02 13:36:22.788528	\N	2	2
1092	2	5150	5	26	1	\N	1	4189	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	1	1	\N	5221.0	\N	\N	\N	2021-12-02 13:36:22.816307	2021-12-02 13:36:22.816307	\N	3	2
1093	2	5151	5	26	1	\N	2	8378	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	2	1	\N	5221.0	\N	\N	\N	2021-12-02 13:36:22.844175	2021-12-02 13:36:22.844175	\N	1	2
1094	2	5152	5	26	1	\N	3	12567	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	3	1	\N	5221.0	\N	\N	\N	2021-12-02 13:36:22.871514	2021-12-02 13:36:22.871514	\N	4	2
1095	2	5153	5	26	1	\N	4	16756	USD	\N	18	1	1	24	1	\N	3	\N	\N	0	USD	3552	USD	0.6	\N	4	1	\N	5221.0	\N	\N	\N	2021-12-02 13:36:22.89878	2021-12-02 13:36:22.89878	\N	2	2
1096	2	5154	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	2021-12-02 13:36:22.926429	2021-12-02 13:36:22.926429	\N	3	2
1097	2	5155	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	2021-12-02 13:36:22.953618	2021-12-02 13:36:22.953618	\N	1	2
1098	2	5156	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	2021-12-02 13:36:22.98052	2021-12-02 13:36:22.98052	\N	4	2
1099	2	5157	5	26	4	\N	0.5	354	USD	\N	18	4	9	24	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	2021-12-02 13:36:23.007456	2021-12-02 13:36:23.007456	\N	2	2
1100	2	5158	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	5281.0	\N	\N	\N	2021-12-02 13:36:23.034011	2021-12-02 13:36:23.034011	\N	3	2
1101	2	5159	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5281.0	\N	\N	\N	2021-12-02 13:36:23.061053	2021-12-02 13:36:23.061053	\N	1	2
1102	2	5160	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	3	1	\N	5281.0	\N	\N	\N	2021-12-02 13:36:23.088571	2021-12-02 13:36:23.088571	\N	4	2
1103	2	5161	5	26	5	\N	0.5	0	USD	\N	18	5	2	24	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	5281.0	\N	\N	\N	2021-12-02 13:36:23.115742	2021-12-02 13:36:23.115742	\N	2	2
1104	2	5162	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	2021-12-02 13:36:23.143258	2021-12-02 13:36:23.143258	\N	3	2
1105	2	5163	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	2021-12-02 13:36:23.176161	2021-12-02 13:36:23.176161	\N	1	2
1106	2	5164	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	2021-12-02 13:36:23.203483	2021-12-02 13:36:23.203483	\N	4	2
1107	2	5165	5	26	9	\N	1	0	USD	\N	18	9	8	24	11	\N	3	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5271.0	\N	\N	\N	2021-12-02 13:36:23.230519	2021-12-02 13:36:23.230519	\N	2	2
1108	2	5166	5	27	1	\N	1	3550	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	1	1	\N	5222.0	\N	\N	\N	2021-12-02 13:36:23.258112	2021-12-02 13:36:23.258112	\N	3	2
1109	2	5167	5	27	1	\N	1.5	7100	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	2	1	\N	5222.0	\N	\N	\N	2021-12-02 13:36:23.285518	2021-12-02 13:36:23.285518	\N	1	2
1110	2	5168	5	27	1	\N	1.5	10650	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	3	1	\N	5222.0	\N	\N	\N	2021-12-02 13:36:23.313186	2021-12-02 13:36:23.313186	\N	4	2
1111	2	5169	5	27	1	\N	2	14200	USD	\N	19	1	1	24	1	\N	3	\N	\N	0	USD	744	USD	0.2	\N	4	1	\N	5222.0	\N	\N	\N	2021-12-02 13:36:23.340983	2021-12-02 13:36:23.340983	\N	2	2
1112	2	5170	5	28	2	\N	0.5	2360	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	2021-12-02 13:36:23.368642	2021-12-02 13:36:23.368642	\N	3	2
1113	2	5171	5	28	2	\N	1	2950	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	2021-12-02 13:36:23.396447	2021-12-02 13:36:23.396447	\N	1	2
1114	2	5172	5	28	2	\N	1.5	3540	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	2021-12-02 13:36:23.423208	2021-12-02 13:36:23.423208	\N	4	2
1115	2	5173	5	28	2	\N	2	7080	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	2021-12-02 13:36:23.48684	2021-12-02 13:36:23.48684	\N	5	2
1116	2	5174	5	28	2	\N	2.2	10620	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	2021-12-02 13:36:23.514793	2021-12-02 13:36:23.514793	\N	6	2
1117	2	5175	5	28	2	\N	2.5	14160	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	2021-12-02 13:36:23.541833	2021-12-02 13:36:23.541833	\N	7	2
1118	2	5176	5	28	2	\N	3	17700	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 13:36:23.569244	2021-12-02 13:36:23.569244	\N	8	2
1119	2	5177	5	28	2	\N	3.6	22420	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 13:36:23.597197	2021-12-02 13:36:23.597197	\N	9	2
1120	2	5178	5	28	2	\N	5	28320	USD	\N	20	2	4	25	2	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 13:36:23.625055	2021-12-02 13:36:23.625055	\N	19	2
1121	2	5179	5	28	3	\N	0.5	2360	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	3000	USD	1.3	\N	1	1	\N	5141.0	\N	\N	\N	2021-12-02 13:36:23.652594	2021-12-02 13:36:23.652594	\N	3	2
1122	2	5180	5	28	3	\N	1	2950	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	4500	USD	1.5	\N	1	1	\N	5142.0	\N	\N	\N	2021-12-02 13:36:23.680332	2021-12-02 13:36:23.680332	\N	1	2
1123	2	5181	5	28	3	\N	1.5	3540	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	6000	USD	1.6	\N	1	1	\N	5143.0	\N	\N	\N	2021-12-02 13:36:23.70752	2021-12-02 13:36:23.70752	\N	4	2
1124	2	5182	5	28	3	\N	2	7080	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	9000	USD	1.8	\N	1	1	\N	5144.0	\N	\N	\N	2021-12-02 13:36:23.741075	2021-12-02 13:36:23.741075	\N	5	2
1125	2	5183	5	28	3	\N	2.2	10620	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	12000	USD	2.1	\N	1	1	\N	5145.0	\N	\N	\N	2021-12-02 13:36:23.768992	2021-12-02 13:36:23.768992	\N	6	2
1126	2	5184	5	28	3	\N	2.5	14160	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	15000	USD	2.3	\N	1	1	\N	5146.0	\N	\N	\N	2021-12-02 13:36:23.797273	2021-12-02 13:36:23.797273	\N	7	2
1127	2	5185	5	28	3	\N	3	17700	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 13:36:23.824944	2021-12-02 13:36:23.824944	\N	8	2
1128	2	5186	5	28	3	\N	3.6	22420	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 13:36:23.853012	2021-12-02 13:36:23.853012	\N	9	2
1129	2	5187	5	28	3	\N	5	28320	USD	\N	20	3	4	25	3	\N	2	\N	\N	0	USD	18000	USD	2.5	\N	1	1	\N	5147.0	\N	\N	\N	2021-12-02 13:36:23.880447	2021-12-02 13:36:23.880447	\N	19	2
1130	2	5188	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:23.907676	2021-12-02 13:36:23.907676	\N	10	2
1131	2	5189	5	28	4	\N	1	0	USD	\N	20	4	4	25	4	\N	2	\N	\N	0	USD	300	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:23.934885	2021-12-02 13:36:23.934885	\N	1	2
1132	2	5190	5	28	5	\N	0.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:23.961841	2021-12-02 13:36:23.961841	\N	3	2
1133	2	5191	5	28	5	\N	1.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	1	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:23.988835	2021-12-02 13:36:23.988835	\N	4	2
1134	2	5192	5	28	5	\N	2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:24.015309	2021-12-02 13:36:24.015309	\N	5	2
1135	2	5193	5	28	5	\N	2.2	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	2	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:24.042614	2021-12-02 13:36:24.042614	\N	6	2
1136	2	5194	5	28	5	\N	2.5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:24.069568	2021-12-02 13:36:24.069568	\N	7	2
1137	2	5195	5	28	5	\N	3	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	3	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:24.096367	2021-12-02 13:36:24.096367	\N	8	2
1138	2	5196	5	28	5	\N	3.6	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:24.123478	2021-12-02 13:36:24.123478	\N	9	2
1139	2	5197	5	28	5	\N	5	0	USD	\N	20	5	2	25	5	\N	2	\N	\N	0	USD	0	USD	0.7	\N	4	1	\N	5131.0	\N	\N	\N	2021-12-02 13:36:24.150747	2021-12-02 13:36:24.150747	\N	19	2
1140	2	5198	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.177643	2021-12-02 13:36:24.177643	\N	1	2
1141	2	5199	5	29	1	\N	0.5	793	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	600	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.20509	2021-12-02 13:36:24.20509	\N	4	2
1142	2	5200	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.238758	2021-12-02 13:36:24.238758	\N	5	2
1143	2	5201	5	29	1	\N	0.5	1586	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1200	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.266213	2021-12-02 13:36:24.266213	\N	6	2
1144	2	5202	5	29	1	\N	0.5	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.29356	2021-12-02 13:36:24.29356	\N	7	2
1145	2	5203	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.321008	2021-12-02 13:36:24.321008	\N	8	2
1146	2	5204	5	29	1	\N	0.6	2379	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	1800	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.348149	2021-12-02 13:36:24.348149	\N	9	2
1147	2	5205	5	29	1	\N	0.6	3172	USD	\N	21	2	1	26	1	\N	2	\N	\N	0	USD	2400	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.410429	2021-12-02 13:36:24.410429	\N	19	2
1148	2	5206	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.438395	2021-12-02 13:36:24.438395	\N	10	2
1149	2	5207	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	1	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.465586	2021-12-02 13:36:24.465586	\N	1	2
1150	2	5208	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.493456	2021-12-02 13:36:24.493456	\N	4	2
1151	2	5209	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.521134	2021-12-02 13:36:24.521134	\N	5	2
1152	2	5210	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.548416	2021-12-02 13:36:24.548416	\N	6	2
1153	2	5211	5	29	8	\N	0.5	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	3	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.576038	2021-12-02 13:36:24.576038	\N	7	2
1154	2	5212	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.603457	2021-12-02 13:36:24.603457	\N	8	2
1155	2	5213	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.630871	2021-12-02 13:36:24.630871	\N	9	2
1156	2	5214	5	29	8	\N	0.6	500	USD	\N	21	8	7	26	10	\N	2	\N	\N	0	USD	0	USD	0.3	\N	5	1	\N	5921.0	\N	\N	\N	2021-12-02 13:36:24.658281	2021-12-02 13:36:24.658281	\N	19	2
1157	2	5215	5	30	1	\N	0.7	1500	USD	\N	22	1	1	27	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	5623.0	\N	\N	\N	2021-12-02 13:36:24.685415	2021-12-02 13:36:24.685415	\N	3	2
1158	2	5216	5	30	5	\N	0.5	0	USD	\N	22	5	5	27	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	2021-12-02 13:36:24.712384	2021-12-02 13:36:24.712384	\N	3	2
1159	2	5217	5	30	4	\N	0.5	300	USD	\N	22	4	10	27	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5682.0	\N	\N	\N	2021-12-02 13:36:24.739137	2021-12-02 13:36:24.739137	\N	3	2
1160	2	5218	5	12	1	\N	2.3	12768	USD	\N	8	1	1	12	1	\N	3	\N	\N	0	USD	9820	USD	1.5	\N	1	1	\N	4721.0	\N	\N	\N	2021-12-02 13:36:24.765682	2021-12-02 13:36:24.765682	\N	3	2
1161	2	5219	5	13	1	\N	2.3	12768	USD	\N	8	1	1	13	1	\N	3	\N	\N	0	USD	9820	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	2021-12-02 13:36:24.799288	2021-12-02 13:36:24.799288	\N	3	2
1162	2	5220	5	14	4	\N	0.6	600	USD	\N	8	4	2	12	4	\N	3	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4722.0	\N	\N	\N	2021-12-02 13:36:24.826659	2021-12-02 13:36:24.826659	\N	3	2
1163	2	5221	5	31	1	\N	1	1400	USD	\N	23	1	1	28	1	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	2021-12-02 13:36:24.853337	2021-12-02 13:36:24.853337	\N	3	2
1164	2	5222	5	31	4	\N	1	1400	USD	\N	23	7	1	28	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	5622.0	\N	\N	\N	2021-12-02 13:36:24.880651	2021-12-02 13:36:24.880651	\N	3	2
1165	2	5223	5	16	1	\N	0.5	1000	USD	\N	9	2	3	15	1	\N	2	\N	\N	0	USD	900	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	2021-12-02 13:36:24.907578	2021-12-02 13:36:24.907578	\N	4	2
1166	2	5224	5	16	1	\N	0.5	2000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	1800	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	2021-12-02 13:36:24.934784	2021-12-02 13:36:24.934784	\N	5	2
1167	2	5225	5	16	1	\N	0.5	3000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2700	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	2021-12-02 13:36:24.962071	2021-12-02 13:36:24.962071	\N	6	2
1168	2	5226	5	16	1	\N	0.5	4000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	1	1	\N	5722.0	\N	\N	\N	2021-12-02 13:36:24.989118	2021-12-02 13:36:24.989118	\N	7	2
1169	2	5227	5	16	1	\N	1	5000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2400	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	2021-12-02 13:36:25.015917	2021-12-02 13:36:25.015917	\N	8	2
1170	2	5228	5	16	1	\N	1	6000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	2800	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	2021-12-02 13:36:25.042625	2021-12-02 13:36:25.042625	\N	18	2
1171	2	5229	5	16	1	\N	1	7000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3150	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	2021-12-02 13:36:25.069702	2021-12-02 13:36:25.069702	\N	34	2
1172	2	5230	5	16	1	\N	1	8000	USD	\N	9	2	3	15	2	\N	2	\N	\N	0	USD	3600	USD	0.5	\N	2	1	\N	5722.0	\N	\N	\N	2021-12-02 13:36:25.097244	2021-12-02 13:36:25.097244	\N	19	2
1173	2	5231	5	15	11	\N	0.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:25.124107	2021-12-02 13:36:25.124107	\N	3	2
1174	2	5232	5	15	11	\N	1	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:25.151418	2021-12-02 13:36:25.151418	\N	1	2
1175	2	5233	5	15	11	\N	1.5	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:25.17813	2021-12-02 13:36:25.17813	\N	4	2
1176	2	5234	5	15	11	\N	2	500	USD	\N	4	6	4	6	6	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	5731.0	\N	\N	\N	2021-12-02 13:36:25.205129	2021-12-02 13:36:25.205129	\N	2	2
1177	2	6000	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	2021-12-02 13:36:25.232343	2021-12-02 13:36:25.232343	\N	5	8
1178	2	6001	6	32	12	\N	1.5	8000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	2021-12-02 13:36:25.259219	2021-12-02 13:36:25.259219	\N	5	11
1179	2	6002	6	32	12	\N	1.5	8060	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	6500	USD	0.9	\N	1	1	\N	6526.0	\N	\N	\N	2021-12-02 13:36:25.329713	2021-12-02 13:36:25.329713	\N	5	13
1180	2	6003	6	32	12	\N	1.5	12500	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	9000	USD	1.2	\N	1	1	\N	6525.0	\N	\N	\N	2021-12-02 13:36:25.358408	2021-12-02 13:36:25.358408	\N	6	13
1181	2	6004	6	32	12	\N	1.5	15000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	11000	USD	1.5	\N	1	1	\N	6523.0	\N	\N	\N	2021-12-02 13:36:25.38633	2021-12-02 13:36:25.38633	\N	7	13
1182	2	6005	6	32	12	\N	2	20000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	14000	USD	1.7	\N	1	1	\N	6527.0	\N	\N	\N	2021-12-02 13:36:25.4142	2021-12-02 13:36:25.4142	\N	8	13
1183	2	6006	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	1.9	\N	1	1	\N	6528.0	\N	\N	\N	2021-12-02 13:36:25.441357	2021-12-02 13:36:25.441357	\N	18	13
1184	2	6007	6	32	12	\N	2.5	30000	USD	\N	24	1	1	29	13	\N	4	\N	\N	0	USD	22000	USD	2	\N	1	1	\N	6529.0	\N	\N	\N	2021-12-02 13:36:25.46834	2021-12-02 13:36:25.46834	\N	34	13
1185	2	6008	6	32	12	\N	3	30000	USD	\N	24	1	1	29	13	\N	2	\N	\N	0	USD	22000	USD	2.1	\N	1	1	\N	6524.0	\N	\N	\N	2021-12-02 13:36:25.495488	2021-12-02 13:36:25.495488	\N	19	13
1186	2	6009	6	32	8	\N	0.75	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	100	USD	0.1	\N	5	1	\N	6173.0	\N	\N	\N	2021-12-02 13:36:25.52254	2021-12-02 13:36:25.52254	\N	5	2
1187	2	6010	6	32	8	\N	1.3	800	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	2021-12-02 13:36:25.550059	2021-12-02 13:36:25.550059	\N	7	2
1188	2	6011	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	800	USD	1	\N	1	1	\N	6533.0	\N	\N	\N	2021-12-02 13:36:25.577786	2021-12-02 13:36:25.577786	\N	19	2
1189	2	6012	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 13:36:25.605492	2021-12-02 13:36:25.605492	\N	21	2
1190	2	6013	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	1600	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 13:36:25.632677	2021-12-02 13:36:25.632677	\N	23	2
1191	2	6014	6	32	8	\N	2	1600	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 13:36:25.660302	2021-12-02 13:36:25.660302	\N	5	2
1192	2	6015	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 13:36:25.688039	2021-12-02 13:36:25.688039	\N	39	2
1193	2	6016	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 13:36:25.71549	2021-12-02 13:36:25.71549	\N	40	2
1194	2	6017	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 13:36:25.742553	2021-12-02 13:36:25.742553	\N	41	2
1195	2	6018	6	32	8	\N	2	3200	USD	\N	24	8	7	29	10	\N	3	\N	\N	0	USD	2400	USD	1.3	\N	1	1	\N	6534.0	\N	\N	\N	2021-12-02 13:36:25.769684	2021-12-02 13:36:25.769684	\N	42	2
1196	2	6019	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:25.796726	2021-12-02 13:36:25.796726	\N	5	2
1197	2	6020	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:25.828023	2021-12-02 13:36:25.828023	\N	6	2
1198	2	6021	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:25.857995	2021-12-02 13:36:25.857995	\N	7	2
1199	2	6022	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:25.885612	2021-12-02 13:36:25.885612	\N	9	2
1200	2	6023	6	32	13	\N	1.3	1200	USD	\N	24	11	7	29	14	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:25.913303	2021-12-02 13:36:25.913303	\N	19	2
1201	2	6024	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:25.94082	2021-12-02 13:36:25.94082	\N	17	12
1202	2	6025	6	32	14	\N	1.3	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:25.967613	2021-12-02 13:36:25.967613	\N	43	14
1203	2	6026	6	32	14	\N	1.8	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:25.994819	2021-12-02 13:36:25.994819	\N	44	15
1204	2	6027	6	32	14	\N	2.6	1200	USD	\N	25	12	11	29	15	\N	2	\N	\N	0	USD	168	USD	0.1	\N	6	1	\N	6172.0	\N	\N	\N	2021-12-02 13:36:26.022049	2021-12-02 13:36:26.022049	\N	9	16
1205	2	6032	6	33	2	\N	1	3540	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 13:36:26.049522	2021-12-02 13:36:26.049522	\N	4	2
1206	2	6033	6	33	2	\N	1	7080	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 13:36:26.076822	2021-12-02 13:36:26.076822	\N	5	2
1207	2	6034	6	33	2	\N	1	10620	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 13:36:26.188409	2021-12-02 13:36:26.188409	\N	6	2
1208	2	6035	6	33	2	\N	1	14160	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 13:36:26.218157	2021-12-02 13:36:26.218157	\N	7	2
1209	2	6036	6	33	2	\N	2	17700	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 13:36:26.245631	2021-12-02 13:36:26.245631	\N	8	2
1210	2	6037	6	33	2	\N	2	22420	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 13:36:26.273334	2021-12-02 13:36:26.273334	\N	9	2
1211	2	6038	6	33	2	\N	2	25724	USD	\N	26	3	1	30	2	\N	2	\N	\N	0	USD	0	USD	0.4	\N	5	1	\N	6352.0	\N	\N	\N	2021-12-02 13:36:26.300369	2021-12-02 13:36:26.300369	\N	19	2
1212	2	6039	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.327343	2021-12-02 13:36:26.327343	\N	10	2
1213	2	6040	6	33	4	\N	0.5	300	USD	\N	26	4	10	30	4	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.354566	2021-12-02 13:36:26.354566	\N	1	2
1214	2	6041	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.382313	2021-12-02 13:36:26.382313	\N	10	2
1215	2	6042	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.410132	2021-12-02 13:36:26.410132	\N	1	2
1216	2	6043	6	33	5	\N	0.5	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.443699	2021-12-02 13:36:26.443699	\N	4	2
1217	2	6044	6	33	5	\N	0.7	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.470966	2021-12-02 13:36:26.470966	\N	5	2
1218	2	6045	6	33	5	\N	0.9	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.499051	2021-12-02 13:36:26.499051	\N	6	2
1219	2	6046	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.526669	2021-12-02 13:36:26.526669	\N	7	2
1220	2	6047	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.55446	2021-12-02 13:36:26.55446	\N	8	2
1221	2	6048	6	33	5	\N	1	0	USD	\N	26	5	10	30	5	\N	2	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	6571.0	\N	\N	\N	2021-12-02 13:36:26.581807	2021-12-02 13:36:26.581807	\N	9	2
1222	2	6049	6	34	1	\N	0.5	3500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	6721.0	\N	\N	\N	2021-12-02 13:36:26.609394	2021-12-02 13:36:26.609394	\N	3	2
1223	2	6050	6	34	1	\N	0.5	7000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	1	\N	6721.0	\N	\N	\N	2021-12-02 13:36:26.636701	2021-12-02 13:36:26.636701	\N	1	2
1224	2	6051	6	34	1	\N	1	10500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	6721.0	\N	\N	\N	2021-12-02 13:36:26.663649	2021-12-02 13:36:26.663649	\N	4	2
1225	2	6052	6	34	1	\N	1	14000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	7	1	\N	6721.0	\N	\N	\N	2021-12-02 13:36:26.690785	2021-12-02 13:36:26.690785	\N	2	2
1226	2	6053	6	34	1	\N	1.5	17500	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	6721.0	\N	\N	\N	2021-12-02 13:36:26.718501	2021-12-02 13:36:26.718501	\N	3	2
1227	2	6054	6	34	1	\N	2	21000	USD	\N	27	1	1	31	1	\N	3	\N	\N	0	USD	0	USD	0.2	\N	9	1	\N	6721.0	\N	\N	\N	2021-12-02 13:36:26.745836	2021-12-02 13:36:26.745836	\N	5	2
1228	2	6055	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.773262	2021-12-02 13:36:26.773262	\N	3	2
1229	2	6056	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.80037	2021-12-02 13:36:26.80037	\N	1	2
1230	2	6057	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.828166	2021-12-02 13:36:26.828166	\N	4	2
1231	2	6058	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.855433	2021-12-02 13:36:26.855433	\N	2	2
1232	2	6059	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.882422	2021-12-02 13:36:26.882422	\N	3	2
1233	2	6060	6	34	4	\N	0.5	0	USD	\N	27	4	3	31	4	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.90967	2021-12-02 13:36:26.90967	\N	5	2
1234	2	6061	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.943008	2021-12-02 13:36:26.943008	\N	3	2
1235	2	6062	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.970294	2021-12-02 13:36:26.970294	\N	1	2
1236	2	6063	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:26.997872	2021-12-02 13:36:26.997872	\N	4	2
1237	2	6064	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.025362	2021-12-02 13:36:27.025362	\N	2	2
1238	2	6065	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.053104	2021-12-02 13:36:27.053104	\N	3	2
1239	2	6066	6	34	5	\N	0.5	0	USD	\N	27	5	2	31	5	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.117323	2021-12-02 13:36:27.117323	\N	5	2
1240	2	6067	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.145845	2021-12-02 13:36:27.145845	\N	3	2
1241	2	6068	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.173311	2021-12-02 13:36:27.173311	\N	1	2
1242	2	6069	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	6	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.201151	2021-12-02 13:36:27.201151	\N	4	2
1243	2	6070	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	7	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.230209	2021-12-02 13:36:27.230209	\N	2	2
1244	2	6071	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.259269	2021-12-02 13:36:27.259269	\N	3	2
1245	2	6072	6	34	15	\N	0.5	0	USD	\N	27	13	1	31	16	\N	3	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6722.0	\N	\N	\N	2021-12-02 13:36:27.287627	2021-12-02 13:36:27.287627	\N	5	2
1246	2	7000	7	35	1	\N	7.9	66000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	7.9	\N	1	1	\N	3521.0	\N	\N	\N	2021-12-02 13:36:27.316267	2021-12-02 13:36:27.316267	\N	1	1
1247	2	7001	7	35	1	\N	15.6	132000	USD	\N	1	1	1	5	1	\N	1	\N	\N	0	USD	0	USD	14.9	\N	1	1	\N	3522.0	\N	\N	\N	2021-12-02 13:36:27.345336	2021-12-02 13:36:27.345336	\N	2	1
1248	2	7002	7	35	2	\N	1.5	2880	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	3550.0	\N	\N	\N	2021-12-02 13:36:27.374451	2021-12-02 13:36:27.374451	\N	4	2
1249	2	7003	7	35	2	\N	2	5760	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	3600	USD	1.4	\N	1	1	\N	3551.0	\N	\N	\N	2021-12-02 13:36:27.403366	2021-12-02 13:36:27.403366	\N	5	2
1250	2	7004	7	35	2	\N	2.2	7200	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	5040	USD	1.7	\N	1	1	\N	3552.0	\N	\N	\N	2021-12-02 13:36:27.432488	2021-12-02 13:36:27.432488	\N	6	2
1251	2	7005	7	35	2	\N	2.5	8640	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	6480	USD	2.1	\N	1	1	\N	3553.0	\N	\N	\N	2021-12-02 13:36:27.46094	2021-12-02 13:36:27.46094	\N	7	2
1252	2	7006	7	35	2	\N	2.8	10080	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	10080	USD	2.8	\N	1	1	\N	3554.0	\N	\N	\N	2021-12-02 13:36:27.489187	2021-12-02 13:36:27.489187	\N	8	2
1253	2	7007	7	35	2	\N	3	11520	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	13680	USD	3.5	\N	1	1	\N	3555.0	\N	\N	\N	2021-12-02 13:36:27.524198	2021-12-02 13:36:27.524198	\N	9	2
1254	2	7008	7	35	2	\N	3.2	13000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	17280	USD	4.9	\N	1	1	\N	3556.0	\N	\N	\N	2021-12-02 13:36:27.553588	2021-12-02 13:36:27.553588	\N	19	2
1255	2	7009	7	35	2	\N	3.5	14500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	6.3	\N	1	1	\N	3557.0	\N	\N	\N	2021-12-02 13:36:27.582642	2021-12-02 13:36:27.582642	\N	20	2
1256	2	7010	7	35	2	\N	4	16000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	7.8	\N	1	1	\N	3558.0	\N	\N	\N	2021-12-02 13:36:27.612034	2021-12-02 13:36:27.612034	\N	45	2
1257	2	7011	7	35	2	\N	4.5	17500	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	2021-12-02 13:36:27.641076	2021-12-02 13:36:27.641076	\N	23	2
1258	2	7012	7	35	2	\N	7	19000	USD	\N	1	2	1	5	2	\N	2	\N	\N	0	USD	0	USD	9.2	\N	1	1	\N	3559.0	\N	\N	\N	2021-12-02 13:36:27.669441	2021-12-02 13:36:27.669441	\N	25	2
1259	2	7013	7	35	3	\N	1	2400	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	1440	USD	0.9	\N	1	1	\N	3541.0	\N	\N	\N	2021-12-02 13:36:27.697993	2021-12-02 13:36:27.697993	\N	1	2
1260	2	7014	7	35	3	\N	1	2880	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	3542.0	\N	\N	\N	2021-12-02 13:36:27.725919	2021-12-02 13:36:27.725919	\N	4	2
1261	2	7015	7	35	3	\N	1.5	5760	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	3544.0	\N	\N	\N	2021-12-02 13:36:27.755143	2021-12-02 13:36:27.755143	\N	5	2
1262	2	7016	7	35	3	\N	1.8	7200	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	3545.0	\N	\N	\N	2021-12-02 13:36:27.784085	2021-12-02 13:36:27.784085	\N	6	2
1263	2	7017	7	35	3	\N	2	8640	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	3546.0	\N	\N	\N	2021-12-02 13:36:27.813396	2021-12-02 13:36:27.813396	\N	7	2
1264	2	7018	7	35	3	\N	2.2	10080	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	3547.0	\N	\N	\N	2021-12-02 13:36:27.841916	2021-12-02 13:36:27.841916	\N	8	2
1265	2	7019	7	35	3	\N	3	11520	USD	\N	1	3	1	5	3	\N	2	\N	\N	0	USD	11520	USD	2.2	\N	1	1	\N	3548.0	\N	\N	\N	2021-12-02 13:36:27.870193	2021-12-02 13:36:27.870193	\N	9	2
1266	2	7020	7	35	4	\N	0.5	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	2021-12-02 13:36:27.897902	2021-12-02 13:36:27.897902	\N	10	2
1267	2	7021	7	35	4	\N	1	300	USD	\N	1	7	2	5	4	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	3581.0	\N	\N	\N	2021-12-02 13:36:27.925704	2021-12-02 13:36:27.925704	\N	1	2
1268	2	7022	7	35	5	\N	0.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	2021-12-02 13:36:27.953831	2021-12-02 13:36:27.953831	\N	4	2
1269	2	7023	7	35	5	\N	1	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	2021-12-02 13:36:27.982215	2021-12-02 13:36:27.982215	\N	5	2
1270	2	7024	7	35	5	\N	1.5	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	3581.0	\N	\N	\N	2021-12-02 13:36:28.047813	2021-12-02 13:36:28.047813	\N	6	2
1271	2	7025	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	2021-12-02 13:36:28.08331	2021-12-02 13:36:28.08331	\N	7	2
1272	2	7026	7	35	5	\N	2	0	USD	\N	1	5	2	5	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	8	1	\N	3581.0	\N	\N	\N	2021-12-02 13:36:28.112532	2021-12-02 13:36:28.112532	\N	8	2
1273	2	7027	7	36	1	\N	1	1800	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	2021-12-02 13:36:28.141594	2021-12-02 13:36:28.141594	\N	3	2
1274	2	7028	7	36	4	\N	0.5	0	USD	\N	2	4	2	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	2021-12-02 13:36:28.170649	2021-12-02 13:36:28.170649	\N	3	2
1275	2	7029	7	37	1	\N	4	17200	USD	\N	1	1	1	33	1	\N	2	\N	\N	0	USD	0	USD	4	\N	1	1	\N	4521.0	\N	\N	\N	2021-12-02 13:36:28.2	2021-12-02 13:36:28.2	\N	19	2
1276	2	7031	7	37	2	\N	1.3	2880	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	1.5	\N	1	1	\N	4551.0	\N	\N	\N	2021-12-02 13:36:28.228508	2021-12-02 13:36:28.228508	\N	4	2
1277	2	7032	7	37	2	\N	1.8	5760	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2	\N	1	1	\N	4553.0	\N	\N	\N	2021-12-02 13:36:28.25717	2021-12-02 13:36:28.25717	\N	5	2
1278	2	7033	7	37	2	\N	2	8640	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.3	\N	1	1	\N	4554.0	\N	\N	\N	2021-12-02 13:36:28.286117	2021-12-02 13:36:28.286117	\N	6	2
1279	2	7034	7	37	2	\N	2.5	11520	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.6	\N	1	1	\N	4555.0	\N	\N	\N	2021-12-02 13:36:28.314831	2021-12-02 13:36:28.314831	\N	7	2
1280	2	7035	7	37	2	\N	3	14400	USD	\N	1	2	1	33	2	\N	2	\N	\N	0	USD	0	USD	2.9	\N	1	1	\N	4556.0	\N	\N	\N	2021-12-02 13:36:28.343331	2021-12-02 13:36:28.343331	\N	8	2
1281	2	7036	7	37	3	\N	1	2880	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	4320	USD	1.1	\N	1	1	\N	4543.0	\N	\N	\N	2021-12-02 13:36:28.371702	2021-12-02 13:36:28.371702	\N	1	2
1282	2	7037	7	37	3	\N	1.3	5760	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	4544.0	\N	\N	\N	2021-12-02 13:36:28.400231	2021-12-02 13:36:28.400231	\N	4	2
1283	2	7038	7	37	3	\N	1.8	7200	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	8640	USD	1.5	\N	1	1	\N	4545.0	\N	\N	\N	2021-12-02 13:36:28.429375	2021-12-02 13:36:28.429375	\N	5	2
1284	2	7039	7	37	3	\N	2	8640	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	11500	USD	1.7	\N	1	1	\N	4546.0	\N	\N	\N	2021-12-02 13:36:28.457613	2021-12-02 13:36:28.457613	\N	6	2
1285	2	7040	7	37	3	\N	2.5	10080	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	14400	USD	1.9	\N	1	1	\N	4547.0	\N	\N	\N	2021-12-02 13:36:28.486388	2021-12-02 13:36:28.486388	\N	7	2
1286	2	7041	7	37	3	\N	3	11500	USD	\N	1	3	1	33	3	\N	2	\N	\N	0	USD	17280	USD	2.2	\N	1	1	\N	4548.0	\N	\N	\N	2021-12-02 13:36:28.514546	2021-12-02 13:36:28.514546	\N	8	2
1287	2	7042	7	37	4	\N	1	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	2021-12-02 13:36:28.542854	2021-12-02 13:36:28.542854	\N	10	2
1288	2	7043	7	37	4	\N	1.2	300	USD	\N	1	7	9	33	4	\N	2	\N	\N	0	USD	300	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	2021-12-02 13:36:28.571371	2021-12-02 13:36:28.571371	\N	1	2
1289	2	7044	7	37	5	\N	1	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	2	1	\N	4582.0	\N	\N	\N	2021-12-02 13:36:28.605225	2021-12-02 13:36:28.605225	\N	4	2
1290	2	7045	7	37	5	\N	1.2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	2021-12-02 13:36:28.635794	2021-12-02 13:36:28.635794	\N	5	2
1291	2	7046	7	37	5	\N	1.8	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	2021-12-02 13:36:28.66471	2021-12-02 13:36:28.66471	\N	6	2
1292	2	7047	7	37	5	\N	2	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	2021-12-02 13:36:28.693559	2021-12-02 13:36:28.693559	\N	7	2
1293	2	7048	7	37	5	\N	2.5	0	USD	\N	1	5	5	33	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	4582.0	\N	\N	\N	2021-12-02 13:36:28.722117	2021-12-02 13:36:28.722117	\N	8	2
1294	2	7049	7	38	1	\N	1	1200	USD	\N	2	1	9	32	1	\N	3	\N	\N	0	USD	0	USD	0.3	\N	12	1	\N	3548.0	\N	\N	\N	2021-12-02 13:36:28.750667	2021-12-02 13:36:28.750667	\N	3	2
1295	2	7050	7	38	4	\N	1	0	USD	\N	2	4	9	32	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	6	1	\N	3548.0	\N	\N	\N	2021-12-02 13:36:28.779334	2021-12-02 13:36:28.779334	\N	3	2
1296	2	7051	7	39	1	\N	1.2	9587	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	1	1	\N	7121.0	\N	\N	\N	2021-12-02 13:36:28.807659	2021-12-02 13:36:28.807659	\N	3	2
1297	2	7052	7	39	1	\N	2.4	19174	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	2	1	\N	7121.0	\N	\N	\N	2021-12-02 13:36:28.836248	2021-12-02 13:36:28.836248	\N	1	2
1298	2	7053	7	39	1	\N	3.6	28760	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	3	1	\N	7121.0	\N	\N	\N	2021-12-02 13:36:28.864617	2021-12-02 13:36:28.864617	\N	4	2
1299	2	7054	7	39	1	\N	4.8	38347	USD	\N	28	1	1	34	1	\N	3	\N	\N	0	USD	5952	USD	0.9	\N	4	1	\N	7121.0	\N	\N	\N	2021-12-02 13:36:28.893007	2021-12-02 13:36:28.893007	\N	2	2
1300	2	7055	7	39	3	\N	1	2160	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	2160	USD	0.9	\N	1	1	\N	7141.0	\N	\N	\N	2021-12-02 13:36:28.922111	2021-12-02 13:36:28.922111	\N	1	2
1301	2	7056	7	39	3	\N	1.2	3240	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	3240	USD	1	\N	1	1	\N	7142.0	\N	\N	\N	2021-12-02 13:36:28.950749	2021-12-02 13:36:28.950749	\N	4	2
1302	2	7057	7	39	3	\N	1.8	6480	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	6480	USD	1.2	\N	1	1	\N	7144.0	\N	\N	\N	2021-12-02 13:36:29.015602	2021-12-02 13:36:29.015602	\N	5	2
1303	2	7058	7	39	3	\N	2	9720	USD	\N	28	3	1	34	3	\N	2	\N	\N	0	USD	9720	USD	1.3	\N	1	1	\N	7145.0	\N	\N	\N	2021-12-02 13:36:29.045437	2021-12-02 13:36:29.045437	\N	6	2
1304	2	7059	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	1	1	\N	7182.0	\N	\N	\N	2021-12-02 13:36:29.074735	2021-12-02 13:36:29.074735	\N	3	2
1305	2	7060	7	39	4	\N	0.5	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	2	1	\N	7182.0	\N	\N	\N	2021-12-02 13:36:29.103362	2021-12-02 13:36:29.103362	\N	10	2
1306	2	7061	7	39	4	\N	0.6	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	3	1	\N	7182.0	\N	\N	\N	2021-12-02 13:36:29.131466	2021-12-02 13:36:29.131466	\N	3	2
1307	2	7062	7	39	4	\N	0.8	300	USD	\N	28	4	2	34	4	\N	2	\N	\N	0	USD	300	USD	0.2	\N	4	1	\N	7182.0	\N	\N	\N	2021-12-02 13:36:29.159846	2021-12-02 13:36:29.159846	\N	1	2
1308	2	7063	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	2021-12-02 13:36:29.194672	2021-12-02 13:36:29.194672	\N	4	2
1309	2	7064	7	39	5	\N	0.5	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	2021-12-02 13:36:29.223729	2021-12-02 13:36:29.223729	\N	5	2
1310	2	7065	7	39	5	\N	0.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	2021-12-02 13:36:29.252642	2021-12-02 13:36:29.252642	\N	6	2
1311	2	7066	7	39	5	\N	0.8	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	4	1	\N	7181.0	\N	\N	\N	2021-12-02 13:36:29.281088	2021-12-02 13:36:29.281088	\N	7	2
1312	2	7067	7	40	1	\N	3.3	9600	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7521.0	\N	\N	\N	2021-12-02 13:36:29.310047	2021-12-02 13:36:29.310047	\N	3	2
1313	2	7068	7	40	1	\N	6.6	18000	USD	\N	29	1	2	35	1	\N	3	\N	\N	0	USD	0	USD	3.3	\N	2	1	\N	7521.0	\N	\N	\N	2021-12-02 13:36:29.338381	2021-12-02 13:36:29.338381	\N	1	2
1314	2	7069	7	40	3	\N	0.8	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	7541.0	\N	\N	\N	2021-12-02 13:36:29.367488	2021-12-02 13:36:29.367488	\N	3	2
1315	2	7070	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1	\N	1	1	\N	7542.0	\N	\N	\N	2021-12-02 13:36:29.396386	2021-12-02 13:36:29.396386	\N	1	2
1316	2	7071	7	40	3	\N	1	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.1	\N	1	1	\N	7543.0	\N	\N	\N	2021-12-02 13:36:29.425716	2021-12-02 13:36:29.425716	\N	4	2
1317	2	7072	7	40	3	\N	1.2	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.2	\N	1	1	\N	7544.0	\N	\N	\N	2021-12-02 13:36:29.454164	2021-12-02 13:36:29.454164	\N	5	2
1318	2	7073	7	40	3	\N	1.4	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.4	\N	1	1	\N	7545.0	\N	\N	\N	2021-12-02 13:36:29.482907	2021-12-02 13:36:29.482907	\N	6	2
1319	2	7074	7	40	3	\N	1.6	1200	USD	\N	29	3	2	35	3	\N	2	\N	\N	0	USD	0	USD	1.6	\N	1	1	\N	7546.0	\N	\N	\N	2021-12-02 13:36:29.511729	2021-12-02 13:36:29.511729	\N	7	2
1320	2	7075	7	40	4	\N	0.5	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	2	1	\N	7582.0	\N	\N	\N	2021-12-02 13:36:29.539332	2021-12-02 13:36:29.539332	\N	3	2
1321	2	7076	7	40	4	\N	0.8	0	USD	\N	29	4	9	35	4	\N	3	\N	\N	0	USD	0	USD	0.3	\N	4	1	\N	7582.0	\N	\N	\N	2021-12-02 13:36:29.566417	2021-12-02 13:36:29.566417	\N	1	2
1322	2	7077	7	40	5	\N	0.5	0	USD	\N	29	4	9	35	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7581.0	\N	\N	\N	2021-12-02 13:36:29.593664	2021-12-02 13:36:29.593664	\N	3	2
1323	2	7078	7	41	1	\N	8.7	28200	USD	\N	30	1	1	36	1	\N	3	\N	\N	0	USD	0	USD	8.7	\N	1	1	\N	7321.0	\N	\N	\N	2021-12-02 13:36:29.621342	2021-12-02 13:36:29.621342	\N	3	2
1324	2	7079	7	41	2	\N	1	2800	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	2.7	\N	1	1	\N	7351.0	\N	\N	\N	2021-12-02 13:36:29.648423	2021-12-02 13:36:29.648423	\N	1	2
1325	2	7080	7	41	2	\N	1.1	3120	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.3	\N	1	1	\N	7352.0	\N	\N	\N	2021-12-02 13:36:29.675844	2021-12-02 13:36:29.675844	\N	4	2
1326	2	7081	7	41	2	\N	1.3	6240	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	3.9	\N	1	1	\N	7353.0	\N	\N	\N	2021-12-02 13:36:29.705686	2021-12-02 13:36:29.705686	\N	5	2
1327	2	7082	7	41	2	\N	1.6	9360	USD	\N	30	2	1	36	2	\N	2	\N	\N	0	USD	0	USD	4.4	\N	1	1	\N	7354.0	\N	\N	\N	2021-12-02 13:36:29.736914	2021-12-02 13:36:29.736914	\N	6	2
1328	2	7083	7	41	3	\N	1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	2021-12-02 13:36:29.76471	2021-12-02 13:36:29.76471	\N	1	2
1329	2	7084	7	41	3	\N	1.1	3120	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	3120	USD	1.1	\N	1	1	\N	7356.0	\N	\N	\N	2021-12-02 13:36:29.793114	2021-12-02 13:36:29.793114	\N	4	2
1330	2	7085	7	41	3	\N	1.3	9360	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	6240	USD	1.3	\N	1	1	\N	7357.0	\N	\N	\N	2021-12-02 13:36:29.820753	2021-12-02 13:36:29.820753	\N	5	2
1331	2	7086	7	41	3	\N	1.6	12480	USD	\N	30	3	1	36	3	\N	2	\N	\N	0	USD	9360	USD	1.6	\N	1	1	\N	7358.0	\N	\N	\N	2021-12-02 13:36:29.847888	2021-12-02 13:36:29.847888	\N	6	2
1332	2	7087	7	41	4	\N	1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	1	1	\N	7381.0	\N	\N	\N	2021-12-02 13:36:29.87476	2021-12-02 13:36:29.87476	\N	1	2
1333	2	7088	7	41	4	\N	1.1	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	2021-12-02 13:36:29.9022	2021-12-02 13:36:29.9022	\N	4	2
1334	2	7089	7	41	4	\N	1.3	0	USD	\N	30	4	9	36	4	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	2021-12-02 13:36:29.964726	2021-12-02 13:36:29.964726	\N	5	2
1335	2	7090	7	41	5	\N	1	0	USD	\N	30	5	9	36	5	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7381.0	\N	\N	\N	2021-12-02 13:36:29.992541	2021-12-02 13:36:29.992541	\N	3	2
1336	2	7091	7	42	1	\N	1.5	3600	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 13:36:30.020687	2021-12-02 13:36:30.020687	\N	3	2
1337	2	7092	7	42	1	\N	2.5	7200	USD	\N	31	1	9	37	1	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 13:36:30.048239	2021-12-02 13:36:30.048239	\N	1	2
1338	2	7093	7	42	3	\N	0.5	1400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 13:36:30.075697	2021-12-02 13:36:30.075697	\N	3	2
1339	2	7094	7	42	3	\N	1	2400	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 13:36:30.103641	2021-12-02 13:36:30.103641	\N	1	2
1340	2	7095	7	42	3	\N	1	3600	USD	\N	31	3	9	37	3	\N	2	\N	\N	0	USD	0	USD	0.5	\N	2	1	\N	7421.0	\N	\N	\N	2021-12-02 13:36:30.130762	2021-12-02 13:36:30.130762	\N	4	2
1341	2	7096	7	42	4	\N	0.5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	2021-12-02 13:36:30.156555	2021-12-02 13:36:30.156555	\N	3	2
1342	2	7097	7	42	4	\N	5	0	USD	\N	31	\N	9	37	4	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	7482.0	\N	\N	\N	2021-12-02 13:36:30.182666	2021-12-02 13:36:30.182666	\N	1	2
1343	2	7098	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	2021-12-02 13:36:30.208849	2021-12-02 13:36:30.208849	\N	3	2
1344	2	7099	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	7482.0	\N	\N	\N	2021-12-02 13:36:30.234962	2021-12-02 13:36:30.234962	\N	1	2
1345	2	7100	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	6	1	\N	7482.0	\N	\N	\N	2021-12-02 13:36:30.266917	2021-12-02 13:36:30.266917	\N	4	2
1346	2	7101	7	42	5	\N	0.5	0	USD	\N	31	\N	2	37	5	\N	3	\N	\N	0	USD	0	USD	0.2	\N	8	1	\N	7482.0	\N	\N	\N	2021-12-02 13:36:30.292935	2021-12-02 13:36:30.292935	\N	2	2
1347	2	7102	7	39	5	\N	1	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	2021-12-02 13:36:30.320772	2021-12-02 13:36:30.320772	\N	8	2
1348	2	7103	7	39	5	\N	1.2	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	2021-12-02 13:36:30.348624	2021-12-02 13:36:30.348624	\N	18	2
1349	2	7104	7	39	5	\N	1.4	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	2021-12-02 13:36:30.375977	2021-12-02 13:36:30.375977	\N	34	2
1350	2	7105	7	39	5	\N	1.6	0	USD	\N	28	5	2	34	5	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	7181.0	\N	\N	\N	2021-12-02 13:36:30.402958	2021-12-02 13:36:30.402958	\N	19	2
1351	2	7106	7	43	1	\N	4	17200	USD	\N	1	1	1	38	1	\N	2	\N	\N	0	USD	21000	USD	3.8	\N	1	1	\N	2523.0	\N	\N	\N	2021-12-02 13:36:30.430442	2021-12-02 13:36:30.430442	\N	19	2
1352	2	7107	7	43	2	\N	1.3	2880	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	2021-12-02 13:36:30.457168	2021-12-02 13:36:30.457168	\N	4	2
1353	2	7108	7	43	2	\N	1.8	5760	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	2021-12-02 13:36:30.483779	2021-12-02 13:36:30.483779	\N	5	2
1354	2	7109	7	43	2	\N	2	8640	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	2021-12-02 13:36:30.510482	2021-12-02 13:36:30.510482	\N	6	2
1355	2	7110	7	43	2	\N	2.5	11520	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	2021-12-02 13:36:30.537333	2021-12-02 13:36:30.537333	\N	7	2
1356	2	7111	7	43	2	\N	3	14400	USD	\N	1	2	1	38	2	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	2021-12-02 13:36:30.563985	2021-12-02 13:36:30.563985	\N	8	2
1357	2	7112	7	43	3	\N	1	2880	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	0	USD	0.9	\N	1	1	\N	2550.0	\N	\N	\N	2021-12-02 13:36:30.590502	2021-12-02 13:36:30.590502	\N	1	2
1358	2	7113	7	43	3	\N	1.3	5760	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	2880	USD	1	\N	1	1	\N	2542.0	\N	\N	\N	2021-12-02 13:36:30.617506	2021-12-02 13:36:30.617506	\N	4	2
1359	2	7114	7	43	3	\N	1.8	7200	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	5760	USD	1.3	\N	1	1	\N	2544.0	\N	\N	\N	2021-12-02 13:36:30.646093	2021-12-02 13:36:30.646093	\N	5	2
1360	2	7115	7	43	3	\N	2	8640	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	7200	USD	1.5	\N	1	1	\N	2545.0	\N	\N	\N	2021-12-02 13:36:30.674277	2021-12-02 13:36:30.674277	\N	6	2
1361	2	7116	7	43	3	\N	2.5	10080	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	8640	USD	1.7	\N	1	1	\N	2546.0	\N	\N	\N	2021-12-02 13:36:30.702652	2021-12-02 13:36:30.702652	\N	7	2
1362	2	7117	7	43	3	\N	3	11500	USD	\N	1	3	1	38	3	\N	2	\N	\N	0	USD	10080	USD	1.9	\N	1	1	\N	2547.0	\N	\N	\N	2021-12-02 13:36:30.731217	2021-12-02 13:36:30.731217	\N	8	2
1363	2	7118	7	43	4	\N	1	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 13:36:30.759947	2021-12-02 13:36:30.759947	\N	10	2
1364	2	7119	7	43	4	\N	1.2	300	USD	\N	1	7	9	38	4	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 13:36:30.793845	2021-12-02 13:36:30.793845	\N	1	2
1365	2	7120	7	43	5	\N	1	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 13:36:30.821801	2021-12-02 13:36:30.821801	\N	4	2
1366	2	7121	7	43	5	\N	1.2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 13:36:30.886272	2021-12-02 13:36:30.886272	\N	5	2
1367	2	7122	7	43	5	\N	1.8	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 13:36:30.915108	2021-12-02 13:36:30.915108	\N	6	2
1368	2	7123	7	43	5	\N	2	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 13:36:30.943936	2021-12-02 13:36:30.943936	\N	7	2
1369	2	7124	7	43	5	\N	2.5	0	USD	\N	1	5	5	38	5	\N	2	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	2582.0	\N	\N	\N	2021-12-02 13:36:30.972202	2021-12-02 13:36:30.972202	\N	8	2
1370	2	8000	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	2021-12-02 13:36:31.000252	2021-12-02 13:36:31.000252	\N	1	1
1371	2	8001	8	44	16	\N	0.5	300	USD	\N	4	13	12	39	16	\N	1	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	986.0	\N	\N	\N	2021-12-02 13:36:31.02865	2021-12-02 13:36:31.02865	\N	2	1
1372	2	8002	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	2021-12-02 13:36:31.057124	2021-12-02 13:36:31.057124	\N	1	1
1373	2	8003	8	44	17	\N	0.5	0	USD	\N	32	13	13	40	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	2021-12-02 13:36:31.085382	2021-12-02 13:36:31.085382	\N	2	1
1374	2	8004	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	2021-12-02 13:36:31.113986	2021-12-02 13:36:31.113986	\N	1	1
1375	2	8005	8	44	18	\N	0.5	0	USD	\N	32	13	13	41	16	\N	1	\N	\N	0	USD	0	USD	0.2	\N	4	1	\N	959.0	\N	\N	\N	2021-12-02 13:36:31.142816	2021-12-02 13:36:31.142816	\N	2	1
1376	2	8006	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	2021-12-02 13:36:31.171373	2021-12-02 13:36:31.171373	\N	1	1
1377	2	8007	8	44	19	\N	0.5	0	USD	\N	25	14	14	42	17	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.199599	2021-12-02 13:36:31.199599	\N	2	1
1378	2	8008	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.1	\N	1	1	\N	913.0	\N	\N	\N	2021-12-02 13:36:31.228014	2021-12-02 13:36:31.228014	\N	1	1
1379	2	8009	8	44	20	\N	0.5	0	USD	\N	33	15	14	43	18	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.256189	2021-12-02 13:36:31.256189	\N	2	1
1380	2	8010	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.284939	2021-12-02 13:36:31.284939	\N	1	1
1381	2	8011	8	44	21	\N	0.5	0	USD	\N	33	16	15	44	19	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.313651	2021-12-02 13:36:31.313651	\N	2	1
1382	2	8012	8	44	22	\N	0.5	0	USD	\N	33	17	16	45	20	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.347686	2021-12-02 13:36:31.347686	\N	1	1
1383	2	8013	8	44	23	\N	0.5	0	USD	\N	4	18	17	46	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.376194	2021-12-02 13:36:31.376194	\N	2	1
1384	2	8014	8	44	23	\N	0.5	0	USD	\N	4	18	17	47	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.404732	2021-12-02 13:36:31.404732	\N	16	1
1385	2	8015	8	44	23	\N	0.5	0	USD	\N	4	18	17	48	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.433783	2021-12-02 13:36:31.433783	\N	7	1
1386	2	8016	8	44	23	\N	0.5	0	USD	\N	4	18	17	49	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.461896	2021-12-02 13:36:31.461896	\N	46	1
1387	2	8017	8	44	23	\N	0.5	0	USD	\N	4	18	17	50	21	\N	1	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.490326	2021-12-02 13:36:31.490326	\N	1	1
1388	2	8018	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.51884	2021-12-02 13:36:31.51884	\N	3	2
1389	2	8019	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.546765	2021-12-02 13:36:31.546765	\N	1	2
1390	2	8020	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.574888	2021-12-02 13:36:31.574888	\N	4	2
1391	2	8021	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.603368	2021-12-02 13:36:31.603368	\N	2	2
1392	2	8022	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.632087	2021-12-02 13:36:31.632087	\N	3	2
1393	2	8023	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.659932	2021-12-02 13:36:31.659932	\N	5	2
1394	2	8024	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.68838	2021-12-02 13:36:31.68838	\N	26	2
1395	2	8025	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.716067	2021-12-02 13:36:31.716067	\N	16	2
1396	2	8026	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.744402	2021-12-02 13:36:31.744402	\N	6	2
1397	2	8027	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.773103	2021-12-02 13:36:31.773103	\N	10	2
1398	2	8028	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.838595	2021-12-02 13:36:31.838595	\N	12	2
1399	2	8029	8	44	24	\N	0.5	0	USD	\N	33	13	18	51	16	\N	3	\N	\N	0	USD	0	USD	0.2	\N	1	1	\N	914.0	\N	\N	\N	2021-12-02 13:36:31.868187	2021-12-02 13:36:31.868187	\N	7	2
1400	2	8030	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	2021-12-02 13:36:31.897112	2021-12-02 13:36:31.897112	\N	6	11
1401	2	8031	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	2021-12-02 13:36:31.931933	2021-12-02 13:36:31.931933	\N	9	16
1402	2	8032	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	2021-12-02 13:36:31.961387	2021-12-02 13:36:31.961387	\N	20	17
1403	2	8033	8	44	14	\N	0.5	0	USD	\N	4	12	19	29	15	\N	2	\N	\N	0	USD	0	USD	0.1	\N	9	1	\N	6142.0	\N	\N	\N	2021-12-02 13:36:31.99142	2021-12-02 13:36:31.99142	\N	49	18
1404	2	8034	9	45	1	\N	0.5	500	USD	\N	34	1	6	52	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	951.0	\N	\N	\N	2021-12-02 13:36:32.021031	2021-12-02 13:36:32.021031	\N	3	2
1405	2	8035	9	46	1	\N	0.5	500	USD	\N	34	1	6	53	1	\N	3	\N	\N	0	USD	300	USD	0.1	\N	1	1	\N	952.0	\N	\N	\N	2021-12-02 13:36:32.050328	2021-12-02 13:36:32.050328	\N	3	2
1406	2	8036	9	47	1	\N	1	0	USD	\N	35	1	6	54	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.079098	2021-12-02 13:36:32.079098	\N	3	2
1407	2	8037	9	48	1	\N	1	0	USD	\N	36	1	6	55	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.107929	2021-12-02 13:36:32.107929	\N	3	2
1408	2	8038	9	49	1	\N	2	500	USD	\N	37	1	6	56	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.136768	2021-12-02 13:36:32.136768	\N	3	2
1409	2	8039	9	50	1	\N	0.5	0	USD	\N	38	1	6	57	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.165713	2021-12-02 13:36:32.165713	\N	3	2
1410	2	8040	9	51	1	\N	0.5	0	USD	\N	34	1	6	58	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.194717	2021-12-02 13:36:32.194717	\N	3	2
1411	2	8041	9	52	1	\N	0.5	0	USD	\N	39	1	6	59	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.223099	2021-12-02 13:36:32.223099	\N	3	2
1412	2	8042	9	53	1	\N	0.5	0	USD	\N	40	1	6	60	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.252512	2021-12-02 13:36:32.252512	\N	3	2
1413	2	8043	9	54	1	\N	0.5	0	USD	\N	41	1	6	61	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.281838	2021-12-02 13:36:32.281838	\N	3	2
1414	2	8044	9	55	1	\N	0.5	0	USD	\N	42	1	6	62	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.310466	2021-12-02 13:36:32.310466	\N	3	2
1415	2	8045	9	56	1	\N	0.5	0	USD	\N	32	1	6	63	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.339459	2021-12-02 13:36:32.339459	\N	3	2
1416	2	8046	9	57	1	\N	0.5	0	USD	\N	43	1	6	64	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.366976	2021-12-02 13:36:32.366976	\N	3	2
1417	2	8047	9	58	1	\N	2	500	USD	\N	43	1	6	65	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.394606	2021-12-02 13:36:32.394606	\N	3	2
1418	2	8048	9	59	1	\N	0.5	0	USD	\N	44	1	6	66	1	\N	3	\N	\N	0	USD	0	USD	0.4	\N	3	1	\N	956.0	\N	\N	\N	2021-12-02 13:36:32.422156	2021-12-02 13:36:32.422156	\N	3	2
1419	2	8049	9	60	8	\N	0.5	300	USD	\N	45	8	7	67	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	2021-12-02 13:36:32.45571	2021-12-02 13:36:32.45571	\N	3	2
1420	2	8050	9	61	8	\N	0.5	0	USD	\N	46	8	7	68	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	2021-12-02 13:36:32.483457	2021-12-02 13:36:32.483457	\N	3	2
1421	2	8051	9	62	8	\N	0.5	0	USD	\N	37	8	7	69	22	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	1	\N	985.0	\N	\N	\N	2021-12-02 13:36:32.511528	2021-12-02 13:36:32.511528	\N	3	2
1422	2	8052	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.539605	2021-12-02 13:36:32.539605	\N	3	2
1423	2	8053	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.567403	2021-12-02 13:36:32.567403	\N	1	2
1424	2	8054	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.595016	2021-12-02 13:36:32.595016	\N	4	2
1425	2	8055	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.622622	2021-12-02 13:36:32.622622	\N	2	2
1426	2	8056	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.650615	2021-12-02 13:36:32.650615	\N	3	2
1427	2	8057	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.678311	2021-12-02 13:36:32.678311	\N	5	2
1428	2	8058	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.706243	2021-12-02 13:36:32.706243	\N	26	2
1429	2	8059	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.733912	2021-12-02 13:36:32.733912	\N	16	2
1430	2	8060	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.795704	2021-12-02 13:36:32.795704	\N	6	2
1431	2	8061	10	32	25	\N	2	1500	USD	\N	24	19	20	70	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.824069	2021-12-02 13:36:32.824069	\N	10	2
1432	2	8062	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.852482	2021-12-02 13:36:32.852482	\N	3	2
1433	2	8063	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.880866	2021-12-02 13:36:32.880866	\N	1	2
1434	2	8064	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.909181	2021-12-02 13:36:32.909181	\N	4	2
1435	2	8065	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.937075	2021-12-02 13:36:32.937075	\N	2	2
1436	2	8066	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.964968	2021-12-02 13:36:32.964968	\N	3	2
1437	2	8067	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:32.992974	2021-12-02 13:36:32.992974	\N	5	2
1438	2	8068	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.027261	2021-12-02 13:36:33.027261	\N	26	2
1439	2	8069	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.055885	2021-12-02 13:36:33.055885	\N	16	2
1440	2	8070	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.084177	2021-12-02 13:36:33.084177	\N	6	2
1441	2	8071	10	32	26	\N	2	1500	USD	\N	24	19	20	71	23	\N	3	\N	\N	0	USD	3000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.112381	2021-12-02 13:36:33.112381	\N	10	2
1442	2	8072	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.140313	2021-12-02 13:36:33.140313	\N	3	2
1443	2	8073	10	63	27	\N	0.5	300	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.168247	2021-12-02 13:36:33.168247	\N	1	2
1444	2	8074	10	63	27	\N	0.5	1200	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.19624	2021-12-02 13:36:33.19624	\N	4	2
1445	2	8075	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.224705	2021-12-02 13:36:33.224705	\N	2	2
1446	2	8076	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.254464	2021-12-02 13:36:33.254464	\N	3	2
1447	2	8077	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.283144	2021-12-02 13:36:33.283144	\N	5	2
1448	2	8078	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.311684	2021-12-02 13:36:33.311684	\N	26	2
1449	2	8079	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.340142	2021-12-02 13:36:33.340142	\N	16	2
1450	2	8080	10	63	27	\N	2	1500	USD	\N	4	19	1	71	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.369525	2021-12-02 13:36:33.369525	\N	6	2
1451	2	8081	10	63	27	\N	2	1500	USD	\N	4	19	1	6	23	\N	3	\N	\N	0	USD	9000	USD	0	\N	1	1	\N	911.0	\N	\N	\N	2021-12-02 13:36:33.398127	2021-12-02 13:36:33.398127	\N	10	2
1452	2	8090	9	64	28	\N	16	67500	USD	\N	4	6	1	6	24	\N	3	\N	\N	0	USD	67500	USD	16	\N	1	1	\N	9999.0	\N	\N	\N	2021-12-02 13:36:33.427479	2021-12-02 13:36:33.427479	\N	3	2
1453	2	8091	9	64	29	\N	3	157500	USD	\N	4	1	1	6	1	\N	3	\N	\N	0	USD	157500	USD	3	\N	1	1	\N	9999.0	\N	\N	\N	2021-12-02 13:36:33.456985	2021-12-02 13:36:33.456985	\N	3	2
1454	2	8100	11	65	30	\N	1	0	USD	\N	4	5	1	6	25	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	2021-12-02 13:36:33.4865	2021-12-02 13:36:33.4865	\N	3	2
1455	2	8101	11	65	31	\N	0.5	0	USD	\N	4	5	1	6	19	\N	3	\N	\N	0	USD	0	USD	0.1	\N	1	2	\N	909.0	\N	\N	\N	2021-12-02 13:36:33.515054	2021-12-02 13:36:33.515054	\N	3	2
1456	2	9001	12	66	1	\N	1.2	10000	USD	\N	47	1	21	72	26	\N	3	\N	\N	0	USD	800	USD	0.3	\N	1	2	\N	2326.0	\N	\N	\N	2021-12-02 13:36:33.550562	2021-12-02 13:36:33.550562	\N	3	2
1457	2	9002	12	66	3	\N	1.2	800	USD	\N	47	3	21	72	27	\N	3	\N	\N	0	USD	800	USD	0.3	\N	2	2	\N	2326.0	\N	\N	\N	2021-12-02 13:36:33.579179	2021-12-02 13:36:33.579179	\N	3	2
1458	2	9003	12	66	32	\N	1.2	800	USD	\N	47	6	9	72	28	\N	3	\N	\N	0	USD	800	USD	0.3	\N	3	2	\N	2326.0	\N	\N	\N	2021-12-02 13:36:33.607667	2021-12-02 13:36:33.607667	\N	3	2
1459	2	9004	12	66	7	\N	1.2	800	USD	\N	47	8	9	72	29	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 13:36:33.636748	2021-12-02 13:36:33.636748	\N	3	2
1460	2	9005	12	66	33	\N	1.2	800	USD	\N	47	10	9	72	30	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 13:36:33.66615	2021-12-02 13:36:33.66615	\N	3	2
1461	2	9006	12	66	34	\N	1.2	800	USD	\N	47	11	9	72	31	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 13:36:33.695883	2021-12-02 13:36:33.695883	\N	3	2
1462	2	9007	12	66	5	\N	1.2	800	USD	\N	47	5	9	72	32	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 13:36:33.760315	2021-12-02 13:36:33.760315	\N	3	2
1463	2	9008	12	66	35	\N	1.2	800	USD	\N	47	20	5	72	33	\N	3	\N	\N	0	USD	800	USD	0.3	\N	4	2	\N	2326.0	\N	\N	\N	2021-12-02 13:36:33.789924	2021-12-02 13:36:33.789924	\N	3	2
1464	2	9009	12	67	1	\N	1.2	10000	USD	\N	48	1	9	73	26	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 13:36:33.819497	2021-12-02 13:36:33.819497	\N	3	2
1465	2	9010	12	67	2	\N	1.2	3000	USD	\N	48	2	9	73	34	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 13:36:33.848582	2021-12-02 13:36:33.848582	\N	3	2
1466	2	9011	12	67	3	\N	1.2	3000	USD	\N	48	3	9	73	27	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 13:36:33.877611	2021-12-02 13:36:33.877611	\N	3	2
1467	2	9012	12	67	7	\N	1.2	800	USD	\N	48	8	7	73	29	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 13:36:33.906398	2021-12-02 13:36:33.906398	\N	3	2
1468	2	9013	12	67	5	\N	1.2	0	USD	\N	48	5	2	73	32	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 13:36:33.935002	2021-12-02 13:36:33.935002	\N	3	2
1469	2	9014	12	67	36	\N	1.2	200	USD	\N	48	7	9	73	35	\N	3	\N	\N	0	USD	600	USD	0.5	\N	1	2	\N	6970.0	\N	\N	\N	2021-12-02 13:36:33.963935	2021-12-02 13:36:33.963935	\N	3	2
1470	2	9015	12	68	1	\N	1.2	8000	USD	\N	49	1	9	74	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:33.992454	2021-12-02 13:36:33.992454	\N	3	2
1471	2	9016	12	68	2	\N	1.2	1000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.020612	2021-12-02 13:36:34.020612	\N	4	2
1472	2	9017	12	68	2	\N	1.2	2000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.04911	2021-12-02 13:36:34.04911	\N	5	2
1473	2	9018	12	68	2	\N	1.2	3000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.078586	2021-12-02 13:36:34.078586	\N	6	2
1474	2	9019	12	68	2	\N	1.2	4000	USD	\N	49	2	9	74	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.107578	2021-12-02 13:36:34.107578	\N	7	2
1475	2	9020	12	68	7	\N	1.2	800	USD	\N	49	8	9	74	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	2021-12-02 13:36:34.141766	2021-12-02 13:36:34.141766	\N	3	2
1476	2	9021	12	69	2	\N	1.2	800	USD	\N	21	2	9	75	34	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	2021-12-02 13:36:34.170269	2021-12-02 13:36:34.170269	\N	3	2
1477	2	9022	12	70	1	\N	1.2	8000	USD	\N	50	1	9	76	26	\N	3	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.198786	2021-12-02 13:36:34.198786	\N	3	2
1478	2	9023	12	70	2	\N	1.2	1000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	1000	USD	0.5	\N	1	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.22806	2021-12-02 13:36:34.22806	\N	4	2
1479	2	9024	12	70	2	\N	1.2	2000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	2000	USD	0.5	\N	2	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.257629	2021-12-02 13:36:34.257629	\N	5	2
1480	2	9025	12	70	2	\N	1.2	3000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	3000	USD	0.5	\N	3	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.286267	2021-12-02 13:36:34.286267	\N	6	2
1481	2	9026	12	70	2	\N	1.2	4000	USD	\N	50	2	9	76	34	\N	2	\N	\N	0	USD	4460	USD	0.5	\N	5	2	\N	5722.0	\N	\N	\N	2021-12-02 13:36:34.314053	2021-12-02 13:36:34.314053	\N	7	2
1482	2	9027	12	70	7	\N	1.2	800	USD	\N	50	8	9	76	29	\N	3	\N	\N	0	USD	0	USD	0.1	\N	8	2	\N	5731.0	\N	\N	\N	2021-12-02 13:36:34.342158	2021-12-02 13:36:34.342158	\N	3	2
1483	2	9028	12	71	1	\N	1	6500	USD	\N	51	1	9	77	26	\N	3	\N	\N	0	USD	5000	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	2021-12-02 13:36:34.370152	2021-12-02 13:36:34.370152	\N	3	2
1484	2	9029	12	71	33	\N	1	300	USD	\N	51	10	1	77	30	\N	3	\N	\N	0	USD	0	USD	0.9	\N	1	2	\N	5221.0	\N	\N	\N	2021-12-02 13:36:34.397614	2021-12-02 13:36:34.397614	\N	3	2
1485	2	9030	12	71	5	\N	0.5	300	USD	\N	51	5	2	77	32	\N	3	\N	\N	0	USD	0	USD	0.1	\N	5	2	\N	5281.0	\N	\N	\N	2021-12-02 13:36:34.425107	2021-12-02 13:36:34.425107	\N	3	2
1486	2	9031	12	72	1	\N	1	6500	USD	\N	19	1	9	78	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	2021-12-02 13:36:34.453182	2021-12-02 13:36:34.453182	\N	3	2
1487	2	9032	12	72	5	\N	0.5	300	USD	\N	19	5	9	78	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	5	2	\N	5222.0	\N	\N	\N	2021-12-02 13:36:34.48073	2021-12-02 13:36:34.48073	\N	3	2
1488	2	9033	12	73	32	\N	1.4	1920	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.508241	2021-12-02 13:36:34.508241	\N	4	17
1489	2	9034	12	73	32	\N	1.5	2160	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	2021-12-02 13:36:34.5352	2021-12-02 13:36:34.5352	\N	2	5
1490	2	9035	12	73	32	\N	1.6	2400	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	2021-12-02 13:36:34.562376	2021-12-02 13:36:34.562376	\N	8	6
1491	2	9036	12	73	32	\N	1.8	2880	USD	\N	52	6	9	79	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	2021-12-02 13:36:34.588939	2021-12-02 13:36:34.588939	\N	5	8
1492	2	9037	12	73	7	\N	1.2	800	USD	\N	52	8	9	79	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.615612	2021-12-02 13:36:34.615612	\N	3	2
1493	2	9038	12	73	37	\N	1.5	2800	USD	\N	52	21	9	79	36	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.683234	2021-12-02 13:36:34.683234	\N	3	2
1494	2	9039	12	73	5	\N	1	0	USD	\N	52	5	2	79	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.710913	2021-12-02 13:36:34.710913	\N	3	2
1495	2	9040	12	74	38	\N	0.5	1000	USD	\N	53	22	1	80	37	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.738568	2021-12-02 13:36:34.738568	\N	3	2
1496	2	9041	12	75	39	\N	1.5	1200	USD	\N	54	23	19	81	38	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.76646	2021-12-02 13:36:34.76646	\N	3	2
1497	2	9042	12	75	32	\N	1.4	1920	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	1900	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.793068	2021-12-02 13:36:34.793068	\N	4	17
1498	2	9043	12	75	32	\N	1.5	2160	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	2500	USD	1	\N	1	2	\N	3312.0	\N	\N	\N	2021-12-02 13:36:34.820369	2021-12-02 13:36:34.820369	\N	2	5
1499	2	9044	12	75	32	\N	1.6	2400	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3000	USD	1.1	\N	1	2	\N	3313.0	\N	\N	\N	2021-12-02 13:36:34.848212	2021-12-02 13:36:34.848212	\N	8	6
1500	2	9045	12	75	32	\N	1.8	2880	USD	\N	54	6	9	81	28	\N	2	\N	\N	0	USD	3500	USD	1.4	\N	1	2	\N	3314.0	\N	\N	\N	2021-12-02 13:36:34.875389	2021-12-02 13:36:34.875389	\N	5	8
1501	2	9046	12	75	7	\N	1.2	800	USD	\N	54	8	22	81	29	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.903462	2021-12-02 13:36:34.903462	\N	3	2
1502	2	9047	12	75	40	\N	1.2	800	USD	\N	54	18	19	81	39	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.931453	2021-12-02 13:36:34.931453	\N	3	2
1503	2	9048	12	75	5	\N	1	0	USD	\N	54	5	2	81	32	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.958764	2021-12-02 13:36:34.958764	\N	3	2
1504	2	9049	12	75	36	\N	1	600	USD	\N	54	7	3	81	35	\N	3	\N	\N	0	USD	500	USD	0.8	\N	1	2	\N	3311.0	\N	\N	\N	2021-12-02 13:36:34.985533	2021-12-02 13:36:34.985533	\N	3	2
1505	2	9050	12	76	32	\N	1	600	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	1900	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	2021-12-02 13:36:35.012045	2021-12-02 13:36:35.012045	\N	3	6
1506	2	9051	12	76	32	\N	1.4	1920	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	2400	USD	0.9	\N	1	2	\N	6502.0	\N	\N	\N	2021-12-02 13:36:35.038948	2021-12-02 13:36:35.038948	\N	4	17
1507	2	9052	12	76	32	\N	1.5	2160	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	3500	USD	1.3	\N	1	2	\N	6511.0	\N	\N	\N	2021-12-02 13:36:35.066876	2021-12-02 13:36:35.066876	\N	2	5
1508	2	9053	12	76	32	\N	1.6	2400	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	5500	USD	1.7	\N	1	2	\N	6512.0	\N	\N	\N	2021-12-02 13:36:35.094847	2021-12-02 13:36:35.094847	\N	8	6
1509	2	9054	12	76	32	\N	1.8	2880	USD	\N	4	6	9	82	28	\N	2	\N	\N	0	USD	7500	USD	2.1	\N	1	2	\N	6513.0	\N	\N	\N	2021-12-02 13:36:35.122501	2021-12-02 13:36:35.122501	\N	5	8
1510	2	9055	12	76	40	\N	1.2	800	USD	\N	4	18	19	82	39	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	2021-12-02 13:36:35.149989	2021-12-02 13:36:35.149989	\N	3	2
1511	2	9056	12	76	5	\N	1	0	USD	\N	4	5	2	82	32	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	2021-12-02 13:36:35.177311	2021-12-02 13:36:35.177311	\N	3	2
1512	2	9057	12	76	36	\N	1	600	USD	\N	4	7	3	82	35	\N	3	\N	\N	0	USD	500	USD	0.4	\N	1	2	\N	6501.0	\N	\N	\N	2021-12-02 13:36:35.210706	2021-12-02 13:36:35.210706	\N	3	2
1513	2	9058	12	77	1	\N	3	21000	USD	\N	55	1	9	83	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	2021-12-02 13:36:35.238389	2021-12-02 13:36:35.238389	\N	51	23
1514	2	9059	12	77	2	\N	1	3000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	2021-12-02 13:36:35.26676	2021-12-02 13:36:35.26676	\N	4	23
1515	2	9060	12	77	2	\N	2	6000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.293801	2021-12-02 13:36:35.293801	\N	5	23
1516	2	9061	12	77	2	\N	3	9000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.321473	2021-12-02 13:36:35.321473	\N	6	23
1517	2	9062	12	77	2	\N	3.5	12000	USD	\N	55	2	9	83	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.349164	2021-12-02 13:36:35.349164	\N	7	23
1518	2	9063	12	77	5	\N	1	0	USD	\N	55	5	2	83	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.376574	2021-12-02 13:36:35.376574	\N	3	2
1519	2	9064	12	77	41	\N	1	600	USD	\N	55	4	3	83	40	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.407481	2021-12-02 13:36:35.407481	\N	3	2
1520	2	9065	12	77	36	\N	0.5	300	USD	\N	55	7	3	83	35	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.436717	2021-12-02 13:36:35.436717	\N	3	2
1521	2	9066	12	78	1	\N	3	21000	USD	\N	56	1	3	84	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	2021-12-02 13:36:35.464716	2021-12-02 13:36:35.464716	\N	51	23
1522	2	9067	12	78	2	\N	1	3000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	2021-12-02 13:36:35.492197	2021-12-02 13:36:35.492197	\N	4	23
1523	2	9068	12	78	2	\N	2	6000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.519864	2021-12-02 13:36:35.519864	\N	5	23
1524	2	9069	12	78	2	\N	3	9000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.547353	2021-12-02 13:36:35.547353	\N	6	23
1525	2	9070	12	78	2	\N	3.5	12000	USD	\N	56	2	9	84	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.609673	2021-12-02 13:36:35.609673	\N	7	23
1526	2	9071	12	78	7	\N	1.2	800	USD	\N	56	8	5	84	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.637328	2021-12-02 13:36:35.637328	\N	3	2
1527	2	9072	12	78	5	\N	1	0	USD	\N	56	5	5	84	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.665375	2021-12-02 13:36:35.665375	\N	3	2
1528	2	9073	12	78	35	\N	1	600	USD	\N	56	20	9	84	33	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.693168	2021-12-02 13:36:35.693168	\N	3	2
1529	2	9074	12	79	1	\N	3	21000	USD	\N	57	1	9	85	26	\N	2	\N	\N	0	USD	22080	USD	2.3	\N	1	2	\N	6243.0	\N	\N	\N	2021-12-02 13:36:35.720817	2021-12-02 13:36:35.720817	\N	51	23
1530	2	9075	12	79	2	\N	1	3000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	10080	USD	1.6	\N	1	2	\N	6241.0	\N	\N	\N	2021-12-02 13:36:35.755054	2021-12-02 13:36:35.755054	\N	4	23
1531	2	9076	12	79	2	\N	2	6000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.78282	2021-12-02 13:36:35.78282	\N	5	23
1532	2	9077	12	79	2	\N	3	9000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.811108	2021-12-02 13:36:35.811108	\N	6	23
1533	2	9078	12	79	2	\N	3.5	12000	USD	\N	57	2	9	85	34	\N	2	\N	\N	0	USD	17280	USD	2	\N	1	2	\N	6242.0	\N	\N	\N	2021-12-02 13:36:35.838999	2021-12-02 13:36:35.838999	\N	7	23
1534	2	9079	12	79	7	\N	1.2	800	USD	\N	57	8	9	85	29	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.867517	2021-12-02 13:36:35.867517	\N	3	2
1535	2	9080	12	79	5	\N	1	0	USD	\N	57	5	2	85	32	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.895202	2021-12-02 13:36:35.895202	\N	3	2
1536	2	9081	12	79	42	\N	1	600	USD	\N	57	4	9	85	41	\N	3	\N	\N	0	USD	0	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.922768	2021-12-02 13:36:35.922768	\N	3	2
1537	2	9082	12	79	36	\N	0.5	300	USD	\N	57	7	9	85	35	\N	3	\N	\N	0	USD	500	USD	0.5	\N	2	2	\N	6281.0	\N	\N	\N	2021-12-02 13:36:35.950787	2021-12-02 13:36:35.950787	\N	3	2
1538	2	9083	12	80	1	\N	1	5000	USD	\N	58	1	9	86	26	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	2021-12-02 13:36:35.978515	2021-12-02 13:36:35.978515	\N	3	2
1539	2	9084	12	80	7	\N	0.5	500	USD	\N	58	8	9	86	29	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	2021-12-02 13:36:36.005731	2021-12-02 13:36:36.005731	\N	3	2
1540	2	9085	12	80	5	\N	0.5	0	USD	\N	58	5	9	86	32	\N	3	\N	\N	0	USD	1200	USD	0.1	\N	1	2	\N	3920.0	\N	\N	\N	2021-12-02 13:36:36.033191	2021-12-02 13:36:36.033191	\N	3	2
1541	2	9086	12	81	1	\N	1	5000	USD	\N	59	1	9	87	26	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	2021-12-02 13:36:36.059894	2021-12-02 13:36:36.059894	\N	3	2
1542	2	9087	12	81	33	\N	0.5	500	USD	\N	59	10	1	87	30	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	2021-12-02 13:36:36.086632	2021-12-02 13:36:36.086632	\N	3	2
1543	2	9088	12	81	5	\N	0.5	0	USD	\N	59	5	2	87	32	\N	3	\N	\N	0	USD	0	USD	0.2	\N	2	2	\N	2424.0	\N	\N	\N	2021-12-02 13:36:36.113967	2021-12-02 13:36:36.113967	\N	3	2
\.


--
-- Data for Name: repair_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repair_lists (id, name, is_active, created_at, updated_at) FROM stdin;
2	Version 2	f	2021-12-02 13:35:47.757863	2021-12-03 07:10:49.434796
1	Version 1	t	2021-12-02 12:49:12.307949	2021-12-03 07:10:49.439118
\.


--
-- Data for Name: repair_modes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repair_modes (id, name, created_at, updated_at) FROM stdin;
1	3.0	2021-12-02 12:49:11.169281	2021-12-02 12:49:11.169281
2	2.0	2021-12-02 12:49:11.173496	2021-12-02 12:49:11.173496
\.


--
-- Data for Name: repair_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repair_types (id, name, created_at, updated_at) FROM stdin;
1	REPLACE	2021-12-02 12:49:09.404627	2021-12-02 12:49:09.404627
2	SECTION	2021-12-02 12:49:09.408788	2021-12-02 12:49:09.408788
3	INSERT	2021-12-02 12:49:09.412557	2021-12-02 12:49:09.412557
4	STRAIGHTEN AND WELD OR WELD	2021-12-02 12:49:09.416229	2021-12-02 12:49:09.416229
5	STRAIGHTEN	2021-12-02 12:49:09.419813	2021-12-02 12:49:09.419813
6	INSERT / PATCH	2021-12-02 12:49:09.423566	2021-12-02 12:49:09.423566
7	RESECURE	2021-12-02 12:49:09.42725	2021-12-02 12:49:09.42725
8	FASTEN	2021-12-02 12:49:09.430898	2021-12-02 12:49:09.430898
9	FREE UP	2021-12-02 12:49:09.434524	2021-12-02 12:49:09.434524
10	REMOVE & REFIT	2021-12-02 12:49:09.438142	2021-12-02 12:49:09.438142
11	REFASTEN (REEFER)	2021-12-02 12:49:09.454058	2021-12-02 12:49:09.454058
12	SECTION/REPLACE	2021-12-02 12:49:09.45906	2021-12-02 12:49:09.45906
13	SEAL/RESEAL	2021-12-02 12:49:09.46265	2021-12-02 12:49:09.46265
14	GRIND/SANDING	2021-12-02 12:49:09.466233	2021-12-02 12:49:09.466233
15	REMOVE	2021-12-02 12:49:09.469908	2021-12-02 12:49:09.469908
16	TAKE OFF / REMOVE	2021-12-02 12:49:09.473722	2021-12-02 12:49:09.473722
17	LABELS/MARKINGS (DANGEROUS GOODS)	2021-12-02 12:49:09.477614	2021-12-02 12:49:09.477614
18	LABELS/MARKINGS (CARGO LABELS)	2021-12-02 12:49:09.48157	2021-12-02 12:49:09.48157
19	SWEEPING	2021-12-02 12:49:09.485481	2021-12-02 12:49:09.485481
20	WASHING	2021-12-02 12:49:09.489308	2021-12-02 12:49:09.489308
21	SPECIAL CLEANING (CHEMICAL)	2021-12-02 12:49:09.492945	2021-12-02 12:49:09.492945
22	SPECIAL CLEANING (DEODORIZE)	2021-12-02 12:49:09.496687	2021-12-02 12:49:09.496687
23	UPGRADE	2021-12-02 12:49:09.50036	2021-12-02 12:49:09.50036
24	FOREIGN / UNQUALIFIED LASHING DEVICES REMOVE	2021-12-02 12:49:09.504705	2021-12-02 12:49:09.504705
25	Fill and Paint	2021-12-02 12:49:09.508308	2021-12-02 12:49:09.508308
26	Paint	2021-12-02 12:49:09.511776	2021-12-02 12:49:09.511776
27	Brush and Paint	2021-12-02 12:49:09.515342	2021-12-02 12:49:09.515342
28	Ocean Clean Up - Paint Full Container	2021-12-02 12:49:09.518976	2021-12-02 12:49:09.518976
29	Ocean Clean Up - Apply Decals	2021-12-02 12:49:09.522825	2021-12-02 12:49:09.522825
30	Complete Inspection and Photograph Container	2021-12-02 12:49:09.526372	2021-12-02 12:49:09.526372
31	Quote or inspection fee	2021-12-02 12:49:09.529952	2021-12-02 12:49:09.529952
32	PATCH	2021-12-02 12:49:09.533581	2021-12-02 12:49:09.533581
33	REMOVE AND REFIT	2021-12-02 12:49:09.537299	2021-12-02 12:49:09.537299
34	SEAL	2021-12-02 12:49:09.540903	2021-12-02 12:49:09.540903
35	STRAIGHTEN AND RESECURE	2021-12-02 12:49:09.544424	2021-12-02 12:49:09.544424
36	WELD	2021-12-02 12:49:09.548128	2021-12-02 12:49:09.548128
37	PATCH & FOAM	2021-12-02 12:49:09.551807	2021-12-02 12:49:09.551807
38	FOAM	2021-12-02 12:49:09.555336	2021-12-02 12:49:09.555336
39	ABRADE AND PAINT	2021-12-02 12:49:09.558982	2021-12-02 12:49:09.558982
40	SURFACE PREPARATION AND PAINT	2021-12-02 12:49:09.562499	2021-12-02 12:49:09.562499
41	STRAIGHTEN AND WELD	2021-12-02 12:49:09.565991	2021-12-02 12:49:09.565991
42	STRAIGHTEN & WELD	2021-12-02 12:49:09.569615	2021-12-02 12:49:09.569615
\.


--
-- Data for Name: reps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reps (id, name, created_at, updated_at) FROM stdin;
1	RP	2021-12-02 12:49:10.732027	2021-12-02 12:49:10.732027
2	SN	2021-12-02 12:49:10.736348	2021-12-02 12:49:10.736348
3	IT	2021-12-02 12:49:10.740165	2021-12-02 12:49:10.740165
4	GW	2021-12-02 12:49:10.744006	2021-12-02 12:49:10.744006
5	GS	2021-12-02 12:49:10.747892	2021-12-02 12:49:10.747892
6	PT	2021-12-02 12:49:10.75171	2021-12-02 12:49:10.75171
7	WD	2021-12-02 12:49:10.755666	2021-12-02 12:49:10.755666
8	RE	2021-12-02 12:49:10.759567	2021-12-02 12:49:10.759567
9	FR	2021-12-02 12:49:10.763197	2021-12-02 12:49:10.763197
10	RR	2021-12-02 12:49:10.766813	2021-12-02 12:49:10.766813
11	SE	2021-12-02 12:49:10.770439	2021-12-02 12:49:10.770439
12	SD	2021-12-02 12:49:10.774109	2021-12-02 12:49:10.774109
13	RM	2021-12-02 12:49:10.777633	2021-12-02 12:49:10.777633
14	WP	2021-12-02 12:49:10.781423	2021-12-02 12:49:10.781423
15	WW	2021-12-02 12:49:10.785168	2021-12-02 12:49:10.785168
16	CC	2021-12-02 12:49:10.78942	2021-12-02 12:49:10.78942
17	DO	2021-12-02 12:49:10.793296	2021-12-02 12:49:10.793296
18	PS	2021-12-02 12:49:10.796993	2021-12-02 12:49:10.796993
19	FQ	2021-12-02 12:49:10.800712	2021-12-02 12:49:10.800712
20	RS	2021-12-02 12:49:10.804416	2021-12-02 12:49:10.804416
21	PX	2021-12-02 12:49:10.80797	2021-12-02 12:49:10.80797
22	FO	2021-12-02 12:49:10.811545	2021-12-02 12:49:10.811545
23	AB	2021-12-02 12:49:10.81515	2021-12-02 12:49:10.81515
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20210902082323
20210903094917
20210903102403
20210903111106
20210908115920
20210909155021
20210909155117
20210909155135
20210909155148
20210909155158
20210909155211
20210909155221
20210909155226
20210909155237
20210909155243
20210909155254
20210910105408
20210910105559
20210912224536
20210916021637
20210921030143
20210928101912
20210928101918
20210928101925
20210928114305
20210928114328
20211005180201
20211005180207
20211005180349
20211005181155
20211006142248
20211006142257
20211006145806
20211013110602
20211013112007
20211109153740
20211110032040
20211110035150
20211110162113
20211110165023
20211111113559
20211117041319
20211117041357
20211117082737
20211117123321
20211119073155
20211119122516
20211122052630
20211202105529
20211202105537
20211202110954
20211202114136
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (id, name, created_at, updated_at) FROM stdin;
1	FT	2021-12-02 12:49:09.06553	2021-12-02 12:49:09.06553
2	CM	2021-12-02 12:49:09.069797	2021-12-02 12:49:09.069797
3	EA	2021-12-02 12:49:09.073442	2021-12-02 12:49:09.073442
4	MC	2021-12-02 12:49:09.077263	2021-12-02 12:49:09.077263
\.


--
-- Data for Name: uploaded_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uploaded_files (id, attachment, user_type, user_id, created_at, updated_at) FROM stdin;
1	mlcan-1.jpeg	Admin	1	2021-12-02 13:15:12.05538	2021-12-02 13:15:12.05538
2	mlcan-8.jpeg	Admin	1	2021-12-02 13:15:17.117376	2021-12-02 13:15:17.117376
3	mlcan-7.jpeg	Admin	1	2021-12-02 13:15:18.597565	2021-12-02 13:15:18.597565
4	mlcan-6.jpeg	Admin	1	2021-12-02 13:15:20.56702	2021-12-02 13:15:20.56702
5	mlcan-5.jpeg	Admin	1	2021-12-02 13:15:22.925333	2021-12-02 13:15:22.925333
6	mlcan-4.jpeg	Admin	1	2021-12-02 13:15:25.981102	2021-12-02 13:15:25.981102
7	mlcan-3.jpeg	Admin	1	2021-12-02 13:15:30.163478	2021-12-02 13:15:30.163478
8	mlcan-2.jpeg	Admin	1	2021-12-02 13:15:31.098086	2021-12-02 13:15:31.098086
9	mlcan-7.jpeg	Admin	1	2021-12-02 13:23:07.130597	2021-12-02 13:23:07.130597
10	istockphoto-1136737448-170667a.jpg	Admin	1	2021-12-02 13:33:30.127328	2021-12-02 13:33:30.127328
11	Repair-list-version-1__10_.csv	Admin	1	2021-12-02 13:35:56.77398	2021-12-02 13:35:56.77398
12	Repair-list-version-1__10_.csv	Admin	1	2021-12-02 13:37:11.368434	2021-12-02 13:37:11.368434
13	Customer-repair-list-version-1_-_Customer-repair-list-version-1.csv	Admin	1	2021-12-02 14:21:00.343038	2021-12-02 14:21:00.343038
14	mlcan-1.jpeg	Admin	1	2021-12-02 14:28:12.293464	2021-12-02 14:28:12.293464
15	mlcan-2.jpeg	Admin	1	2021-12-02 14:28:18.209242	2021-12-02 14:28:18.209242
16	mlcan-3.jpeg	Admin	1	2021-12-02 14:28:21.569441	2021-12-02 14:28:21.569441
17	mlcan-4.jpeg	Admin	1	2021-12-02 14:28:26.649343	2021-12-02 14:28:26.649343
18	mlcan-5.jpeg	Admin	1	2021-12-02 14:28:34.986965	2021-12-02 14:28:34.986965
19	mlcan-6.jpeg	Admin	1	2021-12-02 14:28:38.413757	2021-12-02 14:28:38.413757
20	mlcan-7.jpeg	Admin	1	2021-12-02 14:28:41.836022	2021-12-02 14:28:41.836022
21	mlcan-8.jpeg	Admin	1	2021-12-02 14:28:47.342796	2021-12-02 14:28:47.342796
22	mlcan-5.jpeg	Admin	1	2021-12-02 14:40:33.373406	2021-12-02 14:40:33.373406
23	Repair-list-version-1__5_.csv	Admin	1	2021-12-03 07:09:26.001693	2021-12-03 07:09:26.001693
24	Repair-list-version-1__5_.csv	Admin	1	2021-12-03 07:09:35.847426	2021-12-03 07:09:35.847426
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, first_name, last_name, phone_number) FROM stdin;
\.


--
-- Data for Name: widths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.widths (id, name, created_at, updated_at) FROM stdin;
1	8.0	2021-12-02 12:49:09.309348	2021-12-02 12:49:09.309348
2	1.0	2021-12-02 12:49:09.313361	2021-12-02 12:49:09.313361
3	10.0	2021-12-02 12:49:09.317083	2021-12-02 12:49:09.317083
4	20.0	2021-12-02 12:49:09.320694	2021-12-02 12:49:09.320694
5	240.0	2021-12-02 12:49:09.32419	2021-12-02 12:49:09.32419
6	45.0	2021-12-02 12:49:09.327793	2021-12-02 12:49:09.327793
7	55.0	2021-12-02 12:49:09.332303	2021-12-02 12:49:09.332303
8	60.0	2021-12-02 12:49:09.335913	2021-12-02 12:49:09.335913
9	65.0	2021-12-02 12:49:09.339499	2021-12-02 12:49:09.339499
10	80.0	2021-12-02 12:49:09.345279	2021-12-02 12:49:09.345279
11	90.0	2021-12-02 12:49:09.348923	2021-12-02 12:49:09.348923
12	100.0	2021-12-02 12:49:09.352446	2021-12-02 12:49:09.352446
13	120.0	2021-12-02 12:49:09.356023	2021-12-02 12:49:09.356023
14	140.0	2021-12-02 12:49:09.359814	2021-12-02 12:49:09.359814
15	170.0	2021-12-02 12:49:09.363369	2021-12-02 12:49:09.363369
16	200.0	2021-12-02 12:49:09.366956	2021-12-02 12:49:09.366956
17	300.0	2021-12-02 12:49:09.370503	2021-12-02 12:49:09.370503
18	400.0	2021-12-02 12:49:09.374126	2021-12-02 12:49:09.374126
19	3.0	2021-12-02 12:49:09.37769	2021-12-02 12:49:09.37769
20	4.0	2021-12-02 12:49:09.381319	2021-12-02 12:49:09.381319
21	5.0	2021-12-02 12:49:09.384919	2021-12-02 12:49:09.384919
22	6.0	2021-12-02 12:49:09.388431	2021-12-02 12:49:09.388431
23	32.0	2021-12-02 12:49:09.392068	2021-12-02 12:49:09.392068
\.


--
-- Data for Name: yards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yards (id, name, created_at, updated_at) FROM stdin;
1	Aheer	2021-12-02 12:49:11.509435	2021-12-02 12:49:11.509435
2	Harbourlink	2021-12-02 12:49:11.513592	2021-12-02 12:49:11.513592
3	Nordel	2021-12-02 12:49:11.517417	2021-12-02 12:49:11.517417
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_id_seq', 7, true);


--
-- Name: activity_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_attachments_id_seq', 1, false);


--
-- Name: activity_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_items_id_seq', 3, true);


--
-- Name: activity_timelines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_timelines_id_seq', 17, true);


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 5, true);


--
-- Name: components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_id_seq', 87, true);


--
-- Name: comps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comps_id_seq', 59, true);


--
-- Name: container_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_attachments_id_seq', 32, true);


--
-- Name: container_damaged_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_damaged_areas_id_seq', 81, true);


--
-- Name: container_heights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_heights_id_seq', 23, true);


--
-- Name: container_lengths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_lengths_id_seq', 51, true);


--
-- Name: container_repair_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_repair_areas_id_seq', 12, true);


--
-- Name: container_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.container_types_id_seq', 5, true);


--
-- Name: containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.containers_id_seq', 2, true);


--
-- Name: customer_repair_list_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_repair_list_items_id_seq', 3084, true);


--
-- Name: customer_repair_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_repair_lists_id_seq', 5, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 2, true);


--
-- Name: dams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dams_id_seq', 22, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 41, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 1, false);


--
-- Name: lengths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lengths_id_seq', 51, true);


--
-- Name: mode_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mode_numbers_id_seq', 1, false);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 15, true);


--
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 5, true);


--
-- Name: repair_list_item_uploads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repair_list_item_uploads_id_seq', 6, true);


--
-- Name: repair_list_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repair_list_items_id_seq', 1543, true);


--
-- Name: repair_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repair_lists_id_seq', 2, true);


--
-- Name: repair_modes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repair_modes_id_seq', 2, true);


--
-- Name: repair_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repair_types_id_seq', 42, true);


--
-- Name: reps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reps_id_seq', 23, true);


--
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_id_seq', 4, true);


--
-- Name: uploaded_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uploaded_files_id_seq', 24, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: widths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.widths_id_seq', 23, true);


--
-- Name: yards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yards_id_seq', 3, true);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: activity_attachments activity_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_attachments
    ADD CONSTRAINT activity_attachments_pkey PRIMARY KEY (id);


--
-- Name: activity_items activity_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_items
    ADD CONSTRAINT activity_items_pkey PRIMARY KEY (id);


--
-- Name: activity_timelines activity_timelines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_timelines
    ADD CONSTRAINT activity_timelines_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: components components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);


--
-- Name: comps comps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comps
    ADD CONSTRAINT comps_pkey PRIMARY KEY (id);


--
-- Name: container_attachments container_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_attachments
    ADD CONSTRAINT container_attachments_pkey PRIMARY KEY (id);


--
-- Name: container_damaged_areas container_damaged_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_damaged_areas
    ADD CONSTRAINT container_damaged_areas_pkey PRIMARY KEY (id);


--
-- Name: container_heights container_heights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_heights
    ADD CONSTRAINT container_heights_pkey PRIMARY KEY (id);


--
-- Name: container_lengths container_lengths_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_lengths
    ADD CONSTRAINT container_lengths_pkey PRIMARY KEY (id);


--
-- Name: container_repair_areas container_repair_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_repair_areas
    ADD CONSTRAINT container_repair_areas_pkey PRIMARY KEY (id);


--
-- Name: container_types container_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_types
    ADD CONSTRAINT container_types_pkey PRIMARY KEY (id);


--
-- Name: containers containers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers
    ADD CONSTRAINT containers_pkey PRIMARY KEY (id);


--
-- Name: customer_repair_list_items customer_repair_list_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT customer_repair_list_items_pkey PRIMARY KEY (id);


--
-- Name: customer_repair_lists customer_repair_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_lists
    ADD CONSTRAINT customer_repair_lists_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: dams dams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dams
    ADD CONSTRAINT dams_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: lengths lengths_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lengths
    ADD CONSTRAINT lengths_pkey PRIMARY KEY (id);


--
-- Name: mode_numbers mode_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mode_numbers
    ADD CONSTRAINT mode_numbers_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: repair_list_item_uploads repair_list_item_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_item_uploads
    ADD CONSTRAINT repair_list_item_uploads_pkey PRIMARY KEY (id);


--
-- Name: repair_list_items repair_list_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT repair_list_items_pkey PRIMARY KEY (id);


--
-- Name: repair_lists repair_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_lists
    ADD CONSTRAINT repair_lists_pkey PRIMARY KEY (id);


--
-- Name: repair_modes repair_modes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_modes
    ADD CONSTRAINT repair_modes_pkey PRIMARY KEY (id);


--
-- Name: repair_types repair_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_types
    ADD CONSTRAINT repair_types_pkey PRIMARY KEY (id);


--
-- Name: reps reps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reps
    ADD CONSTRAINT reps_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- Name: uploaded_files uploaded_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uploaded_files
    ADD CONSTRAINT uploaded_files_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: widths widths_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.widths
    ADD CONSTRAINT widths_pkey PRIMARY KEY (id);


--
-- Name: yards yards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yards
    ADD CONSTRAINT yards_pkey PRIMARY KEY (id);


--
-- Name: customer_repair_list_items_uid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX customer_repair_list_items_uid_index ON public.customer_repair_list_items USING btree (uid, customer_repair_list_id);


--
-- Name: index_activities_on_assigned_to_type_and_assigned_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activities_on_assigned_to_type_and_assigned_to_id ON public.activities USING btree (assigned_to_type, assigned_to_id);


--
-- Name: index_activities_on_container_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activities_on_container_id ON public.activities USING btree (container_id);


--
-- Name: index_activity_attachments_on_activity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_attachments_on_activity_id ON public.activity_attachments USING btree (activity_id);


--
-- Name: index_activity_items_on_activity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_activity_id ON public.activity_items USING btree (activity_id);


--
-- Name: index_activity_items_on_container_damaged_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_container_damaged_area_id ON public.activity_items USING btree (container_damaged_area_id);


--
-- Name: index_activity_items_on_container_repair_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_container_repair_area_id ON public.activity_items USING btree (container_repair_area_id);


--
-- Name: index_activity_items_on_damaged_area_image_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_damaged_area_image_id ON public.activity_items USING btree (damaged_area_image_id);


--
-- Name: index_activity_items_on_length_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_length_id ON public.activity_items USING btree (length_id);


--
-- Name: index_activity_items_on_repair_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_repair_type_id ON public.activity_items USING btree (repair_type_id);


--
-- Name: index_activity_items_on_repaired_area_image_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_repaired_area_image_id ON public.activity_items USING btree (repaired_area_image_id);


--
-- Name: index_activity_items_on_unit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_unit_id ON public.activity_items USING btree (unit_id);


--
-- Name: index_activity_items_on_width_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_items_on_width_id ON public.activity_items USING btree (width_id);


--
-- Name: index_activity_timelines_on_activity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_activity_timelines_on_activity_id ON public.activity_timelines USING btree (activity_id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- Name: index_cities_on_province_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_cities_on_province_id ON public.cities USING btree (province_id);


--
-- Name: index_container_attachments_on_attachment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_container_attachments_on_attachment_id ON public.container_attachments USING btree (attachment_id);


--
-- Name: index_container_attachments_on_container_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_container_attachments_on_container_id ON public.container_attachments USING btree (container_id);


--
-- Name: index_containers_on_container_height_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_containers_on_container_height_id ON public.containers USING btree (container_height_id);


--
-- Name: index_containers_on_container_length_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_containers_on_container_length_id ON public.containers USING btree (container_length_id);


--
-- Name: index_containers_on_container_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_containers_on_container_type_id ON public.containers USING btree (container_type_id);


--
-- Name: index_containers_on_container_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_containers_on_container_uid ON public.containers USING btree (container_uid);


--
-- Name: index_containers_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_containers_on_customer_id ON public.containers USING btree (customer_id);


--
-- Name: index_containers_on_yard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_containers_on_yard_id ON public.containers USING btree (yard_id);


--
-- Name: index_customer_repair_list_items_on_comp_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_comp_id ON public.customer_repair_list_items USING btree (comp_id);


--
-- Name: index_customer_repair_list_items_on_component_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_component_id ON public.customer_repair_list_items USING btree (component_id);


--
-- Name: index_customer_repair_list_items_on_container_damaged_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_container_damaged_area_id ON public.customer_repair_list_items USING btree (container_damaged_area_id);


--
-- Name: index_customer_repair_list_items_on_container_repair_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_container_repair_area_id ON public.customer_repair_list_items USING btree (container_repair_area_id);


--
-- Name: index_customer_repair_list_items_on_customer_repair_list_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_customer_repair_list_id ON public.customer_repair_list_items USING btree (customer_repair_list_id);


--
-- Name: index_customer_repair_list_items_on_dam_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_dam_id ON public.customer_repair_list_items USING btree (dam_id);


--
-- Name: index_customer_repair_list_items_on_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_event_id ON public.customer_repair_list_items USING btree (event_id);


--
-- Name: index_customer_repair_list_items_on_length_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_length_id ON public.customer_repair_list_items USING btree (length_id);


--
-- Name: index_customer_repair_list_items_on_mode_number_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_mode_number_id ON public.customer_repair_list_items USING btree (mode_number_id);


--
-- Name: index_customer_repair_list_items_on_rep_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_rep_id ON public.customer_repair_list_items USING btree (rep_id);


--
-- Name: index_customer_repair_list_items_on_repair_mode_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_repair_mode_id ON public.customer_repair_list_items USING btree (repair_mode_id);


--
-- Name: index_customer_repair_list_items_on_repair_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_repair_type_id ON public.customer_repair_list_items USING btree (repair_type_id);


--
-- Name: index_customer_repair_list_items_on_unit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_unit_id ON public.customer_repair_list_items USING btree (unit_id);


--
-- Name: index_customer_repair_list_items_on_width_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_list_items_on_width_id ON public.customer_repair_list_items USING btree (width_id);


--
-- Name: index_customer_repair_lists_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customer_repair_lists_on_customer_id ON public.customer_repair_lists USING btree (customer_id);


--
-- Name: index_customers_on_city_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customers_on_city_id ON public.customers USING btree (city_id);


--
-- Name: index_customers_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_customers_on_email ON public.customers USING btree (email);


--
-- Name: index_customers_on_province_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_customers_on_province_id ON public.customers USING btree (province_id);


--
-- Name: index_customers_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_customers_on_reset_password_token ON public.customers USING btree (reset_password_token);


--
-- Name: index_oauth_access_tokens_on_application_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_tokens_on_application_id ON public.oauth_access_tokens USING btree (application_id);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_repair_list_items_on_comp_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_comp_id ON public.repair_list_items USING btree (comp_id);


--
-- Name: index_repair_list_items_on_component_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_component_id ON public.repair_list_items USING btree (component_id);


--
-- Name: index_repair_list_items_on_container_damaged_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_container_damaged_area_id ON public.repair_list_items USING btree (container_damaged_area_id);


--
-- Name: index_repair_list_items_on_container_repair_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_container_repair_area_id ON public.repair_list_items USING btree (container_repair_area_id);


--
-- Name: index_repair_list_items_on_dam_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_dam_id ON public.repair_list_items USING btree (dam_id);


--
-- Name: index_repair_list_items_on_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_event_id ON public.repair_list_items USING btree (event_id);


--
-- Name: index_repair_list_items_on_length_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_length_id ON public.repair_list_items USING btree (length_id);


--
-- Name: index_repair_list_items_on_mode_number_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_mode_number_id ON public.repair_list_items USING btree (mode_number_id);


--
-- Name: index_repair_list_items_on_rep_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_rep_id ON public.repair_list_items USING btree (rep_id);


--
-- Name: index_repair_list_items_on_repair_list_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_repair_list_id ON public.repair_list_items USING btree (repair_list_id);


--
-- Name: index_repair_list_items_on_repair_mode_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_repair_mode_id ON public.repair_list_items USING btree (repair_mode_id);


--
-- Name: index_repair_list_items_on_repair_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_repair_type_id ON public.repair_list_items USING btree (repair_type_id);


--
-- Name: index_repair_list_items_on_uid_and_repair_list_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_repair_list_items_on_uid_and_repair_list_id ON public.repair_list_items USING btree (uid, repair_list_id);


--
-- Name: index_repair_list_items_on_unit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_unit_id ON public.repair_list_items USING btree (unit_id);


--
-- Name: index_repair_list_items_on_width_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repair_list_items_on_width_id ON public.repair_list_items USING btree (width_id);


--
-- Name: index_uploaded_files_on_user_type_and_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_uploaded_files_on_user_type_and_user_id ON public.uploaded_files USING btree (user_type, user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: customer_repair_list_items fk_rails_013fa69edf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_013fa69edf FOREIGN KEY (repair_mode_id) REFERENCES public.repair_modes(id);


--
-- Name: customer_repair_list_items fk_rails_052cecb15a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_052cecb15a FOREIGN KEY (length_id) REFERENCES public.lengths(id);


--
-- Name: customer_repair_list_items fk_rails_189db54bcc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_189db54bcc FOREIGN KEY (unit_id) REFERENCES public.units(id);


--
-- Name: customer_repair_list_items fk_rails_1ba606e327; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_1ba606e327 FOREIGN KEY (rep_id) REFERENCES public.reps(id);


--
-- Name: repair_list_items fk_rails_1cdb461e8e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_1cdb461e8e FOREIGN KEY (rep_id) REFERENCES public.reps(id);


--
-- Name: repair_list_items fk_rails_1f667c81b3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_1f667c81b3 FOREIGN KEY (repair_list_id) REFERENCES public.repair_lists(id);


--
-- Name: repair_list_items fk_rails_254899aae6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_254899aae6 FOREIGN KEY (unit_id) REFERENCES public.units(id);


--
-- Name: customer_repair_list_items fk_rails_30c912b0c3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_30c912b0c3 FOREIGN KEY (component_id) REFERENCES public.components(id);


--
-- Name: repair_list_items fk_rails_37ae3774ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_37ae3774ff FOREIGN KEY (container_repair_area_id) REFERENCES public.container_repair_areas(id);


--
-- Name: repair_list_items fk_rails_3c33b1b3e6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_3c33b1b3e6 FOREIGN KEY (repair_mode_id) REFERENCES public.repair_modes(id);


--
-- Name: customer_repair_list_items fk_rails_3f1c040a6c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_3f1c040a6c FOREIGN KEY (dam_id) REFERENCES public.dams(id);


--
-- Name: customer_repair_list_items fk_rails_4006221c41; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_4006221c41 FOREIGN KEY (customer_repair_list_id) REFERENCES public.customer_repair_lists(id);


--
-- Name: repair_list_items fk_rails_57a5ed3b3f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_57a5ed3b3f FOREIGN KEY (comp_id) REFERENCES public.comps(id);


--
-- Name: repair_list_items fk_rails_65f5a2e920; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_65f5a2e920 FOREIGN KEY (dam_id) REFERENCES public.dams(id);


--
-- Name: customer_repair_list_items fk_rails_6f577ea925; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_6f577ea925 FOREIGN KEY (container_damaged_area_id) REFERENCES public.container_damaged_areas(id);


--
-- Name: container_attachments fk_rails_71c4d91713; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_attachments
    ADD CONSTRAINT fk_rails_71c4d91713 FOREIGN KEY (attachment_id) REFERENCES public.uploaded_files(id);


--
-- Name: container_attachments fk_rails_78aeb03edc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.container_attachments
    ADD CONSTRAINT fk_rails_78aeb03edc FOREIGN KEY (container_id) REFERENCES public.containers(id);


--
-- Name: activity_items fk_rails_7a9518d2ef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_items
    ADD CONSTRAINT fk_rails_7a9518d2ef FOREIGN KEY (unit_id) REFERENCES public.units(id);


--
-- Name: activity_timelines fk_rails_818d267e46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_timelines
    ADD CONSTRAINT fk_rails_818d267e46 FOREIGN KEY (activity_id) REFERENCES public.activities(id);


--
-- Name: customers fk_rails_82ab4c2287; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_rails_82ab4c2287 FOREIGN KEY (province_id) REFERENCES public.provinces(id);


--
-- Name: containers fk_rails_8310338f7a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers
    ADD CONSTRAINT fk_rails_8310338f7a FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: repair_list_items fk_rails_908b69fd6a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_908b69fd6a FOREIGN KEY (mode_number_id) REFERENCES public.mode_numbers(id);


--
-- Name: repair_list_items fk_rails_90f8c20e2e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_90f8c20e2e FOREIGN KEY (container_damaged_area_id) REFERENCES public.container_damaged_areas(id);


--
-- Name: customer_repair_lists fk_rails_9438471705; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_lists
    ADD CONSTRAINT fk_rails_9438471705 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: repair_list_items fk_rails_9674175fee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_9674175fee FOREIGN KEY (repair_type_id) REFERENCES public.repair_types(id);


--
-- Name: activity_items fk_rails_975580688e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_items
    ADD CONSTRAINT fk_rails_975580688e FOREIGN KEY (width_id) REFERENCES public.widths(id);


--
-- Name: customer_repair_list_items fk_rails_9cc81ac75a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_9cc81ac75a FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: customer_repair_list_items fk_rails_9db6dfbcc8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_9db6dfbcc8 FOREIGN KEY (comp_id) REFERENCES public.comps(id);


--
-- Name: customer_repair_list_items fk_rails_a1dd101496; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_a1dd101496 FOREIGN KEY (width_id) REFERENCES public.widths(id);


--
-- Name: repair_list_items fk_rails_a68597d0da; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_a68597d0da FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: activity_items fk_rails_a74b0a0bf9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_items
    ADD CONSTRAINT fk_rails_a74b0a0bf9 FOREIGN KEY (repaired_area_image_id) REFERENCES public.uploaded_files(id);


--
-- Name: customer_repair_list_items fk_rails_b4c0711862; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_b4c0711862 FOREIGN KEY (repair_type_id) REFERENCES public.repair_types(id);


--
-- Name: activity_items fk_rails_c0513e1c2a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_items
    ADD CONSTRAINT fk_rails_c0513e1c2a FOREIGN KEY (damaged_area_image_id) REFERENCES public.uploaded_files(id);


--
-- Name: containers fk_rails_c938d9dc4a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers
    ADD CONSTRAINT fk_rails_c938d9dc4a FOREIGN KEY (container_length_id) REFERENCES public.container_lengths(id);


--
-- Name: repair_list_items fk_rails_d15698b6cf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_d15698b6cf FOREIGN KEY (length_id) REFERENCES public.lengths(id);


--
-- Name: activity_items fk_rails_de99b42852; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_items
    ADD CONSTRAINT fk_rails_de99b42852 FOREIGN KEY (length_id) REFERENCES public.lengths(id);


--
-- Name: repair_list_items fk_rails_e3889833b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_e3889833b0 FOREIGN KEY (width_id) REFERENCES public.widths(id);


--
-- Name: customer_repair_list_items fk_rails_e79160bf66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_e79160bf66 FOREIGN KEY (container_repair_area_id) REFERENCES public.container_repair_areas(id);


--
-- Name: cities fk_rails_ea36d40e0b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_rails_ea36d40e0b FOREIGN KEY (province_id) REFERENCES public.provinces(id);


--
-- Name: containers fk_rails_eb8e6a2745; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers
    ADD CONSTRAINT fk_rails_eb8e6a2745 FOREIGN KEY (yard_id) REFERENCES public.yards(id);


--
-- Name: containers fk_rails_f4056da32b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.containers
    ADD CONSTRAINT fk_rails_f4056da32b FOREIGN KEY (container_height_id) REFERENCES public.container_heights(id);


--
-- Name: customers fk_rails_f7e48962e3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_rails_f7e48962e3 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: repair_list_items fk_rails_f847a77b44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_list_items
    ADD CONSTRAINT fk_rails_f847a77b44 FOREIGN KEY (component_id) REFERENCES public.components(id);


--
-- Name: customer_repair_list_items fk_rails_fca6ecaadb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_repair_list_items
    ADD CONSTRAINT fk_rails_fca6ecaadb FOREIGN KEY (mode_number_id) REFERENCES public.mode_numbers(id);


--
-- PostgreSQL database dump complete
--

