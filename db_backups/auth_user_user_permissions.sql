--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-18 12:49:09 IST

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
-- TOC entry 212 (class 1259 OID 183123)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_myuser_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE users_myuser_user_permissions OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 183121)
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
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_myuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_myuser_user_permissions_id_seq OWNED BY users_myuser_user_permissions.id;


--
-- TOC entry 3456 (class 2604 OID 183126)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('users_myuser_user_permissions_id_seq'::regclass);


--
-- TOC entry 3587 (class 0 OID 183123)
-- Dependencies: 212
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_myuser_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_myuser_user_permissions_id_seq', 25, true);


--
-- TOC entry 3460 (class 2606 OID 183128)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions
    ADD CONSTRAINT users_myuser_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3462 (class 2606 OID 183130)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions
    ADD CONSTRAINT users_myuser_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 3457 (class 1259 OID 183174)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_myuser_user_permissions_8373b171 ON users_myuser_user_permissions USING btree (permission_id);


--
-- TOC entry 3458 (class 1259 OID 183173)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_myuser_user_permissions_e8701ad4 ON users_myuser_user_permissions USING btree (user_id);


--
-- TOC entry 3464 (class 2606 OID 183168)
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3463 (class 2606 OID 183163)
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_myuser_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2016-09-18 12:49:09 IST

--
-- PostgreSQL database dump complete
--

