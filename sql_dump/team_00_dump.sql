--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: route; Type: TABLE; Schema: public; Owner: obrol
--

CREATE TABLE public.route (
    id bigint NOT NULL,
    point1 character varying(255),
    point2 character varying(255),
    cost integer
);


ALTER TABLE public.route OWNER TO obrol;

--
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: obrol
--

COPY public.route (id, point1, point2, cost) FROM stdin;
1	a	b	10
2	b	a	10
3	a	d	20
4	d	a	20
5	a	c	15
6	c	a	15
7	b	d	25
8	d	b	25
9	b	c	35
10	c	d	30
11	d	c	30
12	c	b	35
\.


--
-- Name: route route_pkey; Type: CONSTRAINT; Schema: public; Owner: obrol
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

