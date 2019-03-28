--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: mpm; Type: SCHEMA; Schema: -; Owner: prithvikt
--

CREATE SCHEMA mpm;


ALTER SCHEMA mpm OWNER TO prithvikt;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: deliverable; Type: TABLE; Schema: mpm; Owner: prithvikt
--

CREATE TABLE mpm.deliverable (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    name character varying(250),
    priority bigint,
    status bigint,
    skip_review boolean,
    description text,
    asset_id bigint,
    owner character varying(250),
    approver character varying(250),
    created_by character varying(250),
    modified_by character varying(250),
    created_date date,
    modified_date date,
    due_date date
);


ALTER TABLE mpm.deliverable OWNER TO prithvikt;

--
-- Name: deliverable_sequence; Type: SEQUENCE; Schema: mpm; Owner: prithvikt
--

CREATE SEQUENCE mpm.deliverable_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mpm.deliverable_sequence OWNER TO prithvikt;

--
-- Name: project; Type: TABLE; Schema: mpm; Owner: prithvikt
--

CREATE TABLE mpm.project (
    id bigint NOT NULL,
    name character varying(250),
    owner character varying(250),
    status bigint,
    priority bigint,
    start_date date,
    end_date date,
    description text,
    custom_attrs json,
    worklfow_id bigint,
    workflow_config_id bigint,
    external_ref_id bigint,
    created_date date,
    modified_date date,
    created_by character varying(250),
    modified_by character varying(250),
    custom_id character varying(250)
);


ALTER TABLE mpm.project OWNER TO prithvikt;

--
-- Name: project_sequence; Type: SEQUENCE; Schema: mpm; Owner: prithvikt
--

CREATE SEQUENCE mpm.project_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mpm.project_sequence OWNER TO prithvikt;

--
-- Name: task; Type: TABLE; Schema: mpm; Owner: prithvikt
--

CREATE TABLE mpm.task (
    id bigint NOT NULL,
    status bigint,
    is_approval_task boolean,
    priority bigint,
    start_date date,
    end_date date,
    description text,
    project_id bigint NOT NULL,
    created_by character varying(250),
    modified_by character varying(250),
    created_date date,
    modified_date date,
    name character varying(250),
    owner character varying(250)
);


ALTER TABLE mpm.task OWNER TO prithvikt;

--
-- Name: task_sequence; Type: SEQUENCE; Schema: mpm; Owner: prithvikt
--

CREATE SEQUENCE mpm.task_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mpm.task_sequence OWNER TO prithvikt;

--
-- Name: SEQUENCE task_sequence; Type: COMMENT; Schema: mpm; Owner: prithvikt
--

COMMENT ON SEQUENCE mpm.task_sequence IS 'task_sequence';


--
-- Name: workflow; Type: TABLE; Schema: mpm; Owner: prithvikt
--

CREATE TABLE mpm.workflow (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    status bigint,
    user_id "char"[],
    iteration bigint,
    is_active boolean,
    is_deleted boolean
);


ALTER TABLE mpm.workflow OWNER TO prithvikt;

--
-- Name: workflow_config; Type: TABLE; Schema: mpm; Owner: prithvikt
--

CREATE TABLE mpm.workflow_config (
    id bigint NOT NULL,
    name character varying(250),
    description text
);


ALTER TABLE mpm.workflow_config OWNER TO prithvikt;

--
-- Name: workflow_dependency_matrix; Type: TABLE; Schema: mpm; Owner: prithvikt
--

CREATE TABLE mpm.workflow_dependency_matrix (
    worklfow_dependency_matrix_id bigint NOT NULL,
    from_node bigint,
    to_node bigint,
    node_type "char"[],
    project_id bigint,
    created_by "char"[],
    modified_by "char"[],
    created_date date,
    modified_date date,
    is_active boolean
);


ALTER TABLE mpm.workflow_dependency_matrix OWNER TO prithvikt;

--
-- Name: workflow_step; Type: TABLE; Schema: mpm; Owner: prithvikt
--

CREATE TABLE mpm.workflow_step (
    id bigint NOT NULL,
    workflow_id bigint NOT NULL,
    workflow_master_id bigint NOT NULL,
    status bigint,
    state bigint,
    user_id "char"[],
    is_active boolean,
    is_deleted boolean,
    iteration integer
);


ALTER TABLE mpm.workflow_step OWNER TO prithvikt;

--
-- Name: workflow_step_config; Type: TABLE; Schema: mpm; Owner: prithvikt
--

CREATE TABLE mpm.workflow_step_config (
    id bigint NOT NULL,
    sequence integer,
    is_active boolean,
    name character varying(250),
    description text,
    workflow_config_id bigint
);


ALTER TABLE mpm.workflow_step_config OWNER TO prithvikt;

--
-- Name: project_id_sequence; Type: SEQUENCE; Schema: public; Owner: prithvikt
--

CREATE SEQUENCE public.project_id_sequence
    START WITH 1000
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_sequence OWNER TO prithvikt;

--
-- Data for Name: deliverable; Type: TABLE DATA; Schema: mpm; Owner: prithvikt
--

COPY mpm.deliverable (id, task_id, name, priority, status, skip_review, description, asset_id, owner, approver, created_by, modified_by, created_date, modified_date, due_date) FROM stdin;
5	4	Sample Deliverable 1	1	0	f	Sample Task	\N	PrithviKT	\N	PrithviKT	PrithviKT	2018-12-18	2018-12-18	2018-12-30
8	5	Sample Deliverable 1	1	0	f	Sample Task	\N	PrithviKT	\N	PrithviKT	PrithviKT	2018-12-18	2018-12-18	2018-12-30
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: mpm; Owner: prithvikt
--

COPY mpm.project (id, name, owner, status, priority, start_date, end_date, description, custom_attrs, worklfow_id, workflow_config_id, external_ref_id, created_date, modified_date, created_by, modified_by, custom_id) FROM stdin;
6	Sample Project 2	PrithviKT	0	1	2018-12-18	2018-12-30	Sample Project	\N	\N	1	\N	2018-12-18	2018-12-18	PrithviKT	PrithviKT	\N
7	Sample Project 2	PrithviKT	0	1	2018-12-18	2018-12-30	Sample Project	\N	\N	1	\N	2018-12-18	2018-12-18	PrithviKT	PrithviKT	\N
10	Sample Project 3	PrithviKT	0	1	2018-12-18	2018-12-30	Sample Project	\N	\N	1	\N	2018-12-18	2018-12-18	PrithviKT	PrithviKT	\N
8	Sample Project 88	PrithviKT	1	3	2018-12-18	2018-12-30	Sample Project	\N	\N	1	\N	2018-12-18	2018-12-18	PrithviKT	PrithviKT	\N
12	Sample Project Demo	PrithviKT	0	1	2018-12-18	2018-12-30	Sample Project	\N	\N	1	\N	2018-12-18	2018-12-18	PrithviKT	PrithviKT	\N
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: mpm; Owner: prithvikt
--

COPY mpm.task (id, status, is_approval_task, priority, start_date, end_date, description, project_id, created_by, modified_by, created_date, modified_date, name, owner) FROM stdin;
4	0	f	1	2018-12-18	2018-12-30	Sample Task	8	PrithviKT	PrithviKT	2018-12-18	2018-12-18	Sample Task 22	PrithviKT
5	0	f	1	2018-12-18	2018-12-30	Sample Task	12	PrithviKT	PrithviKT	2018-12-18	2018-12-18	Sample Demo Task 111	PrithviKT
\.


--
-- Data for Name: workflow; Type: TABLE DATA; Schema: mpm; Owner: prithvikt
--

COPY mpm.workflow (id, project_id, status, user_id, iteration, is_active, is_deleted) FROM stdin;
\.


--
-- Data for Name: workflow_config; Type: TABLE DATA; Schema: mpm; Owner: prithvikt
--

COPY mpm.workflow_config (id, name, description) FROM stdin;
1	DEFAULT	Default MPM Workflow
\.


--
-- Data for Name: workflow_dependency_matrix; Type: TABLE DATA; Schema: mpm; Owner: prithvikt
--

COPY mpm.workflow_dependency_matrix (worklfow_dependency_matrix_id, from_node, to_node, node_type, project_id, created_by, modified_by, created_date, modified_date, is_active) FROM stdin;
\.


--
-- Data for Name: workflow_step; Type: TABLE DATA; Schema: mpm; Owner: prithvikt
--

COPY mpm.workflow_step (id, workflow_id, workflow_master_id, status, state, user_id, is_active, is_deleted, iteration) FROM stdin;
\.


--
-- Data for Name: workflow_step_config; Type: TABLE DATA; Schema: mpm; Owner: prithvikt
--

COPY mpm.workflow_step_config (id, sequence, is_active, name, description, workflow_config_id) FROM stdin;
1	1	t	UPLOAD_TASK	Upload Task	1
2	2	t	REVIEW_TASK	Review Task	1
3	3	t	APPROVER_TASK	Approver Task	1
\.


--
-- Name: deliverable_sequence; Type: SEQUENCE SET; Schema: mpm; Owner: prithvikt
--

SELECT pg_catalog.setval('mpm.deliverable_sequence', 8, true);


--
-- Name: project_sequence; Type: SEQUENCE SET; Schema: mpm; Owner: prithvikt
--

SELECT pg_catalog.setval('mpm.project_sequence', 12, true);


--
-- Name: task_sequence; Type: SEQUENCE SET; Schema: mpm; Owner: prithvikt
--

SELECT pg_catalog.setval('mpm.task_sequence', 6, true);


--
-- Name: project_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: prithvikt
--

SELECT pg_catalog.setval('public.project_id_sequence', 1000, false);


--
-- Name: deliverable deliverable_pkey; Type: CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.deliverable
    ADD CONSTRAINT deliverable_pkey PRIMARY KEY (id);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: workflow_config workflow_config_pkey; Type: CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.workflow_config
    ADD CONSTRAINT workflow_config_pkey PRIMARY KEY (id);


--
-- Name: workflow_dependency_matrix workflow_dependency_matrix_pkey; Type: CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.workflow_dependency_matrix
    ADD CONSTRAINT workflow_dependency_matrix_pkey PRIMARY KEY (worklfow_dependency_matrix_id);


--
-- Name: workflow workflow_pkey; Type: CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.workflow
    ADD CONSTRAINT workflow_pkey PRIMARY KEY (id);


--
-- Name: workflow_step_config workflow_step_config_pkey; Type: CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.workflow_step_config
    ADD CONSTRAINT workflow_step_config_pkey PRIMARY KEY (id);


--
-- Name: workflow_step workflow_step_pkey; Type: CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.workflow_step
    ADD CONSTRAINT workflow_step_pkey PRIMARY KEY (id);


--
-- Name: workflow PROJECT_ID_FK; Type: FK CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.workflow
    ADD CONSTRAINT "PROJECT_ID_FK" FOREIGN KEY (project_id) REFERENCES mpm.project(id);


--
-- Name: CONSTRAINT "PROJECT_ID_FK" ON workflow; Type: COMMENT; Schema: mpm; Owner: prithvikt
--

COMMENT ON CONSTRAINT "PROJECT_ID_FK" ON mpm.workflow IS 'PROJECT_ID_FK';


--
-- Name: workflow_dependency_matrix PROJECT_ID_FK; Type: FK CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.workflow_dependency_matrix
    ADD CONSTRAINT "PROJECT_ID_FK" FOREIGN KEY (project_id) REFERENCES mpm.project(id);


--
-- Name: CONSTRAINT "PROJECT_ID_FK" ON workflow_dependency_matrix; Type: COMMENT; Schema: mpm; Owner: prithvikt
--

COMMENT ON CONSTRAINT "PROJECT_ID_FK" ON mpm.workflow_dependency_matrix IS 'PROJECT_ID_FK';


--
-- Name: project WORKFLOW_ID_FK; Type: FK CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.project
    ADD CONSTRAINT "WORKFLOW_ID_FK" FOREIGN KEY (worklfow_id) REFERENCES mpm.workflow(id);


--
-- Name: CONSTRAINT "WORKFLOW_ID_FK" ON project; Type: COMMENT; Schema: mpm; Owner: prithvikt
--

COMMENT ON CONSTRAINT "WORKFLOW_ID_FK" ON mpm.project IS 'WORKFLOW_ID_FK';


--
-- Name: workflow_step_config workflow_config_ID_FK; Type: FK CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.workflow_step_config
    ADD CONSTRAINT "workflow_config_ID_FK" FOREIGN KEY (workflow_config_id) REFERENCES mpm.workflow_config(id);


--
-- Name: project workflow_config_id_fk; Type: FK CONSTRAINT; Schema: mpm; Owner: prithvikt
--

ALTER TABLE ONLY mpm.project
    ADD CONSTRAINT workflow_config_id_fk FOREIGN KEY (workflow_config_id) REFERENCES mpm.workflow_config(id);


--
-- Name: CONSTRAINT workflow_config_id_fk ON project; Type: COMMENT; Schema: mpm; Owner: prithvikt
--

COMMENT ON CONSTRAINT workflow_config_id_fk ON mpm.project IS 'workflow_config_id_fk';


--
-- PostgreSQL database dump complete
--

