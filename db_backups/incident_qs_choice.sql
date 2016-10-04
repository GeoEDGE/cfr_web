--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-22 21:06:45 IST

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
    ds character varying(255),
    is_validated boolean
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
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 224
-- Name: incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE incident_id_seq OWNED BY incident.id;


--
-- TOC entry 3486 (class 2604 OID 237434)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident ALTER COLUMN id SET DEFAULT nextval('incident_id_seq'::regclass);


--
-- TOC entry 3615 (class 0 OID 188325)
-- Dependencies: 225
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY incident (id, name, latitude, longitude, disaster_type, contact_no, address, synced_date, reported_date, description, validation_id, district, province, ds, is_validated) FROM stdin;
6	Sachie	7.25129999999999963	80.3464000000000027	1	0788550013	907/8,Udawaththa Rd,malabe	2016-09-05 09:14:33	2016-09-05 09:14:33	test	7	Kegalle	Sabaragamuwa	\N	t
110	\N	79.8912703999999962	6.90389059999999954	6	\N	Nawala 2nd Ln, Sri Jayawardenepura Kotte, Sri Lanka	\N	2016-09-22 08:27:10.798665	\N	\N	Colombo	Western	\N	f
111	\N	7.4531987065290366	80.1239776611328125	11	\N	Muruthenge Ruggassagaraya Rd, Sri Lanka	\N	2016-09-22 09:00:36.104442	\N	\N	Kurunegala	NorthWestern	\N	f
112	\N	6.90389059999999954	79.8912703999999962	7	\N	Nawala 2nd Ln, Sri Jayawardenepura Kotte, Sri Lanka	\N	2016-09-22 09:36:40.088004	\N	\N	Colombo	Western	\N	f
113	\N	7.76899488149274475	80.0580596923827983	8	\N	Unnamed Road, Sri Lanka	\N	2016-09-22 09:41:00.956253	\N	\N	Kurunegala	NorthWestern	\N	f
114	\N	8.09543076172897713	80.2118682861327983	4	\N	Unnamed Road, Sri Lanka	\N	2016-09-22 09:43:50.862071	\N	\N	Kurunegala	NorthWestern	\N	f
115	\N	7.56149531968904398	79.8046982288360596	7	\N	Chilaw - Colombo Main Rd, Chilaw, Sri Lanka	\N	2016-09-22 09:59:01.023016	\N	\N	Puttalam	NorthWestern	\N	f
11	Amith	6.08582999999999963	80.5663899999999984	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Matara	Southern	\N	\N
10	Waruna	7.29638999999999971	80.6350000000000051	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Kandy	Central	\N	\N
8	Dilini	6.69360999999999962	80.3863900000000058	3	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Ratnapura	Sabaragamuwa	\N	\N
7	Naduni	8.56667000000000023	81.2333299999999952	5	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Trincomalee	Eastern	\N	\N
13	Amith	9.66666999999999987	800	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Jaffna	Northern	\N	\N
17	nadini	6.93444000000000038	79.8427800000000047	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Colombo	Western	\N	\N
16	Dhanu	6.03500000000000014	80.2158299999999969	2	0788550012	907/8	2016-09-05 09:14:33	2016-09-05 09:14:33	Test one	\N	Galle	Southern	\N	\N
14	Amith	6.12305999999999973	81.1205599999999976	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Hambantota	Southern	\N	\N
12	Amith	6.58694000000000024	79.9602799999999974	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-05 09:14:33	test	\N	Kalutara	Western	\N	\N
21	Waeer	7.30111000000000043	81.6749999999999972	2	0788550078	Lihini Uyana, Malabe, Sri Lanka	2016-09-12 01:27:10	2016-09-12 01:27:10	Test four	\N	Ampara	Eastern	\N	\N
69		6.90192829999999979	79.8937832000000014	6		535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 09:00:52.76	2016-09-12 09:00:52.76	Ccf	\N	Matara	Southern	\N	\N
70	Kasuntr	6.90186079999999968	79.8938062000000002	1	0788667789	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 11:44:14.097	2016-09-12 11:44:14.097	Sdxdd	\N	Matara	Southern	\N	\N
75	Imashi	6.90188039999999958	79.8937985999999967	10	0677891919	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 12:26:02	2016-09-12 12:26:02	Hdsjaja	\N	Colombo	Western	\N	\N
73	Dha	6.90190160000000041	79.8937714000000057	11	0114567896	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 11:55:11	2016-09-12 11:55:11	Bsnsn	\N	Colombo	Western	\N	\N
72	Xfbfb	7.09334600000000037	79.9937730000000045	10	0112346667	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 11:51:37	2016-09-12 11:51:37	Fbbfb	\N	Gampaha	Western	\N	\N
71	Zxxc	7.09334600000000037	79.9937730000000045	3	0112560101	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 11:46:43	2016-09-12 11:46:43	Xdfff	\N	Gampaha	Western	\N	\N
74	Dasun	6.90190199999999976	79.8937739999999934	2	0788660013	535 Nawala Rd, Sri Jayawardenepura Kotte, Sri Lanka	2016-09-12 12:17:10	2016-09-12 12:17:10	Dgshjsjs	\N	Colombo	Western	\N	\N
15	Amith	7.06167000000000034	79.9666699999999935	2	0788550013	No 178	2016-09-05 09:14:33	2016-09-01 09:14:33	test	\N	Gampaha	Western	\N	\N
\.


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 224
-- Name: incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('incident_id_seq', 115, true);


--
-- TOC entry 3488 (class 2606 OID 188333)
-- Name: incident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT incident_pkey PRIMARY KEY (id);


--
-- TOC entry 3490 (class 2606 OID 270203)
-- Name: unique_validation_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT unique_validation_id UNIQUE (validation_id);


--
-- TOC entry 3491 (class 2606 OID 196489)
-- Name: fk_incident_disaster_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fk_incident_disaster_type FOREIGN KEY (disaster_type) REFERENCES disaster_type(id);


--
-- TOC entry 3492 (class 2606 OID 196575)
-- Name: fk_validation_incident; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident
    ADD CONSTRAINT fk_validation_incident FOREIGN KEY (validation_id) REFERENCES validation(id);


-- Completed on 2016-09-22 21:06:45 IST

--
-- PostgreSQL database dump complete
--

