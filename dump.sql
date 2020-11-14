--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.2

-- Started on 2020-11-13 19:28:39 GMT

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
-- TOC entry 2 (class 3079 OID 16451)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16586)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    category character varying,
    name character varying,
    icon character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    platform_id uuid,
    currency_id json,
    country_id json
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16570)
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id uuid NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16568)
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 212
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- TOC entry 211 (class 1259 OID 16558)
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16556)
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 210
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- TOC entry 204 (class 1259 OID 16418)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16532)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying,
    iso_code character varying,
    continent character varying,
    currency_id uuid,
    flag character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    fiscal_year_start date
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16523)
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying,
    code character varying,
    symbol character varying,
    decimal_places integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    kind character varying,
    fx_eur double precision
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16653)
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loans (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    country_id uuid,
    currency_id uuid,
    originator_id uuid,
    platform_id uuid,
    code character varying,
    internal_code character varying,
    name character varying,
    borrower character varying,
    gender character varying,
    air double precision,
    status character varying,
    xirr double precision,
    rating character varying,
    dti_rating double precision,
    borrower_type character varying,
    category character varying,
    amount double precision,
    description text,
    link character varying,
    secured_buyback boolean,
    secured_personal boolean,
    secured_collaretal boolean,
    security text,
    date_listed date,
    date_issued date,
    date_maturity date,
    amortization character varying,
    installment character varying,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.loans OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16633)
-- Name: originators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.originators (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying,
    product_type_individuals character varying,
    product_type_companies character varying,
    length character varying,
    default_rate double precision,
    air double precision,
    xirr double precision,
    rating character varying,
    apr double precision,
    logo character varying,
    icon character varying,
    website character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_category character varying
);


ALTER TABLE public.originators OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16642)
-- Name: platform_originators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platform_originators (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    originator_id uuid,
    platform_id uuid,
    status character varying,
    skin_game double precision,
    grace_period integer,
    rating character varying,
    length character varying,
    apr double precision,
    structure character varying,
    notes text,
    buyback character varying,
    buyback_principal boolean,
    buyback_interest boolean,
    buyback_activation integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.platform_originators OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16612)
-- Name: platforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platforms (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    contact_id uuid,
    category character varying,
    status character varying,
    liquidity character varying,
    term character varying,
    invest_mode text,
    min_investment character varying,
    secondary_market character varying,
    taxes character varying,
    cashflow_options character varying,
    protection_scheme character varying,
    cost character varying,
    profitable boolean,
    ifisa boolean,
    structure character varying,
    account_category character varying,
    welcome_bonus character varying,
    promo character varying,
    promo_end date,
    icon character varying,
    logo character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.platforms OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16542)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying,
    resource_type character varying,
    resource_id uuid,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16410)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16598)
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accounts (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    country_id uuid,
    account_id uuid,
    platform_id uuid,
    currency_id uuid,
    user_id uuid,
    category character varying,
    name character varying,
    total_fee double precision,
    total_loss double precision,
    total_tax double precision,
    active boolean,
    total_invest double precision,
    total_profit double precision,
    total_referral double precision,
    total_interest double precision,
    total_bonus double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_accounts OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16666)
-- Name: user_loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_loans (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    country_id uuid,
    loan_id uuid,
    user_id uuid,
    currency_id uuid,
    originator_id uuid,
    user_account_id uuid,
    platform_id uuid,
    slice_name character varying,
    market character varying,
    xirr double precision,
    investment_amount double precision,
    invest_mode character varying,
    "position" character varying,
    date_in date,
    date_out date,
    principal_remaining double precision,
    interest double precision,
    bonus double precision,
    tax double precision,
    loss double precision,
    fee double precision,
    contract_url character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_loans OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16622)
-- Name: user_platforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_platforms (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id uuid,
    platform_id uuid,
    overview text,
    strategy text,
    "user" character varying,
    pass character varying,
    internal_id character varying,
    notes text,
    rating integer,
    xirr double precision,
    total_loss double precision,
    air double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_platforms OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16504)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    provider character varying DEFAULT 'email'::character varying NOT NULL,
    uid character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    allow_password_change boolean DEFAULT false,
    remember_created_at timestamp without time zone,
    username character varying,
    image character varying,
    email character varying,
    currency_id uuid,
    country_id uuid,
    tokens json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    dob date,
    name character varying,
    surname character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16551)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id uuid,
    role_id uuid
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- TOC entry 3810 (class 2604 OID 16573)
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- TOC entry 3809 (class 2604 OID 16561)
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- TOC entry 3848 (class 2606 OID 16594)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3844 (class 2606 OID 16578)
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 3841 (class 2606 OID 16566)
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3822 (class 2606 OID 16425)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3834 (class 2606 OID 16540)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3832 (class 2606 OID 16531)
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- TOC entry 3875 (class 2606 OID 16661)
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- TOC entry 3865 (class 2606 OID 16641)
-- Name: originators originators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.originators
    ADD CONSTRAINT originators_pkey PRIMARY KEY (id);


--
-- TOC entry 3869 (class 2606 OID 16650)
-- Name: platform_originators platform_originators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platform_originators
    ADD CONSTRAINT platform_originators_pkey PRIMARY KEY (id);


--
-- TOC entry 3859 (class 2606 OID 16620)
-- Name: platforms platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platforms
    ADD CONSTRAINT platforms_pkey PRIMARY KEY (id);


--
-- TOC entry 3838 (class 2606 OID 16550)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3820 (class 2606 OID 16417)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3856 (class 2606 OID 16606)
-- Name: user_accounts user_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3884 (class 2606 OID 16674)
-- Name: user_loans user_loans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_loans
    ADD CONSTRAINT user_loans_pkey PRIMARY KEY (id);


--
-- TOC entry 3863 (class 2606 OID 16630)
-- Name: user_platforms user_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_platforms
    ADD CONSTRAINT user_platforms_pkey PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 16516)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3849 (class 1259 OID 16597)
-- Name: index_accounts_on_platform_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_accounts_on_platform_id ON public.accounts USING btree (platform_id);


--
-- TOC entry 3845 (class 1259 OID 16584)
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- TOC entry 3846 (class 1259 OID 16585)
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- TOC entry 3842 (class 1259 OID 16567)
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- TOC entry 3835 (class 1259 OID 16541)
-- Name: index_countries_on_currency_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_countries_on_currency_id ON public.countries USING btree (currency_id);


--
-- TOC entry 3870 (class 1259 OID 16662)
-- Name: index_loans_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_loans_on_country_id ON public.loans USING btree (country_id);


--
-- TOC entry 3871 (class 1259 OID 16663)
-- Name: index_loans_on_currency_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_loans_on_currency_id ON public.loans USING btree (currency_id);


--
-- TOC entry 3872 (class 1259 OID 16664)
-- Name: index_loans_on_originator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_loans_on_originator_id ON public.loans USING btree (originator_id);


--
-- TOC entry 3873 (class 1259 OID 16665)
-- Name: index_loans_on_platform_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_loans_on_platform_id ON public.loans USING btree (platform_id);


--
-- TOC entry 3866 (class 1259 OID 16651)
-- Name: index_platform_originators_on_originator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_platform_originators_on_originator_id ON public.platform_originators USING btree (originator_id);


--
-- TOC entry 3867 (class 1259 OID 16652)
-- Name: index_platform_originators_on_platform_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_platform_originators_on_platform_id ON public.platform_originators USING btree (platform_id);


--
-- TOC entry 3857 (class 1259 OID 16621)
-- Name: index_platforms_on_contact_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_platforms_on_contact_id ON public.platforms USING btree (contact_id);


--
-- TOC entry 3836 (class 1259 OID 16554)
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON public.roles USING btree (name, resource_type, resource_id);


--
-- TOC entry 3850 (class 1259 OID 16608)
-- Name: index_user_accounts_on_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_accounts_on_account_id ON public.user_accounts USING btree (account_id);


--
-- TOC entry 3851 (class 1259 OID 16607)
-- Name: index_user_accounts_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_accounts_on_country_id ON public.user_accounts USING btree (country_id);


--
-- TOC entry 3852 (class 1259 OID 16610)
-- Name: index_user_accounts_on_currency_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_accounts_on_currency_id ON public.user_accounts USING btree (currency_id);


--
-- TOC entry 3853 (class 1259 OID 16609)
-- Name: index_user_accounts_on_platform_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_accounts_on_platform_id ON public.user_accounts USING btree (platform_id);


--
-- TOC entry 3854 (class 1259 OID 16611)
-- Name: index_user_accounts_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_accounts_on_user_id ON public.user_accounts USING btree (user_id);


--
-- TOC entry 3876 (class 1259 OID 16675)
-- Name: index_user_loans_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_loans_on_country_id ON public.user_loans USING btree (country_id);


--
-- TOC entry 3877 (class 1259 OID 16678)
-- Name: index_user_loans_on_currency_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_loans_on_currency_id ON public.user_loans USING btree (currency_id);


--
-- TOC entry 3878 (class 1259 OID 16676)
-- Name: index_user_loans_on_loan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_loans_on_loan_id ON public.user_loans USING btree (loan_id);


--
-- TOC entry 3879 (class 1259 OID 16679)
-- Name: index_user_loans_on_originator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_loans_on_originator_id ON public.user_loans USING btree (originator_id);


--
-- TOC entry 3880 (class 1259 OID 16681)
-- Name: index_user_loans_on_platform_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_loans_on_platform_id ON public.user_loans USING btree (platform_id);


--
-- TOC entry 3881 (class 1259 OID 16680)
-- Name: index_user_loans_on_user_account_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_loans_on_user_account_id ON public.user_loans USING btree (user_account_id);


--
-- TOC entry 3882 (class 1259 OID 16677)
-- Name: index_user_loans_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_loans_on_user_id ON public.user_loans USING btree (user_id);


--
-- TOC entry 3860 (class 1259 OID 16632)
-- Name: index_user_platforms_on_platform_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_platforms_on_platform_id ON public.user_platforms USING btree (platform_id);


--
-- TOC entry 3861 (class 1259 OID 16631)
-- Name: index_user_platforms_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_platforms_on_user_id ON public.user_platforms USING btree (user_id);


--
-- TOC entry 3823 (class 1259 OID 16522)
-- Name: index_users_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_country_id ON public.users USING btree (country_id);


--
-- TOC entry 3824 (class 1259 OID 16521)
-- Name: index_users_on_currency_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_currency_id ON public.users USING btree (currency_id);


--
-- TOC entry 3825 (class 1259 OID 16517)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 3826 (class 1259 OID 16519)
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- TOC entry 3827 (class 1259 OID 16518)
-- Name: index_users_on_uid_and_provider; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_uid_and_provider ON public.users USING btree (uid, provider);


--
-- TOC entry 3828 (class 1259 OID 16520)
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);


--
-- TOC entry 3839 (class 1259 OID 16555)
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON public.users_roles USING btree (user_id, role_id);


--
-- TOC entry 3885 (class 2606 OID 16579)
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-11-13 19:28:51 GMT

--
-- PostgreSQL database dump complete
--

