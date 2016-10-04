--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-09-29 02:39:46 IST

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
    question_id integer,
    si character varying(1000),
    ta character varying(1000)
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

COPY close_end_qs_choices (id, choice, question_id, si, ta) FROM stdin;
42	Yes	13	ඔව්	ஆம்
4	1 - 1.5 meter (chest / shoulder / neck deep)	2	1 - 1.5 මීටර් (පපුව / උරහිස / ගෙල ගැඹුරු)	1.5 மீட்டர் (கழுத்து மேலே ஆழமான அல்லது)
30	Very strong -- impossible to walk, major building damages, extremely dangerous	6	ඉතා ශක්තිමත් -, ගමන් කිරීමට නොහැකි ප්රධාන ගොඩනැගිල්ල හානි ඉතා භයානක	மிகவும் வலுவான - சாத்தியமற்றது நடக்க, முக்கிய கட்டிடம் சேதம், மிகவும் ஆபத்தானது
13	0.6 - 1 meter (waste deep)	3	0.6 - 1 මීටර් (ඉණ ගැඹුරු) 	0.6 - 1 மீட்டர் (இடுப்பு ஆழமான)
6	0 - 0.3 meters (ankle deep)	1	0 - 0.3 මීටර් (වළලුකර ගැඹුරු)	0 - 0.3 மீட்டர் (கணுக்கால் ஆழமான)
9	1 - 1.5 meter (chest / shoulder / neck deep)	1	1 - 1.5 මීටර් (පපුව / උරහිස / ගෙල ගැඹුරු)	1.5 மீட்டர் (கழுத்து மேலே ஆழமான அல்லது)
16	Difficulty breathing	15	ශ්වසන අපහසුතා	சுவாசித்தலில் சிரமம்
10	More than 1.5 meters (neck deep or above)	1	1.5 කට වඩා වැඩි මීටර් (ගැඹුරු ) 	1.5 மீட்டர் (கழுத்து மேலே ஆழமான அல்லது)
26	Greater than 5 meters	8	මීටර් 5 ට වඩා වැඩි	கிரேட்டர் விட 5 மீட்டர்
25	3 - 5 meters	8	මීටර් 5 - 3	3 - 5 மீட்டர்
23	0 - 1 meters	8	0 - 1 මීටර්	0 - 1 மீட்டர்
14	1 - 1.5 meter (chest / neck deep)	3	1 - 1.5 මීටර් (පපුව / ගෙල ගැඹුරු)	1 - 1.5 மீட்டர் (மார்பு / கழுத்து ஆழமான)
43	No	13	නැත	இல்லை
11	0 - 0.3 meters (ankle deep)	3	0 - 0.3 මීටර් (වළලුකර ගැඹුරු)	0 - 0.3 மீட்டர் (கணுக்கால் ஆழமான)
1	0 - 0.3 meters (ankle deep)	2	0 - 0.3 මීටර් (වළලුකර ගැඹුරු)	0 - 0.3 மீட்டர் (கணுக்கால் ஆழமான)
2	0.3 - 0.6 meters (thigh deep)	2	0.3 - මීටර් 0.6 (ගැඹුරු කළව)	0.3 - 0.6 மீட்டர்
17	Burning on skin	15	සම මත ගිනි	தோலில் எரியும்
7	0.3 - 0.6 meters (thigh deep)	1	0.3 - මීටර් 0.6 (ගැඹුරු කළව)	0.3 - 0.6 மீட்டர்
12	0.3 - 0.6 meters (thigh deep)	3	0.3 - මීටර් 0.6 (ගැඹුරු කළව)	0.3 - 0.6 மீட்டர்
40	Livestock	11	ගොවිපොළක සතුන්	கால்நடை
15	More than 1.5 meters (greater than neck deep)	3	1.5 කට වඩා වැඩි මීටර් (ගැඹුරු ගෙල වඩා විශාල)	1.5 மீட்டர் (அதிக கழுத்தில் ஆழமான விட)
24	1 - 3 meters	8	මීටර් 3 - 1	1 - 3 மீட்டர்
5	More than 1.5 meters (neck deep or above)	2	1.5 කට වඩා වැඩි මීටර් (ගැඹුරු ) 	1.5 மீட்டர் (கழுத்து மேலே ஆழமான அல்லது)
3	0.6 - 1 meter (waste deep)	2	0.6 - 1 මීටර් (ඉණ ගැඹුරු) 	0.6 - 1 மீட்டர் (இடுப்பு ஆழமான)
19	Fever	5	උණ	காய்ச்சல்
8	0.6 - 1 meter (waste deep)	1	0.6 - 1 මීටර් (ඉණ ගැඹුරු) 	0.6 - 1 மீட்டர் (இடுப்பு ஆழமான)
20	Loss of hunger	5	බඩගින්න නොදැනීම	பசி இழப்பு
18	Trouble using eyes	15	ඇස් භාවිතා කරදර	சிக்கல் பயன்படுத்தி கண்கள்
21	Loss of fluids / diarrhea	5	විජලනය / පාචනය	திரவங்கள் இழப்பு / வயிற்றுப்போக்கு
27	Light -- like a normal thunderstorm	6	ආලෝක - සාමාන්ය ගිගුරුම් සහිත වගේ	ஒளி - ஒரு சாதாரண இடியுடன் கூடிய மழை போன்ற
22	Weakness, inability to move	5	දුර්වල ගමන් කිරීමට නොහැකි වීම	பலவீனம், இயலாமை நகர்த்த
28	Medium -- trees are blowing strongly in the wind, roofs are shaking	6	මධ්යම - ගස් වහල වෙව්ලන්නේ, සුළඟ ගැන දැඩි හමන ඇත	நடுத்தர - ​​மரங்கள் காற்றினால் கடுமையாக வீசுகிறது, கூரைகள் ஆடிக்கொண்டிருக்கிறது
29	Strong -- trees are blowing over, unsecured roofs are coming off, objects are blown, difficult to walk	6	ශක්තිමත් - ගස් පුරා හමන අතර, අනාරක්ෂිත වහලයන් ගැලවී එනවා, වස්තූන් ගමන් කිරීමට මවනවා, දුෂ්කර	வலுவான - மரங்கள், பாதுகாப்பற்ற கூரைகள் ஆஃப் வரும், பொருட்களை சேதமடைந்தது மீது வீசுகிறது, கடினமான நடக்க
32	Light - enough to wake you up	10	ආලෝක - ඔබ අවදි කිරීමට තරම්	ஒளி - நீங்கள் எழுந்து போதுமான
34	Heavy - damages, injuries	10	බැර - හානි, තුවාල	ஹெவி - சேதம், காயங்கள்
37	People	11	මහජන	மக்கள்
38	Buildings	11	ගොඩනැගිලි	கட்டிடங்கள்
39	Property (cars, etc.)	11	දේපල (මෝටර් රථ, ආදිය)	சொத்து (கார்கள், முதலியன)
41	Crops	11	බෝග	பயிர்கள்
31	Very light -- wouldn't wake someone up	10	ඉතා සැහැල්ලු - කෙනෙකු අවදි නැහැ	மிகவும் ஒளி - யாரோ எழுந்திருக்க முடியாது
33	Medium - scary, objects fell off shelves, some injuries, no real damages	10	මධ්යම - බය හිතෙන, වස්තූන් කපා රාක්ක, සමහර තුවාල, කිසිදු සැබෑ හානි වැටී	நடுத்தர - ​​பயங்கரமான, பொருட்களை அலமாரிகள், சில காயங்கள், எந்த உண்மையான சேதம் விழுந்தது
35	Extreme - major building damages to some structures, many injuries, possible deaths	10	අන්ත - සමහර ව්යුහයන් ප්රධාන ගොඩනැගිල්ල හානි, බොහෝ තුවාල, හැකි මරණ	எக்ஸ்ட்ரீம் - சில கட்டமைப்புகள் முக்கிய கட்டிடம் சேதம், பல காயங்கள், இறப்பான
36	Catastrophic - widespread destruction, many injuries, many deaths	10	විනාශකාරී - පරිමානයෙන් විනාශ, බොහෝ තුවාල, බොහෝ මරණ	பேரழிவு - பரந்த முறையில் அழிவு, பல காயங்கள், பல மரணங்கள்
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


-- Completed on 2016-09-29 02:39:47 IST

--
-- PostgreSQL database dump complete
--

