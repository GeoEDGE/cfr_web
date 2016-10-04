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
-- Name: district; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE district (
    id integer NOT NULL,
    name character varying(255),
    province_id integer
);


ALTER TABLE public.district OWNER TO postgres;

--
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.district_id_seq OWNER TO postgres;

--
-- Name: district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE district_id_seq OWNED BY district.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district ALTER COLUMN id SET DEFAULT nextval('district_id_seq'::regclass);


--
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
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('district_id_seq', 26, true);


--
-- Name: district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);


--
-- Name: fk_province_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY district
    ADD CONSTRAINT fk_province_district FOREIGN KEY (province_id) REFERENCES province(id);


--
-- PostgreSQL database dump complete
--

