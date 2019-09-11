--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

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
-- Name: api; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA api;


ALTER SCHEMA api OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: todos; Type: TABLE; Schema: api; Owner: postgres
--

CREATE TABLE api.todos (
    id integer NOT NULL,
    done boolean DEFAULT false NOT NULL,
    task text NOT NULL,
    due timestamp with time zone
);


ALTER TABLE api.todos OWNER TO postgres;

--
-- Name: todos_id_seq; Type: SEQUENCE; Schema: api; Owner: postgres
--

CREATE SEQUENCE api.todos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api.todos_id_seq OWNER TO postgres;

--
-- Name: todos_id_seq; Type: SEQUENCE OWNED BY; Schema: api; Owner: postgres
--

ALTER SEQUENCE api.todos_id_seq OWNED BY api.todos.id;


--
-- Name: todos id; Type: DEFAULT; Schema: api; Owner: postgres
--

ALTER TABLE ONLY api.todos ALTER COLUMN id SET DEFAULT nextval('api.todos_id_seq'::regclass);


--
-- Data for Name: todos; Type: TABLE DATA; Schema: api; Owner: postgres
--

COPY api.todos (id, done, task, due) FROM stdin;
1	f	finish tutorial 0	\N
2	f	pat self on back	\N
\.


--
-- Name: todos_id_seq; Type: SEQUENCE SET; Schema: api; Owner: postgres
--

SELECT pg_catalog.setval('api.todos_id_seq', 2, true);


--
-- Name: todos todos_pkey; Type: CONSTRAINT; Schema: api; Owner: postgres
--

ALTER TABLE ONLY api.todos
    ADD CONSTRAINT todos_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA api; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA api TO web_anon;
GRANT USAGE ON SCHEMA api TO todo_user;


--
-- Name: TABLE todos; Type: ACL; Schema: api; Owner: postgres
--

GRANT SELECT ON TABLE api.todos TO web_anon;
GRANT ALL ON TABLE api.todos TO todo_user;


--
-- Name: SEQUENCE todos_id_seq; Type: ACL; Schema: api; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE api.todos_id_seq TO todo_user;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE authenticator;
ALTER ROLE authenticator WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md59609c31c541da381b2e4ee8a95d444a0';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE repmgr;
ALTER ROLE repmgr WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE todo_user;
ALTER ROLE todo_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE web_anon;
ALTER ROLE web_anon WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;


--
-- Role memberships
--

GRANT todo_user TO authenticator GRANTED BY postgres;
GRANT web_anon TO authenticator GRANTED BY postgres;


--
-- PostgreSQL database cluster dump complete
--

