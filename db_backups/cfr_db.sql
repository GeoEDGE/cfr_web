--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-19 14:32:43 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 181676)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 204 (class 1259 OID 183083)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 183081)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 206 (class 1259 OID 183093)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 183091)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 202 (class 1259 OID 183073)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 183071)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 208 (class 1259 OID 183103)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    province_id integer,
    district_id integer,
    ds_id integer,
    gn_id integer
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 183113)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 183111)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 207 (class 1259 OID 183101)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 212 (class 1259 OID 183123)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 183121)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 249 (class 1259 OID 245628)
-- Name: corsheaders_corsmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE corsheaders_corsmodel (
    id integer NOT NULL,
    cors character varying(255) NOT NULL
);


ALTER TABLE corsheaders_corsmodel OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 245626)
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE corsheaders_corsmodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corsheaders_corsmodel_id_seq OWNER TO postgres;

--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 248
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE corsheaders_corsmodel_id_seq OWNED BY corsheaders_corsmodel.id;


--
-- TOC entry 229 (class 1259 OID 188347)
-- Name: disaster_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE disaster_type (
    id integer NOT NULL,
    english character varying(1000),
    sinhala character varying(1000),
    tamil character varying(1000)
);


ALTER TABLE disaster_type OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 188345)
-- Name: disaster_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disaster_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE disaster_type_id_seq OWNER TO postgres;

--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 228
-- Name: disaster_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disaster_type_id_seq OWNED BY disaster_type.id;


--
-- TOC entry 237 (class 1259 OID 188386)
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE district (
    id integer NOT NULL,
    name character varying(255),
    province_id integer
);


ALTER TABLE district OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 188384)
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE district_id_seq OWNER TO postgres;

--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 236
-- Name: district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE district_id_seq OWNED BY district.id;


--
-- TOC entry 214 (class 1259 OID 183177)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 183175)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 213
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 200 (class 1259 OID 183063)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 183061)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 198 (class 1259 OID 183052)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 183050)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 215 (class 1259 OID 183199)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 188378)
-- Name: ds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ds (
    id integer NOT NULL,
    name character varying(255),
    district_id integer
);


ALTER TABLE ds OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 188376)
-- Name: ds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ds_id_seq OWNER TO postgres;

--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 234
-- Name: ds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ds_id_seq OWNED BY ds.id;


--
-- TOC entry 246 (class 1259 OID 237460)
-- Name: garbled_incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE garbled_incident (
    name character varying(1000),
    latitude double precision,
    longitude double precision,
    disaster_type integer,
    contact_no character varying(12),
    address text,
    synced_date timestamp without time zone,
    reported_date timestamp without time zone,
    description text,
    district character varying(255),
    province character varying(255),
    ds character varying(255),
    id integer NOT NULL,
    "user" integer,
    deleted_date timestamp without time zone
);


ALTER TABLE garbled_incident OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 237466)
-- Name: garbled_incident_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE garbled_incident_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE garbled_incident_id_seq OWNER TO postgres;

--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 247
-- Name: garbled_incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE garbled_incident_id_seq OWNED BY garbled_incident.id;


--
-- TOC entry 233 (class 1259 OID 188370)
-- Name: gn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE gn (
    id integer NOT NULL,
    name character varying(255),
    ds_id integer
);


ALTER TABLE gn OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 188368)
-- Name: gn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gn_id_seq OWNER TO postgres;

--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 232
-- Name: gn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gn_id_seq OWNED BY gn.id;


--
-- TOC entry 225 (class 1259 OID 188325)
-- Name: incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE incident (
    id integer NOT NULL,
    name character varying(1000),
    latitude double precision,
    longitude double precision,
    disaster_type integer,
    contact_no character varying(12),
    address text,
    synced_date timestamp without time zone,
    reported_date timestamp without time zone,
    description text,
    validation_id integer,
    district character varying(255),
    province character varying(255),
    ds character varying(255)
);


ALTER TABLE incident OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 188323)
-- Name: incident_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE incident_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incident_id_seq OWNER TO postgres;

--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 224
-- Name: incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE incident_id_seq OWNED BY incident.id;


--
-- TOC entry 259 (class 1259 OID 262069)
-- Name: incident_language_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE incident_language_translation (
    id integer NOT NULL,
    language character varying(255),
    disasters character varying(255),
    gps_location character varying(255),
    name character varying(255),
    contact_no character varying(255),
    disaster_type character varying(255),
    description character varying(255),
    images character varying(255)
);


ALTER TABLE incident_language_translation OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 262067)
-- Name: incident_language_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE incident_language_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incident_language_translation_id_seq OWNER TO postgres;

--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 258
-- Name: incident_language_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE incident_language_translation_id_seq OWNED BY incident_language_translation.id;


--
-- TOC entry 219 (class 1259 OID 188295)
-- Name: layer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE layer (
    id integer NOT NULL,
    name character varying(1000),
    title character varying(1000),
    description text,
    date timestamp without time zone,
    user_id integer
);


ALTER TABLE layer OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 188293)
-- Name: layer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE layer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE layer_id_seq OWNER TO postgres;

--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 218
-- Name: layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE layer_id_seq OWNED BY layer.id;


--
-- TOC entry 216 (class 1259 OID 183213)
-- Name: map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE map (
    name character varying(1000),
    id integer NOT NULL,
    date timestamp without time zone,
    description text,
    user_id integer,
    title character varying(1000)
);


ALTER TABLE map OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 188282)
-- Name: map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE map_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE map_id_seq OWNER TO postgres;

--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 217
-- Name: map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE map_id_seq OWNED BY map.id;


--
-- TOC entry 221 (class 1259 OID 188306)
-- Name: map_layer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE map_layer (
    id integer NOT NULL,
    map_id integer,
    layer_id integer
);


ALTER TABLE map_layer OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 188304)
-- Name: map_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE map_layer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE map_layer_id_seq OWNER TO postgres;

--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 220
-- Name: map_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE map_layer_id_seq OWNED BY map_layer.id;


--
-- TOC entry 252 (class 1259 OID 253846)
-- Name: users_myuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_myuser (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    province_id integer,
    district_id integer,
    ds_id integer,
    gn_id integer,
    id integer NOT NULL
);


ALTER TABLE users_myuser OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 253872)
-- Name: my_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE my_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE my_user_id_seq OWNER TO postgres;

--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 253
-- Name: my_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE my_user_id_seq OWNED BY users_myuser.id;


--
-- TOC entry 227 (class 1259 OID 188336)
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE photo (
    id integer NOT NULL,
    name character varying(1000),
    incident_id integer
);


ALTER TABLE photo OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 188334)
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photo_id_seq OWNER TO postgres;

--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 226
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE photo_id_seq OWNED BY photo.id;


--
-- TOC entry 239 (class 1259 OID 188394)
-- Name: province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE province (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE province OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 188392)
-- Name: province_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE province_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE province_id_seq OWNER TO postgres;

--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 238
-- Name: province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE province_id_seq OWNED BY province.id;


--
-- TOC entry 241 (class 1259 OID 196561)
-- Name: social_media_incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE social_media_incident (
    id integer NOT NULL,
    title character varying(255),
    description text,
    validation_id integer
);


ALTER TABLE social_media_incident OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 196559)
-- Name: social_media_incident_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_media_incident_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_media_incident_id_seq OWNER TO postgres;

--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 240
-- Name: social_media_incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_media_incident_id_seq OWNED BY social_media_incident.id;


--
-- TOC entry 223 (class 1259 OID 188314)
-- Name: style; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE style (
    id integer NOT NULL,
    sld_title character varying(1000),
    name character varying(1000),
    date timestamp without time zone,
    url character varying(2000),
    layer_id integer
);


ALTER TABLE style OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 188312)
-- Name: style_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE style_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE style_id_seq OWNER TO postgres;

--
-- TOC entry 3930 (class 0 OID 0)
-- Dependencies: 222
-- Name: style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE style_id_seq OWNED BY style.id;


--
-- TOC entry 243 (class 1259 OID 221052)
-- Name: tastypie_apiaccess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tastypie_apiaccess (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    request_method character varying(10) NOT NULL,
    accessed integer NOT NULL,
    CONSTRAINT tastypie_apiaccess_accessed_check CHECK ((accessed >= 0))
);


ALTER TABLE tastypie_apiaccess OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 221050)
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tastypie_apiaccess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tastypie_apiaccess_id_seq OWNER TO postgres;

--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 242
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tastypie_apiaccess_id_seq OWNED BY tastypie_apiaccess.id;


--
-- TOC entry 245 (class 1259 OID 221064)
-- Name: tastypie_apikey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tastypie_apikey (
    id integer NOT NULL,
    key character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE tastypie_apikey OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 221062)
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tastypie_apikey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tastypie_apikey_id_seq OWNER TO postgres;

--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 244
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tastypie_apikey_id_seq OWNED BY tastypie_apikey.id;


--
-- TOC entry 251 (class 1259 OID 245636)
-- Name: users_cfruser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_cfruser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    username character varying(30) NOT NULL,
    district_id integer,
    ds_id integer,
    gn_id integer,
    province_id integer
);


ALTER TABLE users_cfruser OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 245634)
-- Name: users_cfruser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_cfruser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_cfruser_id_seq OWNER TO postgres;

--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 250
-- Name: users_cfruser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_cfruser_id_seq OWNED BY users_cfruser.id;


--
-- TOC entry 256 (class 1259 OID 262040)
-- Name: users_myuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_myuser_groups (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE users_myuser_groups OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 262043)
-- Name: users_myuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_myuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_myuser_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 257
-- Name: users_myuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_myuser_groups_id_seq OWNED BY users_myuser_groups.id;


--
-- TOC entry 254 (class 1259 OID 262013)
-- Name: users_myuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_myuser_user_permissions (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE users_myuser_user_permissions OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 262016)
-- Name: users_myuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_myuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_myuser_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 255
-- Name: users_myuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_myuser_user_permissions_id_seq OWNED BY users_myuser_user_permissions.id;


--
-- TOC entry 231 (class 1259 OID 188358)
-- Name: validation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE validation (
    id integer NOT NULL,
    status character varying(10),
    validated_latitude double precision,
    validated_longitude double precision,
    comment text,
    date timestamp without time zone,
    user_id integer,
    address character varying(255)
);


ALTER TABLE validation OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 188356)
-- Name: validation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE validation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE validation_id_seq OWNER TO postgres;

--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 230
-- Name: validation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE validation_id_seq OWNED BY validation.id;


--
-- TOC entry 3529 (class 2604 OID 183086)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 3530 (class 2604 OID 183096)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3528 (class 2604 OID 183076)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 3531 (class 2604 OID 183106)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 3532 (class 2604 OID 183116)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3533 (class 2604 OID 183126)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3553 (class 2604 OID 245631)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY corsheaders_corsmodel ALTER COLUMN id SET DEFAULT nextval('corsheaders_corsmodel_id_seq'::regclass);


--
-- TOC entry 3542 (class 2604 OID 188350)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disaster_type ALTER COLUMN id SET DEFAULT nextval('disaster_type_id_seq'::regclass);


--
-- TOC entry 3546 (class 2604 OID 229245)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district ALTER COLUMN id SET DEFAULT nextval('district_id_seq'::regclass);


--
-- TOC entry 3534 (class 2604 OID 183180)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 3527 (class 2604 OID 183066)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 3526 (class 2604 OID 183055)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 3545 (class 2604 OID 188381)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ds ALTER COLUMN id SET DEFAULT nextval('ds_id_seq'::regclass);


--
-- TOC entry 3552 (class 2604 OID 237468)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY garbled_incident ALTER COLUMN id SET DEFAULT nextval('garbled_incident_id_seq'::regclass);


--
-- TOC entry 3544 (class 2604 OID 188373)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gn ALTER COLUMN id SET DEFAULT nextval('gn_id_seq'::regclass);


--
-- TOC entry 3540 (class 2604 OID 237434)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident ALTER COLUMN id SET DEFAULT nextval('incident_id_seq'::regclass);


--
-- TOC entry 3558 (class 2604 OID 262072)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_language_translation ALTER COLUMN id SET DEFAULT nextval('incident_language_translation_id_seq'::regclass);


--
-- TOC entry 3537 (class 2604 OID 188298)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY layer ALTER COLUMN id SET DEFAULT nextval('layer_id_seq'::regclass);


--
-- TOC entry 3536 (class 2604 OID 188284)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY map ALTER COLUMN id SET DEFAULT nextval('map_id_seq'::regclass);


--
-- TOC entry 3538 (class 2604 OID 188309)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY map_layer ALTER COLUMN id SET DEFAULT nextval('map_layer_id_seq'::regclass);


--
-- TOC entry 3541 (class 2604 OID 188339)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo ALTER COLUMN id SET DEFAULT nextval('photo_id_seq'::regclass);


--
-- TOC entry 3547 (class 2604 OID 188397)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY province ALTER COLUMN id SET DEFAULT nextval('province_id_seq'::regclass);


--
-- TOC entry 3548 (class 2604 OID 196564)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_media_incident ALTER COLUMN id SET DEFAULT nextval('social_media_incident_id_seq'::regclass);


--
-- TOC entry 3539 (class 2604 OID 188317)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY style ALTER COLUMN id SET DEFAULT nextval('style_id_seq'::regclass);


--
-- TOC entry 3549 (class 2604 OID 221055)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tastypie_apiaccess ALTER COLUMN id SET DEFAULT nextval('tastypie_apiaccess_id_seq'::regclass);


--
-- TOC entry 3551 (class 2604 OID 221067)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tastypie_apikey ALTER COLUMN id SET DEFAULT nextval('tastypie_apikey_id_seq'::regclass);


--
-- TOC entry 3554 (class 2604 OID 245639)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_cfruser ALTER COLUMN id SET DEFAULT nextval('users_cfruser_id_seq'::regclass);


--
-- TOC entry 3555 (class 2604 OID 253874)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser ALTER COLUMN id SET DEFAULT nextval('my_user_id_seq'::regclass);


--
-- TOC entry 3557 (class 2604 OID 262045)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups ALTER COLUMN id SET DEFAULT nextval('users_myuser_groups_id_seq'::regclass);


--
-- TOC entry 3556 (class 2604 OID 262018)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('users_myuser_user_permissions_id_seq'::regclass);


--
-- TOC entry 3543 (class 2604 OID 188361)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY validation ALTER COLUMN id SET DEFAULT nextval('validation_id_seq'::regclass);


--
-- TOC entry 3841 (class 0 OID 183083)
-- Dependencies: 204
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
1	my_group
\.


--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 203
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, true);


--
-- TOC entry 3843 (class 0 OID 183093)
-- Dependencies: 206
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3839 (class 0 OID 183073)
-- Dependencies: 202
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add map	7	add_map
20	Can change map	7	change_map
21	Can delete map	7	delete_map
22	Can add map layer	17	add_maplayer
23	Can change map layer	17	change_maplayer
24	Can delete map layer	17	delete_maplayer
25	Can add layer	9	add_layer
26	Can change layer	9	change_layer
27	Can delete layer	9	delete_layer
28	Can add style	18	add_style
29	Can change style	18	change_style
30	Can delete style	18	delete_style
31	Can add validation	19	add_validation
32	Can change validation	19	change_validation
33	Can delete validation	19	delete_validation
34	Can add incident	14	add_incident
35	Can change incident	14	change_incident
36	Can delete incident	14	delete_incident
37	Can add photo	20	add_photo
38	Can change photo	20	change_photo
39	Can delete photo	20	delete_photo
40	Can add social media incident	16	add_socialmediaincident
41	Can change social media incident	16	change_socialmediaincident
42	Can delete social media incident	16	delete_socialmediaincident
43	Can add disaster type	13	add_disastertype
44	Can change disaster type	13	change_disastertype
45	Can delete disaster type	13	delete_disastertype
46	Can add province	15	add_province
47	Can change province	15	change_province
48	Can delete province	15	delete_province
49	Can add district	10	add_district
50	Can change district	10	change_district
51	Can delete district	10	delete_district
52	Can add ds	11	add_ds
53	Can change ds	11	change_ds
54	Can delete ds	11	delete_ds
55	Can add gn	12	add_gn
56	Can change gn	12	change_gn
57	Can delete gn	12	delete_gn
58	Can add api access	21	add_apiaccess
59	Can change api access	21	change_apiaccess
60	Can delete api access	21	delete_apiaccess
61	Can add api key	22	add_apikey
62	Can change api key	22	change_apikey
63	Can delete api key	22	delete_apikey
64	Access chart page	14	access_chart_page
65	Can add garbled incident	23	add_garbledincident
66	Can change garbled incident	23	change_garbledincident
67	Can delete garbled incident	23	delete_garbledincident
68	Can add cors model	24	add_corsmodel
69	Can change cors model	24	change_corsmodel
70	Can delete cors model	24	delete_corsmodel
71	Can add my user	25	add_myuser
72	Can change my user	25	change_myuser
73	Can delete my user	25	delete_myuser
74	Access report page	14	access_report_page
75	Access map page	14	access_map_page
76	Access incident page	14	access_incident_page
\.


--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 76, true);


--
-- TOC entry 3845 (class 0 OID 183103)
-- Dependencies: 208
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, province_id, district_id, ds_id, gn_id) FROM stdin;
2	pbkdf2_sha256$20000$BUy6CmOJTHZP$lIJ130EiNWdqvSDn3lzpavai9v9CaD2Vvyuv1dAebF0=	2016-08-26 11:34:24+05:30	f	Dilini				f	t	2016-08-26 11:30:24+05:30	\N	\N	\N	\N
3	pbkdf2_sha256$20000$1JxAtbI1nxyK$5sjisru3DY8e7Jo7PANht6vfc6cSHemi7gCEiZr7jSA=	2016-09-15 15:27:56.099261+05:30	f	himali				t	t	2016-08-26 11:39:34+05:30	\N	\N	\N	\N
1	pbkdf2_sha256$20000$uSEN3PJ9gpmn$QUGogRrPRRmZTxHfAw/BF9JF3MbBDGB8JRbksSJ1f9I=	2016-09-15 17:57:37.490068+05:30	t	admin			admin@gmail.com	t	t	2016-08-23 13:45:49.67971+05:30	\N	\N	\N	\N
\.


--
-- TOC entry 3847 (class 0 OID 183113)
-- Dependencies: 210
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 3, true);


--
-- TOC entry 3849 (class 0 OID 183123)
-- Dependencies: 212
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 25, true);


--
-- TOC entry 3886 (class 0 OID 245628)
-- Dependencies: 249
-- Data for Name: corsheaders_corsmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY corsheaders_corsmodel (id, cors) FROM stdin;
\.


--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 248
-- Name: corsheaders_corsmodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('corsheaders_corsmodel_id_seq', 1, false);


--
-- TOC entry 3866 (class 0 OID 188347)
-- Dependencies: 229
-- Data for Name: disaster_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disaster_type (id, english, sinhala, tamil) FROM stdin;
9	Thunder Storm		
2	Flood		
5	Landslides		
8	Fire		
7	Explostion		
6	Cyclone		
1	Drought		
3	Earthquakes		
11	Chemical		
10	Epedemic		
4	Tsunami		
\.


--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 228
-- Name: disaster_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('disaster_type_id_seq', 5, true);


--
-- TOC entry 3874 (class 0 OID 188386)
-- Dependencies: 237
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY district (id, name, province_id) FROM stdin;
3	Kandy	2
4	Matale	2
5	Nuwara Eliya	2
6	Ampara	3
7	Batticaloa	3
8	Trincomalee	3
9	Anuradhapura	4
10	Polonnaruwa	4
11	Kurunegala	6
12	Puttalam	6
13	Jaffna	5
14	Kilinochchi	5
15	Mannar	5
16	Mullaitivu	5
17	Vavuniya	5
18	Kegalle	7
19	Ratnapura	7
20	Galle	8
21	Hambantota	8
22	Matara	8
23	Badulla	9
24	Monaragala	9
25	Gampaha	1
26	Kalutara	1
2	Colombo	1
\.


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 236
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('district_id_seq', 26, true);


--
-- TOC entry 3851 (class 0 OID 183177)
-- Dependencies: 214
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-08-23 13:54:55.910311+05:30	1	Map object	1		7	1
2	2016-08-23 14:02:58.193481+05:30	1	Map object	3		7	1
3	2016-08-23 14:03:10.960066+05:30	2	Map object	1		7	1
4	2016-08-23 14:03:14.960345+05:30	2	Map object	2	No fields changed.	7	1
12	2016-08-26 12:34:10.344796+05:30	1	my_group	1		3	3
13	2016-08-31 14:25:28.401921+05:30	1	DisasterType object	1		13	1
14	2016-08-31 14:26:16.00634+05:30	1	Province object	1		15	1
15	2016-08-31 14:36:51.152456+05:30	1	District object	1		10	1
16	2016-08-31 14:36:55.891916+05:30	2	District object	1		10	1
17	2016-08-31 14:37:33.90087+05:30	1	District object	3		10	1
18	2016-08-31 14:38:35.897628+05:30	1	Ds object	1		11	1
19	2016-08-31 14:39:16.341813+05:30	1	GN1	1		12	1
20	2016-08-31 14:49:41.979821+05:30	1	Incident object	1		14	1
21	2016-08-31 14:56:35.362239+05:30	1	SocialMediaIncident object	1		16	1
22	2016-08-31 14:57:43.918221+05:30	1	Disaster at Kotmale	2	Changed title.	16	1
23	2016-08-31 14:59:07.551952+05:30	1	Layer object	1		9	1
24	2016-08-31 15:02:44.970013+05:30	2	my map	2	Changed title and user.	7	1
25	2016-08-31 16:39:55.483771+05:30	1	Drought reported by Himali	2	No fields changed.	14	1
26	2016-08-31 17:07:41.726072+05:30	1	Drought reported by Himali	2	No fields changed.	14	1
27	2016-08-31 20:37:32.48199+05:30	3	disaster areas	1		7	1
28	2016-09-05 21:45:55.007532+05:30	2	Incident object	1		14	1
29	2016-09-05 21:47:47.020163+05:30	2	Flood	1		13	1
30	2016-09-05 21:47:56.335493+05:30	3	Volcano	1		13	1
31	2016-09-05 21:53:18.749494+05:30	2	Incident object	2	Changed name, latitude, longitude and disaster_type.	14	1
32	2016-09-05 21:54:00.756469+05:30	3	Incident object	1		14	1
33	2016-09-05 22:01:15.936021+05:30	1	Incident object	2	Changed latitude and longitude.	14	1
34	2016-09-06 11:01:54.068651+05:30	3	Incident object	2	Changed latitude and longitude.	14	1
35	2016-09-06 11:02:49.915185+05:30	2	Incident object	2	Changed latitude and longitude.	14	1
36	2016-09-06 11:03:01.020703+05:30	1	Incident object	2	Changed latitude and longitude.	14	1
37	2016-09-06 11:06:20.546071+05:30	4	Incident object	1		14	1
38	2016-09-06 11:07:00.291819+05:30	4	Incident object	2	Changed longitude.	14	1
39	2016-09-06 11:07:22.093385+05:30	4	Incident object	2	Changed longitude.	14	1
40	2016-09-06 11:07:38.580584+05:30	4	Incident object	2	Changed longitude.	14	1
41	2016-09-06 11:08:05.431554+05:30	4	Incident object	2	Changed latitude and longitude.	14	1
42	2016-09-06 13:50:50.580839+05:30	5	Incident object	3		14	1
43	2016-09-07 21:51:03.896123+05:30	3	Incident object	2	Changed synced_date.	14	1
44	2016-09-07 21:51:12.853967+05:30	4	Incident object	2	Changed synced_date.	14	1
45	2016-09-07 21:51:21.055818+05:30	2	Incident object	2	Changed synced_date.	14	1
46	2016-09-07 22:26:49.999481+05:30	4	Incident object	2	Changed reported_date.	14	1
47	2016-09-07 22:27:02.465881+05:30	3	Incident object	2	Changed reported_date.	14	1
48	2016-09-07 22:27:16.134121+05:30	2	Incident object	2	Changed reported_date.	14	1
49	2016-09-08 22:11:35.991216+05:30	2	Incident object	2	Changed name.	14	1
50	2016-09-10 13:35:53.612465+05:30	5	Volcano	1		13	1
51	2016-09-10 18:14:42.705807+05:30	4	Incident object	2	Changed district and province.	14	1
52	2016-09-10 18:15:04.791995+05:30	3	Incident object	2	Changed district and province.	14	1
53	2016-09-10 18:15:55.356347+05:30	2	Incident object	2	Changed district and province.	14	1
54	2016-09-10 18:16:11.511918+05:30	1	Incident object	2	Changed district and province.	14	1
55	2016-09-10 18:27:23.175217+05:30	3	Incident object	2	Changed reported_date.	14	1
56	2016-09-10 18:33:24.052207+05:30	3	Incident object	2	Changed reported_date.	14	1
57	2016-09-10 18:39:48.014828+05:30	3	Incident object	2	Changed district.	14	1
58	2016-09-11 15:49:37.728571+05:30	3	Incident object	2	Changed reported_date.	14	1
59	2016-09-11 15:50:31.939554+05:30	3	Incident object	2	Changed reported_date.	14	1
60	2016-09-11 15:57:38.819186+05:30	3	Incident object	2	Changed reported_date.	14	1
61	2016-09-11 15:58:12.392806+05:30	1	Incident object	2	Changed reported_date.	14	1
62	2016-09-11 15:58:30.931288+05:30	1	Incident object	2	Changed reported_date.	14	1
63	2016-09-11 15:58:57.606148+05:30	4	Incident object	2	Changed reported_date.	14	1
64	2016-09-12 10:01:24.953221+05:30	2	Incident object	2	Changed reported_date.	14	1
65	2016-09-12 10:17:27.520517+05:30	1	Western	3		15	1
66	2016-09-12 10:17:43.91574+05:30	2	Colomb	3		10	1
67	2016-09-12 10:17:50.559136+05:30	1	Western	3		15	1
68	2016-09-12 23:36:39.004589+05:30	4	Incident object	2	Changed validation.	14	1
69	2016-09-13 12:12:08.012116+05:30	74	Incident object	2	Changed disaster_type.	14	1
70	2016-09-13 17:37:55.789116+05:30	15	Incident object	2	Changed reported_date.	14	1
71	2016-09-14 11:59:15.376611+05:30	80	Incident object	2	Changed validation.	14	1
72	2016-09-18 12:20:28.557216+05:30	15	Lara	1		25	1
73	2016-09-18 14:23:23.132685+05:30	15	Lara	2	Changed first_name, last_name, email and user_permissions.	25	1
74	2016-09-18 14:24:24.587958+05:30	15	Lara	2	Changed user_permissions.	25	1
75	2016-09-18 14:27:34.620049+05:30	15	Lara	2	Changed province and district.	25	1
\.


--
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 213
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 75, true);


--
-- TOC entry 3837 (class 0 OID 183063)
-- Dependencies: 200
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
5	contenttypes	contenttype
6	sessions	session
7	maps	map
9	layers	layer
10	administrative_divisions	district
11	administrative_divisions	ds
12	administrative_divisions	gn
13	settings	disastertype
14	incidents	incident
15	administrative_divisions	province
16	incidents	socialmediaincident
17	maps	maplayer
18	layers	style
19	incidents	validation
20	incidents	photo
21	tastypie	apiaccess
22	tastypie	apikey
23	incidents	garbledincident
24	corsheaders	corsmodel
25	users	myuser
\.


--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 199
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 25, true);


--
-- TOC entry 3835 (class 0 OID 183052)
-- Dependencies: 198
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-08-22 16:58:44.631733+05:30
2	auth	0001_initial	2016-08-22 16:58:44.810884+05:30
3	admin	0001_initial	2016-08-22 16:58:44.834918+05:30
4	contenttypes	0002_remove_content_type_name	2016-08-22 16:58:44.880912+05:30
5	auth	0002_alter_permission_name_max_length	2016-08-22 16:58:44.89544+05:30
6	auth	0003_alter_user_email_max_length	2016-08-22 16:58:44.916472+05:30
7	auth	0004_alter_user_username_opts	2016-08-22 16:58:44.931418+05:30
8	auth	0005_alter_user_last_login_null	2016-08-22 16:58:44.945045+05:30
9	auth	0006_require_contenttypes_0002	2016-08-22 16:58:44.952218+05:30
10	sessions	0001_initial	2016-08-22 16:58:44.968076+05:30
11	maps	0001_initial	2016-08-23 14:01:31.846388+05:30
12	administrative_divisions	0001_initial	2016-08-31 20:35:17.938425+05:30
13	incidents	0001_initial	2016-08-31 20:35:18.079871+05:30
14	layers	0001_initial	2016-08-31 20:35:18.124801+05:30
15	maps	0002_maplayer	2016-08-31 20:35:18.150334+05:30
16	settings	0001_initial	2016-08-31 20:35:18.180071+05:30
17	tastypie	0001_initial	2016-09-10 18:04:47.46901+05:30
18	users	0001_initial	2016-09-17 19:55:15.368506+05:30
19	incidents	0002_garbledincident	2016-09-18 08:29:19.901681+05:30
\.


--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 197
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 19, true);


--
-- TOC entry 3852 (class 0 OID 183199)
-- Dependencies: 215
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
cl3nfspcsmwc0vu8npx60z9p8efg9ynj	ZjBlOTIxZjMyYmJlNTA0YjFkYmVjYWI3ZDNhYzBkYjlhNGQ1ZDFiNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5OGZjYjA1NWY3NDhmODRkNGY0Njc5ZDE1ZDliOWM2ZjMyY2NhMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-06 13:45:54.595897+05:30
23mjikp808jxya9m5q0odyp79dn9ii1z	ZjBlOTIxZjMyYmJlNTA0YjFkYmVjYWI3ZDNhYzBkYjlhNGQ1ZDFiNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5OGZjYjA1NWY3NDhmODRkNGY0Njc5ZDE1ZDliOWM2ZjMyY2NhMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-06 18:00:53.573952+05:30
e9j66yqjudjca4hb2615t8zo8ot9a5ja	ZjBlOTIxZjMyYmJlNTA0YjFkYmVjYWI3ZDNhYzBkYjlhNGQ1ZDFiNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5OGZjYjA1NWY3NDhmODRkNGY0Njc5ZDE1ZDliOWM2ZjMyY2NhMTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-17 20:50:51.946923+05:30
\.


--
-- TOC entry 3872 (class 0 OID 188378)
-- Dependencies: 235
-- Data for Name: ds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ds (id, name, district_id) FROM stdin;
\.


--
-- TOC entry 3949 (class 0 OID 0)
-- Dependencies: 234
-- Name: ds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ds_id_seq', 1, true);


--
-- TOC entry 3883 (class 0 OID 237460)
-- Dependencies: 246
-- Data for Name: garbled_incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY garbled_incident (name, latitude, longitude, disaster_type, contact_no, address, synced_date, reported_date, description, district, province, ds, id, "user", deleted_date) FROM stdin;
\.


--
-- TOC entry 3950 (class 0 OID 0)
-- Dependencies: 247
-- Name: garbled_incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('garbled_incident_id_seq', 8, true);


--
-- TOC entry 3870 (class 0 OID 188370)
-- Dependencies: 233
-- Data for Name: gn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gn (id, name, ds_id) FROM stdin;
\.


--
-- TOC entry 3951 (class 0 OID 0)
-- Dependencies: 232
-- Name: gn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gn_id_seq', 1, true);


--
-- TOC entry 3862 (class 0 OID 188325)
-- Dependencies: 225
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY incident (id, name, latitude, longitude, disaster_type, contact_no, address, synced_date, reported_date, description, validation_id, district, province, ds) FROM stdin;
78	\N	\N	\N	5	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	Lara	\N	\N	2	\N	\N	\N	\N	Flooded area	\N	\N	\N	\N
81	Cinder	\N	\N	6	07734567	\N	\N	\N	Cyclone	\N	\N	\N	\N
82	Lennon	\N	\N	7	07734567	\N	\N	\N	Explosion	\N	\N	\N	\N
6	Sachie	7.25129999999999963	80.3464000000000027	1	0788550013	907/8,Udawaththa Rd,malabe	2016-09-05 09:14:33	2016-09-05 09:14:33	test	7	Kegalle	Sabaragamuwa	\N
11	Amith	6.08582999999999963	80.5663899999999984	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Matara	Southern	\N
10	Waruna	7.29638999999999971	80.6350000000000051	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Kandy	Central	\N
8	Dilini	6.69360999999999962	80.3863900000000058	3	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Ratnapura	Sabaragamuwa	\N
7	Naduni	8.56667000000000023	81.2333299999999952	5	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Trincomalee	Eastern	\N
13	Amith	9.66666999999999987	800	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Jaffna	Northern	\N
17	nadini	6.93444000000000038	79.8427800000000047	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Colombo	Western	\N
16	Dhanu	6.03500000000000014	80.2158299999999969	2	0788550012	907/8	2016-09-05 09:14:33	2016-09-05 09:14:33	Test one	\N	Galle	Southern	\N
14	Amith	6.12305999999999973	81.1205599999999976	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Hambantota	Southern	\N
12	Amith	6.58694000000000024	79.9602799999999974	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Kalutara	Western	\N
21	Waeer	7.30111000000000043	81.6749999999999972	2	0788550078	Lihini Uyana, Malabe, Sri Lanka	2016-09-12 01:27:10	2016-09-12 01:27:10	Test four	\N	Ampara	Eastern	\N
69		6.90192829999999979	79.8937832000000014	6		535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 09:00:52.76	2016-09-12 09:00:52.76	Ccf	\N	Matara	Southern	\N
70	Kasuntr	6.90186079999999968	79.8938062000000002	1	0788667789	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 11:44:14.097	2016-09-12 11:44:14.097	Sdxdd	\N	Matara	Southern	\N
75	Imashi	6.90188039999999958	79.8937985999999967	10	0677891919	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 12:26:02	2016-09-12 12:26:02	Hdsjaja	\N	Colombo	Western	\N
73	Dha	6.90190160000000041	79.8937714000000057	11	0114567896	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 11:55:11	2016-09-12 11:55:11	Bsnsn	\N	Colombo	Western	\N
72	Xfbfb	7.09334600000000037	79.9937730000000045	10	0112346667	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 11:51:37	2016-09-12 11:51:37	Fbbfb	\N	Gampaha	Western	\N
71	Zxxc	7.09334600000000037	79.9937730000000045	3	0112560101	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 11:46:43	2016-09-12 11:46:43	Xdfff	\N	Gampaha	Western	\N
74	Dasun	6.90190199999999976	79.8937739999999934	2	0788660013	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 12:17:10	2016-09-12 12:17:10	Dgshjsjs	\N	Colombo	Western	\N
15	Amith	7.06167000000000034	79.9666699999999935	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-01 09:14:33	test	\N	Gampaha	Western	\N
\.


--
-- TOC entry 3952 (class 0 OID 0)
-- Dependencies: 224
-- Name: incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('incident_id_seq', 82, true);


--
-- TOC entry 3896 (class 0 OID 262069)
-- Dependencies: 259
-- Data for Name: incident_language_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY incident_language_translation (id, language, disasters, gps_location, name, contact_no, disaster_type, description, images) FROM stdin;
9	si	\N	\N	\N	\N	\N	\N	\N
10	ta	\N	\N	\N	\N	\N	\N	\N
8	en	Disasters	GPS location	Name	Contact No	Disaster type	Description	Images
\.


--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 258
-- Name: incident_language_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('incident_language_translation_id_seq', 10, true);


--
-- TOC entry 3856 (class 0 OID 188295)
-- Dependencies: 219
-- Data for Name: layer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY layer (id, name, title, description, date, user_id) FROM stdin;
1	kaluthara_flood	Kaluthara Flood		2016-08-31 09:29:06	2
\.


--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 218
-- Name: layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('layer_id_seq', 1, true);


--
-- TOC entry 3853 (class 0 OID 183213)
-- Dependencies: 216
-- Data for Name: map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY map (name, id, date, description, user_id, title) FROM stdin;
my map	2	\N		1	my map
disaster areas	3	2016-08-31 15:07:26		1	disaster areas
\.


--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 217
-- Name: map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('map_id_seq', 3, true);


--
-- TOC entry 3858 (class 0 OID 188306)
-- Dependencies: 221
-- Data for Name: map_layer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY map_layer (id, map_id, layer_id) FROM stdin;
\.


--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 220
-- Name: map_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('map_layer_id_seq', 1, false);


--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 253
-- Name: my_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('my_user_id_seq', 15, true);


--
-- TOC entry 3864 (class 0 OID 188336)
-- Dependencies: 227
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo (id, name, incident_id) FROM stdin;
1	img.png	8
\.


--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 226
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('photo_id_seq', 1, true);


--
-- TOC entry 3876 (class 0 OID 188394)
-- Dependencies: 239
-- Data for Name: province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY province (id, name) FROM stdin;
1	Western
2	Central
3	Eastern
4	North Central
5	Northern
6	North Western
7	Sabaragamuwa
8	Southern
9	Uva
\.


--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 238
-- Name: province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('province_id_seq', 1, true);


--
-- TOC entry 3878 (class 0 OID 196561)
-- Dependencies: 241
-- Data for Name: social_media_incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_media_incident (id, title, description, validation_id) FROM stdin;
1	Disaster at Kotmale		\N
\.


--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 240
-- Name: social_media_incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_media_incident_id_seq', 1, true);


--
-- TOC entry 3525 (class 0 OID 181966)
-- Dependencies: 183
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys  FROM stdin;
\.


--
-- TOC entry 3860 (class 0 OID 188314)
-- Dependencies: 223
-- Data for Name: style; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY style (id, sld_title, name, date, url, layer_id) FROM stdin;
\.


--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 222
-- Name: style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('style_id_seq', 1, false);


--
-- TOC entry 3880 (class 0 OID 221052)
-- Dependencies: 243
-- Data for Name: tastypie_apiaccess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tastypie_apiaccess (id, identifier, url, request_method, accessed) FROM stdin;
\.


--
-- TOC entry 3962 (class 0 OID 0)
-- Dependencies: 242
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tastypie_apiaccess_id_seq', 1, false);


--
-- TOC entry 3882 (class 0 OID 221064)
-- Dependencies: 245
-- Data for Name: tastypie_apikey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tastypie_apikey (id, key, created, user_id) FROM stdin;
\.


--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 244
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tastypie_apikey_id_seq', 1, false);


--
-- TOC entry 3888 (class 0 OID 245636)
-- Dependencies: 251
-- Data for Name: users_cfruser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_cfruser (id, password, last_login, username, district_id, ds_id, gn_id, province_id) FROM stdin;
\.


--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 250
-- Name: users_cfruser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_cfruser_id_seq', 1, false);


--
-- TOC entry 3889 (class 0 OID 253846)
-- Dependencies: 252
-- Data for Name: users_myuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_myuser (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, province_id, district_id, ds_id, gn_id, id) FROM stdin;
pbkdf2_sha256$20000$BUy6CmOJTHZP$lIJ130EiNWdqvSDn3lzpavai9v9CaD2Vvyuv1dAebF0=	2016-08-26 11:34:24+05:30	f	Dilini				f	t	2016-08-26 11:30:24+05:30	\N	\N	\N	\N	2
pbkdf2_sha256$20000$1JxAtbI1nxyK$5sjisru3DY8e7Jo7PANht6vfc6cSHemi7gCEiZr7jSA=	2016-09-18 13:33:35.158194+05:30	f	himali				t	t	2016-08-26 11:39:34+05:30	\N	\N	\N	\N	3
pbkdf2_sha256$20000$63SkFH72VYPj$XJKEXqYQYQwJ0lsfFiE5PvP49YOWSEyCTGsZEsPyNFc=	2016-09-19 13:20:32.239286+05:30	f	Lara	Lara	Cameron	dilinihb@gmail.com	t	t	2016-09-18 12:20:28+05:30	1	2	\N	\N	15
pbkdf2_sha256$20000$uSEN3PJ9gpmn$QUGogRrPRRmZTxHfAw/BF9JF3MbBDGB8JRbksSJ1f9I=	2016-09-19 13:22:05.484247+05:30	t	admin			admin@gmail.com	t	t	2016-08-23 13:45:49.67971+05:30	\N	\N	\N	\N	1
\.


--
-- TOC entry 3893 (class 0 OID 262040)
-- Dependencies: 256
-- Data for Name: users_myuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_myuser_groups (id, myuser_id, group_id) FROM stdin;
\.


--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 257
-- Name: users_myuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_myuser_groups_id_seq', 1, false);


--
-- TOC entry 3891 (class 0 OID 262013)
-- Dependencies: 254
-- Data for Name: users_myuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_myuser_user_permissions (id, myuser_id, permission_id) FROM stdin;
29	15	55
\.


--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 255
-- Name: users_myuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_myuser_user_permissions_id_seq', 29, true);


--
-- TOC entry 3868 (class 0 OID 188358)
-- Dependencies: 231
-- Data for Name: validation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY validation (id, status, validated_latitude, validated_longitude, comment, date, user_id, address) FROM stdin;
7	\N	\N	\N	\N	2016-09-18 12:56:47.892	1	\N
\.


--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 230
-- Name: validation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('validation_id_seq', 7, true);


--
-- TOC entry 3572 (class 2606 OID 183090)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3578 (class 2606 OID 183100)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 3580 (class 2606 OID 183098)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3574 (class 2606 OID 183088)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3567 (class 2606 OID 183080)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 3569 (class 2606 OID 183078)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3590 (class 2606 OID 183118)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3592 (class 2606 OID 183120)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 3582 (class 2606 OID 183108)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3596 (class 2606 OID 183128)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3598 (class 2606 OID 183130)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 3585 (class 2606 OID 183110)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 3644 (class 2606 OID 245633)
-- Name: corsheaders_corsmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY corsheaders_corsmodel
    ADD CONSTRAINT corsheaders_corsmodel_pkey PRIMARY KEY (id);


--
-- TOC entry 3620 (class 2606 OID 188355)
-- Name: disaster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disaster_type
    ADD CONSTRAINT disaster_pkey PRIMARY KEY (id);


--
-- TOC entry 3628 (class 2606 OID 188391)
-- Name: district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);


--
-- TOC entry 3602 (class 2606 OID 183186)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3562 (class 2606 OID 183070)
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- TOC entry 3564 (class 2606 OID 183068)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3560 (class 2606 OID 183060)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3605 (class 2606 OID 183206)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3626 (class 2606 OID 188383)
-- Name: ds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ds
    ADD CONSTRAINT ds_pkey PRIMARY KEY (id);


--
-- TOC entry 3624 (class 2606 OID 188375)
-- Name: gn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gn
    ADD CONSTRAINT gn_pkey PRIMARY KEY (id);


--
-- TOC entry 3671 (class 2606 OID 262077)
-- Name: incident_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_language_translation
    ADD CONSTRAINT incident_lang_pkey PRIMARY KEY (id);


--
-- TOC entry 3616 (class 2606 OID 188333)
-- Name: incident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT incident_pkey PRIMARY KEY (id);


--
-- TOC entry 3610 (class 2606 OID 188303)
-- Name: layer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY layer
    ADD CONSTRAINT layer_pkey PRIMARY KEY (id);


--
-- TOC entry 3612 (class 2606 OID 188311)
-- Name: map_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY map_layer
    ADD CONSTRAINT map_layer_pkey PRIMARY KEY (id);


--
-- TOC entry 3608 (class 2606 OID 188292)
-- Name: map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY map
    ADD CONSTRAINT map_pkey PRIMARY KEY (id);


--
-- TOC entry 3655 (class 2606 OID 253880)
-- Name: my_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser
    ADD CONSTRAINT my_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3657 (class 2606 OID 253850)
-- Name: my_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser
    ADD CONSTRAINT my_user_username_key UNIQUE (username);


--
-- TOC entry 3618 (class 2606 OID 188344)
-- Name: photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- TOC entry 3642 (class 2606 OID 237470)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY garbled_incident
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 3632 (class 2606 OID 196569)
-- Name: pkey_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_media_incident
    ADD CONSTRAINT pkey_id PRIMARY KEY (id);


--
-- TOC entry 3630 (class 2606 OID 188399)
-- Name: province_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);


--
-- TOC entry 3614 (class 2606 OID 188322)
-- Name: style_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY style
    ADD CONSTRAINT style_pkey PRIMARY KEY (id);


--
-- TOC entry 3634 (class 2606 OID 221061)
-- Name: tastypie_apiaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tastypie_apiaccess
    ADD CONSTRAINT tastypie_apiaccess_pkey PRIMARY KEY (id);


--
-- TOC entry 3638 (class 2606 OID 221069)
-- Name: tastypie_apikey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_pkey PRIMARY KEY (id);


--
-- TOC entry 3640 (class 2606 OID 221071)
-- Name: tastypie_apikey_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_user_id_key UNIQUE (user_id);


--
-- TOC entry 3650 (class 2606 OID 245641)
-- Name: users_cfruser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_cfruser
    ADD CONSTRAINT users_cfruser_pkey PRIMARY KEY (id);


--
-- TOC entry 3653 (class 2606 OID 245643)
-- Name: users_cfruser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_cfruser
    ADD CONSTRAINT users_cfruser_username_key UNIQUE (username);


--
-- TOC entry 3667 (class 2606 OID 262047)
-- Name: users_myuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups
    ADD CONSTRAINT users_myuser_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3669 (class 2606 OID 262049)
-- Name: users_myuser_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups
    ADD CONSTRAINT users_myuser_groups_user_id_group_id_key UNIQUE (myuser_id, group_id);


--
-- TOC entry 3661 (class 2606 OID 262020)
-- Name: users_myuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions
    ADD CONSTRAINT users_myuser_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3663 (class 2606 OID 262022)
-- Name: users_myuser_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions
    ADD CONSTRAINT users_myuser_user_permissions_user_id_permission_id_key UNIQUE (myuser_id, permission_id);


--
-- TOC entry 3622 (class 2606 OID 188366)
-- Name: validation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY validation
    ADD CONSTRAINT validation_pkey PRIMARY KEY (id);


--
-- TOC entry 3570 (class 1259 OID 183137)
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3575 (class 1259 OID 183148)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 3576 (class 1259 OID 183149)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3565 (class 1259 OID 183136)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 3587 (class 1259 OID 183162)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 3588 (class 1259 OID 183161)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 3593 (class 1259 OID 183174)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3594 (class 1259 OID 183173)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 3583 (class 1259 OID 183150)
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3599 (class 1259 OID 183197)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 3600 (class 1259 OID 183198)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 3603 (class 1259 OID 183207)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 3606 (class 1259 OID 183208)
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3586 (class 1259 OID 253871)
-- Name: my_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX my_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 3635 (class 1259 OID 221077)
-- Name: tastypie_apikey_3c6e0b8a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tastypie_apikey_3c6e0b8a ON tastypie_apikey USING btree (key);


--
-- TOC entry 3636 (class 1259 OID 221078)
-- Name: tastypie_apikey_key_b86d63920e5bbcb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tastypie_apikey_key_b86d63920e5bbcb_like ON tastypie_apikey USING btree (key varchar_pattern_ops);


--
-- TOC entry 3645 (class 1259 OID 245667)
-- Name: users_cfruser_4a5754ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_cfruser_4a5754ed ON users_cfruser USING btree (province_id);


--
-- TOC entry 3646 (class 1259 OID 245665)
-- Name: users_cfruser_5c785270; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_cfruser_5c785270 ON users_cfruser USING btree (ds_id);


--
-- TOC entry 3647 (class 1259 OID 245666)
-- Name: users_cfruser_73b14aec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_cfruser_73b14aec ON users_cfruser USING btree (gn_id);


--
-- TOC entry 3648 (class 1259 OID 245664)
-- Name: users_cfruser_a34a99d3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_cfruser_a34a99d3 ON users_cfruser USING btree (district_id);


--
-- TOC entry 3651 (class 1259 OID 245668)
-- Name: users_cfruser_username_4fe64aaaa4195697_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_cfruser_username_4fe64aaaa4195697_like ON users_cfruser USING btree (username varchar_pattern_ops);


--
-- TOC entry 3664 (class 1259 OID 262050)
-- Name: users_myuser_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_myuser_groups_0e939a4f ON users_myuser_groups USING btree (group_id);


--
-- TOC entry 3665 (class 1259 OID 262051)
-- Name: users_myuser_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_myuser_groups_e8701ad4 ON users_myuser_groups USING btree (myuser_id);


--
-- TOC entry 3658 (class 1259 OID 262023)
-- Name: users_myuser_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_myuser_user_permissions_8373b171 ON users_myuser_user_permissions USING btree (permission_id);


--
-- TOC entry 3659 (class 1259 OID 262024)
-- Name: users_myuser_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_myuser_user_permissions_e8701ad4 ON users_myuser_user_permissions USING btree (myuser_id);


--
-- TOC entry 3672 (class 2606 OID 183131)
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3673 (class 2606 OID 183138)
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3674 (class 2606 OID 183143)
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3682 (class 2606 OID 183168)
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3709 (class 2606 OID 262025)
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3680 (class 2606 OID 183156)
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3679 (class 2606 OID 183151)
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3681 (class 2606 OID 183163)
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3683 (class 2606 OID 183187)
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3684 (class 2606 OID 183192)
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3695 (class 2606 OID 196534)
-- Name: fk_district_ds; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ds
    ADD CONSTRAINT fk_district_ds FOREIGN KEY (district_id) REFERENCES district(id);


--
-- TOC entry 3676 (class 2606 OID 196544)
-- Name: fk_district_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT fk_district_user FOREIGN KEY (district_id) REFERENCES district(id);


--
-- TOC entry 3705 (class 2606 OID 253851)
-- Name: fk_district_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser
    ADD CONSTRAINT fk_district_user FOREIGN KEY (district_id) REFERENCES district(id);


--
-- TOC entry 3694 (class 2606 OID 196524)
-- Name: fk_ds_gn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gn
    ADD CONSTRAINT fk_ds_gn FOREIGN KEY (ds_id) REFERENCES ds(id);


--
-- TOC entry 3677 (class 2606 OID 196549)
-- Name: fk_ds_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT fk_ds_user FOREIGN KEY (ds_id) REFERENCES ds(id);


--
-- TOC entry 3706 (class 2606 OID 253856)
-- Name: fk_ds_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser
    ADD CONSTRAINT fk_ds_user FOREIGN KEY (ds_id) REFERENCES ds(id);


--
-- TOC entry 3678 (class 2606 OID 196554)
-- Name: fk_gn_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT fk_gn_user FOREIGN KEY (gn_id) REFERENCES gn(id);


--
-- TOC entry 3707 (class 2606 OID 253861)
-- Name: fk_gn_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser
    ADD CONSTRAINT fk_gn_user FOREIGN KEY (gn_id) REFERENCES gn(id);


--
-- TOC entry 3690 (class 2606 OID 196489)
-- Name: fk_incident_disaster_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fk_incident_disaster_type FOREIGN KEY (disaster_type) REFERENCES disaster_type(id);


--
-- TOC entry 3699 (class 2606 OID 237471)
-- Name: fk_incident_disaster_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY garbled_incident
    ADD CONSTRAINT fk_incident_disaster_type FOREIGN KEY (disaster_type) REFERENCES disaster_type(id);


--
-- TOC entry 3692 (class 2606 OID 196494)
-- Name: fk_incident_photo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT fk_incident_photo FOREIGN KEY (incident_id) REFERENCES incident(id);


--
-- TOC entry 3688 (class 2606 OID 196479)
-- Name: fk_layer_map_layer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY map_layer
    ADD CONSTRAINT fk_layer_map_layer FOREIGN KEY (layer_id) REFERENCES layer(id);


--
-- TOC entry 3689 (class 2606 OID 196484)
-- Name: fk_layer_style; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY style
    ADD CONSTRAINT fk_layer_style FOREIGN KEY (layer_id) REFERENCES layer(id);


--
-- TOC entry 3687 (class 2606 OID 196474)
-- Name: fk_map_map_layer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY map_layer
    ADD CONSTRAINT fk_map_map_layer FOREIGN KEY (map_id) REFERENCES map(id);


--
-- TOC entry 3696 (class 2606 OID 205064)
-- Name: fk_province_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district
    ADD CONSTRAINT fk_province_district FOREIGN KEY (province_id) REFERENCES province(id);


--
-- TOC entry 3675 (class 2606 OID 196539)
-- Name: fk_province_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT fk_province_user FOREIGN KEY (province_id) REFERENCES province(id);


--
-- TOC entry 3708 (class 2606 OID 253866)
-- Name: fk_province_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser
    ADD CONSTRAINT fk_province_user FOREIGN KEY (province_id) REFERENCES province(id);


--
-- TOC entry 3700 (class 2606 OID 262078)
-- Name: fk_user_gincident; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY garbled_incident
    ADD CONSTRAINT fk_user_gincident FOREIGN KEY ("user") REFERENCES users_myuser(id);


--
-- TOC entry 3686 (class 2606 OID 196514)
-- Name: fk_user_layer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY layer
    ADD CONSTRAINT fk_user_layer FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- TOC entry 3685 (class 2606 OID 196509)
-- Name: fk_user_map; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY map
    ADD CONSTRAINT fk_user_map FOREIGN KEY (user_id) REFERENCES auth_user(id);


--
-- TOC entry 3693 (class 2606 OID 262062)
-- Name: fk_user_validation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY validation
    ADD CONSTRAINT fk_user_validation FOREIGN KEY (user_id) REFERENCES users_myuser(id);


--
-- TOC entry 3691 (class 2606 OID 196575)
-- Name: fk_validation_incident; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fk_validation_incident FOREIGN KEY (validation_id) REFERENCES validation(id);


--
-- TOC entry 3697 (class 2606 OID 196570)
-- Name: fk_validation_social_media_incident; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_media_incident
    ADD CONSTRAINT fk_validation_social_media_incident FOREIGN KEY (validation_id) REFERENCES validation(id);


--
-- TOC entry 3710 (class 2606 OID 262035)
-- Name: myuser_user_user_permissions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions
    ADD CONSTRAINT myuser_user_user_permissions FOREIGN KEY (myuser_id) REFERENCES users_myuser(id);


--
-- TOC entry 3698 (class 2606 OID 221072)
-- Name: tastypie_apikey_user_id_ffeb4840e0b406b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_user_id_ffeb4840e0b406b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3701 (class 2606 OID 245644)
-- Name: users_cfruser_district_id_1b584f82facfff9a_fk_district_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_cfruser
    ADD CONSTRAINT users_cfruser_district_id_1b584f82facfff9a_fk_district_id FOREIGN KEY (district_id) REFERENCES district(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3702 (class 2606 OID 245649)
-- Name: users_cfruser_ds_id_318d2d0c0c78ea83_fk_ds_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_cfruser
    ADD CONSTRAINT users_cfruser_ds_id_318d2d0c0c78ea83_fk_ds_id FOREIGN KEY (ds_id) REFERENCES ds(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3703 (class 2606 OID 245654)
-- Name: users_cfruser_gn_id_12b90be8f839d631_fk_gn_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_cfruser
    ADD CONSTRAINT users_cfruser_gn_id_12b90be8f839d631_fk_gn_id FOREIGN KEY (gn_id) REFERENCES gn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3704 (class 2606 OID 245659)
-- Name: users_cfruser_province_id_390fe687ad196584_fk_province_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_cfruser
    ADD CONSTRAINT users_cfruser_province_id_390fe687ad196584_fk_province_id FOREIGN KEY (province_id) REFERENCES province(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3711 (class 2606 OID 262052)
-- Name: users_myuser_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups
    ADD CONSTRAINT users_myuser_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3712 (class 2606 OID 262057)
-- Name: users_myuser_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups
    ADD CONSTRAINT users_myuser_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (myuser_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-19 14:32:45 IST

--
-- PostgreSQL database dump complete
--

