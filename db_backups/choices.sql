--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-26 10:27:06 IST

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
-- TOC entry 262 (class 1259 OID 294848)
-- Name: close_end_qs_choices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE close_end_qs_choices (
    id integer NOT NULL,
    choice character varying(1000),
    question_id integer
);


ALTER TABLE close_end_qs_choices OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 294854)
-- Name: close_end_qs_choices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE close_end_qs_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE close_end_qs_choices_id_seq OWNER TO postgres;

--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 263
-- Name: close_end_qs_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE close_end_qs_choices_id_seq OWNED BY close_end_qs_choices.id;


--
-- TOC entry 3486 (class 2604 OID 294856)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs_choices ALTER COLUMN id SET DEFAULT nextval('close_end_qs_choices_id_seq'::regclass);


--
-- TOC entry 3611 (class 0 OID 294848)
-- Dependencies: 262
-- Data for Name: close_end_qs_choices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY close_end_qs_choices (id, choice, question_id) FROM stdin;
1	0 - 0.3 meters (ankle deep)	2
2	0.3 - 0.6 meters (thigh deep)	2
3	0.6 - 1 meter (waste deep)	2
4	1 - 1.5 meter (chest / shoulder / neck deep)	2
5	More than 1.5 meters (neck deep or above)	2
12	0.3 - 0.6 meters (thigh deep)	3
13	0.6 - 1 meter (waste deep)	3
14	1 - 1.5 meter (chest / neck deep)	3
15	More than 1.5 meters (greater than neck deep)	3
19	Fever	5
20	Loss of hunger	5
21	Loss of fluids / diarrhea	5
22	Weakness, inability to move	5
29	Strong -- trees are blowing over, unsecured roofs are coming off, objects are blown, difficult to walk	6
30	Very strong -- impossible to walk, major building damages, extremely dangerous	6
6	0 - 0.3 meters (ankle deep)	1
7	0.3 - 0.6 meters (thigh deep)	1
8	0.6 - 1 meter (waste deep)	1
9	1 - 1.5 meter (chest / shoulder / neck deep)	1
10	More than 1.5 meters (neck deep or above)	1
11	0 - 0.3 meters (ankle deep)	3
28	Medium -- trees are blowing strongly in the wind, roofs are shaking	6
31	Very light -- wouldn't wake someone up	10
32	Light - enough to wake you up	10
33	Medium - scary, objects fell off shelves, some injuries, no real damages	10
34	Heavy - damages, injuries	10
35	Extreme - major building damages to some structures, many injuries, possible deaths	10
36	Catastrophic - widespread destruction, many injuries, many deaths	10
37	People	11
38	Buildings	11
39	Property (cars, etc.)	11
40	Livestock	11
41	Crops	11
27	Light -- like a normal thunderstorm	6
23	0 - 1 meters	8
24	1 - 3 meters	8
25	3 - 5 meters	8
26	Greater than 5 meters	8
42	Yes	13
16	Difficulty breathing	15
17	Burning on skin	15
18	Trouble using eyes	15
43	No	13
\.


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 263
-- Name: close_end_qs_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('close_end_qs_choices_id_seq', 43, true);


--
-- TOC entry 3488 (class 2606 OID 294858)
-- Name: pkey_qs_choice; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs_choices
    ADD CONSTRAINT pkey_qs_choice PRIMARY KEY (id);


--
-- TOC entry 3489 (class 2606 OID 294859)
-- Name: fkey_disaster_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs_choices
    ADD CONSTRAINT fkey_disaster_type FOREIGN KEY (question_id) REFERENCES close_end_qs(id);


-- Completed on 2016-09-26 10:27:06 IST

--
-- PostgreSQL database dump complete
--

