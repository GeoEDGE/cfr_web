--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-29 02:40:09 IST

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
-- TOC entry 265 (class 1259 OID 302972)
-- Name: incident_user_choices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE incident_user_choices (
    id integer NOT NULL,
    question_id integer,
    choice_id integer,
    incident_id integer,
    text_input character varying(255)
);


ALTER TABLE incident_user_choices OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 302970)
-- Name: incident_user_choices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE incident_user_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incident_user_choices_id_seq OWNER TO postgres;

--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 264
-- Name: incident_user_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE incident_user_choices_id_seq OWNED BY incident_user_choices.id;


--
-- TOC entry 3486 (class 2604 OID 302975)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_user_choices ALTER COLUMN id SET DEFAULT nextval('incident_user_choices_id_seq'::regclass);


--
-- TOC entry 3614 (class 0 OID 302972)
-- Dependencies: 265
-- Data for Name: incident_user_choices; Type: TABLE DATA; Schema: public; Owner: postgres
--
--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 264
-- Name: incident_user_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('incident_user_choices_id_seq', 60, true);


--
-- TOC entry 3488 (class 2606 OID 302977)
-- Name: pkey_user_choice; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_user_choices
    ADD CONSTRAINT pkey_user_choice PRIMARY KEY (id);


--
-- TOC entry 3489 (class 2606 OID 302978)
-- Name: fkey_inc_choice_qs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_user_choices
    ADD CONSTRAINT fkey_inc_choice_qs FOREIGN KEY (question_id) REFERENCES close_end_qs(id);


--
-- TOC entry 3491 (class 2606 OID 302988)
-- Name: fkey_user_choice_incident; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_user_choices
    ADD CONSTRAINT fkey_user_choice_incident FOREIGN KEY (incident_id) REFERENCES incident(id);


--
-- TOC entry 3490 (class 2606 OID 302983)
-- Name: incident_user_choice_choice; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_user_choices
    ADD CONSTRAINT incident_user_choice_choice FOREIGN KEY (choice_id) REFERENCES close_end_qs_choices(id);


-- Completed on 2016-09-29 02:40:09 IST

--
-- PostgreSQL database dump complete
--

