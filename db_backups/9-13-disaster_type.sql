--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: disaster_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disaster_type (
    id integer NOT NULL,
    english character varying(1000),
    sinhala character varying(1000),
    tamil character varying(1000)
);


ALTER TABLE public.disaster_type OWNER TO postgres;

--
-- Name: disaster_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disaster_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disaster_type_id_seq OWNER TO postgres;

--
-- Name: disaster_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disaster_type_id_seq OWNED BY disaster_type.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disaster_type ALTER COLUMN id SET DEFAULT nextval('disaster_type_id_seq'::regclass);


--
-- Data for Name: disaster_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disaster_type (id, english, sinhala, tamil) FROM stdin;
4	Tsunamis		
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
\.


--
-- Name: disaster_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('disaster_type_id_seq', 11, true);


--
-- Name: disaster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY disaster_type
    ADD CONSTRAINT disaster_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

