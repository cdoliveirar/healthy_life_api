--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO postgres;

--
-- Name: competition_competition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE competition_competition (
    id integer NOT NULL,
    qualification integer,
    qualification_feedback character varying(100),
    recommendation integer,
    recommendation_feedback character varying(100),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    doctor_id integer,
    patient_id integer
);


ALTER TABLE competition_competition OWNER TO postgres;

--
-- Name: competition_competition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE competition_competition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE competition_competition_id_seq OWNER TO postgres;

--
-- Name: competition_competition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE competition_competition_id_seq OWNED BY competition_competition.id;


--
-- Name: customuser_allergincreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customuser_allergincreaction (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    name character varying(50),
    description character varying(255),
    created_by_id integer
);


ALTER TABLE customuser_allergincreaction OWNER TO postgres;

--
-- Name: customuser_allergincreaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customuser_allergincreaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customuser_allergincreaction_id_seq OWNER TO postgres;

--
-- Name: customuser_allergincreaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customuser_allergincreaction_id_seq OWNED BY customuser_allergincreaction.id;


--
-- Name: customuser_background; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customuser_background (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    name character varying(50),
    description character varying(255),
    created_by_id integer
);


ALTER TABLE customuser_background OWNER TO postgres;

--
-- Name: customuser_background_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customuser_background_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customuser_background_id_seq OWNER TO postgres;

--
-- Name: customuser_background_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customuser_background_id_seq OWNED BY customuser_background.id;


--
-- Name: customuser_emergencyattention; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customuser_emergencyattention (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    name character varying(50),
    description character varying(255),
    picture_url character varying(200),
    is_active boolean NOT NULL,
    is_emergency boolean NOT NULL,
    created_by_id integer
);


ALTER TABLE customuser_emergencyattention OWNER TO postgres;

--
-- Name: customuser_emergencyattention_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customuser_emergencyattention_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customuser_emergencyattention_id_seq OWNER TO postgres;

--
-- Name: customuser_emergencyattention_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customuser_emergencyattention_id_seq OWNED BY customuser_emergencyattention.id;


--
-- Name: customuser_myuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customuser_myuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    photo character varying(100),
    first_name character varying(50),
    last_name character varying(50),
    dni character varying(8),
    birth_date date,
    address character varying(200),
    cellphone character varying(15),
    total_calls integer NOT NULL,
    month_used_calls integer NOT NULL,
    available_calls integer NOT NULL,
    location_id integer,
    cmd_peru character varying(20),
    degree character varying(100),
    type_of_specialist character varying(100),
    call_activate boolean NOT NULL,
    in_call boolean NOT NULL,
    queue_count integer,
    blood_type character varying(10),
    token_sinch character varying(100),
    size double precision,
    gender character varying(1),
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_admin boolean NOT NULL,
    emergency_attention_id integer,
    url_photo text,
    username character varying(50),
    is_subscribe boolean NOT NULL,
    subscription_id character varying(300)
);


ALTER TABLE customuser_myuser OWNER TO postgres;

--
-- Name: customuser_myuser_allergic_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customuser_myuser_allergic_reaction (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    allergincreaction_id integer NOT NULL
);


ALTER TABLE customuser_myuser_allergic_reaction OWNER TO postgres;

--
-- Name: customuser_myuser_allergic_reaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customuser_myuser_allergic_reaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customuser_myuser_allergic_reaction_id_seq OWNER TO postgres;

--
-- Name: customuser_myuser_allergic_reaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customuser_myuser_allergic_reaction_id_seq OWNED BY customuser_myuser_allergic_reaction.id;


--
-- Name: customuser_myuser_background; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customuser_myuser_background (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    background_id integer NOT NULL
);


ALTER TABLE customuser_myuser_background OWNER TO postgres;

--
-- Name: customuser_myuser_background_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customuser_myuser_background_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customuser_myuser_background_id_seq OWNER TO postgres;

--
-- Name: customuser_myuser_background_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customuser_myuser_background_id_seq OWNED BY customuser_myuser_background.id;


--
-- Name: customuser_myuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customuser_myuser_groups (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE customuser_myuser_groups OWNER TO postgres;

--
-- Name: customuser_myuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customuser_myuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customuser_myuser_groups_id_seq OWNER TO postgres;

--
-- Name: customuser_myuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customuser_myuser_groups_id_seq OWNED BY customuser_myuser_groups.id;


--
-- Name: customuser_myuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customuser_myuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customuser_myuser_id_seq OWNER TO postgres;

--
-- Name: customuser_myuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customuser_myuser_id_seq OWNED BY customuser_myuser.id;


--
-- Name: customuser_myuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customuser_myuser_user_permissions (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE customuser_myuser_user_permissions OWNER TO postgres;

--
-- Name: customuser_myuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customuser_myuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customuser_myuser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: customuser_myuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE customuser_myuser_user_permissions_id_seq OWNED BY customuser_myuser_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: medicalhistory_artifactmeasurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE medicalhistory_artifactmeasurement (
    id integer NOT NULL,
    token_sinch text,
    weight numeric(5,2),
    blood_pressure numeric(5,2),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    patient_id integer,
    measurement_date timestamp with time zone,
    temperature numeric(5,2)
);


ALTER TABLE medicalhistory_artifactmeasurement OWNER TO postgres;

--
-- Name: medicalhistory_artifactmeasurement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medicalhistory_artifactmeasurement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicalhistory_artifactmeasurement_id_seq OWNER TO postgres;

--
-- Name: medicalhistory_artifactmeasurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medicalhistory_artifactmeasurement_id_seq OWNED BY medicalhistory_artifactmeasurement.id;


--
-- Name: medicalhistory_medicalhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE medicalhistory_medicalhistory (
    id integer NOT NULL,
    symptom text,
    doctor_comment text,
    diagnostic text,
    weight character varying(10),
    body_temperature character varying(10),
    blood_pressure character varying(10),
    heart_rate character varying(10),
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    doctor_id integer,
    patient_id integer
);


ALTER TABLE medicalhistory_medicalhistory OWNER TO postgres;

--
-- Name: medicalhistory_medicalhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medicalhistory_medicalhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicalhistory_medicalhistory_id_seq OWNER TO postgres;

--
-- Name: medicalhistory_medicalhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medicalhistory_medicalhistory_id_seq OWNED BY medicalhistory_medicalhistory.id;


--
-- Name: medicalhistory_medicalhistorymedia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE medicalhistory_medicalhistorymedia (
    id integer NOT NULL,
    picture_url text,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    medical_history_id integer
);


ALTER TABLE medicalhistory_medicalhistorymedia OWNER TO postgres;

--
-- Name: medicalhistory_medicalhistorymedia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medicalhistory_medicalhistorymedia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medicalhistory_medicalhistorymedia_id_seq OWNER TO postgres;

--
-- Name: medicalhistory_medicalhistorymedia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medicalhistory_medicalhistorymedia_id_seq OWNED BY medicalhistory_medicalhistorymedia.id;


--
-- Name: plans_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plans_payment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    amount double precision NOT NULL,
    patient_id integer NOT NULL,
    plan_id integer
);


ALTER TABLE plans_payment OWNER TO postgres;

--
-- Name: plans_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plans_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plans_payment_id_seq OWNER TO postgres;

--
-- Name: plans_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plans_payment_id_seq OWNED BY plans_payment.id;


--
-- Name: plans_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plans_plan (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    name character varying(100),
    price double precision,
    calls_quantity integer,
    plan_culqi_id character varying(300),
    is_active boolean NOT NULL,
    CONSTRAINT plans_plan_calls_quantity_check CHECK ((calls_quantity >= 0))
);


ALTER TABLE plans_plan OWNER TO postgres;

--
-- Name: plans_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plans_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plans_plan_id_seq OWNER TO postgres;

--
-- Name: plans_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plans_plan_id_seq OWNED BY plans_plan.id;


--
-- Name: plans_planpatient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE plans_planpatient (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    plan_id integer NOT NULL,
    created timestamp with time zone,
    extra_data jsonb,
    updated timestamp with time zone
);


ALTER TABLE plans_planpatient OWNER TO postgres;

--
-- Name: plans_planpatient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plans_planpatient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plans_planpatient_id_seq OWNER TO postgres;

--
-- Name: plans_planpatient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plans_planpatient_id_seq OWNED BY plans_planpatient.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE social_auth_association OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_association_id_seq OWNER TO postgres;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_auth_association_id_seq OWNED BY social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE social_auth_code OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_code_id_seq OWNER TO postgres;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_auth_code_id_seq OWNED BY social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE social_auth_nonce OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_nonce_id_seq OWNER TO postgres;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_auth_nonce_id_seq OWNED BY social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE social_auth_partial OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_partial_id_seq OWNER TO postgres;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_auth_partial_id_seq OWNED BY social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE social_auth_usersocialauth OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_usersocialauth_id_seq OWNER TO postgres;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE social_auth_usersocialauth_id_seq OWNED BY social_auth_usersocialauth.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition_competition ALTER COLUMN id SET DEFAULT nextval('competition_competition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_allergincreaction ALTER COLUMN id SET DEFAULT nextval('customuser_allergincreaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_background ALTER COLUMN id SET DEFAULT nextval('customuser_background_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_emergencyattention ALTER COLUMN id SET DEFAULT nextval('customuser_emergencyattention_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser ALTER COLUMN id SET DEFAULT nextval('customuser_myuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_allergic_reaction ALTER COLUMN id SET DEFAULT nextval('customuser_myuser_allergic_reaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_background ALTER COLUMN id SET DEFAULT nextval('customuser_myuser_background_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_groups ALTER COLUMN id SET DEFAULT nextval('customuser_myuser_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('customuser_myuser_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_artifactmeasurement ALTER COLUMN id SET DEFAULT nextval('medicalhistory_artifactmeasurement_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_medicalhistory ALTER COLUMN id SET DEFAULT nextval('medicalhistory_medicalhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_medicalhistorymedia ALTER COLUMN id SET DEFAULT nextval('medicalhistory_medicalhistorymedia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_payment ALTER COLUMN id SET DEFAULT nextval('plans_payment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_plan ALTER COLUMN id SET DEFAULT nextval('plans_plan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_planpatient ALTER COLUMN id SET DEFAULT nextval('plans_planpatient_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_association ALTER COLUMN id SET DEFAULT nextval('social_auth_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_code ALTER COLUMN id SET DEFAULT nextval('social_auth_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('social_auth_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_partial ALTER COLUMN id SET DEFAULT nextval('social_auth_partial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
1	patients
2	doctors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add Token	6	add_token
17	Can change Token	6	change_token
18	Can delete Token	6	delete_token
19	Can add Usuario	7	add_myuser
20	Can change Usuario	7	change_myuser
21	Can delete Usuario	7	delete_myuser
22	Can add Reacción Alérgica	8	add_allergincreaction
23	Can change Reacción Alérgica	8	change_allergincreaction
24	Can delete Reacción Alérgica	8	delete_allergincreaction
25	Can add Atención de Emergencia	9	add_emergencyattention
26	Can change Atención de Emergencia	9	change_emergencyattention
27	Can delete Atención de Emergencia	9	delete_emergencyattention
28	Can add Background	10	add_background
29	Can change Background	10	change_background
30	Can delete Background	10	delete_background
31	Can add partial	11	add_partial
32	Can change partial	11	change_partial
33	Can delete partial	11	delete_partial
34	Can add association	12	add_association
35	Can change association	12	change_association
36	Can delete association	12	delete_association
37	Can add user social auth	13	add_usersocialauth
38	Can change user social auth	13	change_usersocialauth
39	Can delete user social auth	13	delete_usersocialauth
40	Can add code	14	add_code
41	Can change code	14	change_code
42	Can delete code	14	delete_code
43	Can add nonce	15	add_nonce
44	Can change nonce	15	change_nonce
45	Can delete nonce	15	delete_nonce
46	Can add plan	16	add_plan
47	Can change plan	16	change_plan
48	Can delete plan	16	delete_plan
49	Can add plan patient	17	add_planpatient
50	Can change plan patient	17	change_planpatient
51	Can delete plan patient	17	delete_planpatient
52	Can add Historia Medica	18	add_medicalhistory
53	Can change Historia Medica	18	change_medicalhistory
54	Can delete Historia Medica	18	delete_medicalhistory
55	Can add Media de Historia Medica	19	add_medicalhistorymedia
56	Can change Media de Historia Medica	19	change_medicalhistorymedia
57	Can delete Media de Historia Medica	19	delete_medicalhistorymedia
58	Can add Mediciones de Artefactos	20	add_artifactmeasurement
59	Can change Mediciones de Artefactos	20	change_artifactmeasurement
60	Can delete Mediciones de Artefactos	20	delete_artifactmeasurement
61	Can add Calificacion	21	add_competition
62	Can change Calificacion	21	change_competition
63	Can delete Calificacion	21	delete_competition
64	Can add payment	22	add_payment
65	Can change payment	22	change_payment
66	Can delete payment	22	delete_payment
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 66, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY authtoken_token (key, created, user_id) FROM stdin;
5cc18f2e84aba9c8c2b85867bec792386b9133c9	2017-12-20 16:44:08.038531-05	2
ba321998d00497bde118802b752d1fd04b549e5b	2017-12-20 19:02:26.717801-05	3
2a8974f8bc34324b292ce01b79a9b76d1d9a7bfe	2017-12-20 20:31:48.845149-05	4
3a473bbc20afa393ad1bf78ed10f14a8c87980ca	2017-12-20 20:32:55.113571-05	6
60d34f7a064e226883bfa5b97a8b5893a8f03340	2017-12-20 20:34:13.420253-05	7
c57a12985dfd23b589542f5eda9689f1d41ec417	2017-12-20 20:38:32.288406-05	8
fdd49243b5cbdab3c6942e02899a4f3371497bd4	2017-12-22 11:05:58.238131-05	12
8b3a9e9c24090c6d13100d45e20b4ecccbb5b0ec	2017-12-22 20:07:19.843998-05	13
9f3abf9a43a7ccdfc5d6a6d0d09aca6d1cb3240d	2017-12-22 20:07:52.530052-05	15
e7d238fec6c73995afa8944b305a99a9c2a7cb05	2017-12-22 20:08:25.955215-05	16
a32ddab308ed4237ec10baae0fa325b65068f6ba	2017-12-26 18:30:53.339474-05	17
408ba01a15c813914e511c4eac8a559d8c4f44a5	2017-12-27 12:21:50.046748-05	21
b699058749bd4c3baf3f66f4b648a9c7be23839c	2017-12-27 12:22:29.118349-05	24
b533839dce03c39fa098ba85e381046f57f125fc	2017-12-27 13:00:53.091837-05	26
\.


--
-- Data for Name: competition_competition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY competition_competition (id, qualification, qualification_feedback, recommendation, recommendation_feedback, created, updated, doctor_id, patient_id) FROM stdin;
\.


--
-- Name: competition_competition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('competition_competition_id_seq', 1, false);


--
-- Data for Name: customuser_allergincreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customuser_allergincreaction (id, created, updated, name, description, created_by_id) FROM stdin;
1	2017-12-20 16:52:07.513693-05	2017-12-20 16:52:07.513766-05	alergia1	alergia1	2
2	2017-12-20 16:52:17.667396-05	2017-12-20 16:52:17.667518-05	alergia2	alergia2	2
\.


--
-- Name: customuser_allergincreaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customuser_allergincreaction_id_seq', 2, true);


--
-- Data for Name: customuser_background; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customuser_background (id, created, updated, name, description, created_by_id) FROM stdin;
1	2017-12-20 16:55:25.186425-05	2017-12-20 16:55:25.186495-05	GUSTAVO TUFIÑO FERNANDEZ	Hipertensión	2
\.


--
-- Name: customuser_background_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customuser_background_id_seq', 1, true);


--
-- Data for Name: customuser_emergencyattention; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customuser_emergencyattention (id, created, updated, name, description, picture_url, is_active, is_emergency, created_by_id) FROM stdin;
\.


--
-- Name: customuser_emergencyattention_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customuser_emergencyattention_id_seq', 1, false);


--
-- Data for Name: customuser_myuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customuser_myuser (id, password, last_login, is_superuser, created, updated, email, photo, first_name, last_name, dni, birth_date, address, cellphone, total_calls, month_used_calls, available_calls, location_id, cmd_peru, degree, type_of_specialist, call_activate, in_call, queue_count, blood_type, token_sinch, size, gender, is_active, is_staff, is_admin, emergency_attention_id, url_photo, username, is_subscribe, subscription_id) FROM stdin;
4	pbkdf2_sha256$36000$0eODTyV1cx0O$vvBz2brYOEdu79owydsnRQ/tHN4PEEz0IHun2K1Tjx8=	\N	f	2017-12-20 20:31:48.849626-05	2017-12-20 20:31:48.779667-05	adasda@dadsa.com		dsadsa			\N			0	0	1	\N				f	f	\N			\N		t	f	f	\N	\N	\N	f	\N
7	pbkdf2_sha256$36000$jaz22T2RNWfW$CpJlRx+PF6GQ0oM1HdbpDJieAaoDidJWRxxc7rol5SU=	\N	f	2017-12-20 20:34:13.421871-05	2017-12-20 20:34:13.365683-05	tavo.tf2dd@gmail.com		gusgus	tufiño fernandez	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	f	f	0	\N	\N	0	\N	t	f	f	\N	\N	\N	f	\N
8	pbkdf2_sha256$36000$xqxo5RRySYon$/SZl8neHsM7Codiyf86PnxQMbw0E4GPrQR9KCD1aawU=	\N	f	2017-12-20 20:38:32.291245-05	2017-12-20 20:38:32.212859-05	nfxnfx@nfxnfx.com		tavo.tf12	tavogjccgd@gmail.com	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	f	f	0	\N	\N	0	\N	t	f	f	\N	\N	\N	f	\N
11	pbkdf2_sha256$36000$d3yetcSIAofE$fXverHwEQwAR7jZClRjBHy+3+lXdHIpaC7/w9kWenG8=	\N	t	2017-12-21 14:08:54.768495-05	2017-12-21 14:08:54.768518-05	gtufinof@gmail.com		\N	\N	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	f	f	0	\N	\N	0	\N	t	t	f	\N	\N	\N	f	\N
3	pbkdf2_sha256$36000$Fbd1ja75kabC$dwyNSO2vc9hfMmM70tqTZ+GtYRx+/vRUQSRZcUZrELs=	\N	f	2017-12-22 19:03:22.233616-05	2017-12-20 19:02:26.629821-05	tavo.tf222@gmail.com		Gus	Gus	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	f	f	0	\N	\N	0	\N	t	f	f	\N	\N	\N	f	\N
21	pbkdf2_sha256$36000$pD4Io6RkKWJ3$m4WWOpqOAt3msDRuSpobeag6iZtifHJmM2hULIU6N3U=	\N	f	2017-12-27 12:21:50.048864-05	2017-12-27 12:21:49.984486-05	falejandro@ggs.com.pe		fredy	alejandro	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	f	f	0	\N	\N	0	\N	t	f	f	\N	\N	\N	f	\N
16	pbkdf2_sha256$36000$VZ1EoLe0OFhL$ynXHBKG9FBxiMrq3ZhtGEADSV1CuW/hAASR7Ua7RA24=	\N	f	2017-12-26 12:55:31.12647-05	2017-12-22 20:08:25.867543-05	gustavo.g334@gmail.com		Nicholas	Gatjens	48269083	\N			0	0	1	\N		NUTRICIONISTA		f	f	\N			\N	\N	t	f	f	\N	https://s3.amazonaws.com/midocvirtual/image-dev/doctor/nicholas_gatjens.png	\N	f	\N
13	pbkdf2_sha256$36000$rxaUBDkYBSdD$+1yv++Hr3AjQ9ipBw7OUGJqWPNepUgR2s96c3hRTxzk=	\N	f	2017-12-22 20:07:19.846102-05	2017-12-22 20:07:19.780863-05	gustavo.g@gmail.com		Gustavo	Tufiño	48269083	\N			0	0	1	\N				f	f	\N			\N	\N	t	f	f	\N	\N	\N	f	\N
6	pbkdf2_sha256$36000$K2tN5VfZHPDa$6dfMt7O+aVO9CysJ4SlTR7hNP/9zPLRUmmLiiBipWAQ=	\N	f	2017-12-26 18:10:19.987631-05	2017-12-20 20:32:55.036032-05	adasdsadasda@dadsa.com		Ian	De Tramontana	31232131	\N			0	0	1	\N		NUTRICIONISTA		f	f	\N			\N	\N	t	f	f	\N	https://s3.amazonaws.com/midocvirtual/image-dev/doctor/ian_de_tramontana.png	itramontana	f	\N
15	pbkdf2_sha256$36000$Xj4ElnFqZYIg$8EA1h4j+tANKuUS/BztLpA+ziAaAJLL9syJAx2rUxWk=	\N	f	2017-12-26 18:10:50.339757-05	2017-12-22 20:07:52.439093-05	gustavo.g3@gmail.com		Viviana	Zavala	48269083	\N			0	0	1	\N		NUTRICIONISTA		f	f	\N			\N	\N	t	f	f	\N	https://s3.amazonaws.com/midocvirtual/image-dev/doctor/viviana_zavala.png	vzavala	f	\N
24	pbkdf2_sha256$36000$CfDl2doK08qf$gRZ2Z0JMK5gLEmrf51/sEQ6+hZnZUHiGZs4G5qv2tbU=	\N	f	2017-12-27 12:22:29.120756-05	2017-12-27 12:22:29.037319-05	falejandfro@ggs.com.pe		fredy	alejandro	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	f	f	0	\N	\N	0	\N	t	f	f	\N	\N	\N	f	\N
26	pbkdf2_sha256$36000$rexfWLhmJOeC$ZgdUIpQ16nv77Q6GMd/c2c7auiLpH14IkSiRN85z8I8=	\N	f	2017-12-27 13:00:53.094855-05	2017-12-27 13:00:53.042791-05	dsadsadq@dasdsa.com		\N	\N	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	f	f	0	\N	\N	0	\N	t	f	f	\N	\N	\N	f	\N
1	pbkdf2_sha256$36000$tB7e2Yco1bkx$eXWk/0DGvyXKMGIPw/spuQKFxUitSSNT5xKusCI5kyA=	2017-12-27 21:42:52.757886-05	t	2017-12-20 16:25:08.323172-05	2017-12-20 16:25:08.323202-05	baudelaire@gmail.com		\N	\N	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	f	f	0	\N	\N	0	\N	t	t	f	\N	\N	\N	f	\N
12	pbkdf2_sha256$36000$7FMvqtZdV8w8$db/YQhyHgB5CjGqbd+jAyE65CiBF74IQFssWrx+bAek=	2017-12-27 12:54:28.20215-05	f	2017-12-27 22:32:43.894348-05	2017-12-22 11:05:58.175623-05	erikd.guiba@gmail.com	users/db.png	Erik	Guido	70043237	\N	address	986245245	0	0	1	\N		NUTRICIONISTA		t	t	\N			\N	\N	t	f	f	\N	\N	\N	f	\N
2	pbkdf2_sha256$36000$nrp0yEYoT1Rg$VCmREHK3VZmQeGXYGERDF2i5HQXO+EZf6sfq6VZ/n28=	\N	f	2017-12-27 22:41:22.821991-05	2017-12-20 16:44:07.923434-05	tavo.tf@gmail.com		Gustavo	Tufiño	48269082	1994-04-12		956573855	0	0	1	\N				f	f	\N		ca84f6cb-ee32-424c-aea2-c9ee413f5ebc	170	\N	t	f	f	\N	\N	\N	f	\N
17	pbkdf2_sha256$36000$iiZr7XUyRJy6$CrAh4uPPkYbGPoD8HDFzeND9D2WjwgdDUr+O4Q514Rc=	\N	f	2017-12-27 20:50:49.485824-05	2017-12-26 18:30:53.255942-05	leo.ramirez.o@gmail.com					\N			0	0	1	\N				t	f	\N			\N	\N	t	f	f	\N		lramirez	f	\N
\.


--
-- Data for Name: customuser_myuser_allergic_reaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customuser_myuser_allergic_reaction (id, myuser_id, allergincreaction_id) FROM stdin;
1	6	1
\.


--
-- Name: customuser_myuser_allergic_reaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customuser_myuser_allergic_reaction_id_seq', 1, true);


--
-- Data for Name: customuser_myuser_background; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customuser_myuser_background (id, myuser_id, background_id) FROM stdin;
1	6	1
\.


--
-- Name: customuser_myuser_background_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customuser_myuser_background_id_seq', 1, true);


--
-- Data for Name: customuser_myuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customuser_myuser_groups (id, myuser_id, group_id) FROM stdin;
1	3	1
2	6	2
3	7	1
4	8	1
6	15	2
7	16	2
8	12	2
10	21	1
11	24	1
13	2	1
15	17	2
\.


--
-- Name: customuser_myuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customuser_myuser_groups_id_seq', 15, true);


--
-- Name: customuser_myuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customuser_myuser_id_seq', 26, true);


--
-- Data for Name: customuser_myuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customuser_myuser_user_permissions (id, myuser_id, permission_id) FROM stdin;
\.


--
-- Name: customuser_myuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customuser_myuser_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-12-20 16:39:40.253402-05	1	patients	1	[{"added": {}}]	2	1
2	2017-12-20 16:39:55.145767-05	2	doctors	1	[{"added": {}}]	2	1
3	2017-12-20 16:52:07.515246-05	1	alergia1	1	[{"added": {}}]	8	1
4	2017-12-20 16:52:17.668855-05	2	alergia2	1	[{"added": {}}]	8	1
5	2017-12-22 11:05:37.479675-05	10	-	3		7	1
6	2017-12-22 11:44:21.220856-05	12	Guido-Erik	2	[{"changed": {"fields": ["first_name", "last_name", "dni", "cellphone", "address", "photo"]}}]	7	1
7	2017-12-22 12:11:48.419644-05	12	Guido-Erik	2	[{"changed": {"fields": ["photo"]}}]	7	1
8	2017-12-26 19:04:48.899713-05	12	Guido-Erik	2	[]	7	1
9	2017-12-27 17:06:15.453818-05	2	PLAN FAMILIAR	2	[{"changed": {"fields": ["plan_culqi_id"]}}]	16	1
10	2017-12-27 17:06:20.474133-05	1	PLAN PERSONAL	2	[{"changed": {"fields": ["plan_culqi_id"]}}]	16	1
11	2017-12-27 21:43:05.027144-05	2	PLAN PERSONAL-Tufiño-Gustavo	3		17	1
12	2017-12-27 21:43:05.037081-05	1	PLAN PERSONAL-None-None	3		17	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 12, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	customuser	myuser
8	customuser	allergincreaction
9	customuser	emergencyattention
10	customuser	background
11	social_django	partial
12	social_django	association
13	social_django	usersocialauth
14	social_django	code
15	social_django	nonce
16	plans	plan
17	plans	planpatient
18	medicalhistory	medicalhistory
19	medicalhistory	medicalhistorymedia
20	medicalhistory	artifactmeasurement
21	competition	competition
22	plans	payment
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 22, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-12-20 16:24:28.062799-05
2	contenttypes	0002_remove_content_type_name	2017-12-20 16:24:28.070508-05
3	auth	0001_initial	2017-12-20 16:24:28.096981-05
4	auth	0002_alter_permission_name_max_length	2017-12-20 16:24:28.103345-05
5	auth	0003_alter_user_email_max_length	2017-12-20 16:24:28.111761-05
6	auth	0004_alter_user_username_opts	2017-12-20 16:24:28.11804-05
7	auth	0005_alter_user_last_login_null	2017-12-20 16:24:28.124321-05
8	auth	0006_require_contenttypes_0002	2017-12-20 16:24:28.126102-05
9	auth	0007_alter_validators_add_error_messages	2017-12-20 16:24:28.132196-05
10	auth	0008_alter_user_username_max_length	2017-12-20 16:24:28.138534-05
11	customuser	0001_initial	2017-12-20 16:24:28.259185-05
12	admin	0001_initial	2017-12-20 16:24:28.282416-05
13	admin	0002_logentry_remove_auto_add	2017-12-20 16:24:28.298143-05
14	authtoken	0001_initial	2017-12-20 16:24:28.316565-05
15	authtoken	0002_auto_20160226_1747	2017-12-20 16:24:28.375689-05
16	sessions	0001_initial	2017-12-20 16:24:28.383459-05
17	default	0001_initial	2017-12-20 16:24:28.440413-05
18	social_auth	0001_initial	2017-12-20 16:24:28.441753-05
19	default	0002_add_related_name	2017-12-20 16:24:28.462093-05
20	social_auth	0002_add_related_name	2017-12-20 16:24:28.463536-05
21	default	0003_alter_email_max_length	2017-12-20 16:24:28.468908-05
22	social_auth	0003_alter_email_max_length	2017-12-20 16:24:28.470348-05
23	default	0004_auto_20160423_0400	2017-12-20 16:24:28.488483-05
24	social_auth	0004_auto_20160423_0400	2017-12-20 16:24:28.490039-05
25	social_auth	0005_auto_20160727_2333	2017-12-20 16:24:28.49525-05
26	social_django	0006_partial	2017-12-20 16:24:28.504136-05
27	social_django	0007_code_timestamp	2017-12-20 16:24:28.513055-05
28	social_django	0008_partial_timestamp	2017-12-20 16:24:28.52327-05
29	social_django	0002_add_related_name	2017-12-20 16:24:28.525747-05
30	social_django	0001_initial	2017-12-20 16:24:28.526913-05
31	social_django	0005_auto_20160727_2333	2017-12-20 16:24:28.527986-05
32	social_django	0003_alter_email_max_length	2017-12-20 16:24:28.529045-05
33	social_django	0004_auto_20160423_0400	2017-12-20 16:24:28.530189-05
34	customuser	0002_auto_20171221_1138	2017-12-21 11:38:33.959378-05
35	plans	0001_initial	2017-12-22 12:48:46.409446-05
36	plans	0002_auto_20171222_1436	2017-12-22 14:36:22.480619-05
37	customuser	0003_myuser_url_photo	2017-12-26 10:36:47.47174-05
38	medicalhistory	0001_initial	2017-12-26 11:24:44.223621-05
39	medicalhistory	0002_auto_20171222_2200	2017-12-26 11:24:44.292021-05
40	medicalhistory	0003_artifactmeasurement_measurement_date	2017-12-26 11:24:44.311179-05
41	competition	0001_initial	2017-12-26 17:23:24.07373-05
42	competition	0002_auto_20171226_1340	2017-12-26 17:23:24.093357-05
43	customuser	0004_myuser_username	2017-12-26 17:23:24.116388-05
44	medicalhistory	0004_auto_20171226_1339	2017-12-26 17:23:24.200739-05
45	plans	0003_auto_20171227_1102	2017-12-27 11:03:24.495801-05
46	medicalhistory	0005_auto_20171227_1125	2017-12-27 17:10:14.335364-05
47	plans	0004_auto_20171227_1710	2017-12-27 17:10:14.342218-05
48	customuser	0005_auto_20171227_1858	2017-12-27 18:58:10.890368-05
49	plans	0005_auto_20171227_1858	2017-12-27 18:58:10.898345-05
50	customuser	0006_auto_20171227_1934	2017-12-27 19:34:13.231836-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 50, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
eui8sn2o7fy57vhtgbxnk1xnqny4qysr	OWQ5MGM0MTRkMmE5NDQ2Zjg0ZjFkZjhmYTYxNzI2YWU1MmQyMTliNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ1ODNjZGEwZWU1MGY4ODNiZWNiZmRiMzIxMWExNjc2MWJhZjgyOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-01-03 16:29:37.025295-05
157bqgjja9qve4rxz6xr7jbx4v5ik14s	MjgyZTU4OTQ4NjA1MzJmMjcyN2EwNGYzZmFlMWM4Y2M1NDg1NDU1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ1ODNjZGEwZWU1MGY4ODNiZWNiZmRiMzIxMWExNjc2MWJhZjgyOGYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-01-03 16:39:17.97019-05
i294cb5rkhrb28anwh4r6eu5or1ueaf4	OWQ5MGM0MTRkMmE5NDQ2Zjg0ZjFkZjhmYTYxNzI2YWU1MmQyMTliNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ1ODNjZGEwZWU1MGY4ODNiZWNiZmRiMzIxMWExNjc2MWJhZjgyOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-01-03 20:34:31.146841-05
z0ki5jfky8x86nolzo468m73m74v2p8c	MjgyZTU4OTQ4NjA1MzJmMjcyN2EwNGYzZmFlMWM4Y2M1NDg1NDU1Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ1ODNjZGEwZWU1MGY4ODNiZWNiZmRiMzIxMWExNjc2MWJhZjgyOGYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-01-04 11:38:44.964151-05
5pa5yt1q28qrtl5txrf2omn0yis61aek	MWI4ZTg5YjJhYmY2MThlNzFiZjdhYzYwZDEzYTM0NTVjOTY2YjU5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDU4M2NkYTBlZTUwZjg4M2JlY2JmZGIzMjExYTE2NzYxYmFmODI4ZiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-01-04 14:09:17.966609-05
i7abz0v4d2q5nfibgvw67x1x300bvt29	MWI4ZTg5YjJhYmY2MThlNzFiZjdhYzYwZDEzYTM0NTVjOTY2YjU5MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDU4M2NkYTBlZTUwZjg4M2JlY2JmZGIzMjExYTE2NzYxYmFmODI4ZiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-01-05 11:05:31.26699-05
gg8091lbjrm2ce7berscemsyikey6blr	OWQ5MGM0MTRkMmE5NDQ2Zjg0ZjFkZjhmYTYxNzI2YWU1MmQyMTliNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ1ODNjZGEwZWU1MGY4ODNiZWNiZmRiMzIxMWExNjc2MWJhZjgyOGYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-01-09 17:23:49.760597-05
ith65g8jzntr20uou6hp8oywg5j3u5d8	YTM1ZDM2ZDgzMzM2MGRmOTI0OGE4M2M1NGI4NjdiN2ZjYTU2NzZiZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI0NTgzY2RhMGVlNTBmODgzYmVjYmZkYjMyMTFhMTY3NjFiYWY4MjhmIn0=	2018-01-10 21:42:52.762922-05
\.


--
-- Data for Name: medicalhistory_artifactmeasurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medicalhistory_artifactmeasurement (id, token_sinch, weight, blood_pressure, created, updated, patient_id, measurement_date, temperature) FROM stdin;
\.


--
-- Name: medicalhistory_artifactmeasurement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medicalhistory_artifactmeasurement_id_seq', 1, false);


--
-- Data for Name: medicalhistory_medicalhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medicalhistory_medicalhistory (id, symptom, doctor_comment, diagnostic, weight, body_temperature, blood_pressure, heart_rate, created, updated, doctor_id, patient_id) FROM stdin;
\.


--
-- Name: medicalhistory_medicalhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medicalhistory_medicalhistory_id_seq', 1, false);


--
-- Data for Name: medicalhistory_medicalhistorymedia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medicalhistory_medicalhistorymedia (id, picture_url, created, updated, medical_history_id) FROM stdin;
\.


--
-- Name: medicalhistory_medicalhistorymedia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medicalhistory_medicalhistorymedia_id_seq', 1, false);


--
-- Data for Name: plans_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plans_payment (id, created, updated, amount, patient_id, plan_id) FROM stdin;
\.


--
-- Name: plans_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plans_payment_id_seq', 1, false);


--
-- Data for Name: plans_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plans_plan (id, created, updated, name, price, calls_quantity, plan_culqi_id, is_active) FROM stdin;
2	2017-12-27 17:06:15.449886-05	2017-12-22 14:56:02.093895-05	PLAN FAMILIAR	20	4	pln_test_9b5lPhg6D1W8h3oZ	t
1	2017-12-27 17:06:20.470209-05	2017-12-22 14:55:50.556841-05	PLAN PERSONAL	25	2	pln_test_iHJprfmwseegI5as	t
\.


--
-- Name: plans_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plans_plan_id_seq', 2, true);


--
-- Data for Name: plans_planpatient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plans_planpatient (id, patient_id, plan_id, created, extra_data, updated) FROM stdin;
\.


--
-- Name: plans_planpatient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plans_planpatient_id_seq', 2, true);


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_auth_association_id_seq', 1, false);


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_auth_code_id_seq', 1, false);


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_auth_nonce_id_seq', 1, false);


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_auth_partial_id_seq', 1, false);


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: competition_competition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition_competition
    ADD CONSTRAINT competition_competition_pkey PRIMARY KEY (id);


--
-- Name: customuser_allergincreaction_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_allergincreaction
    ADD CONSTRAINT customuser_allergincreaction_name_key UNIQUE (name);


--
-- Name: customuser_allergincreaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_allergincreaction
    ADD CONSTRAINT customuser_allergincreaction_pkey PRIMARY KEY (id);


--
-- Name: customuser_background_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_background
    ADD CONSTRAINT customuser_background_name_key UNIQUE (name);


--
-- Name: customuser_background_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_background
    ADD CONSTRAINT customuser_background_pkey PRIMARY KEY (id);


--
-- Name: customuser_emergencyattention_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_emergencyattention
    ADD CONSTRAINT customuser_emergencyattention_name_key UNIQUE (name);


--
-- Name: customuser_emergencyattention_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_emergencyattention
    ADD CONSTRAINT customuser_emergencyattention_pkey PRIMARY KEY (id);


--
-- Name: customuser_myuser_allerg_myuser_id_allergincreact_b779df98_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_allergic_reaction
    ADD CONSTRAINT customuser_myuser_allerg_myuser_id_allergincreact_b779df98_uniq UNIQUE (myuser_id, allergincreaction_id);


--
-- Name: customuser_myuser_allergic_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_allergic_reaction
    ADD CONSTRAINT customuser_myuser_allergic_reaction_pkey PRIMARY KEY (id);


--
-- Name: customuser_myuser_backgr_myuser_id_background_id_c0145271_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_background
    ADD CONSTRAINT customuser_myuser_backgr_myuser_id_background_id_c0145271_uniq UNIQUE (myuser_id, background_id);


--
-- Name: customuser_myuser_background_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_background
    ADD CONSTRAINT customuser_myuser_background_pkey PRIMARY KEY (id);


--
-- Name: customuser_myuser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser
    ADD CONSTRAINT customuser_myuser_email_key UNIQUE (email);


--
-- Name: customuser_myuser_groups_myuser_id_group_id_283bd936_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_groups
    ADD CONSTRAINT customuser_myuser_groups_myuser_id_group_id_283bd936_uniq UNIQUE (myuser_id, group_id);


--
-- Name: customuser_myuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_groups
    ADD CONSTRAINT customuser_myuser_groups_pkey PRIMARY KEY (id);


--
-- Name: customuser_myuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser
    ADD CONSTRAINT customuser_myuser_pkey PRIMARY KEY (id);


--
-- Name: customuser_myuser_user_p_myuser_id_permission_id_3d1f3f65_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_user_permissions
    ADD CONSTRAINT customuser_myuser_user_p_myuser_id_permission_id_3d1f3f65_uniq UNIQUE (myuser_id, permission_id);


--
-- Name: customuser_myuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_user_permissions
    ADD CONSTRAINT customuser_myuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: medicalhistory_artifactmeasurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_artifactmeasurement
    ADD CONSTRAINT medicalhistory_artifactmeasurement_pkey PRIMARY KEY (id);


--
-- Name: medicalhistory_medicalhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_medicalhistory
    ADD CONSTRAINT medicalhistory_medicalhistory_pkey PRIMARY KEY (id);


--
-- Name: medicalhistory_medicalhistorymedia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_medicalhistorymedia
    ADD CONSTRAINT medicalhistory_medicalhistorymedia_pkey PRIMARY KEY (id);


--
-- Name: plans_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_payment
    ADD CONSTRAINT plans_payment_pkey PRIMARY KEY (id);


--
-- Name: plans_plan_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_plan
    ADD CONSTRAINT plans_plan_name_key UNIQUE (name);


--
-- Name: plans_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_plan
    ADD CONSTRAINT plans_plan_pkey PRIMARY KEY (id);


--
-- Name: plans_plan_price_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_plan
    ADD CONSTRAINT plans_plan_price_key UNIQUE (price);


--
-- Name: plans_planpatient_patient_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_planpatient
    ADD CONSTRAINT plans_planpatient_patient_id_key UNIQUE (patient_id);


--
-- Name: plans_planpatient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_planpatient
    ADD CONSTRAINT plans_planpatient_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: competition_competition_doctor_id_f2c4a8e9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX competition_competition_doctor_id_f2c4a8e9 ON competition_competition USING btree (doctor_id);


--
-- Name: competition_competition_patient_id_ae0896ff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX competition_competition_patient_id_ae0896ff ON competition_competition USING btree (patient_id);


--
-- Name: customuser_allergincreaction_created_by_id_9f417105; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_allergincreaction_created_by_id_9f417105 ON customuser_allergincreaction USING btree (created_by_id);


--
-- Name: customuser_allergincreaction_name_f9d57c57_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_allergincreaction_name_f9d57c57_like ON customuser_allergincreaction USING btree (name varchar_pattern_ops);


--
-- Name: customuser_background_created_by_id_850466b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_background_created_by_id_850466b8 ON customuser_background USING btree (created_by_id);


--
-- Name: customuser_background_name_f9fc0ccd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_background_name_f9fc0ccd_like ON customuser_background USING btree (name varchar_pattern_ops);


--
-- Name: customuser_emergencyattention_created_by_id_d4a84ddf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_emergencyattention_created_by_id_d4a84ddf ON customuser_emergencyattention USING btree (created_by_id);


--
-- Name: customuser_emergencyattention_name_fec81713_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_emergencyattention_name_fec81713_like ON customuser_emergencyattention USING btree (name varchar_pattern_ops);


--
-- Name: customuser_myuser_allergic_allergincreaction_id_a6e5bac7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_allergic_allergincreaction_id_a6e5bac7 ON customuser_myuser_allergic_reaction USING btree (allergincreaction_id);


--
-- Name: customuser_myuser_allergic_reaction_myuser_id_5a411d1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_allergic_reaction_myuser_id_5a411d1c ON customuser_myuser_allergic_reaction USING btree (myuser_id);


--
-- Name: customuser_myuser_background_background_id_ed565d1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_background_background_id_ed565d1a ON customuser_myuser_background USING btree (background_id);


--
-- Name: customuser_myuser_background_myuser_id_46958d76; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_background_myuser_id_46958d76 ON customuser_myuser_background USING btree (myuser_id);


--
-- Name: customuser_myuser_email_dbea1720_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_email_dbea1720_like ON customuser_myuser USING btree (email varchar_pattern_ops);


--
-- Name: customuser_myuser_emergency_attention_id_e3a9c715; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_emergency_attention_id_e3a9c715 ON customuser_myuser USING btree (emergency_attention_id);


--
-- Name: customuser_myuser_groups_group_id_e8f28195; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_groups_group_id_e8f28195 ON customuser_myuser_groups USING btree (group_id);


--
-- Name: customuser_myuser_groups_myuser_id_504bdb4d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_groups_myuser_id_504bdb4d ON customuser_myuser_groups USING btree (myuser_id);


--
-- Name: customuser_myuser_user_permissions_myuser_id_29b969ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_user_permissions_myuser_id_29b969ee ON customuser_myuser_user_permissions USING btree (myuser_id);


--
-- Name: customuser_myuser_user_permissions_permission_id_376a9664; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customuser_myuser_user_permissions_permission_id_376a9664 ON customuser_myuser_user_permissions USING btree (permission_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: medicalhistory_artifactmeasurement_patient_id_ffb4bc52; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicalhistory_artifactmeasurement_patient_id_ffb4bc52 ON medicalhistory_artifactmeasurement USING btree (patient_id);


--
-- Name: medicalhistory_medicalhistory_doctor_id_0811d5d3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicalhistory_medicalhistory_doctor_id_0811d5d3 ON medicalhistory_medicalhistory USING btree (doctor_id);


--
-- Name: medicalhistory_medicalhistory_patient_id_74c71b41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicalhistory_medicalhistory_patient_id_74c71b41 ON medicalhistory_medicalhistory USING btree (patient_id);


--
-- Name: medicalhistory_medicalhistorymedia_medical_history_id_4aff75f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicalhistory_medicalhistorymedia_medical_history_id_4aff75f3 ON medicalhistory_medicalhistorymedia USING btree (medical_history_id);


--
-- Name: plans_payment_patient_id_4ddebc3f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plans_payment_patient_id_4ddebc3f ON plans_payment USING btree (patient_id);


--
-- Name: plans_payment_plan_id_80e69fa2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plans_payment_plan_id_80e69fa2 ON plans_payment USING btree (plan_id);


--
-- Name: plans_plan_name_7f9e0f56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plans_plan_name_7f9e0f56_like ON plans_plan USING btree (name varchar_pattern_ops);


--
-- Name: plans_planpatient_plan_id_5088c0d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plans_planpatient_plan_id_5088c0d7 ON plans_planpatient USING btree (plan_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167 ON social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_code_a2393167_like ON social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_code_timestamp_176b341f ON social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3 ON social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON social_auth_usersocialauth USING btree (user_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_customuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_customuser_myuser_id FOREIGN KEY (user_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_competit_doctor_id_f2c4a8e9_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition_competition
    ADD CONSTRAINT competition_competit_doctor_id_f2c4a8e9_fk_customuse FOREIGN KEY (doctor_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: competition_competit_patient_id_ae0896ff_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competition_competition
    ADD CONSTRAINT competition_competit_patient_id_ae0896ff_fk_customuse FOREIGN KEY (patient_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_allerginc_created_by_id_9f417105_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_allergincreaction
    ADD CONSTRAINT customuser_allerginc_created_by_id_9f417105_fk_customuse FOREIGN KEY (created_by_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_backgroun_created_by_id_850466b8_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_background
    ADD CONSTRAINT customuser_backgroun_created_by_id_850466b8_fk_customuse FOREIGN KEY (created_by_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_emergency_created_by_id_d4a84ddf_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_emergencyattention
    ADD CONSTRAINT customuser_emergency_created_by_id_d4a84ddf_fk_customuse FOREIGN KEY (created_by_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_al_allergincreaction_id_a6e5bac7_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_allergic_reaction
    ADD CONSTRAINT customuser_myuser_al_allergincreaction_id_a6e5bac7_fk_customuse FOREIGN KEY (allergincreaction_id) REFERENCES customuser_allergincreaction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_al_myuser_id_5a411d1c_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_allergic_reaction
    ADD CONSTRAINT customuser_myuser_al_myuser_id_5a411d1c_fk_customuse FOREIGN KEY (myuser_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_ba_background_id_ed565d1a_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_background
    ADD CONSTRAINT customuser_myuser_ba_background_id_ed565d1a_fk_customuse FOREIGN KEY (background_id) REFERENCES customuser_background(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_ba_myuser_id_46958d76_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_background
    ADD CONSTRAINT customuser_myuser_ba_myuser_id_46958d76_fk_customuse FOREIGN KEY (myuser_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_emergency_attention__e3a9c715_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser
    ADD CONSTRAINT customuser_myuser_emergency_attention__e3a9c715_fk_customuse FOREIGN KEY (emergency_attention_id) REFERENCES customuser_emergencyattention(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_gr_myuser_id_504bdb4d_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_groups
    ADD CONSTRAINT customuser_myuser_gr_myuser_id_504bdb4d_fk_customuse FOREIGN KEY (myuser_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_groups_group_id_e8f28195_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_groups
    ADD CONSTRAINT customuser_myuser_groups_group_id_e8f28195_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_us_myuser_id_29b969ee_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_user_permissions
    ADD CONSTRAINT customuser_myuser_us_myuser_id_29b969ee_fk_customuse FOREIGN KEY (myuser_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customuser_myuser_us_permission_id_376a9664_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customuser_myuser_user_permissions
    ADD CONSTRAINT customuser_myuser_us_permission_id_376a9664_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_customuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_customuser_myuser_id FOREIGN KEY (user_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: medicalhistory_artif_patient_id_ffb4bc52_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_artifactmeasurement
    ADD CONSTRAINT medicalhistory_artif_patient_id_ffb4bc52_fk_customuse FOREIGN KEY (patient_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: medicalhistory_medic_doctor_id_0811d5d3_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_medicalhistory
    ADD CONSTRAINT medicalhistory_medic_doctor_id_0811d5d3_fk_customuse FOREIGN KEY (doctor_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: medicalhistory_medic_medical_history_id_4aff75f3_fk_medicalhi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_medicalhistorymedia
    ADD CONSTRAINT medicalhistory_medic_medical_history_id_4aff75f3_fk_medicalhi FOREIGN KEY (medical_history_id) REFERENCES medicalhistory_medicalhistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: medicalhistory_medic_patient_id_74c71b41_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicalhistory_medicalhistory
    ADD CONSTRAINT medicalhistory_medic_patient_id_74c71b41_fk_customuse FOREIGN KEY (patient_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: plans_payment_patient_id_4ddebc3f_fk_customuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_payment
    ADD CONSTRAINT plans_payment_patient_id_4ddebc3f_fk_customuser_myuser_id FOREIGN KEY (patient_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: plans_payment_plan_id_80e69fa2_fk_plans_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_payment
    ADD CONSTRAINT plans_payment_plan_id_80e69fa2_fk_plans_plan_id FOREIGN KEY (plan_id) REFERENCES plans_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: plans_planpatient_patient_id_abe22bb5_fk_customuser_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_planpatient
    ADD CONSTRAINT plans_planpatient_patient_id_abe22bb5_fk_customuser_myuser_id FOREIGN KEY (patient_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: plans_planpatient_plan_id_5088c0d7_fk_plans_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans_planpatient
    ADD CONSTRAINT plans_planpatient_plan_id_5088c0d7_fk_plans_plan_id FOREIGN KEY (plan_id) REFERENCES plans_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersoci_user_id_17d28448_fk_customuse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersoci_user_id_17d28448_fk_customuse FOREIGN KEY (user_id) REFERENCES customuser_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

