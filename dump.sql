--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visitedUrls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."visitedUrls" (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: visitedUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."visitedUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visitedUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."visitedUrls_id_seq" OWNED BY public."visitedUrls".id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visitedUrls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."visitedUrls" ALTER COLUMN id SET DEFAULT nextval('public."visitedUrls_id_seq"'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '9cb50c8e-e68b-489c-9e82-5249104ab49c', '2022-12-23 17:41:05.585648');
INSERT INTO public.sessions VALUES (2, 2, 'bb97e06b-577f-4b45-a2c5-0584b826e1fc', '2022-12-23 17:43:45.583743');
INSERT INTO public.sessions VALUES (3, 2, '8b5ac24a-91fa-4724-aac5-7042cc3c1f81', '2022-12-23 17:44:02.485319');
INSERT INTO public.sessions VALUES (4, 3, '94c71519-3046-4dce-88ba-30aabe37c592', '2022-12-23 17:47:46.170808');
INSERT INTO public.sessions VALUES (5, 4, '1f4cd5ac-2a9c-47a3-b92f-b033a511da48', '2022-12-23 17:48:18.30033');
INSERT INTO public.sessions VALUES (6, 9, 'cb4c1dbf-d9a1-470d-a7dd-76de876e2040', '2022-12-23 17:48:47.216908');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 'pHenM49o', 'https://www.youtube.com/@cortesdoordemcastoficial1971', 1, '2022-12-23 17:41:47.997267');
INSERT INTO public.urls VALUES (2, 'RJ7jZBuK', 'https://www.youtube.com/@cortesdoordemcastoficial1971', 1, '2022-12-23 17:41:49.325949');
INSERT INTO public.urls VALUES (4, '0R4qppa3', 'https://www.youtube.com/@cortesdoordemcastoficial1971', 1, '2022-12-23 17:41:51.885019');
INSERT INTO public.urls VALUES (5, 'qqMo0Xo9', 'https://www.youtube.com/@cortesdoordemcastoficial1971', 2, '2022-12-23 17:44:37.578062');
INSERT INTO public.urls VALUES (7, '_xxSimB5', 'https://www.youtube.com/@cortesdoordemcastoficial197', 3, '2022-12-23 17:47:56.119775');
INSERT INTO public.urls VALUES (8, 'igx3n-1z', 'https://www.youtube.com/@cortesdoordemcastoficial197', 3, '2022-12-23 17:47:57.052658');
INSERT INTO public.urls VALUES (9, 'f0dqOGhz', 'https://www.youtube.com/@cortesdoordemcastoficial197', 3, '2022-12-23 17:47:58.003671');
INSERT INTO public.urls VALUES (10, 'uY-p1A8e', 'https://www.youtube.com/@cortesdoordemcastoficial197', 3, '2022-12-23 17:47:59.926206');
INSERT INTO public.urls VALUES (11, 'ZdJfCRZ8', 'https://www.youtube.com/@cortesdoordemcastoficial197', 4, '2022-12-23 17:48:29.315694');
INSERT INTO public.urls VALUES (12, 'TE5TKARc', 'https://www.youtube.com/@cortesdoordemcastoficial197', 4, '2022-12-23 17:48:30.22527');
INSERT INTO public.urls VALUES (13, 'PrqgGjmt', 'https://www.youtube.com/@cortesdoordemcastoficial197', 4, '2022-12-23 17:48:31.279697');
INSERT INTO public.urls VALUES (14, '_oQ_z-_5', 'https://www.youtube.com/@cortesdoordemcastoficial197', 9, '2022-12-23 17:48:55.711951');
INSERT INTO public.urls VALUES (15, 'de8FTF8r', 'https://www.youtube.com/@cortesdoordemcastoficial1971', 9, '2022-12-23 17:49:38.462239');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'julia', 'julia@gmail.com', '$2b$10$OxTmK4oGyfOeSIl/gnH7nev2qPtT1IMe7lPGOUyCcif9ZGSqzWygG', '2022-12-23 17:40:59.172717');
INSERT INTO public.users VALUES (2, '222', '222@gmail.com', '$2b$10$q/RX6qV2PjPTLXWZIl.YK.AsmrDBVPifz1x0jHZM.ukWp545tItL6', '2022-12-23 17:43:40.480966');
INSERT INTO public.users VALUES (3, '333', '333@gmail.com', '$2b$10$IfBZF2lc40FO49GohyILNeVKAjKt8xpEcz2mArT46A.nPMRrrf5V6', '2022-12-23 17:46:15.672187');
INSERT INTO public.users VALUES (4, '444', '444@gmail.com', '$2b$10$GieerWOP906qHVv5kJ2Ti.GXhq985O6X8WIVmjp9D91CgB2g9fb2.', '2022-12-23 17:46:19.879325');
INSERT INTO public.users VALUES (5, '555', '555@gmail.com', '$2b$10$eghKYNdkziNYaHszMBLWyOTRjZ89fQADaeDwWBjhjJKYITNStEf9i', '2022-12-23 17:46:23.174318');
INSERT INTO public.users VALUES (6, '666', '666@gmail.com', '$2b$10$XKsjG4pBygUpo0czDFWMHuPDuEh05vv4oCHQq4o33ml/z06SKH6HG', '2022-12-23 17:46:27.186262');
INSERT INTO public.users VALUES (7, '777', '777@gmail.com', '$2b$10$lqB2KoRC9y4hLhNLLdZKzOG9pVKTrHGtF.aX1drEX/vlqqj3KnIGu', '2022-12-23 17:46:35.070477');
INSERT INTO public.users VALUES (8, '888', '888@gmail.com', '$2b$10$YPI2tci8MvtXMpg3TLr07.rnC.KPBCncsdBQM3nqPRwcBzO/Fji86', '2022-12-23 17:46:38.584512');
INSERT INTO public.users VALUES (9, '999', '999@gmail.com', '$2b$10$M2ANf9DzqLNYWRGT7EeGVeid9/8FBcGFuS/GXP/wkav6H4NqplIW6', '2022-12-23 17:46:44.083737');
INSERT INTO public.users VALUES (10, '1000', '1000@gmail.com', '$2b$10$.uAL14lOdBG319LkAmdcbuaeiZS7lKS5rwnL4Gxvzkw5btZLzoNc6', '2022-12-23 17:46:51.771476');
INSERT INTO public.users VALUES (11, '1111', '1111@gmail.com', '$2b$10$HxsRGX4bOXmzOMvdasRZkemhkt1pueDEXcqrb9Bed3EOAsHaBQ3R2', '2022-12-23 17:47:04.672239');


--
-- Data for Name: visitedUrls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."visitedUrls" VALUES (1, 4, '2022-12-23 17:42:07.092031');
INSERT INTO public."visitedUrls" VALUES (2, 4, '2022-12-23 17:42:08.778533');
INSERT INTO public."visitedUrls" VALUES (3, 4, '2022-12-23 17:42:10.222327');
INSERT INTO public."visitedUrls" VALUES (4, 4, '2022-12-23 17:42:11.627496');
INSERT INTO public."visitedUrls" VALUES (7, 14, '2022-12-23 17:49:09.530754');
INSERT INTO public."visitedUrls" VALUES (8, 15, '2022-12-23 17:49:45.650326');
INSERT INTO public."visitedUrls" VALUES (9, 15, '2022-12-23 17:49:48.174672');
INSERT INTO public."visitedUrls" VALUES (10, 15, '2022-12-23 17:49:49.479141');
INSERT INTO public."visitedUrls" VALUES (11, 15, '2022-12-23 17:49:50.792993');
INSERT INTO public."visitedUrls" VALUES (12, 15, '2022-12-23 17:49:52.264506');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 6, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 15, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: visitedUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."visitedUrls_id_seq"', 12, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visitedUrls visitedUrls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."visitedUrls"
    ADD CONSTRAINT "visitedUrls_pkey" PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: visitedUrls visitedUrls_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."visitedUrls"
    ADD CONSTRAINT "visitedUrls_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO mattinho;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

