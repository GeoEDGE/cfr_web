--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-19 09:27:09 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 258
-- Name: incident_language_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE incident_language_translation_id_seq OWNED BY incident_language_translation.id;


--
-- TOC entry 3469 (class 2604 OID 262072)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_language_translation ALTER COLUMN id SET DEFAULT nextval('incident_language_translation_id_seq'::regclass);


--
-- TOC entry 3594 (class 0 OID 262069)
-- Dependencies: 259
-- Data for Name: incident_language_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY incident_language_translation (id, language, disasters, gps_location, name, contact_no, disaster_type, description, images) FROM stdin;
9	si	\N	\N	\N	\N	\N	\N	\N
10	ta	\N	\N	\N	\N	\N	\N	\N
8	en	Disasters	GPS location	Name	Contact No	Disaster type	Description	Images
\.


--
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 258
-- Name: incident_language_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('incident_language_translation_id_seq', 10, true);


--
-- TOC entry 3471 (class 2606 OID 262077)
-- Name: incident_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_language_translation
    ADD CONSTRAINT incident_lang_pkey PRIMARY KEY (id);


-- Completed on 2016-09-19 09:27:09 IST

--
-- PostgreSQL database dump complete
--

