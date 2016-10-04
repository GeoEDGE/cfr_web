--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-29 11:27:15 IST

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
    incident_report_header character varying(255),
    gps_location character varying(255),
    name character varying(255),
    contact_no character varying(255),
    disaster_type character varying(255),
    description character varying(255),
    images character varying(255),
    select_disaster_type character varying(255),
    please_select character varying(255),
    incident_report_quote character varying(1000),
    inform_disaster character varying(255),
    click_to_get_location character varying(255),
    data_collection_form character varying(255),
    submit character varying(100),
    cancel character varying(100),
    disaster_error_msg character varying(255),
    location_error_msg character varying(255),
    contact_no_validity_msg character varying(255),
    incident character varying(50),
    successful_msg character varying(100),
    ok character varying(10),
    drop_down_select_display character varying(50)
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
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 258
-- Name: incident_language_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE incident_language_translation_id_seq OWNED BY incident_language_translation.id;


--
-- TOC entry 3486 (class 2604 OID 262072)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_language_translation ALTER COLUMN id SET DEFAULT nextval('incident_language_translation_id_seq'::regclass);


--
-- TOC entry 3611 (class 0 OID 262069)
-- Dependencies: 259
-- Data for Name: incident_language_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY incident_language_translation (id, language, incident_report_header, gps_location, name, contact_no, disaster_type, description, images, select_disaster_type, please_select, incident_report_quote, inform_disaster, click_to_get_location, data_collection_form, submit, cancel, disaster_error_msg, location_error_msg, contact_no_validity_msg, incident, successful_msg, ok, drop_down_select_display) FROM stdin;
9	si	ඔන්ලයින් ආපදා වාර්තාකරණ ක්රමවේදය	ජීපීඑස් ස්ථානය	නම	ඇමතුම් අංකය	ආපදා වර්ගය	විස්තර	රූප	ආපදා වර්ගය තෝරන්න	කරුණාකර තෝරන්න	ඔබේ ජාතිය විපත් වලින් ආරක්ෂා කරන්න. එය ඔබගේ පරම වගකීමක්.	ආපදාවක් දැනුම් දෙන්න	ස්ථානය ලබා ගන්න මෙහි ක්ලික් කරන්න	දත්ත එකතුව ආකෘතිය	යොමු කරන්න	හිස් කරන්න	කරුණාකර ආපදා වර්ගය තෝරන්න	ඔබගේ ස්ථානය කරුණාකර තෝරන්න	කරුණාකර නිවැරදි  ඇමතුම් අංකය ඇතුලත් කරන්න 	සිද්ධිය	සිදුවීම සාර්ථකව යොමු කරන ලදී.	හරි	\N
8	en	Online Disaster Reporting System	GPS location	Name	Contact No	Disaster type	Description	Images	Select Disaster Type	Please Select	keep your nation safe from the disasters. it's your absolute responsibility.	Inform Disaster	Click Here to Get Location	Data Collection Form	Submit	Cancel	Please select the Disaster Type	Please select your location	Please select a valid phone number	Incident	Incident saved successfully.	OK	\N
10	ta	ஆன்லைன் அனர்த்த அறிக்கை அமைப்பு	ஜிபிஎஸ் இடம்	பெயர்	தொடர்பு எண்	அனர்த்த வகை	விளக்கம்	படங்கள்	அனர்த்த வகை தேர்வு	தயவு செய்து தேர்வு செய்யவும்	உங்கள் நாட்டின் பேரழிவுகளில் இருந்து பாதுகாப்பாக வைத்து. அது உங்கள் முழு பொறுப்பு.	அனர்த்த அறிவிப்பீராக	இடம் பெற இங்கே கிளிக் செய்யவும்	தரவு சேகரிப்பு படிவம்	விண்ணப்பிக்க	தெளிவு	தயவு செய்து பேரழிவு வகை தேர்வு	உங்கள் இடம் தேர்ந்தெடுக்கவும்	சரியான எண்ணிக்கை அழைப்புகள் 	சம்பவம்	வெற்றிகரமான குறிப்பிடப்படுகிறது.	சரி	\N
\.


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 258
-- Name: incident_language_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('incident_language_translation_id_seq', 10, true);


--
-- TOC entry 3488 (class 2606 OID 262077)
-- Name: incident_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incident_language_translation
    ADD CONSTRAINT incident_lang_pkey PRIMARY KEY (id);


-- Completed on 2016-09-29 11:27:16 IST

--
-- PostgreSQL database dump complete
--

