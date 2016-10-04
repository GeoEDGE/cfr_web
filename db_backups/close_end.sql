--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-22 10:08:11 IST

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
-- TOC entry 260 (class 1259 OID 278394)
-- Name: close_end_qs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE close_end_qs (
    id integer NOT NULL,
    disaster_type integer,
    question character varying(1000),
    field_name character varying(255),
    field_type character varying(255)
);


ALTER TABLE close_end_qs OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 286586)
-- Name: close_end_qs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE close_end_qs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE close_end_qs_id_seq OWNER TO postgres;

--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 261
-- Name: close_end_qs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE close_end_qs_id_seq OWNED BY close_end_qs.id;


--
-- TOC entry 3475 (class 2604 OID 286588)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs ALTER COLUMN id SET DEFAULT nextval('close_end_qs_id_seq'::regclass);


--
-- TOC entry 3600 (class 0 OID 278394)
-- Dependencies: 260
-- Data for Name: close_end_qs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY close_end_qs (id, disaster_type, question, field_name, field_type) FROM stdin;
\.


--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 261
-- Name: close_end_qs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('close_end_qs_id_seq', 1, false);


--
-- TOC entry 3477 (class 2606 OID 286601)
-- Name: pkey_qs_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs
    ADD CONSTRAINT pkey_qs_id PRIMARY KEY (id);


--
-- TOC entry 3478 (class 2606 OID 286595)
-- Name: fkey_disaster_qs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs
    ADD CONSTRAINT fkey_disaster_qs FOREIGN KEY (disaster_type) REFERENCES disaster_type(id);


-- Completed on 2016-09-22 10:08:11 IST

--
-- PostgreSQL database dump complete
--

