--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-29 02:38:42 IST

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
-- TOC entry 260 (class 1259 OID 294832)
-- Name: close_end_qs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE close_end_qs (
    id integer NOT NULL,
    disaster_type integer,
    question character varying(1000),
    field_name character varying(255),
    field_type character varying(255),
    si character varying(1000),
    ta character varying(1000)
);


ALTER TABLE close_end_qs OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 294838)
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
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 261
-- Name: close_end_qs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE close_end_qs_id_seq OWNED BY close_end_qs.id;


--
-- TOC entry 3486 (class 2604 OID 294840)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs ALTER COLUMN id SET DEFAULT nextval('close_end_qs_id_seq'::regclass);


--
-- TOC entry 3611 (class 0 OID 294832)
-- Dependencies: 260
-- Data for Name: close_end_qs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY close_end_qs (id, disaster_type, question, field_name, field_type, si, ta) FROM stdin;
1	5	How high is the lanslide?	landslide_height	select	නාය යෑම් කොපමණ ඉහළ ද?	நிலச்சரிவு எப்படி அதிகமாக உள்ளது?
2	2	How high is the flood?	flood_height	select	ගංවතුර කොපමණ ඉහළ ද?	வெள்ள எப்படி அதிகமாக உள்ளது?
3	4	How high was the tsunami?	tsunami_height	select	සුනාමි කොපමණ ඉහළ ද?	சுனாமி எப்படி அதிகமாக இருந்தது?
5	10	Symptoms	epidemic_symptom	multiple_choices	රෝග ලක්ෂණ	அறிகுறிகள்
6	1	How long since last rainfall?	drought_last_rainfall	text	කොපමණ කල් පසුගිය වර්ෂාපතනය සිට?	எவ்வளவு காலத்திற்கு நீடிக்கும் மழை பின்னர்?
8	8	How high are the fires?	fire_height	select	ගිනි කොපමණ ඉහළ ද?	தீ எப்படி அதிகமாக இருக்கும்?
10	3	How strong did it feel?	earthquake_strength	select	එය කොතරම් ශක්තිමත් හැඟුණේ කොහොමද?	அது எப்படி வலுவான உணர்ந்தீர்கள்?
11	12	What did the attack effect?	elephant_attack	multiple_choices	ප්‍රහාරයෙන් හානි වුයේ  මොනවටද ?	என்ன தாக்குதல் விளைவு செய்தார்?
13	2	Is the flood continuing to rise?	flood_continuity	boolean	ගංවතුර ඉහළ යමින් තිබෙන්නේ කෙසේද?	வெள்ள தொடர்ந்து ஏறி வருகிறது?
14	6	How strong were (are) the winds?	cyclone_wind_strength	select	කොතරම් ශක්තිමත් සුළං ද?	எப்படி வலுவான (இருக்கும்) செய்யப்பட்டனர் காற்று?
15	11	What sensations do you have ?	chemical_sensation	multiple_choices	ඔබට දැනෙන්නේ මොනවද ?	நீங்கள் என்ன உணர்வுடன் வேண்டும்?
\.


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 261
-- Name: close_end_qs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('close_end_qs_id_seq', 15, true);


--
-- TOC entry 3488 (class 2606 OID 294842)
-- Name: pkey_qs_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs
    ADD CONSTRAINT pkey_qs_id PRIMARY KEY (id);


--
-- TOC entry 3489 (class 2606 OID 294843)
-- Name: fkey_disaster_qs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY close_end_qs
    ADD CONSTRAINT fkey_disaster_qs FOREIGN KEY (disaster_type) REFERENCES disaster_type(id);


-- Completed on 2016-09-29 02:38:42 IST

--
-- PostgreSQL database dump complete
--

