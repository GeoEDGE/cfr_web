--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-18 14:15:21 IST

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
-- TOC entry 210 (class 1259 OID 183113)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_myuser_groups (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE users_myuser_groups OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 183111)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_myuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_myuser_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_myuser_groups_id_seq OWNED BY users_myuser_groups.id;


--
-- TOC entry 3458 (class 2604 OID 183116)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups ALTER COLUMN id SET DEFAULT nextval('users_myuser_groups_id_seq'::regclass);


--
-- TOC entry 3589 (class 0 OID 183113)
-- Dependencies: 210
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_myuser_groups_id_seq', 1, false);


--
-- TOC entry 3462 (class 2606 OID 183118)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups
    ADD CONSTRAINT users_myuser_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3464 (class 2606 OID 183120)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups
    ADD CONSTRAINT users_myuser_groups_user_id_group_id_key UNIQUE (myuser_id, group_id);


--
-- TOC entry 3459 (class 1259 OID 183162)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_myuser_groups_0e939a4f ON users_myuser_groups USING btree (group_id);


--
-- TOC entry 3460 (class 1259 OID 183161)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_myuser_groups_e8701ad4 ON users_myuser_groups USING btree (myuser_id);


--
-- TOC entry 3466 (class 2606 OID 183156)
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups
    ADD CONSTRAINT users_myuser_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3465 (class 2606 OID 183151)
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_groups
    ADD CONSTRAINT users_myuser_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (myuser_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2016-09-18 14:15:21 IST

--
-- PostgreSQL database dump complete
--

