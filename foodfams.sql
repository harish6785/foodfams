--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_addresses (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    zipcode character varying,
    phone character varying,
    state_name character varying,
    alternative_phone character varying,
    company character varying,
    state_id integer,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_addresses OWNER TO postgres;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_addresses_id_seq OWNER TO postgres;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_addresses_id_seq OWNED BY spree_addresses.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_adjustments (
    id integer NOT NULL,
    source_id integer,
    source_type character varying,
    adjustable_id integer,
    adjustable_type character varying,
    amount numeric(10,2),
    label character varying,
    mandatory boolean,
    eligible boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying,
    order_id integer,
    included boolean DEFAULT false
);


ALTER TABLE public.spree_adjustments OWNER TO postgres;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_adjustments_id_seq OWNER TO postgres;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_adjustments_id_seq OWNED BY spree_adjustments.id;


--
-- Name: spree_assets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_assets (
    id integer NOT NULL,
    viewable_id integer,
    viewable_type character varying,
    attachment_width integer,
    attachment_height integer,
    attachment_file_size integer,
    "position" integer,
    attachment_content_type character varying,
    attachment_file_name character varying,
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    alt text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_assets OWNER TO postgres;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_assets_id_seq OWNER TO postgres;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_assets_id_seq OWNED BY spree_assets.id;


--
-- Name: spree_authentication_methods; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_authentication_methods (
    id integer NOT NULL,
    environment character varying,
    provider character varying,
    api_key character varying,
    api_secret character varying,
    active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_authentication_methods OWNER TO postgres;

--
-- Name: spree_authentication_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_authentication_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_authentication_methods_id_seq OWNER TO postgres;

--
-- Name: spree_authentication_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_authentication_methods_id_seq OWNED BY spree_authentication_methods.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_calculators (
    id integer NOT NULL,
    type character varying,
    calculable_id integer,
    calculable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    preferences text
);


ALTER TABLE public.spree_calculators OWNER TO postgres;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_calculators_id_seq OWNER TO postgres;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_calculators_id_seq OWNED BY spree_calculators.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_countries (
    id integer NOT NULL,
    iso_name character varying,
    iso character varying,
    iso3 character varying,
    name character varying,
    numcode integer,
    states_required boolean DEFAULT false,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_countries OWNER TO postgres;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_countries_id_seq OWNER TO postgres;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_countries_id_seq OWNED BY spree_countries.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_credit_cards (
    id integer NOT NULL,
    month character varying,
    year character varying,
    cc_type character varying,
    last_digits character varying,
    address_id integer,
    gateway_customer_profile_id character varying,
    gateway_payment_profile_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    user_id integer,
    payment_method_id integer,
    "default" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.spree_credit_cards OWNER TO postgres;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_credit_cards_id_seq OWNER TO postgres;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_credit_cards_id_seq OWNED BY spree_credit_cards.id;


--
-- Name: spree_customer_returns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_customer_returns (
    id integer NOT NULL,
    number character varying,
    stock_location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_customer_returns OWNER TO postgres;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_customer_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_customer_returns_id_seq OWNER TO postgres;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_customer_returns_id_seq OWNED BY spree_customer_returns.id;


--
-- Name: spree_gateways; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_gateways (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    environment character varying DEFAULT 'development'::character varying,
    server character varying DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    preferences text
);


ALTER TABLE public.spree_gateways OWNER TO postgres;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_gateways_id_seq OWNER TO postgres;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_gateways_id_seq OWNED BY spree_gateways.id;


--
-- Name: spree_inventory_units; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_inventory_units (
    id integer NOT NULL,
    state character varying,
    variant_id integer,
    order_id integer,
    shipment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pending boolean DEFAULT true,
    line_item_id integer
);


ALTER TABLE public.spree_inventory_units OWNER TO postgres;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_inventory_units_id_seq OWNER TO postgres;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_inventory_units_id_seq OWNED BY spree_inventory_units.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_line_items (
    id integer NOT NULL,
    variant_id integer,
    order_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    cost_price numeric(10,2),
    tax_category_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    pre_tax_amount numeric(8,2) DEFAULT 0
);


ALTER TABLE public.spree_line_items OWNER TO postgres;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_line_items_id_seq OWNED BY spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_log_entries (
    id integer NOT NULL,
    source_id integer,
    source_type character varying,
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_log_entries OWNER TO postgres;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_log_entries_id_seq OWNER TO postgres;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_log_entries_id_seq OWNED BY spree_log_entries.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_option_types OWNER TO postgres;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_types_id_seq OWNER TO postgres;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_option_types_id_seq OWNED BY spree_option_types.id;


--
-- Name: spree_option_types_prototypes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_option_types_prototypes (
    prototype_id integer,
    option_type_id integer
);


ALTER TABLE public.spree_option_types_prototypes OWNER TO postgres;

--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_option_values (
    id integer NOT NULL,
    "position" integer,
    name character varying,
    presentation character varying,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_option_values OWNER TO postgres;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_values_id_seq OWNER TO postgres;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_option_values_id_seq OWNED BY spree_option_values.id;


--
-- Name: spree_option_values_variants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_option_values_variants (
    variant_id integer,
    option_value_id integer
);


ALTER TABLE public.spree_option_values_variants OWNER TO postgres;

--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_orders (
    id integer NOT NULL,
    number character varying(32),
    item_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    total numeric(10,2) DEFAULT 0.0 NOT NULL,
    state character varying,
    adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    user_id integer,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(10,2) DEFAULT 0.0,
    shipping_method_id integer,
    shipment_state character varying,
    payment_state character varying,
    email character varying,
    special_instructions text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    last_ip_address character varying,
    created_by_id integer,
    shipment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    channel character varying DEFAULT 'spree'::character varying,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    item_count integer DEFAULT 0,
    approver_id integer,
    approved_at timestamp without time zone,
    confirmation_delivered boolean DEFAULT false,
    considered_risky boolean DEFAULT false,
    guest_token character varying,
    canceled_at timestamp without time zone,
    canceler_id integer,
    store_id integer,
    state_lock_version integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.spree_orders OWNER TO postgres;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_orders_id_seq OWNER TO postgres;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_orders_id_seq OWNED BY spree_orders.id;


--
-- Name: spree_orders_promotions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_orders_promotions (
    order_id integer,
    promotion_id integer
);


ALTER TABLE public.spree_orders_promotions OWNER TO postgres;

--
-- Name: spree_payment_capture_events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_payment_capture_events (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0,
    payment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_payment_capture_events OWNER TO postgres;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_payment_capture_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payment_capture_events_id_seq OWNER TO postgres;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_payment_capture_events_id_seq OWNED BY spree_payment_capture_events.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_payment_methods (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    display_on character varying,
    auto_capture boolean,
    preferences text
);


ALTER TABLE public.spree_payment_methods OWNER TO postgres;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payment_methods_id_seq OWNER TO postgres;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_payment_methods_id_seq OWNED BY spree_payment_methods.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_payments (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    source_id integer,
    source_type character varying,
    payment_method_id integer,
    state character varying,
    response_code character varying,
    avs_response character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying,
    cvv_response_code character varying,
    cvv_response_message character varying
);


ALTER TABLE public.spree_payments OWNER TO postgres;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payments_id_seq OWNER TO postgres;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_payments_id_seq OWNED BY spree_payments.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_preferences (
    id integer NOT NULL,
    value text,
    key character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_preferences OWNER TO postgres;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_preferences_id_seq OWNER TO postgres;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_preferences_id_seq OWNED BY spree_preferences.id;


--
-- Name: spree_prices; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_prices (
    id integer NOT NULL,
    variant_id integer NOT NULL,
    amount numeric(10,2),
    currency character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_prices OWNER TO postgres;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prices_id_seq OWNER TO postgres;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_prices_id_seq OWNED BY spree_prices.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_product_option_types (
    id integer NOT NULL,
    "position" integer,
    product_id integer,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_product_option_types OWNER TO postgres;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_option_types_id_seq OWNER TO postgres;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_product_option_types_id_seq OWNED BY spree_product_option_types.id;


--
-- Name: spree_product_properties; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_product_properties (
    id integer NOT NULL,
    value character varying,
    product_id integer,
    property_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


ALTER TABLE public.spree_product_properties OWNER TO postgres;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_properties_id_seq OWNER TO postgres;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_product_properties_id_seq OWNED BY spree_product_properties.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_products (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    available_on timestamp without time zone,
    deleted_at timestamp without time zone,
    slug character varying,
    meta_description text,
    meta_keywords character varying,
    tax_category_id integer,
    shipping_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    promotionable boolean DEFAULT true,
    meta_title character varying
);


ALTER TABLE public.spree_products OWNER TO postgres;

--
-- Name: spree_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_products_id_seq OWNER TO postgres;

--
-- Name: spree_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_products_id_seq OWNED BY spree_products.id;


--
-- Name: spree_products_promotion_rules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_products_promotion_rules (
    product_id integer,
    promotion_rule_id integer
);


ALTER TABLE public.spree_products_promotion_rules OWNER TO postgres;

--
-- Name: spree_products_taxons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_products_taxons (
    product_id integer,
    taxon_id integer,
    id integer NOT NULL,
    "position" integer
);


ALTER TABLE public.spree_products_taxons OWNER TO postgres;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_products_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_products_taxons_id_seq OWNER TO postgres;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_products_taxons_id_seq OWNED BY spree_products_taxons.id;


--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1
);


ALTER TABLE public.spree_promotion_action_line_items OWNER TO postgres;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_action_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_promotion_action_line_items_id_seq OWNED BY spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_actions (
    id integer NOT NULL,
    promotion_id integer,
    "position" integer,
    type character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_promotion_actions OWNER TO postgres;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_actions_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_promotion_actions_id_seq OWNED BY spree_promotion_actions.id;


--
-- Name: spree_promotion_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying
);


ALTER TABLE public.spree_promotion_categories OWNER TO postgres;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_promotion_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_categories_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_promotion_categories_id_seq OWNED BY spree_promotion_categories.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_rules (
    id integer NOT NULL,
    promotion_id integer,
    user_id integer,
    product_group_id integer,
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    preferences text
);


ALTER TABLE public.spree_promotion_rules OWNER TO postgres;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rules_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_promotion_rules_id_seq OWNED BY spree_promotion_rules.id;


--
-- Name: spree_promotion_rules_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_rules_users (
    user_id integer,
    promotion_rule_id integer
);


ALTER TABLE public.spree_promotion_rules_users OWNER TO postgres;

--
-- Name: spree_promotions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotions (
    id integer NOT NULL,
    description character varying,
    expires_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying,
    type character varying,
    usage_limit integer,
    match_policy character varying DEFAULT 'all'::character varying,
    code character varying,
    advertise boolean DEFAULT false,
    path character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    promotion_category_id integer
);


ALTER TABLE public.spree_promotions OWNER TO postgres;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotions_id_seq OWNER TO postgres;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_promotions_id_seq OWNED BY spree_promotions.id;


--
-- Name: spree_properties; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_properties (
    id integer NOT NULL,
    name character varying,
    presentation character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_properties OWNER TO postgres;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_properties_id_seq OWNER TO postgres;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_properties_id_seq OWNED BY spree_properties.id;


--
-- Name: spree_properties_prototypes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_properties_prototypes (
    prototype_id integer,
    property_id integer
);


ALTER TABLE public.spree_properties_prototypes OWNER TO postgres;

--
-- Name: spree_prototypes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_prototypes (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_prototypes OWNER TO postgres;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prototypes_id_seq OWNER TO postgres;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_prototypes_id_seq OWNED BY spree_prototypes.id;


--
-- Name: spree_refund_reasons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_refund_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_refund_reasons OWNER TO postgres;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_refund_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_refund_reasons_id_seq OWNER TO postgres;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_refund_reasons_id_seq OWNED BY spree_refund_reasons.id;


--
-- Name: spree_refunds; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_refunds (
    id integer NOT NULL,
    payment_id integer,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    transaction_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    refund_reason_id integer,
    reimbursement_id integer
);


ALTER TABLE public.spree_refunds OWNER TO postgres;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_refunds_id_seq OWNER TO postgres;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_refunds_id_seq OWNED BY spree_refunds.id;


--
-- Name: spree_reimbursement_credits; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_reimbursement_credits (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    reimbursement_id integer,
    creditable_id integer,
    creditable_type character varying
);


ALTER TABLE public.spree_reimbursement_credits OWNER TO postgres;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_reimbursement_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursement_credits_id_seq OWNER TO postgres;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_reimbursement_credits_id_seq OWNED BY spree_reimbursement_credits.id;


--
-- Name: spree_reimbursement_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_reimbursement_types (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying
);


ALTER TABLE public.spree_reimbursement_types OWNER TO postgres;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_reimbursement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursement_types_id_seq OWNER TO postgres;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_reimbursement_types_id_seq OWNED BY spree_reimbursement_types.id;


--
-- Name: spree_reimbursements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_reimbursements (
    id integer NOT NULL,
    number character varying,
    reimbursement_status character varying,
    customer_return_id integer,
    order_id integer,
    total numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_reimbursements OWNER TO postgres;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_reimbursements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursements_id_seq OWNER TO postgres;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_reimbursements_id_seq OWNED BY spree_reimbursements.id;


--
-- Name: spree_return_authorization_reasons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_return_authorization_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_return_authorization_reasons OWNER TO postgres;

--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_return_authorization_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_authorization_reasons_id_seq OWNER TO postgres;

--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_return_authorization_reasons_id_seq OWNED BY spree_return_authorization_reasons.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_return_authorizations (
    id integer NOT NULL,
    number character varying,
    state character varying,
    order_id integer,
    memo text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stock_location_id integer,
    return_authorization_reason_id integer
);


ALTER TABLE public.spree_return_authorizations OWNER TO postgres;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_authorizations_id_seq OWNER TO postgres;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_return_authorizations_id_seq OWNED BY spree_return_authorizations.id;


--
-- Name: spree_return_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_return_items (
    id integer NOT NULL,
    return_authorization_id integer,
    inventory_unit_id integer,
    exchange_variant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    included_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    reception_status character varying,
    acceptance_status character varying,
    customer_return_id integer,
    reimbursement_id integer,
    exchange_inventory_unit_id integer,
    acceptance_status_errors text,
    preferred_reimbursement_type_id integer,
    override_reimbursement_type_id integer,
    resellable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.spree_return_items OWNER TO postgres;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_return_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_items_id_seq OWNER TO postgres;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_return_items_id_seq OWNED BY spree_return_items.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_roles (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.spree_roles OWNER TO postgres;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_roles_id_seq OWNER TO postgres;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_roles_id_seq OWNED BY spree_roles.id;


--
-- Name: spree_roles_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_roles_users (
    role_id integer,
    user_id integer
);


ALTER TABLE public.spree_roles_users OWNER TO postgres;

--
-- Name: spree_shipments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipments (
    id integer NOT NULL,
    tracking character varying,
    number character varying,
    cost numeric(10,2) DEFAULT 0.0,
    shipped_at timestamp without time zone,
    order_id integer,
    address_id integer,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stock_location_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    pre_tax_amount numeric(8,2) DEFAULT 0
);


ALTER TABLE public.spree_shipments OWNER TO postgres;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipments_id_seq OWNER TO postgres;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_shipments_id_seq OWNED BY spree_shipments.id;


--
-- Name: spree_shipping_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipping_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_shipping_categories OWNER TO postgres;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_categories_id_seq OWNER TO postgres;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_shipping_categories_id_seq OWNED BY spree_shipping_categories.id;


--
-- Name: spree_shipping_method_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipping_method_categories (
    id integer NOT NULL,
    shipping_method_id integer NOT NULL,
    shipping_category_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_shipping_method_categories OWNER TO postgres;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_shipping_method_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_method_categories_id_seq OWNER TO postgres;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_shipping_method_categories_id_seq OWNED BY spree_shipping_method_categories.id;


--
-- Name: spree_shipping_methods; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipping_methods (
    id integer NOT NULL,
    name character varying,
    display_on character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tracking_url character varying,
    admin_name character varying,
    tax_category_id integer,
    code character varying
);


ALTER TABLE public.spree_shipping_methods OWNER TO postgres;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_methods_id_seq OWNER TO postgres;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_shipping_methods_id_seq OWNED BY spree_shipping_methods.id;


--
-- Name: spree_shipping_methods_zones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipping_methods_zones (
    shipping_method_id integer,
    zone_id integer
);


ALTER TABLE public.spree_shipping_methods_zones OWNER TO postgres;

--
-- Name: spree_shipping_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipping_rates (
    id integer NOT NULL,
    shipment_id integer,
    shipping_method_id integer,
    selected boolean DEFAULT false,
    cost numeric(8,2) DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tax_rate_id integer
);


ALTER TABLE public.spree_shipping_rates OWNER TO postgres;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_rates_id_seq OWNER TO postgres;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_shipping_rates_id_seq OWNED BY spree_shipping_rates.id;


--
-- Name: spree_skrill_transactions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_skrill_transactions (
    id integer NOT NULL,
    email character varying,
    amount double precision,
    currency character varying,
    transaction_id integer,
    customer_id integer,
    payment_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_skrill_transactions OWNER TO postgres;

--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_skrill_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_skrill_transactions_id_seq OWNER TO postgres;

--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_skrill_transactions_id_seq OWNED BY spree_skrill_transactions.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_state_changes (
    id integer NOT NULL,
    name character varying,
    previous_state character varying,
    stateful_id integer,
    user_id integer,
    stateful_type character varying,
    next_state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_state_changes OWNER TO postgres;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_state_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_state_changes_id_seq OWNER TO postgres;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_state_changes_id_seq OWNED BY spree_state_changes.id;


--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_states (
    id integer NOT NULL,
    name character varying,
    abbr character varying,
    country_id integer,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_states OWNER TO postgres;

--
-- Name: spree_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_states_id_seq OWNER TO postgres;

--
-- Name: spree_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_states_id_seq OWNED BY spree_states.id;


--
-- Name: spree_stock_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_stock_items (
    id integer NOT NULL,
    stock_location_id integer,
    variant_id integer,
    count_on_hand integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    backorderable boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_stock_items OWNER TO postgres;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_stock_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_items_id_seq OWNER TO postgres;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_stock_items_id_seq OWNED BY spree_stock_items.id;


--
-- Name: spree_stock_locations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_stock_locations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    state_id integer,
    state_name character varying,
    country_id integer,
    zipcode character varying,
    phone character varying,
    active boolean DEFAULT true,
    backorderable_default boolean DEFAULT false,
    propagate_all_variants boolean DEFAULT true,
    admin_name character varying
);


ALTER TABLE public.spree_stock_locations OWNER TO postgres;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_locations_id_seq OWNER TO postgres;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_stock_locations_id_seq OWNED BY spree_stock_locations.id;


--
-- Name: spree_stock_movements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_stock_movements (
    id integer NOT NULL,
    stock_item_id integer,
    quantity integer DEFAULT 0,
    action character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    originator_id integer,
    originator_type character varying
);


ALTER TABLE public.spree_stock_movements OWNER TO postgres;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_movements_id_seq OWNER TO postgres;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_stock_movements_id_seq OWNED BY spree_stock_movements.id;


--
-- Name: spree_stock_transfers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_stock_transfers (
    id integer NOT NULL,
    type character varying,
    reference character varying,
    source_location_id integer,
    destination_location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying
);


ALTER TABLE public.spree_stock_transfers OWNER TO postgres;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_stock_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_transfers_id_seq OWNER TO postgres;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_stock_transfers_id_seq OWNED BY spree_stock_transfers.id;


--
-- Name: spree_stores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_stores (
    id integer NOT NULL,
    name character varying,
    url character varying,
    meta_description text,
    meta_keywords text,
    seo_title character varying,
    mail_from_address character varying,
    default_currency character varying,
    code character varying,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_stores OWNER TO postgres;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stores_id_seq OWNER TO postgres;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_stores_id_seq OWNED BY spree_stores.id;


--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_tax_categories (
    id integer NOT NULL,
    name character varying,
    description character varying,
    is_default boolean DEFAULT false,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tax_code character varying
);


ALTER TABLE public.spree_tax_categories OWNER TO postgres;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_categories_id_seq OWNER TO postgres;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_tax_categories_id_seq OWNED BY spree_tax_categories.id;


--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_tax_rates (
    id integer NOT NULL,
    amount numeric(8,5),
    zone_id integer,
    tax_category_id integer,
    included_in_price boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    show_rate_in_label boolean DEFAULT true,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_tax_rates OWNER TO postgres;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_rates_id_seq OWNER TO postgres;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_tax_rates_id_seq OWNED BY spree_tax_rates.id;


--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_taxonomies (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


ALTER TABLE public.spree_taxonomies OWNER TO postgres;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxonomies_id_seq OWNER TO postgres;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_taxonomies_id_seq OWNED BY spree_taxonomies.id;


--
-- Name: spree_taxons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_taxons (
    id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying NOT NULL,
    permalink character varying,
    taxonomy_id integer,
    lft integer,
    rgt integer,
    icon_file_name character varying,
    icon_content_type character varying,
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    meta_title character varying,
    meta_description character varying,
    meta_keywords character varying,
    depth integer
);


ALTER TABLE public.spree_taxons OWNER TO postgres;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxons_id_seq OWNER TO postgres;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_taxons_id_seq OWNED BY spree_taxons.id;


--
-- Name: spree_taxons_promotion_rules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_taxons_promotion_rules (
    id integer NOT NULL,
    taxon_id integer,
    promotion_rule_id integer
);


ALTER TABLE public.spree_taxons_promotion_rules OWNER TO postgres;

--
-- Name: spree_taxons_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_taxons_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxons_promotion_rules_id_seq OWNER TO postgres;

--
-- Name: spree_taxons_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_taxons_promotion_rules_id_seq OWNED BY spree_taxons_promotion_rules.id;


--
-- Name: spree_taxons_prototypes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_taxons_prototypes (
    id integer NOT NULL,
    taxon_id integer,
    prototype_id integer
);


ALTER TABLE public.spree_taxons_prototypes OWNER TO postgres;

--
-- Name: spree_taxons_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_taxons_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxons_prototypes_id_seq OWNER TO postgres;

--
-- Name: spree_taxons_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_taxons_prototypes_id_seq OWNED BY spree_taxons_prototypes.id;


--
-- Name: spree_trackers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_trackers (
    id integer NOT NULL,
    analytics_id character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_trackers OWNER TO postgres;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_trackers_id_seq OWNER TO postgres;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_trackers_id_seq OWNED BY spree_trackers.id;


--
-- Name: spree_user_authentications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_user_authentications (
    id integer NOT NULL,
    user_id integer,
    provider character varying,
    uid character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_user_authentications OWNER TO postgres;

--
-- Name: spree_user_authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_user_authentications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_user_authentications_id_seq OWNER TO postgres;

--
-- Name: spree_user_authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_user_authentications_id_seq OWNED BY spree_user_authentications.id;


--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_users (
    id integer NOT NULL,
    encrypted_password character varying(128),
    password_salt character varying(128),
    email character varying,
    remember_token character varying,
    persistence_token character varying,
    reset_password_token character varying,
    perishable_token character varying,
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    login character varying,
    ship_address_id integer,
    bill_address_id integer,
    authentication_token character varying,
    unlock_token character varying,
    locked_at timestamp without time zone,
    reset_password_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    spree_api_key character varying(48),
    remember_created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


ALTER TABLE public.spree_users OWNER TO postgres;

--
-- Name: spree_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_users_id_seq OWNER TO postgres;

--
-- Name: spree_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_users_id_seq OWNED BY spree_users.id;


--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_variants (
    id integer NOT NULL,
    sku character varying DEFAULT ''::character varying NOT NULL,
    weight numeric(8,2) DEFAULT 0.0,
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    product_id integer,
    cost_price numeric(10,2),
    "position" integer,
    cost_currency character varying,
    track_inventory boolean DEFAULT true,
    tax_category_id integer,
    updated_at timestamp without time zone,
    stock_items_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.spree_variants OWNER TO postgres;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variants_id_seq OWNER TO postgres;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_variants_id_seq OWNED BY spree_variants.id;


--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_zone_members (
    id integer NOT NULL,
    zoneable_id integer,
    zoneable_type character varying,
    zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_zone_members OWNER TO postgres;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_zone_members_id_seq OWNER TO postgres;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_zone_members_id_seq OWNED BY spree_zone_members.id;


--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_zones (
    id integer NOT NULL,
    name character varying,
    description character varying,
    default_tax boolean DEFAULT false,
    zone_members_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    kind character varying
);


ALTER TABLE public.spree_zones OWNER TO postgres;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_zones_id_seq OWNER TO postgres;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_zones_id_seq OWNED BY spree_zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_addresses ALTER COLUMN id SET DEFAULT nextval('spree_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_adjustments ALTER COLUMN id SET DEFAULT nextval('spree_adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_assets ALTER COLUMN id SET DEFAULT nextval('spree_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_authentication_methods ALTER COLUMN id SET DEFAULT nextval('spree_authentication_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_calculators ALTER COLUMN id SET DEFAULT nextval('spree_calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_countries ALTER COLUMN id SET DEFAULT nextval('spree_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('spree_credit_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_customer_returns ALTER COLUMN id SET DEFAULT nextval('spree_customer_returns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_gateways ALTER COLUMN id SET DEFAULT nextval('spree_gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_inventory_units ALTER COLUMN id SET DEFAULT nextval('spree_inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_line_items ALTER COLUMN id SET DEFAULT nextval('spree_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_log_entries ALTER COLUMN id SET DEFAULT nextval('spree_log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_option_types ALTER COLUMN id SET DEFAULT nextval('spree_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_option_values ALTER COLUMN id SET DEFAULT nextval('spree_option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_orders ALTER COLUMN id SET DEFAULT nextval('spree_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_payment_capture_events ALTER COLUMN id SET DEFAULT nextval('spree_payment_capture_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('spree_payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_payments ALTER COLUMN id SET DEFAULT nextval('spree_payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_preferences ALTER COLUMN id SET DEFAULT nextval('spree_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_prices ALTER COLUMN id SET DEFAULT nextval('spree_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('spree_product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_product_properties ALTER COLUMN id SET DEFAULT nextval('spree_product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_products ALTER COLUMN id SET DEFAULT nextval('spree_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_products_taxons ALTER COLUMN id SET DEFAULT nextval('spree_products_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('spree_promotion_action_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('spree_promotion_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_promotion_categories ALTER COLUMN id SET DEFAULT nextval('spree_promotion_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_promotions ALTER COLUMN id SET DEFAULT nextval('spree_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_properties ALTER COLUMN id SET DEFAULT nextval('spree_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_refund_reasons ALTER COLUMN id SET DEFAULT nextval('spree_refund_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_refunds ALTER COLUMN id SET DEFAULT nextval('spree_refunds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_reimbursement_credits ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_credits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_reimbursement_types ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_reimbursements ALTER COLUMN id SET DEFAULT nextval('spree_reimbursements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_return_authorization_reasons ALTER COLUMN id SET DEFAULT nextval('spree_return_authorization_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('spree_return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_return_items ALTER COLUMN id SET DEFAULT nextval('spree_return_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_roles ALTER COLUMN id SET DEFAULT nextval('spree_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_shipments ALTER COLUMN id SET DEFAULT nextval('spree_shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_shipping_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_shipping_method_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_shipping_methods ALTER COLUMN id SET DEFAULT nextval('spree_shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_shipping_rates ALTER COLUMN id SET DEFAULT nextval('spree_shipping_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_skrill_transactions ALTER COLUMN id SET DEFAULT nextval('spree_skrill_transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_state_changes ALTER COLUMN id SET DEFAULT nextval('spree_state_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_states ALTER COLUMN id SET DEFAULT nextval('spree_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_stock_items ALTER COLUMN id SET DEFAULT nextval('spree_stock_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_stock_locations ALTER COLUMN id SET DEFAULT nextval('spree_stock_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_stock_movements ALTER COLUMN id SET DEFAULT nextval('spree_stock_movements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_stock_transfers ALTER COLUMN id SET DEFAULT nextval('spree_stock_transfers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_stores ALTER COLUMN id SET DEFAULT nextval('spree_stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('spree_tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('spree_tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('spree_taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_taxons ALTER COLUMN id SET DEFAULT nextval('spree_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_taxons_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_taxons_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_taxons_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_taxons_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_trackers ALTER COLUMN id SET DEFAULT nextval('spree_trackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_user_authentications ALTER COLUMN id SET DEFAULT nextval('spree_user_authentications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_users ALTER COLUMN id SET DEFAULT nextval('spree_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_variants ALTER COLUMN id SET DEFAULT nextval('spree_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_zone_members ALTER COLUMN id SET DEFAULT nextval('spree_zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_zones ALTER COLUMN id SET DEFAULT nextval('spree_zones_id_seq'::regclass);


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
1	ruby-on-rails-tote	1	Spree::Product	\N	2015-03-31 08:20:20.61614
2	ruby-on-rails-bag	2	Spree::Product	\N	2015-03-31 08:20:20.895867
3	ruby-on-rails-baseball-jersey	3	Spree::Product	\N	2015-03-31 08:20:21.154384
4	ruby-on-rails-jr-spaghetti	4	Spree::Product	\N	2015-03-31 08:20:21.430129
5	ruby-on-rails-ringer-t-shirt	5	Spree::Product	\N	2015-03-31 08:20:21.673177
6	ruby-baseball-jersey	6	Spree::Product	\N	2015-03-31 08:20:21.947696
7	apache-baseball-jersey	7	Spree::Product	\N	2015-03-31 08:20:22.23468
8	spree-baseball-jersey	8	Spree::Product	\N	2015-03-31 08:20:22.488807
9	spree-jr-spaghetti	9	Spree::Product	\N	2015-03-31 08:20:22.746735
10	spree-ringer-t-shirt	10	Spree::Product	\N	2015-03-31 08:20:23.017055
11	spree-tote	11	Spree::Product	\N	2015-03-31 08:20:23.292592
12	spree-bag	12	Spree::Product	\N	2015-03-31 08:20:23.581181
13	ruby-on-rails-mug	13	Spree::Product	\N	2015-03-31 08:20:23.835666
14	ruby-on-rails-stein	14	Spree::Product	\N	2015-03-31 08:20:24.105881
15	spree-stein	15	Spree::Product	\N	2015-03-31 08:20:24.358649
16	spree-mug	16	Spree::Product	\N	2015-03-31 08:20:24.605935
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 16, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20150331081931
20150331081932
20150331081933
20150331081934
20150331081935
20150331081936
20150331081937
20150331081938
20150331081939
20150331081940
20150331081941
20150331081942
20150331081943
20150331081944
20150331081945
20150331081946
20150331081947
20150331081948
20150331081949
20150331081950
20150331081951
20150331081952
20150331081953
20150331081954
20150331081955
20150331081956
20150331081957
20150331081958
20150331081959
20150331081960
20150331081961
20150331081962
20150331081963
20150331081964
20150331081965
20150331081966
20150331081967
20150331081968
20150331081969
20150331081970
20150331081971
20150331081972
20150331081973
20150331081974
20150331081975
20150331081976
20150331081977
20150331081978
20150331081979
20150331081980
20150331081981
20150331081982
20150331081983
20150331081984
20150331081985
20150331081986
20150331081987
20150331081988
20150331081989
20150331081990
20150331081991
20150331081992
20150331081993
20150331081994
20150331081995
20150331081996
20150331081997
20150331081998
20150331081999
20150331082000
20150331082001
20150331082002
20150331082003
20150331082004
20150331082005
20150331082006
20150331082007
20150331082008
20150331082009
20150331082010
20150331082011
20150331082012
20150331082013
20150331082014
20150331082015
20150331082016
20150331082017
20150331082018
20150331082019
20150331082020
20150331082021
20150331082022
20150331082023
20150331082024
20150331082025
20150331082026
20150331082027
20150331082028
20150331082029
20150331082030
20150331082031
20150331082032
20150331082033
20150331082034
20150331082035
20150331082036
20150331082037
20150331082038
20150331082039
20150331082040
20150331082041
20150331082042
20150331082043
20150331082044
20150331082045
20150331082046
20150331082047
20150331082048
20150331082049
20150331082050
20150331082051
20150331082052
20150331082053
20150331082054
20150331082055
20150331082056
20150331082057
20150331082058
20150331082059
20150331082060
20150331082061
20150331082062
20150331082063
20150331082064
20150331082065
20150331082066
20150331082067
20150331082068
20150331082069
20150331082070
20150331082071
20150331082072
20150331082073
20150331082074
20150331082075
20150331082076
20150331082077
20150331082078
20150331082079
20150331082080
20150331082081
20150331082082
20150331082083
20150331082084
20150331082085
20150331082086
20150331082087
20150331082088
20150331082089
20150331082090
20150331082091
20150331082092
20150331082093
20150331082094
20150331082095
20150331082096
20150331082097
20150331082098
20150331082099
20150331082100
20150331082101
20150331082102
20150331082103
20150331082104
20150331082105
20150331082106
20150331082107
20150331082108
20150331082109
20150331082110
20150331082111
20150331082112
20150331082113
20150331082114
20150331082115
20150331082116
20150331082117
20150331082118
20150331082119
20150331082120
20150331082121
20150331082122
20150331082123
20150331082124
20150331082125
20150331082126
20150331082127
20150331082128
20150331082129
20150331082130
20150331082131
20150331082132
20150331082133
20150331082134
20150331082135
20150331082136
20150331082137
20150331082138
20150331082139
20150331082140
20150331082141
20150331082142
20150331082143
20150331082144
20150331082145
20150331082146
20150331082147
20150331082148
20150331082149
20150331083248
20150331083249
\.


--
-- Data for Name: spree_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_addresses (id, firstname, lastname, address1, address2, city, zipcode, phone, state_name, alternative_phone, company, state_id, country_id, created_at, updated_at) FROM stdin;
1	Casandra	Witting	562 Minnie Cliffs	Suite 246	Grimeschester	16804	1-914-992-7350 x136	\N	\N	\N	3561	232	2015-03-31 08:20:47.616438	2015-03-31 08:20:47.616438
2	Clarissa	Grady	09598 Mosciski Path	Suite 759	South Aurelia	16804	(271)749-3153 x98440	\N	\N	\N	3561	232	2015-03-31 08:20:47.64397	2015-03-31 08:20:47.64397
\.


--
-- Name: spree_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_addresses_id_seq', 2, true);


--
-- Data for Name: spree_adjustments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_adjustments (id, source_id, source_type, adjustable_id, adjustable_type, amount, label, mandatory, eligible, created_at, updated_at, state, order_id, included) FROM stdin;
2	1	Spree::TaxRate	1	Spree::LineItem	0.80	North America 5.0%	\N	t	2015-03-31 08:20:48.250033	2015-03-31 08:20:49.318847	open	1	f
5	1	Spree::TaxRate	1	Spree::Order	0.84	Tax	t	t	2015-03-31 08:20:48.993485	2015-03-31 08:20:49.339849	open	1	f
4	1	Spree::TaxRate	2	Spree::LineItem	1.15	North America 5.0%	\N	t	2015-03-31 08:20:48.441318	2015-03-31 08:20:49.866244	open	2	f
6	1	Spree::TaxRate	2	Spree::Order	1.21	Tax	t	t	2015-03-31 08:20:49.071935	2015-03-31 08:20:49.898978	open	2	f
\.


--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_adjustments_id_seq', 6, true);


--
-- Data for Name: spree_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_assets (id, viewable_id, viewable_type, attachment_width, attachment_height, attachment_file_size, "position", attachment_content_type, attachment_file_name, type, attachment_updated_at, alt, created_at, updated_at) FROM stdin;
1	17	Spree::Variant	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2015-03-31 08:20:32.778968	\N	2015-03-31 08:20:33.112132	2015-03-31 08:20:33.112132
2	17	Spree::Variant	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2015-03-31 08:20:33.218902	\N	2015-03-31 08:20:33.415689	2015-03-31 08:20:33.415689
3	18	Spree::Variant	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2015-03-31 08:20:33.521798	\N	2015-03-31 08:20:33.721	2015-03-31 08:20:33.721
4	18	Spree::Variant	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2015-03-31 08:20:33.821613	\N	2015-03-31 08:20:34.011959	2015-03-31 08:20:34.011959
5	19	Spree::Variant	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2015-03-31 08:20:34.135669	\N	2015-03-31 08:20:34.327955	2015-03-31 08:20:34.327955
6	19	Spree::Variant	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2015-03-31 08:20:34.424022	\N	2015-03-31 08:20:34.614843	2015-03-31 08:20:34.614843
7	20	Spree::Variant	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2015-03-31 08:20:34.711515	\N	2015-03-31 08:20:34.899338	2015-03-31 08:20:34.899338
8	20	Spree::Variant	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2015-03-31 08:20:34.984713	\N	2015-03-31 08:20:35.178515	2015-03-31 08:20:35.178515
9	21	Spree::Variant	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2015-03-31 08:20:35.27316	\N	2015-03-31 08:20:35.469473	2015-03-31 08:20:35.469473
10	21	Spree::Variant	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2015-03-31 08:20:35.55201	\N	2015-03-31 08:20:35.753094	2015-03-31 08:20:35.753094
11	22	Spree::Variant	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2015-03-31 08:20:35.850266	\N	2015-03-31 08:20:36.039884	2015-03-31 08:20:36.039884
12	22	Spree::Variant	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2015-03-31 08:20:36.140566	\N	2015-03-31 08:20:36.335872	2015-03-31 08:20:36.335872
13	23	Spree::Variant	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2015-03-31 08:20:36.449584	\N	2015-03-31 08:20:36.641218	2015-03-31 08:20:36.641218
14	23	Spree::Variant	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2015-03-31 08:20:36.822912	\N	2015-03-31 08:20:37.013616	2015-03-31 08:20:37.013616
15	24	Spree::Variant	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2015-03-31 08:20:37.118806	\N	2015-03-31 08:20:37.32602	2015-03-31 08:20:37.32602
16	24	Spree::Variant	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2015-03-31 08:20:37.427666	\N	2015-03-31 08:20:37.626581	2015-03-31 08:20:37.626581
17	25	Spree::Variant	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2015-03-31 08:20:37.718711	\N	2015-03-31 08:20:37.920947	2015-03-31 08:20:37.920947
18	25	Spree::Variant	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2015-03-31 08:20:38.013623	\N	2015-03-31 08:20:38.217625	2015-03-31 08:20:38.217625
19	26	Spree::Variant	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2015-03-31 08:20:38.303121	\N	2015-03-31 08:20:38.491678	2015-03-31 08:20:38.491678
20	26	Spree::Variant	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2015-03-31 08:20:38.589845	\N	2015-03-31 08:20:38.803703	2015-03-31 08:20:38.803703
21	1	Spree::Variant	360	360	31490	1	image/jpeg	ror_tote.jpeg	Spree::Image	2015-03-31 08:20:38.902077	\N	2015-03-31 08:20:39.150648	2015-03-31 08:20:39.150648
22	1	Spree::Variant	360	360	28620	2	image/jpeg	ror_tote_back.jpeg	Spree::Image	2015-03-31 08:20:39.254524	\N	2015-03-31 08:20:39.459753	2015-03-31 08:20:39.459753
23	2	Spree::Variant	360	360	28230	1	image/jpeg	ror_bag.jpeg	Spree::Image	2015-03-31 08:20:39.564606	\N	2015-03-31 08:20:39.751936	2015-03-31 08:20:39.751936
24	3	Spree::Variant	360	360	27626	1	image/jpeg	ror_baseball.jpeg	Spree::Image	2015-03-31 08:20:39.848046	\N	2015-03-31 08:20:40.034828	2015-03-31 08:20:40.034828
25	3	Spree::Variant	360	360	23490	2	image/jpeg	ror_baseball_back.jpeg	Spree::Image	2015-03-31 08:20:40.135809	\N	2015-03-31 08:20:40.330131	2015-03-31 08:20:40.330131
26	4	Spree::Variant	360	360	14083	1	image/jpeg	ror_jr_spaghetti.jpeg	Spree::Image	2015-03-31 08:20:40.452059	\N	2015-03-31 08:20:40.625345	2015-03-31 08:20:40.625345
27	13	Spree::Variant	360	360	20026	1	image/jpeg	ror_mug.jpeg	Spree::Image	2015-03-31 08:20:40.714627	\N	2015-03-31 08:20:40.916982	2015-03-31 08:20:40.916982
28	13	Spree::Variant	360	360	10929	2	image/jpeg	ror_mug_back.jpeg	Spree::Image	2015-03-31 08:20:41.033935	\N	2015-03-31 08:20:41.207252	2015-03-31 08:20:41.207252
29	5	Spree::Variant	360	360	18252	1	image/jpeg	ror_ringer.jpeg	Spree::Image	2015-03-31 08:20:41.304242	\N	2015-03-31 08:20:41.490717	2015-03-31 08:20:41.490717
30	5	Spree::Variant	360	360	13276	2	image/jpeg	ror_ringer_back.jpeg	Spree::Image	2015-03-31 08:20:41.590181	\N	2015-03-31 08:20:41.757699	2015-03-31 08:20:41.757699
31	14	Spree::Variant	360	360	20714	1	image/jpeg	ror_stein.jpeg	Spree::Image	2015-03-31 08:20:42.523441	\N	2015-03-31 08:20:42.715577	2015-03-31 08:20:42.715577
32	14	Spree::Variant	360	360	20619	2	image/jpeg	ror_stein_back.jpeg	Spree::Image	2015-03-31 08:20:42.812004	\N	2015-03-31 08:20:42.9871	2015-03-31 08:20:42.9871
33	7	Spree::Variant	504	484	123779	1	image/png	apache_baseball.png	Spree::Image	2015-03-31 08:20:43.091967	\N	2015-03-31 08:20:43.408282	2015-03-31 08:20:43.408282
34	6	Spree::Variant	495	477	138622	1	image/png	ruby_baseball.png	Spree::Image	2015-03-31 08:20:43.520448	\N	2015-03-31 08:20:43.850538	2015-03-31 08:20:43.850538
35	12	Spree::Variant	480	480	38369	1	image/jpeg	spree_bag.jpeg	Spree::Image	2015-03-31 08:20:43.954193	\N	2015-03-31 08:20:44.158355	2015-03-31 08:20:44.158355
36	11	Spree::Variant	480	480	44579	1	image/jpeg	spree_tote_front.jpeg	Spree::Image	2015-03-31 08:20:44.273639	\N	2015-03-31 08:20:44.504802	2015-03-31 08:20:44.504802
37	11	Spree::Variant	480	480	16947	2	image/jpeg	spree_tote_back.jpeg	Spree::Image	2015-03-31 08:20:44.587864	\N	2015-03-31 08:20:44.800445	2015-03-31 08:20:44.800445
38	10	Spree::Variant	480	480	17641	1	image/jpeg	spree_ringer_t.jpeg	Spree::Image	2015-03-31 08:20:44.897419	\N	2015-03-31 08:20:45.073889	2015-03-31 08:20:45.073889
39	10	Spree::Variant	480	480	10514	2	image/jpeg	spree_ringer_t_back.jpeg	Spree::Image	2015-03-31 08:20:45.16756	\N	2015-03-31 08:20:45.342763	2015-03-31 08:20:45.342763
40	9	Spree::Variant	480	480	5898	1	image/jpeg	spree_spaghetti.jpeg	Spree::Image	2015-03-31 08:20:45.433286	\N	2015-03-31 08:20:45.645021	2015-03-31 08:20:45.645021
41	8	Spree::Variant	480	480	18012	1	image/jpeg	spree_jersey.jpeg	Spree::Image	2015-03-31 08:20:45.739227	\N	2015-03-31 08:20:45.932515	2015-03-31 08:20:45.932515
42	8	Spree::Variant	480	480	17868	2	image/jpeg	spree_jersey_back.jpeg	Spree::Image	2015-03-31 08:20:46.035912	\N	2015-03-31 08:20:46.247446	2015-03-31 08:20:46.247446
43	15	Spree::Variant	480	480	12999	1	image/jpeg	spree_stein.jpeg	Spree::Image	2015-03-31 08:20:46.337493	\N	2015-03-31 08:20:46.514396	2015-03-31 08:20:46.514396
44	15	Spree::Variant	480	480	12687	2	image/jpeg	spree_stein_back.jpeg	Spree::Image	2015-03-31 08:20:46.623923	\N	2015-03-31 08:20:46.810318	2015-03-31 08:20:46.810318
45	16	Spree::Variant	240	240	4148	1	image/jpeg	spree_mug.jpeg	Spree::Image	2015-03-31 08:20:46.930125	\N	2015-03-31 08:20:47.077436	2015-03-31 08:20:47.077436
46	16	Spree::Variant	240	240	4428	2	image/jpeg	spree_mug_back.jpeg	Spree::Image	2015-03-31 08:20:47.178304	\N	2015-03-31 08:20:47.33212	2015-03-31 08:20:47.33212
\.


--
-- Name: spree_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_assets_id_seq', 46, true);


--
-- Data for Name: spree_authentication_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_authentication_methods (id, environment, provider, api_key, api_secret, active, created_at, updated_at) FROM stdin;
1	development	facebook	806147029471422	b18de0d4b90b54d74026822d98dfac08	t	2015-03-31 10:10:15.029152	2015-03-31 10:12:22.178745
2	development	twitter	SOLWJpGeBFg2cUymlEKIQBfzF	iSJbq0wqaJxLqP5Ou6kliUC3SgUMcA3BBoW5BRSnSCeWESNyQA	t	2015-03-31 10:52:41.982461	2015-03-31 10:52:41.982461
3	development	google_oauth2	171111461505-24ant70j4iujv0egp4nu82t5996r6s5j.apps.googleusercontent.com	H1Weiv_z0P2ljqlZgIKdpCj2	t	2015-03-31 11:35:16.329486	2015-03-31 11:35:16.329486
4	development	linkedin	75yvhshombyv31	NC0SvektYarS3LfN	t	2015-03-31 12:47:31.133435	2015-03-31 12:47:31.133435
\.


--
-- Name: spree_authentication_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_authentication_methods_id_seq', 4, true);


--
-- Data for Name: spree_calculators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_calculators (id, type, calculable_id, calculable_type, created_at, updated_at, preferences) FROM stdin;
1	Spree::Calculator::Shipping::FlatRate	1	Spree::ShippingMethod	2015-03-31 08:20:19.43704	2015-03-31 08:20:19.768872	---\n:amount: 5\n:currency: USD\n
4	Spree::Calculator::Shipping::FlatRate	4	Spree::ShippingMethod	2015-03-31 08:20:19.485956	2015-03-31 08:20:19.80096	---\n:amount: 5\n:currency: USD\n
3	Spree::Calculator::Shipping::FlatRate	3	Spree::ShippingMethod	2015-03-31 08:20:19.472752	2015-03-31 08:20:19.827673	---\n:amount: 15\n:currency: USD\n
2	Spree::Calculator::Shipping::FlatRate	2	Spree::ShippingMethod	2015-03-31 08:20:19.452481	2015-03-31 08:20:19.85089	---\n:amount: 10\n:currency: USD\n
5	Spree::Calculator::Shipping::FlatRate	5	Spree::ShippingMethod	2015-03-31 08:20:19.506498	2015-03-31 08:20:19.873793	---\n:amount: 8\n:currency: EUR\n
6	Spree::Calculator::DefaultTax	1	Spree::TaxRate	2015-03-31 08:20:20.064555	2015-03-31 08:20:20.108973	\N
\.


--
-- Name: spree_calculators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_calculators_id_seq', 6, true);


--
-- Data for Name: spree_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_countries (id, iso_name, iso, iso3, name, numcode, states_required, updated_at) FROM stdin;
1	ANDORRA	AD	AND	Andorra	20	t	\N
2	UNITED ARAB EMIRATES	AE	ARE	United Arab Emirates	784	t	\N
3	AFGHANISTAN	AF	AFG	Afghanistan	4	t	\N
4	ANTIGUA AND BARBUDA	AG	ATG	Antigua and Barbuda	28	t	\N
5	ANGUILLA	AI	AIA	Anguilla	660	f	\N
6	ALBANIA	AL	ALB	Albania	8	t	\N
7	ARMENIA	AM	ARM	Armenia	51	t	\N
8	ANGOLA	AO	AGO	Angola	24	t	\N
9	ANTARCTICA	AQ	ATA	Antarctica	10	f	\N
10	ARGENTINA	AR	ARG	Argentina	32	t	\N
11	AMERICAN SAMOA	AS	ASM	American Samoa	16	f	\N
12	AUSTRIA	AT	AUT	Austria	40	t	\N
13	AUSTRALIA	AU	AUS	Australia	36	t	\N
14	ARUBA	AW	ABW	Aruba	533	f	\N
15	ÅLAND ISLANDS	AX	ALA	Åland Islands	248	f	\N
16	AZERBAIJAN	AZ	AZE	Azerbaijan	31	t	\N
17	BOSNIA AND HERZEGOVINA	BA	BIH	Bosnia and Herzegovina	70	t	\N
18	BARBADOS	BB	BRB	Barbados	52	t	\N
19	BANGLADESH	BD	BGD	Bangladesh	50	t	\N
20	BELGIUM	BE	BEL	Belgium	56	t	\N
21	BURKINA FASO	BF	BFA	Burkina Faso	854	t	\N
22	BULGARIA	BG	BGR	Bulgaria	100	t	\N
23	BAHRAIN	BH	BHR	Bahrain	48	t	\N
24	BURUNDI	BI	BDI	Burundi	108	t	\N
25	BENIN	BJ	BEN	Benin	204	t	\N
26	SAINT BARTHéLEMY	BL	BLM	Saint Barthélemy	652	f	\N
27	BERMUDA	BM	BMU	Bermuda	60	f	\N
28	BRUNEI DARUSSALAM	BN	BRN	Brunei Darussalam	96	t	\N
29	BOLIVIA, PLURINATIONAL STATE OF	BO	BOL	Bolivia, Plurinational State of	68	t	\N
30	BONAIRE, SINT EUSTATIUS AND SABA	BQ	BES	Bonaire, Sint Eustatius and Saba	535	t	\N
31	BRAZIL	BR	BRA	Brazil	76	t	\N
32	BAHAMAS	BS	BHS	Bahamas	44	t	\N
33	BHUTAN	BT	BTN	Bhutan	64	t	\N
34	BOUVET ISLAND	BV	BVT	Bouvet Island	74	f	\N
35	BOTSWANA	BW	BWA	Botswana	72	t	\N
36	BELARUS	BY	BLR	Belarus	112	t	\N
37	BELIZE	BZ	BLZ	Belize	84	t	\N
38	CANADA	CA	CAN	Canada	124	t	\N
39	COCOS (KEELING) ISLANDS	CC	CCK	Cocos (Keeling) Islands	166	f	\N
40	CONGO, THE DEMOCRATIC REPUBLIC OF THE	CD	COD	Congo, The Democratic Republic of the	180	t	\N
41	CENTRAL AFRICAN REPUBLIC	CF	CAF	Central African Republic	140	t	\N
42	CONGO	CG	COG	Congo	178	t	\N
43	SWITZERLAND	CH	CHE	Switzerland	756	t	\N
44	CôTE D'IVOIRE	CI	CIV	Côte d'Ivoire	384	t	\N
45	COOK ISLANDS	CK	COK	Cook Islands	184	f	\N
46	CHILE	CL	CHL	Chile	152	t	\N
47	CAMEROON	CM	CMR	Cameroon	120	t	\N
48	CHINA	CN	CHN	China	156	t	\N
49	COLOMBIA	CO	COL	Colombia	170	t	\N
50	COSTA RICA	CR	CRI	Costa Rica	188	t	\N
51	CUBA	CU	CUB	Cuba	192	t	\N
52	CAPE VERDE	CV	CPV	Cape Verde	132	t	\N
53	CURAçAO	CW	CUW	Curaçao	531	f	\N
54	CHRISTMAS ISLAND	CX	CXR	Christmas Island	162	f	\N
55	CYPRUS	CY	CYP	Cyprus	196	t	\N
56	CZECH REPUBLIC	CZ	CZE	Czech Republic	203	t	\N
57	GERMANY	DE	DEU	Germany	276	t	\N
58	DJIBOUTI	DJ	DJI	Djibouti	262	t	\N
59	DENMARK	DK	DNK	Denmark	208	t	\N
60	DOMINICA	DM	DMA	Dominica	212	t	\N
61	DOMINICAN REPUBLIC	DO	DOM	Dominican Republic	214	t	\N
62	ALGERIA	DZ	DZA	Algeria	12	t	\N
63	ECUADOR	EC	ECU	Ecuador	218	t	\N
64	ESTONIA	EE	EST	Estonia	233	t	\N
65	EGYPT	EG	EGY	Egypt	818	t	\N
66	WESTERN SAHARA	EH	ESH	Western Sahara	732	f	\N
67	ERITREA	ER	ERI	Eritrea	232	t	\N
68	SPAIN	ES	ESP	Spain	724	t	\N
69	ETHIOPIA	ET	ETH	Ethiopia	231	t	\N
70	FINLAND	FI	FIN	Finland	246	t	\N
71	FIJI	FJ	FJI	Fiji	242	t	\N
72	FALKLAND ISLANDS (MALVINAS)	FK	FLK	Falkland Islands (Malvinas)	238	f	\N
73	MICRONESIA, FEDERATED STATES OF	FM	FSM	Micronesia, Federated States of	583	t	\N
74	FAROE ISLANDS	FO	FRO	Faroe Islands	234	f	\N
75	FRANCE	FR	FRA	France	250	t	\N
76	GABON	GA	GAB	Gabon	266	t	\N
77	UNITED KINGDOM	GB	GBR	United Kingdom	826	t	\N
78	GRENADA	GD	GRD	Grenada	308	t	\N
79	GEORGIA	GE	GEO	Georgia	268	t	\N
80	FRENCH GUIANA	GF	GUF	French Guiana	254	f	\N
81	GUERNSEY	GG	GGY	Guernsey	831	f	\N
82	GHANA	GH	GHA	Ghana	288	t	\N
83	GIBRALTAR	GI	GIB	Gibraltar	292	f	\N
84	GREENLAND	GL	GRL	Greenland	304	t	\N
85	GAMBIA	GM	GMB	Gambia	270	t	\N
86	GUINEA	GN	GIN	Guinea	324	t	\N
87	GUADELOUPE	GP	GLP	Guadeloupe	312	f	\N
88	EQUATORIAL GUINEA	GQ	GNQ	Equatorial Guinea	226	t	\N
89	GREECE	GR	GRC	Greece	300	t	\N
90	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	GS	SGS	South Georgia and the South Sandwich Islands	239	f	\N
91	GUATEMALA	GT	GTM	Guatemala	320	t	\N
92	GUAM	GU	GUM	Guam	316	f	\N
93	GUINEA-BISSAU	GW	GNB	Guinea-Bissau	624	t	\N
94	GUYANA	GY	GUY	Guyana	328	t	\N
95	HONG KONG	HK	HKG	Hong Kong	344	f	\N
96	HEARD ISLAND AND MCDONALD ISLANDS	HM	HMD	Heard Island and McDonald Islands	334	f	\N
97	HONDURAS	HN	HND	Honduras	340	t	\N
98	CROATIA	HR	HRV	Croatia	191	t	\N
99	HAITI	HT	HTI	Haiti	332	t	\N
100	HUNGARY	HU	HUN	Hungary	348	t	\N
101	INDONESIA	ID	IDN	Indonesia	360	t	\N
102	IRELAND	IE	IRL	Ireland	372	t	\N
103	ISRAEL	IL	ISR	Israel	376	t	\N
104	ISLE OF MAN	IM	IMN	Isle of Man	833	f	\N
105	INDIA	IN	IND	India	356	t	\N
106	BRITISH INDIAN OCEAN TERRITORY	IO	IOT	British Indian Ocean Territory	86	f	\N
107	IRAQ	IQ	IRQ	Iraq	368	t	\N
108	IRAN, ISLAMIC REPUBLIC OF	IR	IRN	Iran, Islamic Republic of	364	t	\N
109	ICELAND	IS	ISL	Iceland	352	t	\N
110	ITALY	IT	ITA	Italy	380	t	\N
111	JERSEY	JE	JEY	Jersey	832	f	\N
112	JAMAICA	JM	JAM	Jamaica	388	t	\N
113	JORDAN	JO	JOR	Jordan	400	t	\N
114	JAPAN	JP	JPN	Japan	392	t	\N
115	KENYA	KE	KEN	Kenya	404	t	\N
116	KYRGYZSTAN	KG	KGZ	Kyrgyzstan	417	t	\N
117	CAMBODIA	KH	KHM	Cambodia	116	t	\N
118	KIRIBATI	KI	KIR	Kiribati	296	t	\N
119	COMOROS	KM	COM	Comoros	174	t	\N
120	SAINT KITTS AND NEVIS	KN	KNA	Saint Kitts and Nevis	659	t	\N
121	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	KP	PRK	Korea, Democratic People's Republic of	408	t	\N
122	KOREA, REPUBLIC OF	KR	KOR	Korea, Republic of	410	t	\N
123	KUWAIT	KW	KWT	Kuwait	414	t	\N
124	CAYMAN ISLANDS	KY	CYM	Cayman Islands	136	f	\N
125	KAZAKHSTAN	KZ	KAZ	Kazakhstan	398	t	\N
126	LAO PEOPLE'S DEMOCRATIC REPUBLIC	LA	LAO	Lao People's Democratic Republic	418	t	\N
127	LEBANON	LB	LBN	Lebanon	422	t	\N
128	SAINT LUCIA	LC	LCA	Saint Lucia	662	f	\N
129	LIECHTENSTEIN	LI	LIE	Liechtenstein	438	t	\N
130	SRI LANKA	LK	LKA	Sri Lanka	144	t	\N
131	LIBERIA	LR	LBR	Liberia	430	t	\N
132	LESOTHO	LS	LSO	Lesotho	426	t	\N
133	LITHUANIA	LT	LTU	Lithuania	440	t	\N
134	LUXEMBOURG	LU	LUX	Luxembourg	442	t	\N
135	LATVIA	LV	LVA	Latvia	428	t	\N
136	LIBYA	LY	LBY	Libya	434	t	\N
137	MOROCCO	MA	MAR	Morocco	504	t	\N
138	MONACO	MC	MCO	Monaco	492	t	\N
139	MOLDOVA, REPUBLIC OF	MD	MDA	Moldova, Republic of	498	t	\N
140	MONTENEGRO	ME	MNE	Montenegro	499	t	\N
141	SAINT MARTIN (FRENCH PART)	MF	MAF	Saint Martin (French part)	663	f	\N
142	MADAGASCAR	MG	MDG	Madagascar	450	t	\N
143	MARSHALL ISLANDS	MH	MHL	Marshall Islands	584	t	\N
144	MACEDONIA, REPUBLIC OF	MK	MKD	Macedonia, Republic of	807	t	\N
145	MALI	ML	MLI	Mali	466	t	\N
146	MYANMAR	MM	MMR	Myanmar	104	t	\N
147	MONGOLIA	MN	MNG	Mongolia	496	t	\N
148	MACAO	MO	MAC	Macao	446	f	\N
149	NORTHERN MARIANA ISLANDS	MP	MNP	Northern Mariana Islands	580	f	\N
150	MARTINIQUE	MQ	MTQ	Martinique	474	f	\N
151	MAURITANIA	MR	MRT	Mauritania	478	t	\N
152	MONTSERRAT	MS	MSR	Montserrat	500	f	\N
153	MALTA	MT	MLT	Malta	470	t	\N
154	MAURITIUS	MU	MUS	Mauritius	480	t	\N
155	MALDIVES	MV	MDV	Maldives	462	t	\N
156	MALAWI	MW	MWI	Malawi	454	t	\N
157	MEXICO	MX	MEX	Mexico	484	t	\N
158	MALAYSIA	MY	MYS	Malaysia	458	t	\N
159	MOZAMBIQUE	MZ	MOZ	Mozambique	508	t	\N
160	NAMIBIA	NA	NAM	Namibia	516	t	\N
161	NEW CALEDONIA	NC	NCL	New Caledonia	540	f	\N
162	NIGER	NE	NER	Niger	562	t	\N
163	NORFOLK ISLAND	NF	NFK	Norfolk Island	574	f	\N
164	NIGERIA	NG	NGA	Nigeria	566	t	\N
165	NICARAGUA	NI	NIC	Nicaragua	558	t	\N
166	NETHERLANDS	NL	NLD	Netherlands	528	t	\N
167	NORWAY	NO	NOR	Norway	578	t	\N
168	NEPAL	NP	NPL	Nepal	524	t	\N
169	NAURU	NR	NRU	Nauru	520	t	\N
170	NIUE	NU	NIU	Niue	570	f	\N
171	NEW ZEALAND	NZ	NZL	New Zealand	554	t	\N
172	OMAN	OM	OMN	Oman	512	t	\N
173	PANAMA	PA	PAN	Panama	591	t	\N
174	PERU	PE	PER	Peru	604	t	\N
175	FRENCH POLYNESIA	PF	PYF	French Polynesia	258	f	\N
176	PAPUA NEW GUINEA	PG	PNG	Papua New Guinea	598	t	\N
177	PHILIPPINES	PH	PHL	Philippines	608	t	\N
178	PAKISTAN	PK	PAK	Pakistan	586	t	\N
179	POLAND	PL	POL	Poland	616	t	\N
180	SAINT PIERRE AND MIQUELON	PM	SPM	Saint Pierre and Miquelon	666	f	\N
181	PITCAIRN	PN	PCN	Pitcairn	612	f	\N
182	PALESTINE, STATE OF	PS	PSE	Palestine, State of	275	t	\N
183	PORTUGAL	PT	PRT	Portugal	620	t	\N
184	PALAU	PW	PLW	Palau	585	t	\N
185	PARAGUAY	PY	PRY	Paraguay	600	t	\N
186	QATAR	QA	QAT	Qatar	634	t	\N
187	RéUNION	RE	REU	Réunion	638	f	\N
188	ROMANIA	RO	ROU	Romania	642	t	\N
189	SERBIA	RS	SRB	Serbia	688	t	\N
190	RUSSIAN FEDERATION	RU	RUS	Russian Federation	643	t	\N
191	RWANDA	RW	RWA	Rwanda	646	t	\N
192	SAUDI ARABIA	SA	SAU	Saudi Arabia	682	t	\N
193	SOLOMON ISLANDS	SB	SLB	Solomon Islands	90	t	\N
194	SEYCHELLES	SC	SYC	Seychelles	690	t	\N
195	SUDAN	SD	SDN	Sudan	729	t	\N
196	SWEDEN	SE	SWE	Sweden	752	t	\N
197	SINGAPORE	SG	SGP	Singapore	534	t	\N
198	SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA	SH	SHN	Saint Helena, Ascension and Tristan da Cunha	654	t	\N
199	SLOVENIA	SI	SVN	Slovenia	705	t	\N
200	SVALBARD AND JAN MAYEN	SJ	SJM	Svalbard and Jan Mayen	744	f	\N
201	SLOVAKIA	SK	SVK	Slovakia	703	t	\N
202	SIERRA LEONE	SL	SLE	Sierra Leone	694	t	\N
203	SAN MARINO	SM	SMR	San Marino	674	t	\N
204	SENEGAL	SN	SEN	Senegal	686	t	\N
205	SOMALIA	SO	SOM	Somalia	706	t	\N
206	SURINAME	SR	SUR	Suriname	740	t	\N
207	SOUTH SUDAN	SS	SSD	South Sudan	728	t	\N
208	SAO TOME AND PRINCIPE	ST	STP	Sao Tome and Principe	678	t	\N
209	EL SALVADOR	SV	SLV	El Salvador	222	t	\N
210	SINT MAARTEN (DUTCH PART)	SX	SXM	Sint Maarten (Dutch part)	534	f	\N
211	SYRIAN ARAB REPUBLIC	SY	SYR	Syrian Arab Republic	760	t	\N
212	SWAZILAND	SZ	SWZ	Swaziland	748	t	\N
213	TURKS AND CAICOS ISLANDS	TC	TCA	Turks and Caicos Islands	796	f	\N
214	CHAD	TD	TCD	Chad	148	t	\N
215	FRENCH SOUTHERN TERRITORIES	TF	ATF	French Southern Territories	260	f	\N
216	TOGO	TG	TGO	Togo	768	t	\N
217	THAILAND	TH	THA	Thailand	764	t	\N
218	TAJIKISTAN	TJ	TJK	Tajikistan	762	t	\N
219	TOKELAU	TK	TKL	Tokelau	772	f	\N
220	TIMOR-LESTE	TL	TLS	Timor-Leste	626	t	\N
221	TURKMENISTAN	TM	TKM	Turkmenistan	795	t	\N
222	TUNISIA	TN	TUN	Tunisia	788	t	\N
223	TONGA	TO	TON	Tonga	776	t	\N
224	TURKEY	TR	TUR	Turkey	792	t	\N
225	TRINIDAD AND TOBAGO	TT	TTO	Trinidad and Tobago	780	t	\N
226	TUVALU	TV	TUV	Tuvalu	798	t	\N
227	TAIWAN	TW	TWN	Taiwan	158	t	\N
228	TANZANIA, UNITED REPUBLIC OF	TZ	TZA	Tanzania, United Republic of	834	t	\N
229	UKRAINE	UA	UKR	Ukraine	804	t	\N
230	UGANDA	UG	UGA	Uganda	800	t	\N
231	UNITED STATES MINOR OUTLYING ISLANDS	UM	UMI	United States Minor Outlying Islands	581	t	\N
232	UNITED STATES	US	USA	United States	840	t	\N
233	URUGUAY	UY	URY	Uruguay	858	t	\N
234	UZBEKISTAN	UZ	UZB	Uzbekistan	860	t	\N
235	HOLY SEE (VATICAN CITY STATE)	VA	VAT	Holy See (Vatican City State)	336	f	\N
236	SAINT VINCENT AND THE GRENADINES	VC	VCT	Saint Vincent and the Grenadines	670	t	\N
237	VENEZUELA, BOLIVARIAN REPUBLIC OF	VE	VEN	Venezuela, Bolivarian Republic of	862	t	\N
238	VIRGIN ISLANDS, BRITISH	VG	VGB	Virgin Islands, British	92	f	\N
239	VIRGIN ISLANDS, U.S.	VI	VIR	Virgin Islands, U.S.	850	f	\N
240	VIETNAM	VN	VNM	Vietnam	704	t	\N
241	VANUATU	VU	VUT	Vanuatu	548	t	\N
242	WALLIS AND FUTUNA	WF	WLF	Wallis and Futuna	876	f	\N
243	SAMOA	WS	WSM	Samoa	882	t	\N
244	YEMEN	YE	YEM	Yemen	887	t	\N
245	MAYOTTE	YT	MYT	Mayotte	175	f	\N
246	SOUTH AFRICA	ZA	ZAF	South Africa	710	t	\N
247	ZAMBIA	ZM	ZMB	Zambia	894	t	\N
248	ZIMBABWE	ZW	ZWE	Zimbabwe	716	t	\N
\.


--
-- Name: spree_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_countries_id_seq', 248, true);


--
-- Data for Name: spree_credit_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_credit_cards (id, month, year, cc_type, last_digits, address_id, gateway_customer_profile_id, gateway_payment_profile_id, created_at, updated_at, name, user_id, payment_method_id, "default") FROM stdin;
1	12	2017	visa	1111	\N	BGS-1234	\N	2015-03-31 08:20:49.167045	2015-03-31 08:20:49.167045	Sean Schofield	\N	\N	f
\.


--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_credit_cards_id_seq', 1, true);


--
-- Data for Name: spree_customer_returns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_customer_returns (id, number, stock_location_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_customer_returns_id_seq', 1, false);


--
-- Data for Name: spree_gateways; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_gateways (id, type, name, description, active, environment, server, test_mode, created_at, updated_at, preferences) FROM stdin;
\.


--
-- Name: spree_gateways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_gateways_id_seq', 1, false);


--
-- Data for Name: spree_inventory_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_inventory_units (id, state, variant_id, order_id, shipment_id, created_at, updated_at, pending, line_item_id) FROM stdin;
1	on_hand	1	1	1	2015-03-31 08:20:48.694422	2015-03-31 08:20:48.694422	t	1
2	on_hand	2	2	2	2015-03-31 08:20:48.82153	2015-03-31 08:20:48.82153	t	2
\.


--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_inventory_units_id_seq', 2, true);


--
-- Data for Name: spree_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_line_items (id, variant_id, order_id, quantity, price, created_at, updated_at, currency, cost_price, tax_category_id, adjustment_total, additional_tax_total, promo_total, included_tax_total, pre_tax_amount) FROM stdin;
1	1	1	1	15.99	2015-03-31 08:20:47.855214	2015-03-31 08:20:49.293109	USD	17.00	1	0.80	0.80	0.00	0.00	15.99
2	2	2	1	22.99	2015-03-31 08:20:48.333489	2015-03-31 08:20:49.836611	USD	21.00	1	1.15	1.15	0.00	0.00	22.99
\.


--
-- Name: spree_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_line_items_id_seq', 2, true);


--
-- Data for Name: spree_log_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_log_entries (id, source_id, source_type, details, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_log_entries_id_seq', 1, false);


--
-- Data for Name: spree_option_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_option_types (id, name, presentation, "position", created_at, updated_at) FROM stdin;
1	tshirt-size	Size	1	2015-03-31 08:20:26.203713	2015-03-31 08:20:26.36013
2	tshirt-color	Color	2	2015-03-31 08:20:26.233882	2015-03-31 08:20:26.425702
\.


--
-- Name: spree_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_option_types_id_seq', 2, true);


--
-- Data for Name: spree_option_types_prototypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_option_types_prototypes (prototype_id, option_type_id) FROM stdin;
\.


--
-- Data for Name: spree_option_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_option_values (id, "position", name, presentation, option_type_id, created_at, updated_at) FROM stdin;
1	1	Small	S	1	2015-03-31 08:20:26.274631	2015-03-31 08:20:26.274631
2	2	Medium	M	1	2015-03-31 08:20:26.311801	2015-03-31 08:20:26.311801
3	3	Large	L	1	2015-03-31 08:20:26.332495	2015-03-31 08:20:26.332495
4	4	Extra Large	XL	1	2015-03-31 08:20:26.355222	2015-03-31 08:20:26.355222
5	1	Red	Red	2	2015-03-31 08:20:26.376401	2015-03-31 08:20:26.376401
6	2	Green	Green	2	2015-03-31 08:20:26.399866	2015-03-31 08:20:26.399866
7	3	Blue	Blue	2	2015-03-31 08:20:26.421478	2015-03-31 08:20:26.421478
\.


--
-- Name: spree_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_option_values_id_seq', 7, true);


--
-- Data for Name: spree_option_values_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_option_values_variants (variant_id, option_value_id) FROM stdin;
17	1
17	5
18	1
18	7
19	1
19	6
20	2
20	5
21	2
21	7
22	2
22	6
23	3
23	5
24	3
24	7
25	3
25	6
26	4
26	6
\.


--
-- Data for Name: spree_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_orders (id, number, item_total, total, state, adjustment_total, user_id, completed_at, bill_address_id, ship_address_id, payment_total, shipping_method_id, shipment_state, payment_state, email, special_instructions, created_at, updated_at, currency, last_ip_address, created_by_id, shipment_total, additional_tax_total, promo_total, channel, included_tax_total, item_count, approver_id, approved_at, confirmation_delivered, considered_risky, guest_token, canceled_at, canceler_id, store_id, state_lock_version) FROM stdin;
1	R123456789	15.99	17.63	complete	1.64	\N	2015-03-30 08:20:48.871491	2	1	0.00	\N	pending	balance_due	spree@example.com	\N	2015-03-31 08:20:47.736948	2015-03-31 08:20:49.757415	USD	\N	\N	0.00	0.80	0.00	spree	0.00	0	\N	\N	f	f	G9Vw3ffs0naGh5unO_5uqg	\N	\N	\N	0
2	R987654321	22.99	25.35	complete	2.36	\N	2015-03-30 08:20:48.916204	2	1	0.00	\N	pending	balance_due	spree@example.com	\N	2015-03-31 08:20:47.793722	2015-03-31 08:20:50.272609	USD	\N	\N	0.00	1.15	0.00	spree	0.00	0	\N	\N	f	f	ToE374ZuEAV-I_tkeXDYhA	\N	\N	\N	0
\.


--
-- Name: spree_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_orders_id_seq', 2, true);


--
-- Data for Name: spree_orders_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_orders_promotions (order_id, promotion_id) FROM stdin;
\.


--
-- Data for Name: spree_payment_capture_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_payment_capture_events (id, amount, payment_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_payment_capture_events_id_seq', 1, false);


--
-- Data for Name: spree_payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_payment_methods (id, type, name, description, active, deleted_at, created_at, updated_at, display_on, auto_capture, preferences) FROM stdin;
1	Spree::Gateway::Bogus	Credit Card	Bogus payment gateway.	t	\N	2015-03-31 08:20:19.270253	2015-03-31 08:20:19.270253	\N	\N	---\n:server: test\n:test_mode: true\n
2	Spree::PaymentMethod::Check	Check	Pay by check.	t	\N	2015-03-31 08:20:19.310618	2015-03-31 08:20:19.310618	\N	\N	\N
\.


--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_payment_methods_id_seq', 2, true);


--
-- Data for Name: spree_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_payments (id, amount, order_id, source_id, source_type, payment_method_id, state, response_code, avs_response, created_at, updated_at, number, cvv_response_code, cvv_response_message) FROM stdin;
1	17.63	1	1	Spree::CreditCard	1	pending	12345	\N	2015-03-31 08:20:49.646214	2015-03-31 08:20:49.646214	P1V4ALI9	\N	\N
2	25.35	2	1	Spree::CreditCard	1	pending	12345	\N	2015-03-31 08:20:50.168455	2015-03-31 08:20:50.168455	P2I01WGM	\N	\N
\.


--
-- Name: spree_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_payments_id_seq', 2, true);


--
-- Data for Name: spree_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_preferences (id, value, key, created_at, updated_at) FROM stdin;
1	--- 232\n...\n	spree/app_configuration/default_country_id	2015-03-31 08:20:13.971766	2015-03-31 08:20:13.971766
2	--- USD\n...\n	spree/app_configuration/currency	2015-03-31 08:20:20.169527	2015-03-31 08:20:24.749323
5	--- harish@ourdesignz.com\n...\n	spree/app_configuration/mail_bcc	2015-03-31 08:46:58.45842	2015-03-31 08:46:58.45842
6	--- ''\n	spree/app_configuration/intercept_email	2015-03-31 08:46:58.550615	2015-03-31 08:46:58.550615
7	--- localhost\n...\n	spree/app_configuration/mail_domain	2015-03-31 08:46:58.589619	2015-03-31 08:46:58.589619
8	--- 127.0.0.1\n...\n	spree/app_configuration/mail_host	2015-03-31 08:46:58.630731	2015-03-31 08:46:58.630731
9	--- 1025\n...\n	spree/app_configuration/mail_port	2015-03-31 08:46:58.683249	2015-03-31 08:46:58.683249
10	--- None\n...\n	spree/app_configuration/secure_connection_type	2015-03-31 08:46:58.726547	2015-03-31 08:46:58.726547
11	--- None\n...\n	spree/app_configuration/mail_auth_type	2015-03-31 08:46:58.755016	2015-03-31 08:46:58.755016
12	--- ''\n	spree/app_configuration/smtp_username	2015-03-31 08:46:58.792429	2015-03-31 08:46:58.792429
4	--- true\n...\n	spree/app_configuration/enable_mail_delivery	2015-03-31 08:46:58.30719	2015-03-31 08:47:05.617162
3	--- foodfams@gmail.com\n...\n	spree/app_configuration/mails_from	2015-03-31 08:38:07.579173	2015-03-31 10:12:50.667053
13	--- true\n...\n	spree/app_configuration/check_for_spree_alerts	2015-03-31 14:09:36.322007	2015-03-31 14:09:36.322007
\.


--
-- Name: spree_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_preferences_id_seq', 13, true);


--
-- Data for Name: spree_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_prices (id, variant_id, amount, currency, deleted_at) FROM stdin;
1	1	15.99	USD	\N
2	1	14.00	EUR	\N
3	2	22.99	USD	\N
4	2	19.00	EUR	\N
5	3	19.99	USD	\N
6	3	16.00	EUR	\N
7	4	19.99	USD	\N
8	4	16.00	EUR	\N
9	5	19.99	USD	\N
10	5	16.00	EUR	\N
11	6	19.99	USD	\N
12	6	16.00	EUR	\N
13	7	19.99	USD	\N
14	7	16.00	EUR	\N
15	8	19.99	USD	\N
16	8	16.00	EUR	\N
17	9	19.99	USD	\N
18	9	16.00	EUR	\N
19	10	19.99	USD	\N
20	10	16.00	EUR	\N
21	11	15.99	USD	\N
22	11	14.00	EUR	\N
23	12	22.99	USD	\N
24	12	19.00	EUR	\N
25	13	13.99	USD	\N
26	13	12.00	EUR	\N
27	14	16.99	USD	\N
28	14	14.00	EUR	\N
29	15	16.99	USD	\N
30	15	14.00	EUR	\N
31	16	13.99	USD	\N
32	16	12.00	EUR	\N
33	17	19.99	USD	\N
34	18	19.99	USD	\N
35	19	19.99	USD	\N
36	20	19.99	USD	\N
37	21	19.99	USD	\N
38	22	19.99	USD	\N
39	23	19.99	USD	\N
40	24	19.99	USD	\N
41	25	19.99	USD	\N
42	26	19.99	USD	\N
\.


--
-- Name: spree_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_prices_id_seq', 42, true);


--
-- Data for Name: spree_product_option_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_product_option_types (id, "position", product_id, option_type_id, created_at, updated_at) FROM stdin;
1	1	3	1	2015-03-31 08:20:26.465686	2015-03-31 08:20:26.465686
2	2	3	2	2015-03-31 08:20:26.471892	2015-03-31 08:20:26.471892
3	1	8	1	2015-03-31 08:20:26.506814	2015-03-31 08:20:26.506814
4	2	8	2	2015-03-31 08:20:26.510982	2015-03-31 08:20:26.510982
\.


--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_product_option_types_id_seq', 4, true);


--
-- Data for Name: spree_product_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_product_properties (id, value, product_id, property_id, created_at, updated_at, "position") FROM stdin;
1	Wilson	3	1	2015-03-31 08:20:26.618828	2015-03-31 08:20:26.618828	0
2	Wannabe Sports	3	2	2015-03-31 08:20:26.672744	2015-03-31 08:20:26.672744	0
3	JK1002	3	3	2015-03-31 08:20:26.773812	2015-03-31 08:20:26.773812	0
4	Baseball Jersey	3	4	2015-03-31 08:20:26.838344	2015-03-31 08:20:26.838344	0
5	Long	3	5	2015-03-31 08:20:26.87172	2015-03-31 08:20:26.87172	0
6	100% cotton	3	6	2015-03-31 08:20:26.903603	2015-03-31 08:20:26.903603	0
7	Loose	3	7	2015-03-31 08:20:26.951178	2015-03-31 08:20:26.951178	0
8	Men's	3	8	2015-03-31 08:20:26.994927	2015-03-31 08:20:26.994927	0
9	Jerseys	4	1	2015-03-31 08:20:27.028717	2015-03-31 08:20:27.028717	0
10	Resiliance	4	2	2015-03-31 08:20:27.059967	2015-03-31 08:20:27.059967	0
11	TL174	4	3	2015-03-31 08:20:27.094568	2015-03-31 08:20:27.094568	0
12	Jr. Spaghetti T	4	4	2015-03-31 08:20:27.136211	2015-03-31 08:20:27.136211	0
13	None	4	5	2015-03-31 08:20:27.170245	2015-03-31 08:20:27.170245	0
14	90% Cotton, 10% Nylon	4	6	2015-03-31 08:20:27.204053	2015-03-31 08:20:27.204053	0
15	Form	4	7	2015-03-31 08:20:27.238293	2015-03-31 08:20:27.238293	0
16	Women's	4	8	2015-03-31 08:20:27.270507	2015-03-31 08:20:27.270507	0
17	Jerseys	5	1	2015-03-31 08:20:27.304154	2015-03-31 08:20:27.304154	0
18	Conditioned	5	2	2015-03-31 08:20:27.337408	2015-03-31 08:20:27.337408	0
19	TL9002	5	3	2015-03-31 08:20:27.369848	2015-03-31 08:20:27.369848	0
20	Ringer T	5	4	2015-03-31 08:20:27.404217	2015-03-31 08:20:27.404217	0
21	Short	5	5	2015-03-31 08:20:27.436077	2015-03-31 08:20:27.436077	0
22	100% Vellum	5	6	2015-03-31 08:20:27.46953	2015-03-31 08:20:27.46953	0
23	Loose	5	7	2015-03-31 08:20:27.502175	2015-03-31 08:20:27.502175	0
24	Men's	5	8	2015-03-31 08:20:27.537569	2015-03-31 08:20:27.537569	0
25	Tote	1	9	2015-03-31 08:20:27.574493	2015-03-31 08:20:27.574493	0
26	15" x 18" x 6"	1	10	2015-03-31 08:20:27.616879	2015-03-31 08:20:27.616879	0
27	Canvas	1	11	2015-03-31 08:20:27.660302	2015-03-31 08:20:27.660302	0
28	Messenger	2	9	2015-03-31 08:20:27.693716	2015-03-31 08:20:27.693716	0
29	14 1/2" x 12" x 5"	2	10	2015-03-31 08:20:27.723935	2015-03-31 08:20:27.723935	0
30	600 Denier Polyester	2	11	2015-03-31 08:20:27.758207	2015-03-31 08:20:27.758207	0
31	Mug	13	9	2015-03-31 08:20:27.793423	2015-03-31 08:20:27.793423	0
32	4.5" tall, 3.25" dia.	13	10	2015-03-31 08:20:27.826504	2015-03-31 08:20:27.826504	0
33	Stein	14	9	2015-03-31 08:20:27.869533	2015-03-31 08:20:27.869533	0
34	6.75" tall, 3.75" dia. base, 3" dia. rim	14	10	2015-03-31 08:20:27.901788	2015-03-31 08:20:27.901788	0
35	Stein	15	9	2015-03-31 08:20:27.935626	2015-03-31 08:20:27.935626	0
36	6.75" tall, 3.75" dia. base, 3" dia. rim	15	10	2015-03-31 08:20:27.970347	2015-03-31 08:20:27.970347	0
37	Mug	16	9	2015-03-31 08:20:28.005205	2015-03-31 08:20:28.005205	0
38	4.5" tall, 3.25" dia.	16	10	2015-03-31 08:20:28.034784	2015-03-31 08:20:28.034784	0
39	Tote	11	9	2015-03-31 08:20:28.072727	2015-03-31 08:20:28.072727	0
40	15" x 18" x 6"	11	10	2015-03-31 08:20:28.114235	2015-03-31 08:20:28.114235	0
41	Messenger	12	9	2015-03-31 08:20:28.148282	2015-03-31 08:20:28.148282	0
42	14 1/2" x 12" x 5"	12	10	2015-03-31 08:20:28.180563	2015-03-31 08:20:28.180563	0
43	Wilson	8	1	2015-03-31 08:20:28.228299	2015-03-31 08:20:28.228299	0
44	Wannabe Sports	8	2	2015-03-31 08:20:28.258579	2015-03-31 08:20:28.258579	0
45	JK1002	8	3	2015-03-31 08:20:28.291456	2015-03-31 08:20:28.291456	0
46	Baseball Jersey	8	4	2015-03-31 08:20:28.323691	2015-03-31 08:20:28.323691	0
47	Long	8	5	2015-03-31 08:20:28.357323	2015-03-31 08:20:28.357323	0
48	100% cotton	8	6	2015-03-31 08:20:28.391311	2015-03-31 08:20:28.391311	0
49	Loose	8	7	2015-03-31 08:20:28.425916	2015-03-31 08:20:28.425916	0
50	Men's	8	8	2015-03-31 08:20:28.455827	2015-03-31 08:20:28.455827	0
51	Jerseys	9	1	2015-03-31 08:20:28.492893	2015-03-31 08:20:28.492893	0
52	Resiliance	9	2	2015-03-31 08:20:28.535006	2015-03-31 08:20:28.535006	0
53	TL174	9	3	2015-03-31 08:20:28.569522	2015-03-31 08:20:28.569522	0
54	Jr. Spaghetti T	9	4	2015-03-31 08:20:28.600278	2015-03-31 08:20:28.600278	0
55	None	9	5	2015-03-31 08:20:28.63521	2015-03-31 08:20:28.63521	0
56	90% Cotton, 10% Nylon	9	6	2015-03-31 08:20:28.667559	2015-03-31 08:20:28.667559	0
57	Form	9	7	2015-03-31 08:20:28.702131	2015-03-31 08:20:28.702131	0
58	Women's	9	8	2015-03-31 08:20:28.735675	2015-03-31 08:20:28.735675	0
59	Jerseys	10	1	2015-03-31 08:20:28.770146	2015-03-31 08:20:28.770146	0
60	Conditioned	10	2	2015-03-31 08:20:28.80152	2015-03-31 08:20:28.80152	0
61	TL9002	10	3	2015-03-31 08:20:28.835852	2015-03-31 08:20:28.835852	0
62	Ringer T	10	4	2015-03-31 08:20:28.869541	2015-03-31 08:20:28.869541	0
63	Short	10	5	2015-03-31 08:20:28.901949	2015-03-31 08:20:28.901949	0
64	100% Vellum	10	6	2015-03-31 08:20:28.933871	2015-03-31 08:20:28.933871	0
65	Loose	10	7	2015-03-31 08:20:28.969709	2015-03-31 08:20:28.969709	0
66	Men's	10	8	2015-03-31 08:20:29.00246	2015-03-31 08:20:29.00246	0
\.


--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_product_properties_id_seq', 66, true);


--
-- Data for Name: spree_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_products (id, name, description, available_on, deleted_at, slug, meta_description, meta_keywords, tax_category_id, shipping_category_id, created_at, updated_at, promotionable, meta_title) FROM stdin;
12	Spree Bag	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	spree-bag	\N	\N	1	1	2015-03-31 08:20:23.517451	2015-03-31 08:20:44.171657	t	\N
1	Ruby on Rails Tote	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	ruby-on-rails-tote	\N	\N	1	1	2015-03-31 08:20:20.396168	2015-03-31 08:20:39.47224	t	\N
8	Spree Baseball Jersey	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	spree-baseball-jersey	\N	\N	1	1	2015-03-31 08:20:22.423543	2015-03-31 08:20:46.261602	t	\N
2	Ruby on Rails Bag	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	ruby-on-rails-bag	\N	\N	1	1	2015-03-31 08:20:20.826341	2015-03-31 08:20:39.764688	t	\N
13	Ruby on Rails Mug	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	ruby-on-rails-mug	\N	\N	\N	1	2015-03-31 08:20:23.770475	2015-03-31 08:20:41.220128	t	\N
11	Spree Tote	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	spree-tote	\N	\N	1	1	2015-03-31 08:20:23.228761	2015-03-31 08:20:44.812873	t	\N
15	Spree Stein	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	spree-stein	\N	\N	\N	1	2015-03-31 08:20:24.30772	2015-03-31 08:20:46.824108	t	\N
3	Ruby on Rails Baseball Jersey	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	ruby-on-rails-baseball-jersey	\N	\N	1	1	2015-03-31 08:20:21.092898	2015-03-31 08:20:40.341208	t	\N
10	Spree Ringer T-Shirt	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	spree-ringer-t-shirt	\N	\N	1	1	2015-03-31 08:20:22.955539	2015-03-31 08:20:45.352954	t	\N
5	Ruby on Rails Ringer T-Shirt	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	ruby-on-rails-ringer-t-shirt	\N	\N	1	1	2015-03-31 08:20:21.609743	2015-03-31 08:20:41.769877	t	\N
4	Ruby on Rails Jr. Spaghetti	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	ruby-on-rails-jr-spaghetti	\N	\N	1	1	2015-03-31 08:20:21.370299	2015-03-31 08:20:40.638105	t	\N
9	Spree Jr. Spaghetti	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	spree-jr-spaghetti	\N	\N	1	1	2015-03-31 08:20:22.688953	2015-03-31 08:20:45.656346	t	\N
16	Spree Mug	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	spree-mug	\N	\N	\N	1	2015-03-31 08:20:24.549273	2015-03-31 08:20:47.346265	t	\N
14	Ruby on Rails Stein	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	ruby-on-rails-stein	\N	\N	\N	1	2015-03-31 08:20:24.043435	2015-03-31 08:20:43.000833	t	\N
7	Apache Baseball Jersey	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	apache-baseball-jersey	\N	\N	1	1	2015-03-31 08:20:22.163443	2015-03-31 08:20:43.420666	t	\N
6	Ruby Baseball Jersey	Voluptatem nemo sit expedita similique sed eaque iste. Qui necessitatibus eum dolores exercitationem. Ullam sint itaque necessitatibus maxime et totam error perferendis. Velit non et ad similique ea.	2015-03-31 08:20:20.155517	\N	ruby-baseball-jersey	\N	\N	1	1	2015-03-31 08:20:21.878209	2015-03-31 08:20:43.863367	t	\N
\.


--
-- Name: spree_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_products_id_seq', 16, true);


--
-- Data for Name: spree_products_promotion_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_products_promotion_rules (product_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: spree_products_taxons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_products_taxons (product_id, taxon_id, id, "position") FROM stdin;
1	3	1	1
2	3	2	2
11	3	3	3
12	3	4	4
13	4	5	1
14	4	6	2
15	4	7	3
16	4	8	4
4	6	9	1
9	6	10	2
3	7	11	1
5	7	12	2
7	7	13	3
6	7	14	4
8	7	15	5
10	7	16	6
6	8	17	1
7	9	18	1
15	10	19	1
16	10	20	2
10	10	21	3
8	10	22	4
11	10	23	5
12	10	24	6
9	10	25	7
1	11	26	1
2	11	27	2
13	11	28	3
14	11	29	4
3	11	30	5
4	11	31	6
5	11	32	7
\.


--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_products_taxons_id_seq', 32, true);


--
-- Data for Name: spree_promotion_action_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_action_line_items (id, promotion_action_id, variant_id, quantity) FROM stdin;
\.


--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_promotion_action_line_items_id_seq', 1, false);


--
-- Data for Name: spree_promotion_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_actions (id, promotion_id, "position", type, deleted_at) FROM stdin;
\.


--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_promotion_actions_id_seq', 1, false);


--
-- Data for Name: spree_promotion_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_categories (id, name, created_at, updated_at, code) FROM stdin;
\.


--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_promotion_categories_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_rules (id, promotion_id, user_id, product_group_id, type, created_at, updated_at, code, preferences) FROM stdin;
\.


--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_rules_users (user_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: spree_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotions (id, description, expires_at, starts_at, name, type, usage_limit, match_policy, code, advertise, path, created_at, updated_at, promotion_category_id) FROM stdin;
\.


--
-- Name: spree_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_promotions_id_seq', 1, false);


--
-- Data for Name: spree_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_properties (id, name, presentation, created_at, updated_at) FROM stdin;
1	Manufacturer	Manufacturer	2015-03-31 08:20:26.575486	2015-03-31 08:20:26.575486
2	Brand	Brand	2015-03-31 08:20:26.666507	2015-03-31 08:20:26.666507
3	Model	Model	2015-03-31 08:20:26.765705	2015-03-31 08:20:26.765705
4	Shirt Type	Shirt Type	2015-03-31 08:20:26.832919	2015-03-31 08:20:26.832919
5	Sleeve Type	Sleeve Type	2015-03-31 08:20:26.864969	2015-03-31 08:20:26.864969
6	Made from	Made from	2015-03-31 08:20:26.898181	2015-03-31 08:20:26.898181
7	Fit	Fit	2015-03-31 08:20:26.943165	2015-03-31 08:20:26.943165
8	Gender	Gender	2015-03-31 08:20:26.987916	2015-03-31 08:20:26.987916
9	Type	Type	2015-03-31 08:20:27.566172	2015-03-31 08:20:27.566172
10	Size	Size	2015-03-31 08:20:27.609478	2015-03-31 08:20:27.609478
11	Material	Material	2015-03-31 08:20:27.652661	2015-03-31 08:20:27.652661
\.


--
-- Name: spree_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_properties_id_seq', 11, true);


--
-- Data for Name: spree_properties_prototypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_properties_prototypes (prototype_id, property_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	11
1	7
1	8
2	9
2	10
2	11
3	10
3	9
\.


--
-- Data for Name: spree_prototypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_prototypes (id, name, created_at, updated_at) FROM stdin;
1	Shirt	2015-03-31 08:20:29.051135	2015-03-31 08:20:29.051135
2	Bag	2015-03-31 08:20:29.228172	2015-03-31 08:20:29.228172
3	Mugs	2015-03-31 08:20:29.295518	2015-03-31 08:20:29.295518
\.


--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_prototypes_id_seq', 3, true);


--
-- Data for Name: spree_refund_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_refund_reasons (id, name, active, mutable, created_at, updated_at) FROM stdin;
1	Return processing	t	f	2015-03-31 08:20:02.90195	2015-03-31 08:20:02.90195
\.


--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_refund_reasons_id_seq', 1, true);


--
-- Data for Name: spree_refunds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_refunds (id, payment_id, amount, transaction_id, created_at, updated_at, refund_reason_id, reimbursement_id) FROM stdin;
\.


--
-- Name: spree_refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_refunds_id_seq', 1, false);


--
-- Data for Name: spree_reimbursement_credits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_reimbursement_credits (id, amount, reimbursement_id, creditable_id, creditable_type) FROM stdin;
\.


--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_reimbursement_credits_id_seq', 1, false);


--
-- Data for Name: spree_reimbursement_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_reimbursement_types (id, name, active, mutable, created_at, updated_at, type) FROM stdin;
1	original	t	t	2015-03-31 08:20:04.986803	2015-03-31 08:20:05.488736	Spree::ReimbursementType::OriginalPayment
\.


--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_reimbursement_types_id_seq', 1, true);


--
-- Data for Name: spree_reimbursements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_reimbursements (id, number, reimbursement_status, customer_return_id, order_id, total, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_reimbursements_id_seq', 1, false);


--
-- Data for Name: spree_return_authorization_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_return_authorization_reasons (id, name, active, mutable, created_at, updated_at) FROM stdin;
1	Better price available	t	t	2015-03-31 08:20:02.306237	2015-03-31 08:20:02.306237
2	Missed estimated delivery date	t	t	2015-03-31 08:20:02.309653	2015-03-31 08:20:02.309653
3	Missing parts or accessories	t	t	2015-03-31 08:20:02.313192	2015-03-31 08:20:02.313192
4	Damaged/Defective	t	t	2015-03-31 08:20:02.316662	2015-03-31 08:20:02.316662
5	Different from what was ordered	t	t	2015-03-31 08:20:02.31973	2015-03-31 08:20:02.31973
6	Different from description	t	t	2015-03-31 08:20:02.322544	2015-03-31 08:20:02.322544
7	No longer needed/wanted	t	t	2015-03-31 08:20:02.325543	2015-03-31 08:20:02.325543
8	Accidental order	t	t	2015-03-31 08:20:02.328321	2015-03-31 08:20:02.328321
9	Unauthorized purchase	t	t	2015-03-31 08:20:02.331206	2015-03-31 08:20:02.331206
\.


--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_return_authorization_reasons_id_seq', 9, true);


--
-- Data for Name: spree_return_authorizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_return_authorizations (id, number, state, order_id, memo, created_at, updated_at, stock_location_id, return_authorization_reason_id) FROM stdin;
\.


--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_return_authorizations_id_seq', 1, false);


--
-- Data for Name: spree_return_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_return_items (id, return_authorization_id, inventory_unit_id, exchange_variant_id, created_at, updated_at, pre_tax_amount, included_tax_total, additional_tax_total, reception_status, acceptance_status, customer_return_id, reimbursement_id, exchange_inventory_unit_id, acceptance_status_errors, preferred_reimbursement_type_id, override_reimbursement_type_id, resellable) FROM stdin;
\.


--
-- Name: spree_return_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_return_items_id_seq', 1, false);


--
-- Data for Name: spree_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_roles (id, name) FROM stdin;
1	admin
2	user
\.


--
-- Name: spree_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_roles_id_seq', 2, true);


--
-- Data for Name: spree_roles_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_roles_users (role_id, user_id) FROM stdin;
1	1
\.


--
-- Data for Name: spree_shipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipments (id, tracking, number, cost, shipped_at, order_id, address_id, state, created_at, updated_at, stock_location_id, adjustment_total, additional_tax_total, promo_total, included_tax_total, pre_tax_amount) FROM stdin;
1	\N	H98456334018	5.00	\N	1	1	pending	2015-03-31 08:20:48.688708	2015-03-31 08:20:49.75413	1	0.00	0.00	0.00	0.00	0.00
2	\N	H32168189903	5.00	\N	2	1	pending	2015-03-31 08:20:48.819261	2015-03-31 08:20:50.270261	1	0.00	0.00	0.00	0.00	0.00
\.


--
-- Name: spree_shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_shipments_id_seq', 2, true);


--
-- Data for Name: spree_shipping_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipping_categories (id, name, created_at, updated_at) FROM stdin;
1	Default	2015-03-31 08:19:51.223783	2015-03-31 08:19:51.223783
\.


--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_shipping_categories_id_seq', 1, true);


--
-- Data for Name: spree_shipping_method_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipping_method_categories (id, shipping_method_id, shipping_category_id, created_at, updated_at) FROM stdin;
1	1	1	2015-03-31 08:20:19.610925	2015-03-31 08:20:19.610925
2	2	1	2015-03-31 08:20:19.64165	2015-03-31 08:20:19.64165
3	3	1	2015-03-31 08:20:19.673692	2015-03-31 08:20:19.673692
4	4	1	2015-03-31 08:20:19.708109	2015-03-31 08:20:19.708109
5	5	1	2015-03-31 08:20:19.741009	2015-03-31 08:20:19.741009
\.


--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_shipping_method_categories_id_seq', 5, true);


--
-- Data for Name: spree_shipping_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipping_methods (id, name, display_on, deleted_at, created_at, updated_at, tracking_url, admin_name, tax_category_id, code) FROM stdin;
1	UPS Ground (USD)	\N	\N	2015-03-31 08:20:19.604322	2015-03-31 08:20:19.604322	\N	\N	\N	\N
2	UPS Two Day (USD)	\N	\N	2015-03-31 08:20:19.635744	2015-03-31 08:20:19.635744	\N	\N	\N	\N
3	UPS One Day (USD)	\N	\N	2015-03-31 08:20:19.668889	2015-03-31 08:20:19.668889	\N	\N	\N	\N
4	UPS Ground (EU)	\N	\N	2015-03-31 08:20:19.702255	2015-03-31 08:20:19.702255	\N	\N	\N	\N
5	UPS Ground (EUR)	\N	\N	2015-03-31 08:20:19.733051	2015-03-31 08:20:19.733051	\N	\N	\N	\N
\.


--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_shipping_methods_id_seq', 5, true);


--
-- Data for Name: spree_shipping_methods_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipping_methods_zones (shipping_method_id, zone_id) FROM stdin;
1	2
2	2
3	2
4	1
5	1
\.


--
-- Data for Name: spree_shipping_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipping_rates (id, shipment_id, shipping_method_id, selected, cost, created_at, updated_at, tax_rate_id) FROM stdin;
11	1	2	f	10.00	2015-03-31 08:20:49.734103	2015-03-31 08:20:49.734103	\N
12	1	3	f	15.00	2015-03-31 08:20:49.735772	2015-03-31 08:20:49.735772	\N
10	1	1	t	5.00	2015-03-31 08:20:49.732054	2015-03-31 08:20:49.744126	\N
17	2	2	f	10.00	2015-03-31 08:20:50.248919	2015-03-31 08:20:50.248919	\N
18	2	3	f	15.00	2015-03-31 08:20:50.250348	2015-03-31 08:20:50.250348	\N
16	2	1	t	5.00	2015-03-31 08:20:50.247231	2015-03-31 08:20:50.257137	\N
\.


--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_shipping_rates_id_seq', 18, true);


--
-- Data for Name: spree_skrill_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_skrill_transactions (id, email, amount, currency, transaction_id, customer_id, payment_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_skrill_transactions_id_seq', 1, false);


--
-- Data for Name: spree_state_changes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_state_changes (id, name, previous_state, stateful_id, user_id, stateful_type, next_state, created_at, updated_at) FROM stdin;
1	payment	\N	1	\N	Spree::Order	balance_due	2015-03-31 08:20:49.401531	2015-03-31 08:20:49.401531
2	shipment	\N	1	\N	Spree::Order	pending	2015-03-31 08:20:49.607508	2015-03-31 08:20:49.607508
3	payment	\N	2	\N	Spree::Order	balance_due	2015-03-31 08:20:49.946788	2015-03-31 08:20:49.946788
4	shipment	\N	2	\N	Spree::Order	pending	2015-03-31 08:20:50.130295	2015-03-31 08:20:50.130295
\.


--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_state_changes_id_seq', 4, true);


--
-- Data for Name: spree_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_states (id, name, abbr, country_id, updated_at) FROM stdin;
1	Canillo	02	1	\N
2	Encamp	03	1	\N
3	La Massana	04	1	\N
4	Ordino	05	1	\N
5	Sant Julià de Lòria	06	1	\N
6	Andorra la Vella	07	1	\N
7	Escaldes-Engordany	08	1	\N
8	'Ajmān	AJ	2	\N
9	Abū Ȥaby [Abu Dhabi]	AZ	2	\N
10	Dubayy	DU	2	\N
11	Al Fujayrah	FU	2	\N
12	Ra’s al Khaymah	RK	2	\N
13	Ash Shāriqah	SH	2	\N
14	Umm al Qaywayn	UQ	2	\N
15	Balkh	BAL	3	\N
16	Bāmyān	BAM	3	\N
17	Bādghīs	BDG	3	\N
18	Badakhshān	BDS	3	\N
19	Baghlān	BGL	3	\N
20	Dāykundī	DAY	3	\N
21	Farāh	FRA	3	\N
22	Fāryāb	FYB	3	\N
23	Ghaznī	GHA	3	\N
24	Ghōr	GHO	3	\N
25	Helmand	HEL	3	\N
26	Herāt	HER	3	\N
27	Jowzjān	JOW	3	\N
28	Kābul	KAB	3	\N
29	Kandahār	KAN	3	\N
30	Kāpīsā	KAP	3	\N
31	Kunduz	KDZ	3	\N
32	Khōst	KHO	3	\N
33	Kunar	KNR	3	\N
34	Laghmān	LAG	3	\N
35	Lōgar	LOG	3	\N
36	Nangarhār	NAN	3	\N
37	Nīmrōz	NIM	3	\N
38	Nūristān	NUR	3	\N
39	Panjshayr	PAN	3	\N
40	Parwān	PAR	3	\N
41	Paktiyā	PIA	3	\N
42	Paktīkā	PKA	3	\N
43	Samangān	SAM	3	\N
44	Sar-e Pul	SAR	3	\N
45	Takhār	TAK	3	\N
46	Uruzgān	URU	3	\N
47	Wardak	WAR	3	\N
48	Zābul	ZAB	3	\N
49	Saint George	03	4	\N
50	Saint John	04	4	\N
51	Saint Mary	05	4	\N
52	Saint Paul	06	4	\N
53	Saint Peter	07	4	\N
54	Saint Philip	08	4	\N
55	Barbuda	10	4	\N
56	Redonda	11	4	\N
57	Berat	01	6	\N
58	Durrës	02	6	\N
59	Elbasan	03	6	\N
60	Fier	04	6	\N
61	Gjirokastër	05	6	\N
62	Korçë	06	6	\N
63	Kukës	07	6	\N
64	Lezhë	08	6	\N
65	Dibër	09	6	\N
66	Shkodër	10	6	\N
67	Tiranë	11	6	\N
68	Vlorë	12	6	\N
69	Aragacotn	AG	7	\N
70	Ararat	AR	7	\N
71	Armavir	AV	7	\N
72	Erevan	ER	7	\N
73	Gegarkunik'	GR	7	\N
74	Kotayk'	KT	7	\N
75	Lory	LO	7	\N
76	Sirak	SH	7	\N
77	Syunik'	SU	7	\N
78	Tavus	TV	7	\N
79	Vayoc Jor	VD	7	\N
80	Bengo	BGO	8	\N
81	Benguela	BGU	8	\N
82	Bié	BIE	8	\N
83	Cabinda	CAB	8	\N
84	Cuando-Cubango	CCU	8	\N
85	Cunene	CNN	8	\N
86	Cuanza Norte	CNO	8	\N
87	Cuanza Sul	CUS	8	\N
88	Huambo	HUA	8	\N
89	Huíla	HUI	8	\N
90	Lunda Norte	LNO	8	\N
91	Lunda Sul	LSU	8	\N
92	Luanda	LUA	8	\N
93	Malange	MAL	8	\N
94	Moxico	MOX	8	\N
95	Namibe	NAM	8	\N
96	Uíge	UIG	8	\N
97	Zaire	ZAI	8	\N
98	Salta	A	10	\N
99	Buenos Aires	B	10	\N
100	Ciudad Autónoma de Buenos Aires	C	10	\N
101	San Luis	D	10	\N
102	Entre Rios	E	10	\N
103	Santiago del Estero	G	10	\N
104	Chaco	H	10	\N
105	San Juan	J	10	\N
106	Catamarca	K	10	\N
107	La Pampa	L	10	\N
108	Mendoza	M	10	\N
109	Misiones	N	10	\N
110	Formosa	P	10	\N
111	Neuquen	Q	10	\N
112	Rio Negro	R	10	\N
113	Santa Fe	S	10	\N
114	Tucuman	T	10	\N
115	Chubut	U	10	\N
116	Tierra del Fuego	V	10	\N
117	Corrientes	W	10	\N
118	Cordoba	X	10	\N
119	Jujuy	Y	10	\N
120	Santa Cruz	Z	10	\N
121	La Rioja	F	10	\N
122	Burgenland	1	12	\N
123	Kärnten	2	12	\N
124	Niederösterreich	3	12	\N
125	Oberösterreich	4	12	\N
126	Salzburg	5	12	\N
127	Steiermark	6	12	\N
128	Tirol	7	12	\N
129	Vorarlberg	8	12	\N
130	Wien	9	12	\N
131	Australian Capital Territory	ACT	13	\N
132	New South Wales	NSW	13	\N
133	Northern Territory	NT	13	\N
134	Queensland	QLD	13	\N
135	South Australia	SA	13	\N
136	Tasmania	TAS	13	\N
137	Victoria	VIC	13	\N
138	Western Australia	WA	13	\N
139	Abşeron	ABS	16	\N
140	Ağstafa	AGA	16	\N
141	Ağcabədi	AGC	16	\N
142	Ağdam	AGM	16	\N
143	Ağdaş	AGS	16	\N
144	Ağsu	AGU	16	\N
145	Astara	AST	16	\N
146	Bakı	BA	16	\N
147	Balakən	BAL	16	\N
148	Bərdə	BAR	16	\N
149	Beyləqan	BEY	16	\N
150	Biləsuvar	BIL	16	\N
151	Cəbrayıl	CAB	16	\N
152	Cəlilabab	CAL	16	\N
153	Daşkəsən	DAS	16	\N
154	Füzuli	FUZ	16	\N
155	Gəncə	GA	16	\N
156	Gədəbəy	GAD	16	\N
157	Goranboy	GOR	16	\N
158	Göyçay	GOY	16	\N
159	Göygöl	GYG	16	\N
160	Hacıqabul	HAC	16	\N
161	İmişli	IMI	16	\N
162	İsmayıllı	ISM	16	\N
163	Kəlbəcər	KAL	16	\N
164	Kürdəmir	KUR	16	\N
165	Lənkəran	LA	16	\N
166	Laçın	LAC	16	\N
167	Lənkəran	LAN	16	\N
168	Lerik	LER	16	\N
169	Masallı	MAS	16	\N
170	Mingəçevir	MI	16	\N
171	Naftalan	NA	16	\N
172	Neftçala	NEF	16	\N
173	Naxçıvan	NX	16	\N
174	Oğuz	OGU	16	\N
175	Qəbələ	QAB	16	\N
176	Qax	QAX	16	\N
177	Qazax	QAZ	16	\N
178	Quba	QBA	16	\N
179	Qubadlı	QBI	16	\N
180	Qobustan	QOB	16	\N
181	Qusar	QUS	16	\N
182	Şəki	SA	16	\N
183	Sabirabad	SAB	16	\N
184	Şəki	SAK	16	\N
185	Salyan	SAL	16	\N
186	Saatlı	SAT	16	\N
187	Şabran	SBN	16	\N
188	Siyəzən	SIY	16	\N
189	Şəmkir	SKR	16	\N
190	Sumqayıt	SM	16	\N
191	Şamaxı	SMI	16	\N
192	Samux	SMX	16	\N
193	Şirvan	SR	16	\N
194	Şuşa	SUS	16	\N
195	Tərtər	TAR	16	\N
196	Tovuz	TOV	16	\N
197	Ucar	UCA	16	\N
198	Xankəndi	XA	16	\N
199	Xaçmaz	XAC	16	\N
200	Xocalı	XCI	16	\N
201	Xızı	XIZ	16	\N
202	Xocavənd	XVD	16	\N
203	Yardımlı	YAR	16	\N
204	Yevlax	YE	16	\N
205	Yevlax	YEV	16	\N
206	Zəngilan	ZAN	16	\N
207	Zaqatala	ZAQ	16	\N
208	Zərdab	ZAR	16	\N
209	Federacija Bosne i Hercegovine	BIH	17	\N
210	Brčko distrikt	BRC	17	\N
211	Republika Srpska	SRP	17	\N
212	Christ Church	01	18	\N
213	Saint Andrew	02	18	\N
214	Saint George	03	18	\N
215	Saint James	04	18	\N
216	Saint John	05	18	\N
217	Saint Joseph	06	18	\N
218	Saint Lucy	07	18	\N
219	Saint Michael	08	18	\N
220	Saint Peter	09	18	\N
221	Saint Philip	10	18	\N
222	Saint Thomas	11	18	\N
223	Barisal	A	19	\N
224	Chittagong	B	19	\N
225	Dhaka	C	19	\N
226	Khulna	D	19	\N
227	Rajshahi	E	19	\N
228	Rangpur	F	19	\N
229	Sylhet	G	19	\N
230	Bruxelles-Capitale, Région de;Brussels Hoofdstedelijk Gewest	BRU	20	\N
231	Vlaams Gewest	VLG	20	\N
232	wallonne, Région	WAL	20	\N
233	Boucle du Mouhoun	01	21	\N
234	Cascades	02	21	\N
235	Centre	03	21	\N
236	Centre-Est	04	21	\N
237	Centre-Nord	05	21	\N
238	Centre-Ouest	06	21	\N
239	Centre-Sud	07	21	\N
240	Est	08	21	\N
241	Hauts-Bassins	09	21	\N
242	Nord	10	21	\N
243	Plateau-Central	11	21	\N
244	Sahel	12	21	\N
245	Sud-Ouest	13	21	\N
246	Blagoevgrad	01	22	\N
247	Burgas	02	22	\N
248	Varna	03	22	\N
249	Veliko Tarnovo	04	22	\N
250	Vidin	05	22	\N
251	Vratsa	06	22	\N
252	Gabrovo	07	22	\N
253	Dobrich	08	22	\N
254	Kardzhali	09	22	\N
255	Kyustendil	10	22	\N
256	Lovech	11	22	\N
257	Montana	12	22	\N
258	Pazardzhik	13	22	\N
259	Pernik	14	22	\N
260	Pleven	15	22	\N
261	Plovdiv	16	22	\N
262	Razgrad	17	22	\N
263	Ruse	18	22	\N
264	Silistra	19	22	\N
265	Sliven	20	22	\N
266	Smolyan	21	22	\N
267	Sofia-Grad	22	22	\N
268	Sofia	23	22	\N
269	Stara Zagora	24	22	\N
270	Targovishte	25	22	\N
271	Haskovo	26	22	\N
272	Shumen	27	22	\N
273	Yambol	28	22	\N
274	Al Manāmah (Al ‘Āşimah)	13	23	\N
275	Al Janūbīyah	14	23	\N
276	Al Muḩarraq	15	23	\N
277	Al Wusţá	16	23	\N
278	Ash Shamālīyah	17	23	\N
279	Bubanza	BB	24	\N
280	Bujumbura Rural	BL	24	\N
281	Bujumbura Mairie	BM	24	\N
282	Bururi	BR	24	\N
283	Cankuzo	CA	24	\N
284	Cibitoke	CI	24	\N
285	Gitega	GI	24	\N
286	Kirundo	KI	24	\N
287	Karuzi	KR	24	\N
288	Kayanza	KY	24	\N
289	Makamba	MA	24	\N
290	Muramvya	MU	24	\N
291	Mwaro	MW	24	\N
292	Ngozi	NG	24	\N
293	Rutana	RT	24	\N
294	Ruyigi	RY	24	\N
295	Atakora	AK	25	\N
296	Alibori	AL	25	\N
297	Atlantique	AQ	25	\N
298	Borgou	BO	25	\N
299	Collines	CO	25	\N
300	Donga	DO	25	\N
301	Kouffo	KO	25	\N
302	Littoral	LI	25	\N
303	Mono	MO	25	\N
304	Ouémé	OU	25	\N
305	Plateau	PL	25	\N
306	Zou	ZO	25	\N
307	Belait	BE	28	\N
308	Brunei-Muara	BM	28	\N
309	Temburong	TE	28	\N
310	Tutong	TU	28	\N
311	El Beni	B	29	\N
312	Cochabamba	C	29	\N
313	Chuquisaca	H	29	\N
314	La Paz	L	29	\N
315	Pando	N	29	\N
316	Oruro	O	29	\N
317	Potosí	P	29	\N
318	Santa Cruz	S	29	\N
319	Tarija	T	29	\N
320	Bonaire	BO	30	\N
321	Saba	SA	30	\N
322	Sint Eustatius	SE	30	\N
323	Acre	AC	31	\N
324	Alagoas	AL	31	\N
325	Amazonas	AM	31	\N
326	Amapá	AP	31	\N
327	Bahia	BA	31	\N
328	Ceará	CE	31	\N
329	Distrito Federal	DF	31	\N
330	Espírito Santo	ES	31	\N
331	Fernando de Noronha	FN	31	\N
332	Goiás	GO	31	\N
333	Maranhão	MA	31	\N
334	Minas Gerais	MG	31	\N
335	Mato Grosso do Sul	MS	31	\N
336	Mato Grosso	MT	31	\N
337	Pará	PA	31	\N
338	Paraíba	PB	31	\N
339	Pernambuco	PE	31	\N
340	Piauí	PI	31	\N
341	Paraná	PR	31	\N
342	Rio de Janeiro	RJ	31	\N
343	Rio Grande do Norte	RN	31	\N
344	Rondônia	RO	31	\N
345	Roraima	RR	31	\N
346	Rio Grande do Sul	RS	31	\N
347	Santa Catarina	SC	31	\N
348	Sergipe	SE	31	\N
349	São Paulo	SP	31	\N
350	Tocantins	TO	31	\N
351	Acklins	AK	32	\N
352	Bimini	BI	32	\N
353	Black Point	BP	32	\N
354	Berry Islands	BY	32	\N
355	Central Eleuthera	CE	32	\N
356	Cat Island	CI	32	\N
357	Crooked Island and Long Cay	CK	32	\N
358	Central Abaco	CO	32	\N
359	Central Andros	CS	32	\N
360	East Grand Bahama	EG	32	\N
361	Exuma	EX	32	\N
362	City of Freeport	FP	32	\N
363	Grand Cay	GC	32	\N
364	Harbour Island	HI	32	\N
365	Hope Town	HT	32	\N
366	Inagua	IN	32	\N
367	Long Island	LI	32	\N
368	Mangrove Cay	MC	32	\N
369	Mayaguana	MG	32	\N
370	Moore's Island	MI	32	\N
371	North Eleuthera	NE	32	\N
372	North Abaco	NO	32	\N
373	North Andros	NS	32	\N
374	Rum Cay	RC	32	\N
375	Ragged Island	RI	32	\N
376	South Andros	SA	32	\N
377	South Eleuthera	SE	32	\N
378	South Abaco	SO	32	\N
379	San Salvador	SS	32	\N
380	Spanish Wells	SW	32	\N
381	West Grand Bahama	WG	32	\N
382	Paro	11	33	\N
383	Chhukha	12	33	\N
384	Ha	13	33	\N
385	Samtee	14	33	\N
386	Thimphu	15	33	\N
387	Tsirang	21	33	\N
388	Dagana	22	33	\N
389	Punakha	23	33	\N
390	Wangdue Phodrang	24	33	\N
391	Sarpang	31	33	\N
392	Trongsa	32	33	\N
393	Bumthang	33	33	\N
394	Zhemgang	34	33	\N
395	Trashigang	41	33	\N
396	Monggar	42	33	\N
397	Pemagatshel	43	33	\N
398	Lhuentse	44	33	\N
399	Samdrup Jongkha	45	33	\N
400	Gasa	GA	33	\N
401	Trashi Yangtse	TY	33	\N
402	Central	CE	35	\N
403	Ghanzi	GH	35	\N
404	Kgalagadi	KG	35	\N
405	Kgatleng	KL	35	\N
406	Kweneng	KW	35	\N
407	North-East	NE	35	\N
408	North-West	NW	35	\N
409	South-East	SE	35	\N
410	Southern	SO	35	\N
411	Brèsckaja voblasc'	BR	36	\N
412	Horad Minsk	HM	36	\N
413	Homel'skaja voblasc'	HO	36	\N
414	Hrodzenskaja voblasc'	HR	36	\N
415	Mahilëuskaja voblasc'	MA	36	\N
416	Minskaja voblasc'	MI	36	\N
417	Vicebskaja voblasc'	VI	36	\N
418	Belize	BZ	37	\N
419	Cayo	CY	37	\N
420	Corozal	CZL	37	\N
421	Orange Walk	OW	37	\N
422	Stann Creek	SC	37	\N
423	Toledo	TOL	37	\N
424	Alberta	AB	38	\N
425	British Columbia	BC	38	\N
426	Manitoba	MB	38	\N
427	New Brunswick	NB	38	\N
428	Newfoundland and Labrador	NL	38	\N
429	Nova Scotia	NS	38	\N
430	Northwest Territories	NT	38	\N
431	Nunavut	NU	38	\N
432	Ontario	ON	38	\N
433	Prince Edward Island	PE	38	\N
434	Quebec	QC	38	\N
435	Saskatchewan	SK	38	\N
436	Yukon Territory	YT	38	\N
437	Bas-Congo	BC	40	\N
438	Bandundu	BN	40	\N
439	Équateur	EQ	40	\N
440	Katanga	KA	40	\N
441	Kasai-Oriental	KE	40	\N
442	Kinshasa	KN	40	\N
443	Kasai-Occidental	KW	40	\N
444	Maniema	MA	40	\N
445	Nord-Kivu	NK	40	\N
446	Orientale	OR	40	\N
447	Sud-Kivu	SK	40	\N
448	Ouham	AC	41	\N
449	Bamingui-Bangoran	BB	41	\N
450	Bangui	BGF	41	\N
451	Basse-Kotto	BK	41	\N
452	Haute-Kotto	HK	41	\N
453	Haut-Mbomou	HM	41	\N
454	Haute-Sangha / Mambéré-Kadéï	HS	41	\N
455	Gribingui	KB	41	\N
456	Kémo-Gribingui	KG	41	\N
457	Lobaye	LB	41	\N
458	Mbomou	MB	41	\N
459	Ombella-M'poko	MP	41	\N
460	Nana-Mambéré	NM	41	\N
461	Ouham-Pendé	OP	41	\N
462	Sangha	SE	41	\N
463	Ouaka	UK	41	\N
464	Vakaga	VK	41	\N
465	Bouenza	11	42	\N
466	Pool	12	42	\N
467	Sangha	13	42	\N
468	Plateaux	14	42	\N
469	Cuvette-Ouest	15	42	\N
470	Lékoumou	2	42	\N
471	Kouilou	5	42	\N
472	Likouala	7	42	\N
473	Cuvette	8	42	\N
474	Niari	9	42	\N
475	Brazzaville	BZV	42	\N
476	Aargau	AG	43	\N
477	Appenzell Innerrhoden	AI	43	\N
478	Appenzell Ausserrhoden	AR	43	\N
479	Bern	BE	43	\N
480	Basel-Landschaft	BL	43	\N
481	Basel-Stadt	BS	43	\N
482	Fribourg	FR	43	\N
483	Genève	GE	43	\N
484	Glarus	GL	43	\N
485	Graubünden	GR	43	\N
486	Jura	JU	43	\N
487	Luzern	LU	43	\N
488	Neuchâtel	NE	43	\N
489	Nidwalden	NW	43	\N
490	Obwalden	OW	43	\N
491	Sankt Gallen	SG	43	\N
492	Schaffhausen	SH	43	\N
493	Solothurn	SO	43	\N
494	Schwyz	SZ	43	\N
495	Thurgau	TG	43	\N
496	Ticino	TI	43	\N
497	Uri	UR	43	\N
498	Vaud	VD	43	\N
499	Valais	VS	43	\N
500	Zug	ZG	43	\N
501	Zürich	ZH	43	\N
502	Lagunes (Région des)	01	44	\N
503	Haut-Sassandra (Région du)	02	44	\N
504	Savanes (Région des)	03	44	\N
505	Vallée du Bandama (Région de la)	04	44	\N
506	Moyen-Comoé (Région du)	05	44	\N
507	18 Montagnes (Région des)	06	44	\N
508	Lacs (Région des)	07	44	\N
509	Zanzan (Région du)	08	44	\N
510	Bas-Sassandra (Région du)	09	44	\N
511	Denguélé (Région du)	10	44	\N
512	Nzi-Comoé (Région)	11	44	\N
513	Marahoué (Région de la)	12	44	\N
514	Sud-Comoé (Région du)	13	44	\N
515	Worodouqou (Région du)	14	44	\N
516	Sud-Bandama (Région du)	15	44	\N
517	Agnébi (Région de l')	16	44	\N
518	Bafing (Région du)	17	44	\N
519	Fromager (Région du)	18	44	\N
520	Moyen-Cavally (Région du)	19	44	\N
521	Aisén del General Carlos Ibáñez del Campo	AI	46	\N
522	Antofagasta	AN	46	\N
523	Arica y Parinacota	AP	46	\N
524	Araucanía	AR	46	\N
525	Atacama	AT	46	\N
526	Bío-Bío	BI	46	\N
527	Coquimbo	CO	46	\N
528	Libertador General Bernardo O'Higgins	LI	46	\N
529	Los Lagos	LL	46	\N
530	Los Ríos	LR	46	\N
531	Magallanes y Antártica Chilena	MA	46	\N
532	Maule	ML	46	\N
533	Región Metropolitana de Santiago	RM	46	\N
534	Tarapacá	TA	46	\N
535	Valparaíso	VS	46	\N
536	Adamaoua	AD	47	\N
537	Centre	CE	47	\N
538	Far North	EN	47	\N
539	East	ES	47	\N
540	Littoral	LT	47	\N
541	North	NO	47	\N
542	North-West (Cameroon)	NW	47	\N
543	West	OU	47	\N
544	South	SU	47	\N
545	South-West	SW	47	\N
546	Beijing	11	48	\N
547	Tianjin	12	48	\N
548	Hebei	13	48	\N
549	Shanxi	14	48	\N
550	Nei Mongol	15	48	\N
551	Liaoning	21	48	\N
552	Jilin	22	48	\N
553	Heilongjiang	23	48	\N
554	Shanghai	31	48	\N
555	Jiangsu	32	48	\N
556	Zhejiang	33	48	\N
557	Anhui	34	48	\N
558	Fujian	35	48	\N
559	Jiangxi	36	48	\N
560	Shandong	37	48	\N
561	Henan	41	48	\N
562	Hubei	42	48	\N
563	Hunan	43	48	\N
564	Guangdong	44	48	\N
565	Guangxi	45	48	\N
566	Hainan	46	48	\N
567	Chongqing	50	48	\N
568	Sichuan	51	48	\N
569	Guizhou	52	48	\N
570	Yunnan	53	48	\N
571	Xizang	54	48	\N
572	Shaanxi	61	48	\N
573	Gansu	62	48	\N
574	Qinghai	63	48	\N
575	Ningxia	64	48	\N
576	Xinjiang	65	48	\N
577	Taiwan	71	48	\N
578	Xianggang (Hong-Kong)	91	48	\N
579	Aomen (Macau)	92	48	\N
580	Amazonas	AMA	49	\N
581	Antioquia	ANT	49	\N
582	Arauca	ARA	49	\N
583	Atlántico	ATL	49	\N
584	Bolívar	BOL	49	\N
585	Boyacá	BOY	49	\N
586	Caldas	CAL	49	\N
587	Caquetá	CAQ	49	\N
588	Casanare	CAS	49	\N
589	Cauca	CAU	49	\N
590	Cesar	CES	49	\N
591	Chocó	CHO	49	\N
592	Córdoba	COR	49	\N
593	Cundinamarca	CUN	49	\N
594	Distrito Capital de Bogotá	DC	49	\N
595	Guainía	GUA	49	\N
596	Guaviare	GUV	49	\N
597	Huila	HUI	49	\N
598	La Guajira	LAG	49	\N
599	Magdalena	MAG	49	\N
600	Meta	MET	49	\N
601	Nariño	NAR	49	\N
602	Norte de Santander	NSA	49	\N
603	Putumayo	PUT	49	\N
604	Quindío	QUI	49	\N
605	Risaralda	RIS	49	\N
606	Santander	SAN	49	\N
607	San Andrés, Providencia y Santa Catalina	SAP	49	\N
608	Sucre	SUC	49	\N
609	Tolima	TOL	49	\N
610	Valle del Cauca	VAC	49	\N
611	Vaupés	VAU	49	\N
612	Vichada	VID	49	\N
613	Alajuela	A	50	\N
614	Cartago	C	50	\N
615	Guanacaste	G	50	\N
616	Heredia	H	50	\N
617	Limón	L	50	\N
618	Puntarenas	P	50	\N
619	San José	SJ	50	\N
620	Pinar del Rio	01	51	\N
621	La Habana	02	51	\N
622	Ciudad de La Habana	03	51	\N
623	Matanzas	04	51	\N
624	Villa Clara	05	51	\N
625	Cienfuegos	06	51	\N
626	Sancti Spíritus	07	51	\N
627	Ciego de Ávila	08	51	\N
628	Camagüey	09	51	\N
629	Las Tunas	10	51	\N
630	Holguín	11	51	\N
631	Granma	12	51	\N
632	Santiago de Cuba	13	51	\N
633	Guantánamo	14	51	\N
634	Isla de la Juventud	99	51	\N
635	Ilhas de Barlavento	B	52	\N
636	Ilhas de Sotavento	S	52	\N
637	Lefkosía	01	55	\N
638	Lemesós	02	55	\N
639	Lárnaka	03	55	\N
640	Ammóchostos	04	55	\N
641	Páfos	05	55	\N
642	Kerýneia	06	55	\N
643	Jihočeský kraj	JC	56	\N
644	Jihomoravský kraj	JM	56	\N
645	Karlovarský kraj	KA	56	\N
646	Královéhradecký kraj	KR	56	\N
647	Liberecký kraj	LI	56	\N
648	Moravskoslezský kraj	MO	56	\N
649	Olomoucký kraj	OL	56	\N
650	Pardubický kraj	PA	56	\N
651	Plzeňský kraj	PL	56	\N
652	Praha, hlavní město	PR	56	\N
653	Středočeský kraj	ST	56	\N
654	Ústecký kraj	US	56	\N
655	Vysočina	VY	56	\N
656	Zlínský kraj	ZL	56	\N
657	Brandenburg	BB	57	\N
658	Berlin	BE	57	\N
659	Baden-Württemberg	BW	57	\N
660	Bayern	BY	57	\N
661	Bremen	HB	57	\N
662	Hessen	HE	57	\N
663	Hamburg	HH	57	\N
664	Mecklenburg-Vorpommern	MV	57	\N
665	Niedersachsen	NI	57	\N
666	Nordrhein-Westfalen	NW	57	\N
667	Rheinland-Pfalz	RP	57	\N
668	Schleswig-Holstein	SH	57	\N
669	Saarland	SL	57	\N
670	Sachsen	SN	57	\N
671	Sachsen-Anhalt	ST	57	\N
672	Thüringen	TH	57	\N
673	Arta	AR	58	\N
674	Ali Sabieh	AS	58	\N
675	Dikhil	DI	58	\N
676	Djibouti	DJ	58	\N
677	Obock	OB	58	\N
678	Tadjourah	TA	58	\N
679	Nordjylland	81	59	\N
680	Midtjylland	82	59	\N
681	Syddanmark	83	59	\N
682	Hovedstaden	84	59	\N
683	Sjælland	85	59	\N
684	Saint Peter	01	60	\N
685	Saint Andrew	02	60	\N
686	Saint David	03	60	\N
687	Saint George	04	60	\N
688	Saint John	05	60	\N
689	Saint Joseph	06	60	\N
690	Saint Luke	07	60	\N
691	Saint Mark	08	60	\N
692	Saint Patrick	09	60	\N
693	Saint Paul	10	60	\N
694	Distrito Nacional (Santo Domingo)	01	61	\N
695	Azua	02	61	\N
696	Bahoruco	03	61	\N
697	Barahona	04	61	\N
698	Dajabón	05	61	\N
699	Duarte	06	61	\N
700	La Estrelleta [Elías Piña]	07	61	\N
701	El Seybo [El Seibo]	08	61	\N
702	Espaillat	09	61	\N
703	Independencia	10	61	\N
704	La Altagracia	11	61	\N
705	La Romana	12	61	\N
706	La Vega	13	61	\N
707	María Trinidad Sánchez	14	61	\N
708	Monte Cristi	15	61	\N
709	Pedernales	16	61	\N
710	Peravia	17	61	\N
711	Puerto Plata	18	61	\N
712	Salcedo	19	61	\N
713	Samaná	20	61	\N
714	San Cristóbal	21	61	\N
715	San Juan	22	61	\N
716	San Pedro de Macorís	23	61	\N
717	Sánchez Ramírez	24	61	\N
718	Santiago	25	61	\N
719	Santiago Rodríguez	26	61	\N
720	Valverde	27	61	\N
721	Monseñor Nouel	28	61	\N
722	Monte Plata	29	61	\N
723	Hato Mayor	30	61	\N
724	Adrar	01	62	\N
725	Chlef	02	62	\N
726	Laghouat	03	62	\N
727	Oum el Bouaghi	04	62	\N
728	Batna	05	62	\N
729	Béjaïa	06	62	\N
730	Biskra	07	62	\N
731	Béchar	08	62	\N
732	Blida	09	62	\N
733	Bouira	10	62	\N
734	Tamanghasset	11	62	\N
735	Tébessa	12	62	\N
736	Tlemcen	13	62	\N
737	Tiaret	14	62	\N
738	Tizi Ouzou	15	62	\N
739	Alger	16	62	\N
740	Djelfa	17	62	\N
741	Jijel	18	62	\N
742	Sétif	19	62	\N
743	Saïda	20	62	\N
744	Skikda	21	62	\N
745	Sidi Bel Abbès	22	62	\N
746	Annaba	23	62	\N
747	Guelma	24	62	\N
748	Constantine	25	62	\N
749	Médéa	26	62	\N
750	Mostaganem	27	62	\N
751	Msila	28	62	\N
752	Mascara	29	62	\N
753	Ouargla	30	62	\N
754	Oran	31	62	\N
755	El Bayadh	32	62	\N
756	Illizi	33	62	\N
757	Bordj Bou Arréridj	34	62	\N
758	Boumerdès	35	62	\N
759	El Tarf	36	62	\N
760	Tindouf	37	62	\N
761	Tissemsilt	38	62	\N
762	El Oued	39	62	\N
763	Khenchela	40	62	\N
764	Souk Ahras	41	62	\N
765	Tipaza	42	62	\N
766	Mila	43	62	\N
767	Aïn Defla	44	62	\N
768	Naama	45	62	\N
769	Aïn Témouchent	46	62	\N
770	Ghardaïa	47	62	\N
771	Relizane	48	62	\N
772	Azuay	A	63	\N
773	Bolívar	B	63	\N
774	Carchi	C	63	\N
775	Orellana	D	63	\N
776	Esmeraldas	E	63	\N
777	Cañar	F	63	\N
778	Guayas	G	63	\N
779	Chimborazo	H	63	\N
780	Imbabura	I	63	\N
781	Loja	L	63	\N
782	Manabí	M	63	\N
783	Napo	N	63	\N
784	El Oro	O	63	\N
785	Pichincha	P	63	\N
786	Los Ríos	R	63	\N
787	Morona-Santiago	S	63	\N
788	Santo Domingo de los Tsáchilas	SD	63	\N
789	Santa Elena	SE	63	\N
790	Tungurahua	T	63	\N
791	Sucumbíos	U	63	\N
792	Galápagos	W	63	\N
793	Cotopaxi	X	63	\N
794	Pastaza	Y	63	\N
795	Zamora-Chinchipe	Z	63	\N
796	Harjumaa	37	64	\N
797	Hiiumaa	39	64	\N
798	Ida-Virumaa	44	64	\N
799	Jõgevamaa	49	64	\N
800	Järvamaa	51	64	\N
801	Läänemaa	57	64	\N
802	Lääne-Virumaa	59	64	\N
803	Põlvamaa	65	64	\N
804	Pärnumaa	67	64	\N
805	Raplamaa	70	64	\N
806	Saaremaa	74	64	\N
807	Tartumaa	78	64	\N
808	Valgamaa	82	64	\N
809	Viljandimaa	84	64	\N
810	Võrumaa	86	64	\N
811	Al Iskandarīyah	ALX	65	\N
812	Aswān	ASN	65	\N
813	Asyūt	AST	65	\N
814	Al Bahr al Ahmar	BA	65	\N
815	Al Buhayrah	BH	65	\N
816	Banī Suwayf	BNS	65	\N
817	Al Qāhirah	C	65	\N
818	Ad Daqahlīyah	DK	65	\N
819	Dumyāt	DT	65	\N
820	Al Fayyūm	FYM	65	\N
821	Al Gharbīyah	GH	65	\N
822	Al Jīzah	GZ	65	\N
823	Ḩulwān	HU	65	\N
824	Al Ismā`īlīyah	IS	65	\N
825	Janūb Sīnā'	JS	65	\N
826	Al Qalyūbīyah	KB	65	\N
827	Kafr ash Shaykh	KFS	65	\N
828	Qinā	KN	65	\N
829	Al Minyā	MN	65	\N
830	Al Minūfīyah	MNF	65	\N
831	Matrūh	MT	65	\N
832	Būr Sa`īd	PTS	65	\N
833	Sūhāj	SHG	65	\N
834	Ash Sharqīyah	SHR	65	\N
835	Shamal Sīnā'	SIN	65	\N
836	As Sādis min Uktūbar	SU	65	\N
837	As Suways	SUZ	65	\N
838	Al Wādī al Jadīd	WAD	65	\N
839	Ansabā	AN	67	\N
840	Janūbī al Baḩrī al Aḩmar	DK	67	\N
841	Al Janūbī	DU	67	\N
842	Qāsh-Barkah	GB	67	\N
843	Al Awsaţ	MA	67	\N
844	Shimālī al Baḩrī al Aḩmar	SK	67	\N
845	Andalucía	AN	68	\N
846	Aragón	AR	68	\N
847	Asturias, Principado de	AS	68	\N
848	Cantabria	CB	68	\N
849	Ceuta	CE	68	\N
850	Castilla y León	CL	68	\N
851	Castilla-La Mancha	CM	68	\N
852	Canarias	CN	68	\N
853	Catalunya	CT	68	\N
854	Extremadura	EX	68	\N
855	Galicia	GA	68	\N
856	Illes Balears	IB	68	\N
857	Murcia, Región de	MC	68	\N
858	Madrid, Comunidad de	MD	68	\N
859	Melilla	ML	68	\N
860	Navarra, Comunidad Foral de / Nafarroako Foru Komunitatea	NC	68	\N
861	País Vasco / Euskal Herria	PV	68	\N
862	La Rioja	RI	68	\N
863	Valenciana, Comunidad / Valenciana, Comunitat 	VC	68	\N
864	Ādīs Ābeba	AA	69	\N
865	Āfar	AF	69	\N
866	Āmara	AM	69	\N
867	Bīnshangul Gumuz	BE	69	\N
868	Dirē Dawa	DD	69	\N
869	Gambēla Hizboch	GA	69	\N
870	Hārerī Hizb	HA	69	\N
871	Oromīya	OR	69	\N
872	YeDebub Bihēroch Bihēreseboch na Hizboch	SN	69	\N
873	Sumalē	SO	69	\N
874	Tigray	TI	69	\N
875	Ahvenanmaan maakunta	01	70	\N
876	Etelä-Karjala	02	70	\N
877	Etelä-Pohjanmaa	03	70	\N
878	Etelä-Savo	04	70	\N
879	Kainuu	05	70	\N
880	Kanta-Häme	06	70	\N
881	Keski-Pohjanmaa	07	70	\N
882	Keski-Suomi	08	70	\N
883	Kymenlaakso	09	70	\N
884	Lappi	10	70	\N
885	Pirkanmaa	11	70	\N
886	Pohjanmaa	12	70	\N
887	Pohjois-Karjala	13	70	\N
888	Pohjois-Pohjanmaa	14	70	\N
889	Pohjois-Savo	15	70	\N
890	Päijät-Häme	16	70	\N
891	Satakunta	17	70	\N
892	Uusimaa	18	70	\N
893	Varsinais-Suomi	19	70	\N
894	Central	C	71	\N
895	Eastern	E	71	\N
896	Northern	N	71	\N
897	Rotuma	R	71	\N
898	Western	W	71	\N
899	Kosrae	KSA	73	\N
900	Pohnpei	PNI	73	\N
901	Chuuk	TRK	73	\N
902	Yap	YAP	73	\N
903	Alsace	A	75	\N
904	Aquitaine	B	75	\N
905	Saint-Barthélemy	BL	75	\N
906	Auvergne	C	75	\N
907	Clipperton	CP	75	\N
908	Bourgogne	D	75	\N
909	Bretagne	E	75	\N
910	Centre	F	75	\N
911	Champagne-Ardenne	G	75	\N
912	Guyane	GF	75	\N
913	Guadeloupe	GP	75	\N
914	Corse	H	75	\N
915	Franche-Comté	I	75	\N
916	Île-de-France	J	75	\N
917	Languedoc-Roussillon	K	75	\N
918	Limousin	L	75	\N
919	Lorraine	M	75	\N
920	Saint-Martin	MF	75	\N
921	Martinique	MQ	75	\N
922	Midi-Pyrénées	N	75	\N
923	Nouvelle-Calédonie	NC	75	\N
924	Nord-Pas-de-Calais	O	75	\N
925	Basse-Normandie	P	75	\N
926	Polynésie française	PF	75	\N
927	Saint-Pierre-et-Miquelon	PM	75	\N
928	Haute-Normandie	Q	75	\N
929	Pays de la Loire	R	75	\N
930	La Réunion	RE	75	\N
931	Picardie	S	75	\N
932	Poitou-Charentes	T	75	\N
933	Terres australes françaises	TF	75	\N
934	Provence-Alpes-Côte d'Azur	U	75	\N
935	Rhône-Alpes	V	75	\N
936	Wallis-et-Futuna	WF	75	\N
937	Mayotte	YT	75	\N
938	Estuaire	1	76	\N
939	Haut-Ogooué	2	76	\N
940	Moyen-Ogooué	3	76	\N
941	Ngounié	4	76	\N
942	Nyanga	5	76	\N
943	Ogooué-Ivindo	6	76	\N
944	Ogooué-Lolo	7	76	\N
945	Ogooué-Maritime	8	76	\N
946	Woleu-Ntem	9	76	\N
947	Aberdeenshire	ABD	77	\N
948	Aberdeen City	ABE	77	\N
949	Argyll and Bute	AGB	77	\N
950	Isle of Anglesey;Sir Ynys Môn	AGY	77	\N
951	Angus	ANS	77	\N
952	Antrim	ANT	77	\N
953	Ards	ARD	77	\N
954	Armagh	ARM	77	\N
955	Bath and North East Somerset	BAS	77	\N
956	Blackburn with Darwen	BBD	77	\N
957	Bedford	BDF	77	\N
958	Barking and Dagenham	BDG	77	\N
959	Brent	BEN	77	\N
960	Bexley	BEX	77	\N
961	Belfast	BFS	77	\N
962	Bridgend;Pen-y-bont ar Ogwr	BGE	77	\N
963	Blaenau Gwent	BGW	77	\N
964	Birmingham	BIR	77	\N
965	Buckinghamshire	BKM	77	\N
966	Ballymena	BLA	77	\N
967	Ballymoney	BLY	77	\N
968	Bournemouth	BMH	77	\N
969	Banbridge	BNB	77	\N
970	Barnet	BNE	77	\N
971	Brighton and Hove	BNH	77	\N
972	Barnsley	BNS	77	\N
973	Bolton	BOL	77	\N
974	Blackpool	BPL	77	\N
975	Bracknell Forest	BRC	77	\N
976	Bradford	BRD	77	\N
977	Bromley	BRY	77	\N
978	Bristol, City of	BST	77	\N
979	Bury	BUR	77	\N
980	Cambridgeshire	CAM	77	\N
981	Caerphilly;Caerffili	CAY	77	\N
982	Central Bedfordshire	CBF	77	\N
983	Ceredigion;Sir Ceredigion	CGN	77	\N
984	Craigavon	CGV	77	\N
985	Cheshire East	CHE	77	\N
986	Cheshire West and Chester	CHW	77	\N
987	Carrickfergus	CKF	77	\N
988	Cookstown	CKT	77	\N
989	Calderdale	CLD	77	\N
990	Clackmannanshire	CLK	77	\N
991	Coleraine	CLR	77	\N
992	Cumbria	CMA	77	\N
993	Camden	CMD	77	\N
994	Carmarthenshire;Sir Gaerfyrddin	CMN	77	\N
995	Cornwall	CON	77	\N
996	Coventry	COV	77	\N
997	Cardiff;Caerdydd	CRF	77	\N
998	Croydon	CRY	77	\N
999	Castlereagh	CSR	77	\N
1000	Conwy	CWY	77	\N
1001	Darlington	DAL	77	\N
1002	Derbyshire	DBY	77	\N
1003	Denbighshire;Sir Ddinbych	DEN	77	\N
1004	Derby	DER	77	\N
1005	Devon	DEV	77	\N
1006	Dungannon and South Tyrone	DGN	77	\N
1007	Dumfries and Galloway	DGY	77	\N
1008	Doncaster	DNC	77	\N
1009	Dundee City	DND	77	\N
1010	Dorset	DOR	77	\N
1011	Down	DOW	77	\N
1012	Derry	DRY	77	\N
1013	Dudley	DUD	77	\N
1014	Durham, County	DUR	77	\N
1015	Ealing	EAL	77	\N
1016	England and Wales	EAW	77	\N
1017	East Ayrshire	EAY	77	\N
1018	Edinburgh, City of	EDH	77	\N
1019	East Dunbartonshire	EDU	77	\N
1020	East Lothian	ELN	77	\N
1021	Eilean Siar	ELS	77	\N
1022	Enfield	ENF	77	\N
1023	England	ENG	77	\N
1024	East Renfrewshire	ERW	77	\N
1025	East Riding of Yorkshire	ERY	77	\N
1026	Essex	ESS	77	\N
1027	East Sussex	ESX	77	\N
1028	Falkirk	FAL	77	\N
1029	Fermanagh	FER	77	\N
1030	Fife	FIF	77	\N
1031	Flintshire;Sir y Fflint	FLN	77	\N
1032	Gateshead	GAT	77	\N
1033	Great Britain	GBN	77	\N
1034	Glasgow City	GLG	77	\N
1035	Gloucestershire	GLS	77	\N
1036	Greenwich	GRE	77	\N
1037	Gwynedd	GWN	77	\N
1038	Halton	HAL	77	\N
1039	Hampshire	HAM	77	\N
1040	Havering	HAV	77	\N
1041	Hackney	HCK	77	\N
1042	Herefordshire	HEF	77	\N
1043	Hillingdon	HIL	77	\N
1044	Highland	HLD	77	\N
1045	Hammersmith and Fulham	HMF	77	\N
1046	Hounslow	HNS	77	\N
1047	Hartlepool	HPL	77	\N
1048	Hertfordshire	HRT	77	\N
1049	Harrow	HRW	77	\N
1050	Haringey	HRY	77	\N
1051	Isle of Wight	IOW	77	\N
1052	Islington	ISL	77	\N
1053	Inverclyde	IVC	77	\N
1054	Kensington and Chelsea	KEC	77	\N
1055	Kent	KEN	77	\N
1056	Kingston upon Hull	KHL	77	\N
1057	Kirklees	KIR	77	\N
1058	Kingston upon Thames	KTT	77	\N
1059	Knowsley	KWL	77	\N
1060	Lancashire	LAN	77	\N
1061	Lambeth	LBH	77	\N
1062	Leicester	LCE	77	\N
1063	Leeds	LDS	77	\N
1064	Leicestershire	LEC	77	\N
1065	Lewisham	LEW	77	\N
1066	Lincolnshire	LIN	77	\N
1067	Liverpool	LIV	77	\N
1068	Limavady	LMV	77	\N
1069	London, City of	LND	77	\N
1070	Larne	LRN	77	\N
1071	Lisburn	LSB	77	\N
1072	Luton	LUT	77	\N
1073	Manchester	MAN	77	\N
1074	Middlesbrough	MDB	77	\N
1075	Medway	MDW	77	\N
1076	Magherafelt	MFT	77	\N
1077	Milton Keynes	MIK	77	\N
1078	Midlothian	MLN	77	\N
1079	Monmouthshire;Sir Fynwy	MON	77	\N
1080	Merton	MRT	77	\N
1081	Moray	MRY	77	\N
1082	Merthyr Tydfil;Merthyr Tudful	MTY	77	\N
1083	Moyle	MYL	77	\N
1084	North Ayrshire	NAY	77	\N
1085	Northumberland	NBL	77	\N
1086	North Down	NDN	77	\N
1087	North East Lincolnshire	NEL	77	\N
1088	Newcastle upon Tyne	NET	77	\N
1089	Norfolk	NFK	77	\N
1090	Nottingham	NGM	77	\N
1091	Northern Ireland	NIR	77	\N
1092	North Lanarkshire	NLK	77	\N
1093	North Lincolnshire	NLN	77	\N
1094	North Somerset	NSM	77	\N
1095	Newtownabbey	NTA	77	\N
1096	Northamptonshire	NTH	77	\N
1097	Neath Port Talbot;Castell-nedd Port Talbot	NTL	77	\N
1098	Nottinghamshire	NTT	77	\N
1099	North Tyneside	NTY	77	\N
1100	Newham	NWM	77	\N
1101	Newport;Casnewydd	NWP	77	\N
1102	North Yorkshire	NYK	77	\N
1103	Newry and Mourne	NYM	77	\N
1104	Oldham	OLD	77	\N
1105	Omagh	OMH	77	\N
1106	Orkney Islands	ORK	77	\N
1107	Oxfordshire	OXF	77	\N
1108	Pembrokeshire;Sir Benfro	PEM	77	\N
1109	Perth and Kinross	PKN	77	\N
1110	Plymouth	PLY	77	\N
1111	Poole	POL	77	\N
1112	Portsmouth	POR	77	\N
1113	Powys	POW	77	\N
1114	Peterborough	PTE	77	\N
1115	Redcar and Cleveland	RCC	77	\N
1116	Rochdale	RCH	77	\N
1117	Rhondda, Cynon, Taff;Rhondda, Cynon,Taf	RCT	77	\N
1118	Redbridge	RDB	77	\N
1119	Reading	RDG	77	\N
1120	Renfrewshire	RFW	77	\N
1121	Richmond upon Thames	RIC	77	\N
1122	Rotherham	ROT	77	\N
1123	Rutland	RUT	77	\N
1124	Sandwell	SAW	77	\N
1125	South Ayrshire	SAY	77	\N
1126	Scottish Borders, The	SCB	77	\N
1127	Scotland	SCT	77	\N
1128	Suffolk	SFK	77	\N
1129	Sefton	SFT	77	\N
1130	South Gloucestershire	SGC	77	\N
1131	Sheffield	SHF	77	\N
1132	St. Helens	SHN	77	\N
1133	Shropshire	SHR	77	\N
1134	Stockport	SKP	77	\N
1135	Salford	SLF	77	\N
1136	Slough	SLG	77	\N
1137	South Lanarkshire	SLK	77	\N
1138	Sunderland	SND	77	\N
1139	Solihull	SOL	77	\N
1140	Somerset	SOM	77	\N
1141	Southend-on-Sea	SOS	77	\N
1142	Surrey	SRY	77	\N
1143	Strabane	STB	77	\N
1144	Stoke-on-Trent	STE	77	\N
1145	Stirling	STG	77	\N
1146	Southampton	STH	77	\N
1147	Sutton	STN	77	\N
1148	Staffordshire	STS	77	\N
1149	Stockton-on-Tees	STT	77	\N
1150	South Tyneside	STY	77	\N
1151	Swansea;Abertawe	SWA	77	\N
1152	Swindon	SWD	77	\N
1153	Southwark	SWK	77	\N
1154	Tameside	TAM	77	\N
1155	Telford and Wrekin	TFW	77	\N
1156	Thurrock	THR	77	\N
1157	Torbay	TOB	77	\N
1158	Torfaen;Tor-faen	TOF	77	\N
1159	Trafford	TRF	77	\N
1160	Tower Hamlets	TWH	77	\N
1161	United Kingdom	UKM	77	\N
1162	Vale of Glamorgan, The;Bro Morgannwg	VGL	77	\N
1163	Warwickshire	WAR	77	\N
1164	West Berkshire	WBK	77	\N
1165	West Dunbartonshire	WDU	77	\N
1166	Waltham Forest	WFT	77	\N
1167	Wigan	WGN	77	\N
1168	Wakefield	WKF	77	\N
1169	Walsall	WLL	77	\N
1170	West Lothian	WLN	77	\N
1171	Wales	WLS	77	\N
1172	Wolverhampton	WLV	77	\N
1173	Wandsworth	WND	77	\N
1174	Windsor and Maidenhead	WNM	77	\N
1175	Wokingham	WOK	77	\N
1176	Worcestershire	WOR	77	\N
1177	Wirral	WRL	77	\N
1178	Warrington	WRT	77	\N
1179	Wrexham;Wrecsam	WRX	77	\N
1180	Westminster	WSM	77	\N
1181	West Sussex	WSX	77	\N
1182	York	YOR	77	\N
1183	Shetland Islands	ZET	77	\N
1184	Wiltshire	WIL	77	\N
1185	Saint Andrew	01	78	\N
1186	Saint David	02	78	\N
1187	Saint George	03	78	\N
1188	Saint John	04	78	\N
1189	Saint Mark	05	78	\N
1190	Saint Patrick	06	78	\N
1191	Southern Grenadine Islands	10	78	\N
1192	Abkhazia	AB	79	\N
1193	Ajaria	AJ	79	\N
1194	Guria	GU	79	\N
1195	Imeret’i	IM	79	\N
1196	Kakhet’i	KA	79	\N
1197	K’vemo K’art’li	KK	79	\N
1198	Mts’khet’a-Mt’ianet’i	MM	79	\N
1199	Racha-Lech’khumi-K’vemo Svanet’i	RL	79	\N
1200	Samts’khe-Javakhet’i	SJ	79	\N
1201	Shida K’art’li	SK	79	\N
1202	Samegrelo-Zemo Svanet’i	SZ	79	\N
1203	T’bilisi	TB	79	\N
1204	Greater Accra	AA	82	\N
1205	Ashanti	AH	82	\N
1206	Brong-Ahafo	BA	82	\N
1207	Central	CP	82	\N
1208	Eastern	EP	82	\N
1209	Northern	NP	82	\N
1210	Volta	TV	82	\N
1211	Upper East	UE	82	\N
1212	Upper West	UW	82	\N
1213	Western	WP	82	\N
1214	Kommune Kujalleq	KU	84	\N
1215	Qaasuitsup Kommunia	QA	84	\N
1216	Qeqqata Kommunia	QE	84	\N
1217	Kommuneqarfik Sermersooq	SM	84	\N
1218	Banjul	B	85	\N
1219	Lower River	L	85	\N
1220	Central River	M	85	\N
1221	North Bank	N	85	\N
1222	Upper River	U	85	\N
1223	Western	W	85	\N
1224	Boké	B	86	\N
1225	Conakry	C	86	\N
1226	Kindia	D	86	\N
1227	Faranah	F	86	\N
1228	Kankan	K	86	\N
1229	Labé	L	86	\N
1230	Mamou	M	86	\N
1231	Nzérékoré	N	86	\N
1232	Región Continental	C	88	\N
1233	Región Insular	I	88	\N
1234	Agio Oros	69	89	\N
1235	Anatoliki Makedonia kai Thraki	A	89	\N
1236	Kentriki Makedonia	B	89	\N
1237	Dytiki Makedonia	C	89	\N
1238	Ipeiros	D	89	\N
1239	Thessalia	E	89	\N
1240	Ionia Nisia	F	89	\N
1241	Dytiki Ellada	G	89	\N
1242	Sterea Ellada	H	89	\N
1243	Attiki	I	89	\N
1244	Peloponnisos	J	89	\N
1245	Voreio Aigaio	K	89	\N
1246	Notio Aigaio	L	89	\N
1247	Kriti	M	89	\N
1248	Alta Verapaz	AV	91	\N
1249	Baja Verapaz	BV	91	\N
1250	Chimaltenango	CM	91	\N
1251	Chiquimula	CQ	91	\N
1252	Escuintla	ES	91	\N
1253	Guatemala	GU	91	\N
1254	Huehuetenango	HU	91	\N
1255	Izabal	IZ	91	\N
1256	Jalapa	JA	91	\N
1257	Jutiapa	JU	91	\N
1258	Petén	PE	91	\N
1259	El Progreso	PR	91	\N
1260	Quiché	QC	91	\N
1261	Quetzaltenango	QZ	91	\N
1262	Retalhuleu	RE	91	\N
1263	Sacatepéquez	SA	91	\N
1264	San Marcos	SM	91	\N
1265	Sololá	SO	91	\N
1266	Santa Rosa	SR	91	\N
1267	Suchitepéquez	SU	91	\N
1268	Totonicapán	TO	91	\N
1269	Zacapa	ZA	91	\N
1270	Bissau	BS	93	\N
1271	Leste	L	93	\N
1272	Norte	N	93	\N
1273	Sul	S	93	\N
1274	Barima-Waini	BA	94	\N
1275	Cuyuni-Mazaruni	CU	94	\N
1276	Demerara-Mahaica	DE	94	\N
1277	East Berbice-Corentyne	EB	94	\N
1278	Essequibo Islands-West Demerara	ES	94	\N
1279	Mahaica-Berbice	MA	94	\N
1280	Pomeroon-Supenaam	PM	94	\N
1281	Potaro-Siparuni	PT	94	\N
1282	Upper Demerara-Berbice	UD	94	\N
1283	Upper Takutu-Upper Essequibo	UT	94	\N
1284	Atlántida	AT	97	\N
1285	Choluteca	CH	97	\N
1286	Colón	CL	97	\N
1287	Comayagua	CM	97	\N
1288	Copán	CP	97	\N
1289	Cortés	CR	97	\N
1290	El Paraíso	EP	97	\N
1291	Francisco Morazán	FM	97	\N
1292	Gracias a Dios	GD	97	\N
1293	Islas de la Bahía	IB	97	\N
1294	Intibucá	IN	97	\N
1295	Lempira	LE	97	\N
1296	La Paz	LP	97	\N
1297	Ocotepeque	OC	97	\N
1298	Olancho	OL	97	\N
1299	Santa Bárbara	SB	97	\N
1300	Valle	VA	97	\N
1301	Yoro	YO	97	\N
1302	Zagrebačka županija	01	98	\N
1303	Krapinsko-zagorska županija	02	98	\N
1304	Sisačko-moslavačka županija	03	98	\N
1305	Karlovačka županija	04	98	\N
1306	Varaždinska županija	05	98	\N
1307	Koprivničko-križevačka županija	06	98	\N
1308	Bjelovarsko-bilogorska županija	07	98	\N
1309	Primorsko-goranska županija	08	98	\N
1310	Ličko-senjska županija	09	98	\N
1311	Virovitičko-podravska županija	10	98	\N
1312	Požeško-slavonska županija	11	98	\N
1313	Brodsko-posavska županija	12	98	\N
1314	Zadarska županija	13	98	\N
1315	Osječko-baranjska županija	14	98	\N
1316	Šibensko-kninska županija	15	98	\N
1317	Vukovarsko-srijemska županija	16	98	\N
1318	Splitsko-dalmatinska županija	17	98	\N
1319	Istarska županija	18	98	\N
1320	Dubrovačko-neretvanska županija	19	98	\N
1321	Međimurska županija	20	98	\N
1322	Grad Zagreb	21	98	\N
1323	Artibonite	AR	99	\N
1324	Centre	CE	99	\N
1325	Grande-Anse	GA	99	\N
1326	Nord	ND	99	\N
1327	Nord-Est	NE	99	\N
1328	Nord-Ouest	NO	99	\N
1329	Ouest	OU	99	\N
1330	Sud	SD	99	\N
1331	Sud-Est	SE	99	\N
1332	Baranya	BA	100	\N
1333	Békéscsaba	BC	100	\N
1334	Békés	BE	100	\N
1335	Bács-Kiskun	BK	100	\N
1336	Budapest	BU	100	\N
1337	Borsod-Abaúj-Zemplén	BZ	100	\N
1338	Csongrád	CS	100	\N
1339	Debrecen	DE	100	\N
1340	Dunaújváros	DU	100	\N
1341	Eger	EG	100	\N
1342	Érd	ER	100	\N
1343	Fejér	FE	100	\N
1344	Győr-Moson-Sopron	GS	100	\N
1345	Győr	GY	100	\N
1346	Hajdú-Bihar	HB	100	\N
1347	Heves	HE	100	\N
1348	Hódmezővásárhely	HV	100	\N
1349	Jász-Nagykun-Szolnok	JN	100	\N
1350	Komárom-Esztergom	KE	100	\N
1351	Kecskemét	KM	100	\N
1352	Kaposvár	KV	100	\N
1353	Miskolc	MI	100	\N
1354	Nagykanizsa	NK	100	\N
1355	Nógrád	NO	100	\N
1356	Nyíregyháza	NY	100	\N
1357	Pest	PE	100	\N
1358	Pécs	PS	100	\N
1359	Szeged	SD	100	\N
1360	Székesfehérvár	SF	100	\N
1361	Szombathely	SH	100	\N
1362	Szolnok	SK	100	\N
1363	Sopron	SN	100	\N
1364	Somogy	SO	100	\N
1365	Szekszárd	SS	100	\N
1366	Salgótarján	ST	100	\N
1367	Szabolcs-Szatmár-Bereg	SZ	100	\N
1368	Tatabánya	TB	100	\N
1369	Tolna	TO	100	\N
1370	Vas	VA	100	\N
1371	Veszprém (county)	VE	100	\N
1372	Veszprém	VM	100	\N
1373	Zala	ZA	100	\N
1374	Zalaegerszeg	ZE	100	\N
1375	Papua	IJ	101	\N
1376	Jawa	JW	101	\N
1377	Kalimantan	KA	101	\N
1378	Maluku	ML	101	\N
1379	Nusa Tenggara	NU	101	\N
1380	Sulawesi	SL	101	\N
1381	Sumatera	SM	101	\N
1382	Connacht	C	102	\N
1383	Leinster	L	102	\N
1384	Munster	M	102	\N
1385	Ulster	U	102	\N
1386	HaDarom	D	103	\N
1387	Hefa	HA	103	\N
1388	Yerushalayim Al Quds	JM	103	\N
1389	HaMerkaz	M	103	\N
1390	Tel-Aviv	TA	103	\N
1391	HaZafon	Z	103	\N
1392	Andaman and Nicobar Islands	AN	105	\N
1393	Andhra Pradesh	AP	105	\N
1394	Arunachal Pradesh	AR	105	\N
1395	Assam	AS	105	\N
1396	Bihar	BR	105	\N
1397	Chandigarh	CH	105	\N
1398	Chhattisgarh	CT	105	\N
1399	Damen and Diu	DD	105	\N
1400	Delhi	DL	105	\N
1401	Dadra and Nagar Haveli	DN	105	\N
1402	Goa	GA	105	\N
1403	Gujarat	GJ	105	\N
1404	Himachal Pradesh	HP	105	\N
1405	Haryana	HR	105	\N
1406	Jharkhand	JH	105	\N
1407	Jammu and Kashmir	JK	105	\N
1408	Karnataka	KA	105	\N
1409	Kerala	KL	105	\N
1410	Lakshadweep	LD	105	\N
1411	Maharashtra	MH	105	\N
1412	Meghalaya	ML	105	\N
1413	Manipur	MN	105	\N
1414	Madhya Pradesh	MP	105	\N
1415	Mizoram	MZ	105	\N
1416	Nagaland	NL	105	\N
1417	Orissa	OR	105	\N
1418	Punjab	PB	105	\N
1419	Puducherry	PY	105	\N
1420	Rajasthan	RJ	105	\N
1421	Sikkim	SK	105	\N
1422	Tamil Nadu	TN	105	\N
1423	Tripura	TR	105	\N
1424	Uttar Pradesh	UP	105	\N
1425	Uttarakhand	UT	105	\N
1426	West Bengal	WB	105	\N
1427	Al Anbar	AN	107	\N
1428	Arbil	AR	107	\N
1429	Al Basrah	BA	107	\N
1430	Babil	BB	107	\N
1431	Baghdad	BG	107	\N
1432	Dahuk	DA	107	\N
1433	Diyala	DI	107	\N
1434	Dhi Qar	DQ	107	\N
1435	Karbala'	KA	107	\N
1436	Maysan	MA	107	\N
1437	Al Muthanna	MU	107	\N
1438	An Najef	NA	107	\N
1439	Ninawa	NI	107	\N
1440	Al Qadisiyah	QA	107	\N
1441	Salah ad Din	SD	107	\N
1442	As Sulaymaniyah	SW	107	\N
1443	At Ta'mim	TS	107	\N
1444	Wasit	WA	107	\N
1445	Āzarbāyjān-e Sharqī	01	108	\N
1446	Āzarbāyjān-e Gharbī	02	108	\N
1447	Ardabīl	03	108	\N
1448	Eşfahān	04	108	\N
1449	Īlām	05	108	\N
1450	Būshehr	06	108	\N
1451	Tehrān	07	108	\N
1452	Chahār Mahāll va Bakhtīārī	08	108	\N
1453	Khūzestān	10	108	\N
1454	Zanjān	11	108	\N
1455	Semnān	12	108	\N
1456	Sīstān va Balūchestān	13	108	\N
1457	Fārs	14	108	\N
1458	Kermān	15	108	\N
1459	Kordestān	16	108	\N
1460	Kermānshāh	17	108	\N
1461	Kohgīlūyeh va Būyer Ahmad	18	108	\N
1462	Gīlān	19	108	\N
1463	Lorestān	20	108	\N
1464	Māzandarān	21	108	\N
1465	Markazī	22	108	\N
1466	Hormozgān	23	108	\N
1467	Hamadān	24	108	\N
1468	Yazd	25	108	\N
1469	Qom	26	108	\N
1470	Golestān	27	108	\N
1471	Qazvīn	28	108	\N
1472	Khorāsān-e Janūbī	29	108	\N
1473	Khorāsān-e Razavī	30	108	\N
1474	Khorāsān-e Shemālī	31	108	\N
1475	Reykjavík	0	109	\N
1476	Höfuðborgarsvæðið	1	109	\N
1477	Suðurnes	2	109	\N
1478	Vesturland	3	109	\N
1479	Vestfirðir	4	109	\N
1480	Norðurland vestra	5	109	\N
1481	Norðurland eystra	6	109	\N
1482	Austurland	7	109	\N
1483	Suðurland	8	109	\N
1484	Piemonte	21	110	\N
1485	Valle d'Aosta	23	110	\N
1486	Lombardia	25	110	\N
1487	Trentino-Alto Adige	32	110	\N
1488	Veneto	34	110	\N
1489	Friuli-Venezia Giulia	36	110	\N
1490	Liguria	42	110	\N
1491	Emilia-Romagna	45	110	\N
1492	Toscana	52	110	\N
1493	Umbria	55	110	\N
1494	Marche	57	110	\N
1495	Lazio	62	110	\N
1496	Abruzzo	65	110	\N
1497	Molise	67	110	\N
1498	Campania	72	110	\N
1499	Puglia	75	110	\N
1500	Basilicata	77	110	\N
1501	Calabria	78	110	\N
1502	Sicilia	82	110	\N
1503	Sardegna	88	110	\N
1504	Kingston	01	112	\N
1505	Saint Andrew	02	112	\N
1506	Saint Thomas	03	112	\N
1507	Portland	04	112	\N
1508	Saint Mary	05	112	\N
1509	Saint Ann	06	112	\N
1510	Trelawny	07	112	\N
1511	Saint James	08	112	\N
1512	Hanover	09	112	\N
1513	Westmoreland	10	112	\N
1514	Saint Elizabeth	11	112	\N
1515	Manchester	12	112	\N
1516	Clarendon	13	112	\N
1517	Saint Catherine	14	112	\N
1518	‘Ajlūn	AJ	113	\N
1519	‘Ammān (Al ‘Aşimah)	AM	113	\N
1520	Al ‘Aqabah	AQ	113	\N
1521	Aţ Ţafīlah	AT	113	\N
1522	Az Zarqā'	AZ	113	\N
1523	Al Balqā'	BA	113	\N
1524	Irbid	IR	113	\N
1525	Jarash	JA	113	\N
1526	Al Karak	KA	113	\N
1527	Al Mafraq	MA	113	\N
1528	Mādabā	MD	113	\N
1529	Ma‘ān	MN	113	\N
1530	Hokkaido	01	114	\N
1531	Aomori	02	114	\N
1532	Iwate	03	114	\N
1533	Miyagi	04	114	\N
1534	Akita	05	114	\N
1535	Yamagata	06	114	\N
1536	Fukushima	07	114	\N
1537	Ibaraki	08	114	\N
1538	Tochigi	09	114	\N
1539	Gunma	10	114	\N
1540	Saitama	11	114	\N
1541	Chiba	12	114	\N
1542	Tokyo	13	114	\N
1543	Kanagawa	14	114	\N
1544	Niigata	15	114	\N
1545	Toyama	16	114	\N
1546	Ishikawa	17	114	\N
1547	Fukui	18	114	\N
1548	Yamanashi	19	114	\N
1549	Nagano	20	114	\N
1550	Gifu	21	114	\N
1551	Shizuoka	22	114	\N
1552	Aichi	23	114	\N
1553	Mie	24	114	\N
1554	Shiga	25	114	\N
1555	Kyoto	26	114	\N
1556	Osaka	27	114	\N
1557	Hyogo	28	114	\N
1558	Nara	29	114	\N
1559	Wakayama	30	114	\N
1560	Tottori	31	114	\N
1561	Shimane	32	114	\N
1562	Okayama	33	114	\N
1563	Hiroshima	34	114	\N
1564	Yamaguchi	35	114	\N
1565	Tokushima	36	114	\N
1566	Kagawa	37	114	\N
1567	Ehime	38	114	\N
1568	Kochi	39	114	\N
1569	Fukuoka	40	114	\N
1570	Saga	41	114	\N
1571	Nagasaki	42	114	\N
1572	Kumamoto	43	114	\N
1573	Oita	44	114	\N
1574	Miyazaki	45	114	\N
1575	Kagoshima	46	114	\N
1576	Okinawa	47	114	\N
1577	Nairobi Municipality	110	115	\N
1578	Central	200	115	\N
1579	Coast	300	115	\N
1580	Eastern	400	115	\N
1581	North-Eastern Kaskazini Mashariki	500	115	\N
1582	Rift Valley	700	115	\N
1583	Western Magharibi	800	115	\N
1584	Batken	B	116	\N
1585	Chü	C	116	\N
1586	Bishkek	GB	116	\N
1587	Jalal-Abad	J	116	\N
1588	Naryn	N	116	\N
1589	Osh	O	116	\N
1590	Talas	T	116	\N
1591	Ysyk-Köl	Y	116	\N
1592	Banteay Mean Chey	1	117	\N
1593	Krachoh	10	117	\N
1594	Mondol Kiri	11	117	\N
1595	Phnom Penh	12	117	\N
1596	Preah Vihear	13	117	\N
1597	Prey Veaeng	14	117	\N
1598	Pousaat	15	117	\N
1599	Rotanak Kiri	16	117	\N
1600	Siem Reab	17	117	\N
1601	Krong Preah Sihanouk	18	117	\N
1602	Stueng Traeng	19	117	\N
1603	Battambang	2	117	\N
1604	Svaay Rieng	20	117	\N
1605	Taakaev	21	117	\N
1606	Otdar Mean Chey	22	117	\N
1607	Krong Kaeb	23	117	\N
1608	Krong Pailin	24	117	\N
1609	Kampong Cham	3	117	\N
1610	Kampong Chhnang	4	117	\N
1611	Kampong Speu	5	117	\N
1612	Kampong Thom	6	117	\N
1613	Kampot	7	117	\N
1614	Kandal	8	117	\N
1615	Kach Kong	9	117	\N
1616	Gilbert Islands	G	118	\N
1617	Line Islands	L	118	\N
1618	Phoenix Islands	P	118	\N
1619	Andjouân (Anjwān)	A	119	\N
1620	Andjazîdja (Anjazījah)	G	119	\N
1621	Moûhîlî (Mūhīlī)	M	119	\N
1622	Saint Kitts	K	120	\N
1623	Nevis	N	120	\N
1624	P’yŏngyang	01	121	\N
1625	P’yŏngan-namdo	02	121	\N
1626	P’yŏngan-bukto	03	121	\N
1627	Chagang-do	04	121	\N
1628	Hwanghae-namdo	05	121	\N
1629	Hwanghae-bukto	06	121	\N
1630	Kangwŏn-do	07	121	\N
1631	Hamgyŏng-namdo	08	121	\N
1632	Hamgyŏng-bukto	09	121	\N
1633	Yanggang-do	10	121	\N
1634	Nasŏn (Najin-Sŏnbong)	13	121	\N
1635	Seoul Teugbyeolsi	11	122	\N
1636	Busan Gwang'yeogsi	26	122	\N
1637	Daegu Gwang'yeogsi	27	122	\N
1638	Incheon Gwang'yeogsi	28	122	\N
1639	Gwangju Gwang'yeogsi	29	122	\N
1640	Daejeon Gwang'yeogsi	30	122	\N
1641	Ulsan Gwang'yeogsi	31	122	\N
1642	Gyeonggido	41	122	\N
1643	Gang'weondo	42	122	\N
1644	Chungcheongbukdo	43	122	\N
1645	Chungcheongnamdo	44	122	\N
1646	Jeonrabukdo	45	122	\N
1647	Jeonranamdo	46	122	\N
1648	Gyeongsangbukdo	47	122	\N
1649	Gyeongsangnamdo	48	122	\N
1650	Jejudo	49	122	\N
1651	Al Ahmadi	AH	123	\N
1652	Al Farwānīyah	FA	123	\N
1653	Hawallī	HA	123	\N
1654	Al Jahrrā’	JA	123	\N
1655	Al Kuwayt (Al ‘Āşimah)	KU	123	\N
1656	Mubārak al Kabīr	MU	123	\N
1657	Aqmola oblysy	AKM	125	\N
1658	Aqtöbe oblysy	AKT	125	\N
1659	Almaty	ALA	125	\N
1660	Almaty oblysy	ALM	125	\N
1661	Astana	AST	125	\N
1662	Atyraū oblysy	ATY	125	\N
1663	Qaraghandy oblysy	KAR	125	\N
1664	Qostanay oblysy	KUS	125	\N
1665	Qyzylorda oblysy	KZY	125	\N
1666	Mangghystaū oblysy	MAN	125	\N
1667	Pavlodar oblysy	PAV	125	\N
1668	Soltüstik Quzaqstan oblysy	SEV	125	\N
1669	Shyghys Qazaqstan oblysy	VOS	125	\N
1670	Ongtüstik Qazaqstan oblysy	YUZ	125	\N
1671	Batys Quzaqstan oblysy	ZAP	125	\N
1672	Zhambyl oblysy	ZHA	125	\N
1673	Attapu	AT	126	\N
1674	Bokèo	BK	126	\N
1675	Bolikhamxai	BL	126	\N
1676	Champasak	CH	126	\N
1677	Houaphan	HO	126	\N
1678	Khammouan	KH	126	\N
1679	Louang Namtha	LM	126	\N
1680	Louangphabang	LP	126	\N
1681	Oudômxai	OU	126	\N
1682	Phôngsali	PH	126	\N
1683	Salavan	SL	126	\N
1684	Savannakhét	SV	126	\N
1685	Vientiane	VI	126	\N
1686	Vientiane	VT	126	\N
1687	Xaignabouli	XA	126	\N
1688	Xékong	XE	126	\N
1689	Xiangkhoang	XI	126	\N
1690	Xiasômboun	XN	126	\N
1691	Aakkâr	AK	127	\N
1692	Liban-Nord	AS	127	\N
1693	Beyrouth	BA	127	\N
1694	Baalbek-Hermel	BH	127	\N
1695	Béqaa	BI	127	\N
1696	Liban-Sud	JA	127	\N
1697	Mont-Liban	JL	127	\N
1698	Nabatîyé	NA	127	\N
1699	Balzers	01	129	\N
1700	Eschen	02	129	\N
1701	Gamprin	03	129	\N
1702	Mauren	04	129	\N
1703	Planken	05	129	\N
1704	Ruggell	06	129	\N
1705	Schaan	07	129	\N
1706	Schellenberg	08	129	\N
1707	Triesen	09	129	\N
1708	Triesenberg	10	129	\N
1709	Vaduz	11	129	\N
1710	Basnāhira paḷāta	1	130	\N
1711	Madhyama paḷāta	2	130	\N
1712	Dakuṇu paḷāta	3	130	\N
1713	Uturu paḷāta	4	130	\N
1714	Næ̆gĕnahira paḷāta	5	130	\N
1715	Vayamba paḷāta	6	130	\N
1716	Uturumæ̆da paḷāta	7	130	\N
1717	Ūva paḷāta	8	130	\N
1718	Sabaragamuva paḷāta	9	130	\N
1719	Bong	BG	131	\N
1720	Bomi	BM	131	\N
1721	Grand Cape Mount	CM	131	\N
1722	Grand Bassa	GB	131	\N
1723	Grand Gedeh	GG	131	\N
1724	Grand Kru	GK	131	\N
1725	Lofa	LO	131	\N
1726	Margibi	MG	131	\N
1727	Montserrado	MO	131	\N
1728	Maryland	MY	131	\N
1729	Nimba	NI	131	\N
1730	Rivercess	RI	131	\N
1731	Sinoe	SI	131	\N
1732	Maseru	A	132	\N
1733	Butha-Buthe	B	132	\N
1734	Leribe	C	132	\N
1735	Berea	D	132	\N
1736	Mafeteng	E	132	\N
1737	Mohale's Hoek	F	132	\N
1738	Quthing	G	132	\N
1739	Qacha's Nek	H	132	\N
1740	Mokhotlong	J	132	\N
1741	Thaba-Tseka	K	132	\N
1742	Alytaus Apskritis	AL	133	\N
1743	Klaipėdos Apskritis	KL	133	\N
1744	Kauno Apskritis	KU	133	\N
1745	Marijampolės Apskritis	MR	133	\N
1746	Panevėžio Apskritis	PN	133	\N
1747	Šiaulių Apskritis	SA	133	\N
1748	Tauragés Apskritis	TA	133	\N
1749	Telšių Apskritis	TE	133	\N
1750	Utenos Apskritis	UT	133	\N
1751	Vilniaus Apskritis	VL	133	\N
1752	Diekirch	D	134	\N
1753	Grevenmacher	G	134	\N
1754	Luxembourg	L	134	\N
1755	Aglonas novads	001	135	\N
1756	Aizkraukles novads	002	135	\N
1757	Aizputes novads	003	135	\N
1758	Aknīstes novads	004	135	\N
1759	Alojas novads	005	135	\N
1760	Alsungas novads	006	135	\N
1761	Alūksnes novads	007	135	\N
1762	Amatas novads	008	135	\N
1763	Apes novads	009	135	\N
1764	Auces novads	010	135	\N
1765	Ādažu novads	011	135	\N
1766	Babītes novads	012	135	\N
1767	Baldones novads	013	135	\N
1768	Baltinavas novads	014	135	\N
1769	Balvu novads	015	135	\N
1770	Bauskas novads	016	135	\N
1771	Beverīnas novads	017	135	\N
1772	Brocēnu novads	018	135	\N
1773	Burtnieku novads	019	135	\N
1774	Carnikavas novads	020	135	\N
1775	Cesvaines novads	021	135	\N
1776	Cēsu novads	022	135	\N
1777	Ciblas novads	023	135	\N
1778	Dagdas novads	024	135	\N
1779	Daugavpils novads	025	135	\N
1780	Dobeles novads	026	135	\N
1781	Dundagas novads	027	135	\N
1782	Durbes novads	028	135	\N
1783	Engures novads	029	135	\N
1784	Ērgļu novads	030	135	\N
1785	Garkalnes novads	031	135	\N
1786	Grobiņas novads	032	135	\N
1787	Gulbenes novads	033	135	\N
1788	Iecavas novads	034	135	\N
1789	Ikšķiles novads	035	135	\N
1790	Ilūkstes novads	036	135	\N
1791	Inčukalna novads	037	135	\N
1792	Jaunjelgavas novads	038	135	\N
1793	Jaunpiebalgas novads	039	135	\N
1794	Jaunpils novads	040	135	\N
1795	Jelgavas novads	041	135	\N
1796	Jēkabpils novads	042	135	\N
1797	Kandavas novads	043	135	\N
1798	Kārsavas novads	044	135	\N
1799	Kocēnu novads	045	135	\N
1800	Kokneses novads	046	135	\N
1801	Krāslavas novads	047	135	\N
1802	Krimuldas novads	048	135	\N
1803	Krustpils novads	049	135	\N
1804	Kuldīgas novads	050	135	\N
1805	Ķeguma novads	051	135	\N
1806	Ķekavas novads	052	135	\N
1807	Lielvārdes novads	053	135	\N
1808	Limbažu novads	054	135	\N
1809	Līgatnes novads	055	135	\N
1810	Līvānu novads	056	135	\N
1811	Lubānas novads	057	135	\N
1812	Ludzas novads	058	135	\N
1813	Madonas novads	059	135	\N
1814	Mazsalacas novads	060	135	\N
1815	Mālpils novads	061	135	\N
1816	Mārupes novads	062	135	\N
1817	Mērsraga novads	063	135	\N
1818	Naukšēnu novads	064	135	\N
1819	Neretas novads	065	135	\N
1820	Nīcas novads	066	135	\N
1821	Ogres novads	067	135	\N
1822	Olaines novads	068	135	\N
1823	Ozolnieku novads	069	135	\N
1824	Pārgaujas novads	070	135	\N
1825	Pāvilostas novads	071	135	\N
1826	Pļaviņu novads	072	135	\N
1827	Preiļu novads	073	135	\N
1828	Priekules novads	074	135	\N
1829	Priekuļu novads	075	135	\N
1830	Raunas novads	076	135	\N
1831	Rēzeknes novads	077	135	\N
1832	Riebiņu novads	078	135	\N
1833	Rojas novads	079	135	\N
1834	Ropažu novads	080	135	\N
1835	Rucavas novads	081	135	\N
1836	Rugāju novads	082	135	\N
1837	Rundāles novads	083	135	\N
1838	Rūjienas novads	084	135	\N
1839	Salas novads	085	135	\N
1840	Salacgrīvas novads	086	135	\N
1841	Salaspils novads	087	135	\N
1842	Saldus novads	088	135	\N
1843	Saulkrastu novads	089	135	\N
1844	Sējas novads	090	135	\N
1845	Siguldas novads	091	135	\N
1846	Skrīveru novads	092	135	\N
1847	Skrundas novads	093	135	\N
1848	Smiltenes novads	094	135	\N
1849	Stopiņu novads	095	135	\N
1850	Strenču novads	096	135	\N
1851	Talsu novads	097	135	\N
1852	Tērvetes novads	098	135	\N
1853	Tukuma novads	099	135	\N
1854	Vaiņodes novads	100	135	\N
1855	Valkas novads	101	135	\N
1856	Varakļānu novads	102	135	\N
1857	Vārkavas novads	103	135	\N
1858	Vecpiebalgas novads	104	135	\N
1859	Vecumnieku novads	105	135	\N
1860	Ventspils novads	106	135	\N
1861	Viesītes novads	107	135	\N
1862	Viļakas novads	108	135	\N
1863	Viļānu novads	109	135	\N
1864	Zilupes novads	110	135	\N
1865	Daugavpils	DGV	135	\N
1866	Jelgava	JEL	135	\N
1867	Jēkabpils	JKB	135	\N
1868	Jūrmala	JUR	135	\N
1869	Liepāja	LPX	135	\N
1870	Rēzekne	REZ	135	\N
1871	Rīga	RIX	135	\N
1872	Ventspils	VEN	135	\N
1873	Valmiera	VMR	135	\N
1874	Banghāzī	BA	136	\N
1875	Al Buţnān	BU	136	\N
1876	Darnah	DR	136	\N
1877	Ghāt	GT	136	\N
1878	Al Jabal al Akhḑar	JA	136	\N
1879	Jaghbūb	JB	136	\N
1880	Al Jabal al Gharbī	JG	136	\N
1881	Al Jifārah	JI	136	\N
1882	Al Jufrah	JU	136	\N
1883	Al Kufrah	KF	136	\N
1884	Al Marqab	MB	136	\N
1885	Mişrātah	MI	136	\N
1886	Al Marj	MJ	136	\N
1887	Murzuq	MQ	136	\N
1888	Nālūt	NL	136	\N
1889	An Nuqaţ al Khams	NQ	136	\N
1890	Sabhā	SB	136	\N
1891	Surt	SR	136	\N
1892	Ţarābulus	TB	136	\N
1893	Al Wāḩāt	WA	136	\N
1894	Wādī al Ḩayāt	WD	136	\N
1895	Wādī ash Shāţiʾ	WS	136	\N
1896	Az Zāwiyah	ZA	136	\N
1897	Tanger-Tétouan	01	137	\N
1898	Gharb-Chrarda-Beni Hssen	02	137	\N
1899	Taza-Al Hoceima-Taounate	03	137	\N
1900	L'Oriental	04	137	\N
1901	Fès-Boulemane	05	137	\N
1902	Meknès-Tafilalet	06	137	\N
1903	Rabat-Salé-Zemmour-Zaer	07	137	\N
1904	Grand Casablanca	08	137	\N
1905	Chaouia-Ouardigha	09	137	\N
1906	Doukhala-Abda	10	137	\N
1907	Marrakech-Tensift-Al Haouz	11	137	\N
1908	Tadla-Azilal	12	137	\N
1909	Sous-Massa-Draa	13	137	\N
1910	Guelmim-Es Smara	14	137	\N
1911	Laâyoune-Boujdour-Sakia el Hamra	15	137	\N
1912	Oued ed Dahab-Lagouira	16	137	\N
1913	La Colle	CL	138	\N
1914	La Condamine	CO	138	\N
1915	Fontvieille	FO	138	\N
1916	La Gare	GA	138	\N
1917	Jardin Exotique	JE	138	\N
1918	Larvotto	LA	138	\N
1919	Malbousquet	MA	138	\N
1920	Monte-Carlo	MC	138	\N
1921	Moneghetti	MG	138	\N
1922	Monaco-Ville	MO	138	\N
1923	Moulins	MU	138	\N
1924	Port-Hercule	PH	138	\N
1925	Sainte-Dévote	SD	138	\N
1926	La Source	SO	138	\N
1927	Spélugues	SP	138	\N
1928	Saint-Roman	SR	138	\N
1929	Vallon de la Rousse	VR	138	\N
1930	Anenii Noi	AN	139	\N
1931	Bălți	BA	139	\N
1932	Tighina	BD	139	\N
1933	Briceni	BR	139	\N
1934	Basarabeasca	BS	139	\N
1935	Cahul	CA	139	\N
1936	Călărași	CL	139	\N
1937	Cimișlia	CM	139	\N
1938	Criuleni	CR	139	\N
1939	Căușeni	CS	139	\N
1940	Cantemir	CT	139	\N
1941	Chișinău	CU	139	\N
1942	Dondușeni	DO	139	\N
1943	Drochia	DR	139	\N
1944	Dubăsari	DU	139	\N
1945	Edineț	ED	139	\N
1946	Fălești	FA	139	\N
1947	Florești	FL	139	\N
1948	Găgăuzia, Unitatea teritorială autonomă	GA	139	\N
1949	Glodeni	GL	139	\N
1950	Hîncești	HI	139	\N
1951	Ialoveni	IA	139	\N
1952	Leova	LE	139	\N
1953	Nisporeni	NI	139	\N
1954	Ocnița	OC	139	\N
1955	Orhei	OR	139	\N
1956	Rezina	RE	139	\N
1957	Rîșcani	RI	139	\N
1958	Șoldănești	SD	139	\N
1959	Sîngerei	SI	139	\N
1960	Stînga Nistrului, unitatea teritorială din	SN	139	\N
1961	Soroca	SO	139	\N
1962	Strășeni	ST	139	\N
1963	Ștefan Vodă	SV	139	\N
1964	Taraclia	TA	139	\N
1965	Telenești	TE	139	\N
1966	Ungheni	UN	139	\N
1967	Andrijevica	01	140	\N
1968	Bar	02	140	\N
1969	Berane	03	140	\N
1970	Bijelo Polje	04	140	\N
1971	Budva	05	140	\N
1972	Cetinje	06	140	\N
1973	Danilovgrad	07	140	\N
1974	Herceg-Novi	08	140	\N
1975	Kolašin	09	140	\N
1976	Kotor	10	140	\N
1977	Mojkovac	11	140	\N
1978	Nikšić	12	140	\N
1979	Plav	13	140	\N
1980	Pljevlja	14	140	\N
1981	Plužine	15	140	\N
1982	Podgorica	16	140	\N
1983	Rožaje	17	140	\N
1984	Šavnik	18	140	\N
1985	Tivat	19	140	\N
1986	Ulcinj	20	140	\N
1987	Žabljak	21	140	\N
1988	Toamasina	A	142	\N
1989	Antsiranana	D	142	\N
1990	Fianarantsoa	F	142	\N
1991	Mahajanga	M	142	\N
1992	Antananarivo	T	142	\N
1993	Toliara	U	142	\N
1994	Ralik chain	L	143	\N
1995	Ratak chain	T	143	\N
1996	Aerodrom	01	144	\N
1997	Aračinovo	02	144	\N
1998	Berovo	03	144	\N
1999	Bitola	04	144	\N
2000	Bogdanci	05	144	\N
2001	Bogovinje	06	144	\N
2002	Bosilovo	07	144	\N
2003	Brvenica	08	144	\N
2004	Butel	09	144	\N
2005	Valandovo	10	144	\N
2006	Vasilevo	11	144	\N
2007	Vevčani	12	144	\N
2008	Veles	13	144	\N
2009	Vinica	14	144	\N
2010	Vraneštica	15	144	\N
2011	Vrapčište	16	144	\N
2012	Gazi Baba	17	144	\N
2013	Gevgelija	18	144	\N
2014	Gostivar	19	144	\N
2015	Gradsko	20	144	\N
2016	Debar	21	144	\N
2017	Debarca	22	144	\N
2018	Delčevo	23	144	\N
2019	Demir Kapija	24	144	\N
2020	Demir Hisar	25	144	\N
2021	Dojran	26	144	\N
2022	Dolneni	27	144	\N
2023	Drugovo	28	144	\N
2024	Gjorče Petrov	29	144	\N
2025	Želino	30	144	\N
2026	Zajas	31	144	\N
2027	Zelenikovo	32	144	\N
2028	Zrnovci	33	144	\N
2029	Ilinden	34	144	\N
2030	Jegunovce	35	144	\N
2031	Kavadarci	36	144	\N
2032	Karbinci	37	144	\N
2033	Karpoš	38	144	\N
2034	Kisela Voda	39	144	\N
2035	Kičevo	40	144	\N
2036	Konče	41	144	\N
2037	Kočani	42	144	\N
2038	Kratovo	43	144	\N
2039	Kriva Palanka	44	144	\N
2040	Krivogaštani	45	144	\N
2041	Kruševo	46	144	\N
2042	Kumanovo	47	144	\N
2043	Lipkovo	48	144	\N
2044	Lozovo	49	144	\N
2045	Mavrovo-i-Rostuša	50	144	\N
2046	Makedonska Kamenica	51	144	\N
2047	Makedonski Brod	52	144	\N
2048	Mogila	53	144	\N
2049	Negotino	54	144	\N
2050	Novaci	55	144	\N
2051	Novo Selo	56	144	\N
2052	Oslomej	57	144	\N
2053	Ohrid	58	144	\N
2054	Petrovec	59	144	\N
2055	Pehčevo	60	144	\N
2056	Plasnica	61	144	\N
2057	Prilep	62	144	\N
2058	Probištip	63	144	\N
2059	Radoviš	64	144	\N
2060	Rankovce	65	144	\N
2061	Resen	66	144	\N
2062	Rosoman	67	144	\N
2063	Saraj	68	144	\N
2064	Sveti Nikole	69	144	\N
2065	Sopište	70	144	\N
2066	Staro Nagoričane	71	144	\N
2067	Struga	72	144	\N
2068	Strumica	73	144	\N
2069	Studeničani	74	144	\N
2070	Tearce	75	144	\N
2071	Tetovo	76	144	\N
2072	Centar	77	144	\N
2073	Centar Župa	78	144	\N
2074	Čair	79	144	\N
2075	Čaška	80	144	\N
2076	Češinovo-Obleševo	81	144	\N
2077	Čučer Sandevo	82	144	\N
2078	Štip	83	144	\N
2079	Šuto Orizari	84	144	\N
2080	Kayes	1	145	\N
2081	Koulikoro	2	145	\N
2082	Sikasso	3	145	\N
2083	Ségou	4	145	\N
2084	Mopti	5	145	\N
2085	Tombouctou	6	145	\N
2086	Gao	7	145	\N
2087	Kidal	8	145	\N
2088	Bamako	BK0	145	\N
2089	Sagaing	01	146	\N
2090	Bago	02	146	\N
2091	Magway	03	146	\N
2092	Mandalay	04	146	\N
2093	Tanintharyi	05	146	\N
2094	Yangon	06	146	\N
2095	Ayeyarwady	07	146	\N
2096	Kachin	11	146	\N
2097	Kayah	12	146	\N
2098	Kayin	13	146	\N
2099	Chin	14	146	\N
2100	Mon	15	146	\N
2101	Rakhine	16	146	\N
2102	Shan	17	146	\N
2103	Orhon	035	147	\N
2104	Darhan uul	037	147	\N
2105	Hentiy	039	147	\N
2106	Hövsgöl	041	147	\N
2107	Hovd	043	147	\N
2108	Uvs	046	147	\N
2109	Töv	047	147	\N
2110	Selenge	049	147	\N
2111	Sühbaatar	051	147	\N
2112	Ömnögovi	053	147	\N
2113	Övörhangay	055	147	\N
2114	Dzavhan	057	147	\N
2115	Dundgovi	059	147	\N
2116	Dornod	061	147	\N
2117	Dornogovi	063	147	\N
2118	Govi-Sumber	064	147	\N
2119	Govi-Altay	065	147	\N
2120	Bulgan	067	147	\N
2121	Bayanhongor	069	147	\N
2122	Bayan-Ölgiy	071	147	\N
2123	Arhangay	073	147	\N
2124	Ulanbaatar	1	147	\N
2125	Hodh ech Chargui	01	151	\N
2126	Hodh el Charbi	02	151	\N
2127	Assaba	03	151	\N
2128	Gorgol	04	151	\N
2129	Brakna	05	151	\N
2130	Trarza	06	151	\N
2131	Adrar	07	151	\N
2132	Dakhlet Nouadhibou	08	151	\N
2133	Tagant	09	151	\N
2134	Guidimaka	10	151	\N
2135	Tiris Zemmour	11	151	\N
2136	Inchiri	12	151	\N
2137	Nouakchott	NKC	151	\N
2138	Attard	01	153	\N
2139	Balzan	02	153	\N
2140	Birgu	03	153	\N
2141	Birkirkara	04	153	\N
2142	Birżebbuġa	05	153	\N
2143	Bormla	06	153	\N
2144	Dingli	07	153	\N
2145	Fgura	08	153	\N
2146	Floriana	09	153	\N
2147	Fontana	10	153	\N
2148	Gudja	11	153	\N
2149	Gżira	12	153	\N
2150	Għajnsielem	13	153	\N
2151	Għarb	14	153	\N
2152	Għargħur	15	153	\N
2153	Għasri	16	153	\N
2154	Għaxaq	17	153	\N
2155	Ħamrun	18	153	\N
2156	Iklin	19	153	\N
2157	Isla	20	153	\N
2158	Kalkara	21	153	\N
2159	Kerċem	22	153	\N
2160	Kirkop	23	153	\N
2161	Lija	24	153	\N
2162	Luqa	25	153	\N
2163	Marsa	26	153	\N
2164	Marsaskala	27	153	\N
2165	Marsaxlokk	28	153	\N
2166	Mdina	29	153	\N
2167	Mellieħa	30	153	\N
2168	Mġarr	31	153	\N
2169	Mosta	32	153	\N
2170	Mqabba	33	153	\N
2171	Msida	34	153	\N
2172	Mtarfa	35	153	\N
2173	Munxar	36	153	\N
2174	Nadur	37	153	\N
2175	Naxxar	38	153	\N
2176	Paola	39	153	\N
2177	Pembroke	40	153	\N
2178	Pietà	41	153	\N
2179	Qala	42	153	\N
2180	Qormi	43	153	\N
2181	Qrendi	44	153	\N
2182	Rabat Għawdex	45	153	\N
2183	Rabat Malta	46	153	\N
2184	Safi	47	153	\N
2185	San Ġiljan	48	153	\N
2186	San Ġwann	49	153	\N
2187	San Lawrenz	50	153	\N
2188	San Pawl il-Baħar	51	153	\N
2189	Sannat	52	153	\N
2190	Santa Luċija	53	153	\N
2191	Santa Venera	54	153	\N
2192	Siġġiewi	55	153	\N
2193	Sliema	56	153	\N
2194	Swieqi	57	153	\N
2195	Ta’ Xbiex	58	153	\N
2196	Tarxien	59	153	\N
2197	Valletta	60	153	\N
2198	Xagħra	61	153	\N
2199	Xewkija	62	153	\N
2200	Xgħajra	63	153	\N
2201	Żabbar	64	153	\N
2202	Żebbuġ Għawdex	65	153	\N
2203	Żebbuġ Malta	66	153	\N
2204	Żejtun	67	153	\N
2205	Żurrieq	68	153	\N
2206	Agalega Islands	AG	154	\N
2207	Black River	BL	154	\N
2208	Beau Bassin-Rose Hill	BR	154	\N
2209	Cargados Carajos Shoals	CC	154	\N
2210	Curepipe	CU	154	\N
2211	Flacq	FL	154	\N
2212	Grand Port	GP	154	\N
2213	Moka	MO	154	\N
2214	Pamplemousses	PA	154	\N
2215	Port Louis	PL	154	\N
2216	Port Louis	PU	154	\N
2217	Plaines Wilhems	PW	154	\N
2218	Quatre Bornes	QB	154	\N
2219	Rodrigues Island	RO	154	\N
2220	Rivière du Rempart	RP	154	\N
2221	Savanne	SA	154	\N
2222	Vacoas-Phoenix	VP	154	\N
2223	Central	CE	155	\N
2224	Male	MLE	155	\N
2225	North Central	NC	155	\N
2226	North	NO	155	\N
2227	South Central	SC	155	\N
2228	South	SU	155	\N
2229	Upper North	UN	155	\N
2230	Upper South	US	155	\N
2231	Central Region	C	156	\N
2232	Northern Region	N	156	\N
2233	Southern Region	S	156	\N
2234	Aguascalientes	AGU	157	\N
2235	Baja California	BCN	157	\N
2236	Baja California Sur	BCS	157	\N
2237	Campeche	CAM	157	\N
2238	Chihuahua	CHH	157	\N
2239	Chiapas	CHP	157	\N
2240	Coahuila	COA	157	\N
2241	Colima	COL	157	\N
2242	Distrito Federal	DIF	157	\N
2243	Durango	DUR	157	\N
2244	Guerrero	GRO	157	\N
2245	Guanajuato	GUA	157	\N
2246	Hidalgo	HID	157	\N
2247	Jalisco	JAL	157	\N
2248	México	MEX	157	\N
2249	Michoacán	MIC	157	\N
2250	Morelos	MOR	157	\N
2251	Nayarit	NAY	157	\N
2252	Nuevo León	NLE	157	\N
2253	Oaxaca	OAX	157	\N
2254	Puebla	PUE	157	\N
2255	Querétaro	QUE	157	\N
2256	Quintana Roo	ROO	157	\N
2257	Sinaloa	SIN	157	\N
2258	San Luis Potosí	SLP	157	\N
2259	Sonora	SON	157	\N
2260	Tabasco	TAB	157	\N
2261	Tamaulipas	TAM	157	\N
2262	Tlaxcala	TLA	157	\N
2263	Veracruz	VER	157	\N
2264	Yucatán	YUC	157	\N
2265	Zacatecas	ZAC	157	\N
2266	Johor	01	158	\N
2267	Kedah	02	158	\N
2268	Kelantan	03	158	\N
2269	Melaka	04	158	\N
2270	Negeri Sembilan	05	158	\N
2271	Pahang	06	158	\N
2272	Pulau Pinang	07	158	\N
2273	Perak	08	158	\N
2274	Perlis	09	158	\N
2275	Selangor	10	158	\N
2276	Terengganu	11	158	\N
2277	Sabah	12	158	\N
2278	Sarawak	13	158	\N
2279	Wilayah Persekutuan Kuala Lumpur	14	158	\N
2280	Wilayah Persekutuan Labuan	15	158	\N
2281	Wilayah Persekutuan Putrajaya	16	158	\N
2282	Niassa	A	159	\N
2283	Manica	B	159	\N
2284	Gaza	G	159	\N
2285	Inhambane	I	159	\N
2286	Maputo	L	159	\N
2287	Maputo (city)	MPM	159	\N
2288	Numpula	N	159	\N
2289	Cabo Delgado	P	159	\N
2290	Zambezia	Q	159	\N
2291	Sofala	S	159	\N
2292	Tete	T	159	\N
2293	Caprivi	CA	160	\N
2294	Erongo	ER	160	\N
2295	Hardap	HA	160	\N
2296	Karas	KA	160	\N
2297	Khomas	KH	160	\N
2298	Kunene	KU	160	\N
2299	Otjozondjupa	OD	160	\N
2300	Omaheke	OH	160	\N
2301	Okavango	OK	160	\N
2302	Oshana	ON	160	\N
2303	Omusati	OS	160	\N
2304	Oshikoto	OT	160	\N
2305	Ohangwena	OW	160	\N
2306	Agadez	1	162	\N
2307	Diffa	2	162	\N
2308	Dosso	3	162	\N
2309	Maradi	4	162	\N
2310	Tahoua	5	162	\N
2311	Tillabéri	6	162	\N
2312	Zinder	7	162	\N
2313	Niamey	8	162	\N
2314	Abia	AB	164	\N
2315	Adamawa	AD	164	\N
2316	Akwa Ibom	AK	164	\N
2317	Anambra	AN	164	\N
2318	Bauchi	BA	164	\N
2319	Benue	BE	164	\N
2320	Borno	BO	164	\N
2321	Bayelsa	BY	164	\N
2322	Cross River	CR	164	\N
2323	Delta	DE	164	\N
2324	Ebonyi	EB	164	\N
2325	Edo	ED	164	\N
2326	Ekiti	EK	164	\N
2327	Enugu	EN	164	\N
2328	Abuja Capital Territory	FC	164	\N
2329	Gombe	GO	164	\N
2330	Imo	IM	164	\N
2331	Jigawa	JI	164	\N
2332	Kaduna	KD	164	\N
2333	Kebbi	KE	164	\N
2334	Kano	KN	164	\N
2335	Kogi	KO	164	\N
2336	Katsina	KT	164	\N
2337	Kwara	KW	164	\N
2338	Lagos	LA	164	\N
2339	Nassarawa	NA	164	\N
2340	Niger	NI	164	\N
2341	Ogun	OG	164	\N
2342	Ondo	ON	164	\N
2343	Osun	OS	164	\N
2344	Oyo	OY	164	\N
2345	Plateau	PL	164	\N
2346	Rivers	RI	164	\N
2347	Sokoto	SO	164	\N
2348	Taraba	TA	164	\N
2349	Yobe	YO	164	\N
2350	Zamfara	ZA	164	\N
2351	Atlántico Norte	AN	165	\N
2352	Atlántico Sur	AS	165	\N
2353	Boaco	BO	165	\N
2354	Carazo	CA	165	\N
2355	Chinandega	CI	165	\N
2356	Chontales	CO	165	\N
2357	Estelí	ES	165	\N
2358	Granada	GR	165	\N
2359	Jinotega	JI	165	\N
2360	León	LE	165	\N
2361	Madriz	MD	165	\N
2362	Managua	MN	165	\N
2363	Masaya	MS	165	\N
2364	Matagalpa	MT	165	\N
2365	Nueva Segovia	NS	165	\N
2366	Rivas	RI	165	\N
2367	Río San Juan	SJ	165	\N
2368	Aruba	AW	166	\N
2369	Bonaire	BQ1	166	\N
2370	Saba	BQ2	166	\N
2371	Sint Eustatius	BQ3	166	\N
2372	Curaçao	CW	166	\N
2373	Drenthe	DR	166	\N
2374	Flevoland	FL	166	\N
2375	Friesland	FR	166	\N
2376	Gelderland	GE	166	\N
2377	Groningen	GR	166	\N
2378	Limburg	LI	166	\N
2379	Noord-Brabant	NB	166	\N
2380	Noord-Holland	NH	166	\N
2381	Overijssel	OV	166	\N
2382	Sint Maarten	SX	166	\N
2383	Utrecht	UT	166	\N
2384	Zeeland	ZE	166	\N
2385	Zuid-Holland	ZH	166	\N
2386	Østfold	01	167	\N
2387	Akershus	02	167	\N
2388	Oslo	03	167	\N
2389	Hedmark	04	167	\N
2390	Oppland	05	167	\N
2391	Buskerud	06	167	\N
2392	Vestfold	07	167	\N
2393	Telemark	08	167	\N
2394	Aust-Agder	09	167	\N
2395	Vest-Agder	10	167	\N
2396	Rogaland	11	167	\N
2397	Hordaland	12	167	\N
2398	Sogn og Fjordane	14	167	\N
2399	Møre og Romsdal	15	167	\N
2400	Sør-Trøndelag	16	167	\N
2401	Nord-Trøndelag	17	167	\N
2402	Nordland	18	167	\N
2403	Troms	19	167	\N
2404	Finnmark	20	167	\N
2405	Svalbard (Arctic Region)	21	167	\N
2406	Jan Mayen (Arctic Region)	22	167	\N
2407	Madhyamanchal	1	168	\N
2408	Madhya Pashchimanchal	2	168	\N
2409	Pashchimanchal	3	168	\N
2410	Purwanchal	4	168	\N
2411	Sudur Pashchimanchal	5	168	\N
2412	Aiwo	01	169	\N
2413	Anabar	02	169	\N
2414	Anetan	03	169	\N
2415	Anibare	04	169	\N
2416	Baiti	05	169	\N
2417	Boe	06	169	\N
2418	Buada	07	169	\N
2419	Denigomodu	08	169	\N
2420	Ewa	09	169	\N
2421	Ijuw	10	169	\N
2422	Meneng	11	169	\N
2423	Nibok	12	169	\N
2424	Uaboe	13	169	\N
2425	Yaren	14	169	\N
2426	Chatham Islands Territory	CIT	171	\N
2427	North Island	N	171	\N
2428	South Island	S	171	\N
2429	Al Bāţinah	BA	172	\N
2430	Al Buraymī	BU	172	\N
2431	Ad Dākhilīya	DA	172	\N
2432	Masqaţ	MA	172	\N
2433	Musandam	MU	172	\N
2434	Ash Sharqīyah	SH	172	\N
2435	Al Wusţá	WU	172	\N
2436	Az̧ Z̧āhirah	ZA	172	\N
2437	Z̧ufār	ZU	172	\N
2438	Bocas del Toro	1	173	\N
2439	Coclé	2	173	\N
2440	Colón	3	173	\N
2441	Chiriquí	4	173	\N
2442	Darién	5	173	\N
2443	Herrera	6	173	\N
2444	Los Santos	7	173	\N
2445	Panamá	8	173	\N
2446	Veraguas	9	173	\N
2447	Emberá	EM	173	\N
2448	Kuna Yala	KY	173	\N
2449	Ngöbe-Buglé	NB	173	\N
2450	Amazonas	AMA	174	\N
2451	Ancash	ANC	174	\N
2452	Apurímac	APU	174	\N
2453	Arequipa	ARE	174	\N
2454	Ayacucho	AYA	174	\N
2455	Cajamarca	CAJ	174	\N
2456	El Callao	CAL	174	\N
2457	Cusco [Cuzco]	CUS	174	\N
2458	Huánuco	HUC	174	\N
2459	Huancavelica	HUV	174	\N
2460	Ica	ICA	174	\N
2461	Junín	JUN	174	\N
2462	La Libertad	LAL	174	\N
2463	Lambayeque	LAM	174	\N
2464	Lima	LIM	174	\N
2465	Municipalidad Metropolitana de Lima	LMA	174	\N
2466	Loreto	LOR	174	\N
2467	Madre de Dios	MDD	174	\N
2468	Moquegua	MOQ	174	\N
2469	Pasco	PAS	174	\N
2470	Piura	PIU	174	\N
2471	Puno	PUN	174	\N
2472	San Martín	SAM	174	\N
2473	Tacna	TAC	174	\N
2474	Tumbes	TUM	174	\N
2475	Ucayali	UCA	174	\N
2476	Chimbu	CPK	176	\N
2477	Central	CPM	176	\N
2478	East New Britain	EBR	176	\N
2479	Eastern Highlands	EHG	176	\N
2480	Enga	EPW	176	\N
2481	East Sepik	ESW	176	\N
2482	Gulf	GPK	176	\N
2483	Milne Bay	MBA	176	\N
2484	Morobe	MPL	176	\N
2485	Madang	MPM	176	\N
2486	Manus	MRL	176	\N
2487	National Capital District (Port Moresby)	NCD	176	\N
2488	New Ireland	NIK	176	\N
2489	Northern	NPP	176	\N
2490	Bougainville	NSB	176	\N
2491	Sandaun	SAN	176	\N
2492	Southern Highlands	SHM	176	\N
2493	West New Britain	WBK	176	\N
2494	Western Highlands	WHM	176	\N
2495	Western	WPD	176	\N
2496	National Capital Region	00	177	\N
2497	Ilocos (Region I)	01	177	\N
2498	Cagayan Valley (Region II)	02	177	\N
2499	Central Luzon (Region III)	03	177	\N
2500	Bicol (Region V)	05	177	\N
2501	Western Visayas (Region VI)	06	177	\N
2502	Central Visayas (Region VII)	07	177	\N
2503	Eastern Visayas (Region VIII)	08	177	\N
2504	Zamboanga Peninsula (Region IX)	09	177	\N
2505	Northern Mindanao (Region X)	10	177	\N
2506	Davao (Region XI)	11	177	\N
2507	Soccsksargen (Region XII)	12	177	\N
2508	Caraga (Region XIII)	13	177	\N
2509	Autonomous Region in Muslim Mindanao (ARMM)	14	177	\N
2510	Cordillera Administrative Region (CAR)	15	177	\N
2511	CALABARZON (Region IV-A)	40	177	\N
2512	MIMAROPA (Region IV-B)	41	177	\N
2513	Balochistan	BA	178	\N
2514	Gilgit-Baltistan	GB	178	\N
2515	Islamabad	IS	178	\N
2516	Azad Kashmir	JK	178	\N
2517	Khyber Pakhtunkhwa	KP	178	\N
2518	Punjab	PB	178	\N
2519	Sindh	SD	178	\N
2520	Federally Administered Tribal Areas	TA	178	\N
2521	Dolnośląskie	DS	179	\N
2522	Kujawsko-pomorskie	KP	179	\N
2523	Lubuskie	LB	179	\N
2524	Łódzkie	LD	179	\N
2525	Lubelskie	LU	179	\N
2526	Małopolskie	MA	179	\N
2527	Mazowieckie	MZ	179	\N
2528	Opolskie	OP	179	\N
2529	Podlaskie	PD	179	\N
2530	Podkarpackie	PK	179	\N
2531	Pomorskie	PM	179	\N
2532	Świętokrzyskie	SK	179	\N
2533	Śląskie	SL	179	\N
2534	Warmińsko-mazurskie	WN	179	\N
2535	Wielkopolskie	WP	179	\N
2536	Zachodniopomorskie	ZP	179	\N
2537	Bethlehem	BTH	182	\N
2538	Deir El Balah	DEB	182	\N
2539	Gaza	GZA	182	\N
2540	Hebron	HBN	182	\N
2541	Jerusalem	JEM	182	\N
2542	Jenin	JEN	182	\N
2543	Jericho - Al Aghwar	JRH	182	\N
2544	Khan Yunis	KYS	182	\N
2545	Nablus	NBS	182	\N
2546	North Gaza	NGZ	182	\N
2547	Qalqilya	QQA	182	\N
2548	Ramallah	RBH	182	\N
2549	Rafah	RFH	182	\N
2550	Salfit	SLT	182	\N
2551	Tubas	TBS	182	\N
2552	Tulkarm	TKM	182	\N
2553	Aveiro	01	183	\N
2554	Beja	02	183	\N
2555	Braga	03	183	\N
2556	Bragança	04	183	\N
2557	Castelo Branco	05	183	\N
2558	Coimbra	06	183	\N
2559	Évora	07	183	\N
2560	Faro	08	183	\N
2561	Guarda	09	183	\N
2562	Leiria	10	183	\N
2563	Lisboa	11	183	\N
2564	Portalegre	12	183	\N
2565	Porto	13	183	\N
2566	Santarém	14	183	\N
2567	Setúbal	15	183	\N
2568	Viana do Castelo	16	183	\N
2569	Vila Real	17	183	\N
2570	Viseu	18	183	\N
2571	Região Autónoma dos Açores	20	183	\N
2572	Região Autónoma da Madeira	30	183	\N
2573	Aimeliik	002	184	\N
2574	Airai	004	184	\N
2575	Angaur	010	184	\N
2576	Hatobohei	050	184	\N
2577	Kayangel	100	184	\N
2578	Koror	150	184	\N
2579	Melekeok	212	184	\N
2580	Ngaraard	214	184	\N
2581	Ngarchelong	218	184	\N
2582	Ngardmau	222	184	\N
2583	Ngatpang	224	184	\N
2584	Ngchesar	226	184	\N
2585	Ngeremlengui	227	184	\N
2586	Ngiwal	228	184	\N
2587	Peleliu	350	184	\N
2588	Sonsorol	370	184	\N
2589	Concepción	1	185	\N
2590	Alto Paraná	10	185	\N
2591	Central	11	185	\N
2592	Ñeembucú	12	185	\N
2593	Amambay	13	185	\N
2594	Canindeyú	14	185	\N
2595	Presidente Hayes	15	185	\N
2596	Alto Paraguay	16	185	\N
2597	Boquerón	19	185	\N
2598	San Pedro	2	185	\N
2599	Cordillera	3	185	\N
2600	Guairá	4	185	\N
2601	Caaguazú	5	185	\N
2602	Caazapá	6	185	\N
2603	Itapúa	7	185	\N
2604	Misiones	8	185	\N
2605	Paraguarí	9	185	\N
2606	Asunción	ASU	185	\N
2607	Ad Dawhah	DA	186	\N
2608	Al Khawr wa adh Dhakhīrah	KH	186	\N
2609	Ash Shamal	MS	186	\N
2610	Ar Rayyan	RA	186	\N
2611	Umm Salal	US	186	\N
2612	Al Wakrah	WA	186	\N
2613	Az̧ Z̧a‘āyin	ZA	186	\N
2614	Alba	AB	188	\N
2615	Argeș	AG	188	\N
2616	Arad	AR	188	\N
2617	București	B	188	\N
2618	Bacău	BC	188	\N
2619	Bihor	BH	188	\N
2620	Bistrița-Năsăud	BN	188	\N
2621	Brăila	BR	188	\N
2622	Botoșani	BT	188	\N
2623	Brașov	BV	188	\N
2624	Buzău	BZ	188	\N
2625	Cluj	CJ	188	\N
2626	Călărași	CL	188	\N
2627	Caraș-Severin	CS	188	\N
2628	Constanța	CT	188	\N
2629	Covasna	CV	188	\N
2630	Dâmbovița	DB	188	\N
2631	Dolj	DJ	188	\N
2632	Gorj	GJ	188	\N
2633	Galați	GL	188	\N
2634	Giurgiu	GR	188	\N
2635	Hunedoara	HD	188	\N
2636	Harghita	HR	188	\N
2637	Ilfov	IF	188	\N
2638	Ialomița	IL	188	\N
2639	Iași	IS	188	\N
2640	Mehedinți	MH	188	\N
2641	Maramureș	MM	188	\N
2642	Mureș	MS	188	\N
2643	Neamț	NT	188	\N
2644	Olt	OT	188	\N
2645	Prahova	PH	188	\N
2646	Sibiu	SB	188	\N
2647	Sălaj	SJ	188	\N
2648	Satu Mare	SM	188	\N
2649	Suceava	SV	188	\N
2650	Tulcea	TL	188	\N
2651	Timiș	TM	188	\N
2652	Teleorman	TR	188	\N
2653	Vâlcea	VL	188	\N
2654	Vrancea	VN	188	\N
2655	Vaslui	VS	188	\N
2656	Beograd	00	189	\N
2657	Mačvanski okrug	08	189	\N
2658	Kolubarski okrug	09	189	\N
2659	Podunavski okrug	10	189	\N
2660	Braničevski okrug	11	189	\N
2661	Šumadijski okrug	12	189	\N
2662	Pomoravski okrug	13	189	\N
2663	Borski okrug	14	189	\N
2664	Zaječarski okrug	15	189	\N
2665	Zlatiborski okrug	16	189	\N
2666	Moravički okrug	17	189	\N
2667	Raški okrug	18	189	\N
2668	Rasinski okrug	19	189	\N
2669	Nišavski okrug	20	189	\N
2670	Toplički okrug	21	189	\N
2671	Pirotski okrug	22	189	\N
2672	Jablanički okrug	23	189	\N
2673	Pčinjski okrug	24	189	\N
2674	Kosovo-Metohija	KM	189	\N
2675	Vojvodina	VO	189	\N
2676	Adygeya, Respublika	AD	190	\N
2677	Altay, Respublika	AL	190	\N
2678	Altayskiy kray	ALT	190	\N
2679	Amurskaya oblast'	AMU	190	\N
2680	Arkhangel'skaya oblast'	ARK	190	\N
2681	Astrakhanskaya oblast'	AST	190	\N
2682	Bashkortostan, Respublika	BA	190	\N
2683	Belgorodskaya oblast'	BEL	190	\N
2684	Bryanskaya oblast'	BRY	190	\N
2685	Buryatiya, Respublika	BU	190	\N
2686	Chechenskaya Respublika	CE	190	\N
2687	Chelyabinskaya oblast'	CHE	190	\N
2688	Chukotskiy avtonomnyy okrug	CHU	190	\N
2689	Chuvashskaya Respublika	CU	190	\N
2690	Dagestan, Respublika	DA	190	\N
2691	Respublika Ingushetiya	IN	190	\N
2692	Irkutiskaya oblast'	IRK	190	\N
2693	Ivanovskaya oblast'	IVA	190	\N
2694	Kamchatskiy kray	KAM	190	\N
2695	Kabardino-Balkarskaya Respublika	KB	190	\N
2696	Karachayevo-Cherkesskaya Respublika	KC	190	\N
2697	Krasnodarskiy kray	KDA	190	\N
2698	Kemerovskaya oblast'	KEM	190	\N
2699	Kaliningradskaya oblast'	KGD	190	\N
2700	Kurganskaya oblast'	KGN	190	\N
2701	Khabarovskiy kray	KHA	190	\N
2702	Khanty-Mansiysky avtonomnyy okrug-Yugra	KHM	190	\N
2703	Kirovskaya oblast'	KIR	190	\N
2704	Khakasiya, Respublika	KK	190	\N
2705	Kalmykiya, Respublika	KL	190	\N
2706	Kaluzhskaya oblast'	KLU	190	\N
2707	Komi, Respublika	KO	190	\N
2708	Kostromskaya oblast'	KOS	190	\N
2709	Kareliya, Respublika	KR	190	\N
2710	Kurskaya oblast'	KRS	190	\N
2711	Krasnoyarskiy kray	KYA	190	\N
2712	Leningradskaya oblast'	LEN	190	\N
2713	Lipetskaya oblast'	LIP	190	\N
2714	Magadanskaya oblast'	MAG	190	\N
2715	Mariy El, Respublika	ME	190	\N
2716	Mordoviya, Respublika	MO	190	\N
2717	Moskovskaya oblast'	MOS	190	\N
2718	Moskva	MOW	190	\N
2719	Murmanskaya oblast'	MUR	190	\N
2720	Nenetskiy avtonomnyy okrug	NEN	190	\N
2721	Novgorodskaya oblast'	NGR	190	\N
2722	Nizhegorodskaya oblast'	NIZ	190	\N
2723	Novosibirskaya oblast'	NVS	190	\N
2724	Omskaya oblast'	OMS	190	\N
2725	Orenburgskaya oblast'	ORE	190	\N
2726	Orlovskaya oblast'	ORL	190	\N
2727	Permskiy kray	PER	190	\N
2728	Penzenskaya oblast'	PNZ	190	\N
2729	Primorskiy kray	PRI	190	\N
2730	Pskovskaya oblast'	PSK	190	\N
2731	Rostovskaya oblast'	ROS	190	\N
2732	Ryazanskaya oblast'	RYA	190	\N
2733	Sakha, Respublika [Yakutiya]	SA	190	\N
2734	Sakhalinskaya oblast'	SAK	190	\N
2735	Samaraskaya oblast'	SAM	190	\N
2736	Saratovskaya oblast'	SAR	190	\N
2737	Severnaya Osetiya-Alaniya, Respublika	SE	190	\N
2738	Smolenskaya oblast'	SMO	190	\N
2739	Sankt-Peterburg	SPE	190	\N
2740	Stavropol'skiy kray	STA	190	\N
2741	Sverdlovskaya oblast'	SVE	190	\N
2742	Tatarstan, Respublika	TA	190	\N
2743	Tambovskaya oblast'	TAM	190	\N
2744	Tomskaya oblast'	TOM	190	\N
2745	Tul'skaya oblast'	TUL	190	\N
2746	Tverskaya oblast'	TVE	190	\N
2747	Tyva, Respublika [Tuva]	TY	190	\N
2748	Tyumenskaya oblast'	TYU	190	\N
2749	Udmurtskaya Respublika	UD	190	\N
2750	Ul'yanovskaya oblast'	ULY	190	\N
2751	Volgogradskaya oblast'	VGG	190	\N
2752	Vladimirskaya oblast'	VLA	190	\N
2753	Vologodskaya oblast'	VLG	190	\N
2754	Voronezhskaya oblast'	VOR	190	\N
2755	Yamalo-Nenetskiy avtonomnyy okrug	YAN	190	\N
2756	Yaroslavskaya oblast'	YAR	190	\N
2757	Yevreyskaya avtonomnaya oblast'	YEV	190	\N
2758	Zabajkal'skij kraj	ZAB	190	\N
2759	Ville de Kigali	01	191	\N
2760	Est	02	191	\N
2761	Nord	03	191	\N
2762	Ouest	04	191	\N
2763	Sud	05	191	\N
2764	Ar Riyāḍ	01	192	\N
2765	Makkah	02	192	\N
2766	Al Madīnah	03	192	\N
2767	Ash Sharqīyah	04	192	\N
2768	Al Qaşīm	05	192	\N
2769	Ḥā'il	06	192	\N
2770	Tabūk	07	192	\N
2771	Al Ḥudūd ash Shamāliyah	08	192	\N
2772	Jīzan	09	192	\N
2773	Najrān	10	192	\N
2774	Al Bāhah	11	192	\N
2775	Al Jawf	12	192	\N
2776	`Asīr	14	192	\N
2777	Central	CE	193	\N
2778	Choiseul	CH	193	\N
2779	Capital Territory (Honiara)	CT	193	\N
2780	Guadalcanal	GU	193	\N
2781	Isabel	IS	193	\N
2782	Makira	MK	193	\N
2783	Malaita	ML	193	\N
2784	Rennell and Bellona	RB	193	\N
2785	Temotu	TE	193	\N
2786	Western	WE	193	\N
2787	Anse aux Pins	01	194	\N
2788	Anse Boileau	02	194	\N
2789	Anse Etoile	03	194	\N
2790	Anse Louis	04	194	\N
2791	Anse Royale	05	194	\N
2792	Baie Lazare	06	194	\N
2793	Baie Sainte Anne	07	194	\N
2794	Beau Vallon	08	194	\N
2795	Bel Air	09	194	\N
2796	Bel Ombre	10	194	\N
2797	Cascade	11	194	\N
2798	Glacis	12	194	\N
2799	Grand Anse Mahe	13	194	\N
2800	Grand Anse Praslin	14	194	\N
2801	La Digue	15	194	\N
2802	English River	16	194	\N
2803	Mont Buxton	17	194	\N
2804	Mont Fleuri	18	194	\N
2805	Plaisance	19	194	\N
2806	Pointe Larue	20	194	\N
2807	Port Glaud	21	194	\N
2808	Saint Louis	22	194	\N
2809	Takamaka	23	194	\N
2810	Les Mamelles	24	194	\N
2811	Roche Caiman	25	194	\N
2812	Zalingei	DC	195	\N
2813	Sharq Dārfūr	DE	195	\N
2814	Shamāl Dārfūr	DN	195	\N
2815	Janūb Dārfūr	DS	195	\N
2816	Gharb Dārfūr	DW	195	\N
2817	Al Qaḑārif	GD	195	\N
2818	Al Jazīrah	GZ	195	\N
2819	Kassalā	KA	195	\N
2820	Al Kharţūm	KH	195	\N
2821	Shamāl Kurdufān	KN	195	\N
2822	Janūb Kurdufān	KS	195	\N
2823	An Nīl al Azraq	NB	195	\N
2824	Ash Shamālīyah	NO	195	\N
2825	An Nīl	NR	195	\N
2826	An Nīl al Abyaḑ	NW	195	\N
2827	Al Baḩr al Aḩmar	RS	195	\N
2828	Sinnār	SI	195	\N
2829	Stockholms län	AB	196	\N
2830	Västerbottens län	AC	196	\N
2831	Norrbottens län	BD	196	\N
2832	Uppsala län	C	196	\N
2833	Södermanlands län	D	196	\N
2834	Östergötlands län	E	196	\N
2835	Jönköpings län	F	196	\N
2836	Kronobergs län	G	196	\N
2837	Kalmar län	H	196	\N
2838	Gotlands län	I	196	\N
2839	Blekinge län	K	196	\N
2840	Skåne län	M	196	\N
2841	Hallands län	N	196	\N
2842	Västra Götalands län	O	196	\N
2843	Värmlands län	S	196	\N
2844	Örebro län	T	196	\N
2845	Västmanlands län	U	196	\N
2846	Dalarnas län	W	196	\N
2847	Gävleborgs län	X	196	\N
2848	Västernorrlands län	Y	196	\N
2849	Jämtlands län	Z	196	\N
2850	Central Singapore	01	197	\N
2851	North East	02	197	\N
2852	North West	03	197	\N
2853	South East	04	197	\N
2854	South West	05	197	\N
2855	Ascension	AC	198	\N
2856	Saint Helena	HL	198	\N
2857	Tristan da Cunha	TA	198	\N
2858	Ajdovščina	001	199	\N
2859	Beltinci	002	199	\N
2860	Bled	003	199	\N
2861	Bohinj	004	199	\N
2862	Borovnica	005	199	\N
2863	Bovec	006	199	\N
2864	Brda	007	199	\N
2865	Brezovica	008	199	\N
2866	Brežice	009	199	\N
2867	Tišina	010	199	\N
2868	Celje	011	199	\N
2869	Cerklje na Gorenjskem	012	199	\N
2870	Cerknica	013	199	\N
2871	Cerkno	014	199	\N
2872	Črenšovci	015	199	\N
2873	Črna na Koroškem	016	199	\N
2874	Črnomelj	017	199	\N
2875	Destrnik	018	199	\N
2876	Divača	019	199	\N
2877	Dobrepolje	020	199	\N
2878	Dobrova-Polhov Gradec	021	199	\N
2879	Dol pri Ljubljani	022	199	\N
2880	Domžale	023	199	\N
2881	Dornava	024	199	\N
2882	Dravograd	025	199	\N
2883	Duplek	026	199	\N
2884	Gorenja vas-Poljane	027	199	\N
2885	Gorišnica	028	199	\N
2886	Gornja Radgona	029	199	\N
2887	Gornji Grad	030	199	\N
2888	Gornji Petrovci	031	199	\N
2889	Grosuplje	032	199	\N
2890	Šalovci	033	199	\N
2891	Hrastnik	034	199	\N
2892	Hrpelje-Kozina	035	199	\N
2893	Idrija	036	199	\N
2894	Ig	037	199	\N
2895	Ilirska Bistrica	038	199	\N
2896	Ivančna Gorica	039	199	\N
2897	Izola/Isola	040	199	\N
2898	Jesenice	041	199	\N
2899	Juršinci	042	199	\N
2900	Kamnik	043	199	\N
2901	Kanal	044	199	\N
2902	Kidričevo	045	199	\N
2903	Kobarid	046	199	\N
2904	Kobilje	047	199	\N
2905	Kočevje	048	199	\N
2906	Komen	049	199	\N
2907	Koper/Capodistria	050	199	\N
2908	Kozje	051	199	\N
2909	Kranj	052	199	\N
2910	Kranjska Gora	053	199	\N
2911	Krško	054	199	\N
2912	Kungota	055	199	\N
2913	Kuzma	056	199	\N
2914	Laško	057	199	\N
2915	Lenart	058	199	\N
2916	Lendava/Lendva	059	199	\N
2917	Litija	060	199	\N
2918	Ljubljana	061	199	\N
2919	Ljubno	062	199	\N
2920	Ljutomer	063	199	\N
2921	Logatec	064	199	\N
2922	Loška dolina	065	199	\N
2923	Loški Potok	066	199	\N
2924	Luče	067	199	\N
2925	Lukovica	068	199	\N
2926	Majšperk	069	199	\N
2927	Maribor	070	199	\N
2928	Medvode	071	199	\N
2929	Mengeš	072	199	\N
2930	Metlika	073	199	\N
2931	Mežica	074	199	\N
2932	Miren-Kostanjevica	075	199	\N
2933	Mislinja	076	199	\N
2934	Moravče	077	199	\N
2935	Moravske Toplice	078	199	\N
2936	Mozirje	079	199	\N
2937	Murska Sobota	080	199	\N
2938	Muta	081	199	\N
2939	Naklo	082	199	\N
2940	Nazarje	083	199	\N
2941	Nova Gorica	084	199	\N
2942	Novo mesto	085	199	\N
2943	Odranci	086	199	\N
2944	Ormož	087	199	\N
2945	Osilnica	088	199	\N
2946	Pesnica	089	199	\N
2947	Piran/Pirano	090	199	\N
2948	Pivka	091	199	\N
2949	Podčetrtek	092	199	\N
2950	Podvelka	093	199	\N
2951	Postojna	094	199	\N
2952	Preddvor	095	199	\N
2953	Ptuj	096	199	\N
2954	Puconci	097	199	\N
2955	Rače-Fram	098	199	\N
2956	Radeče	099	199	\N
2957	Radenci	100	199	\N
2958	Radlje ob Dravi	101	199	\N
2959	Radovljica	102	199	\N
2960	Ravne na Koroškem	103	199	\N
2961	Ribnica	104	199	\N
2962	Rogašovci	105	199	\N
2963	Rogaška Slatina	106	199	\N
2964	Rogatec	107	199	\N
2965	Ruše	108	199	\N
2966	Semič	109	199	\N
2967	Sevnica	110	199	\N
2968	Sežana	111	199	\N
2969	Slovenj Gradec	112	199	\N
2970	Slovenska Bistrica	113	199	\N
2971	Slovenske Konjice	114	199	\N
2972	Starče	115	199	\N
2973	Sveti Jurij	116	199	\N
2974	Šenčur	117	199	\N
2975	Šentilj	118	199	\N
2976	Šentjernej	119	199	\N
2977	Šentjur	120	199	\N
2978	Škocjan	121	199	\N
2979	Škofja Loka	122	199	\N
2980	Škofljica	123	199	\N
2981	Šmarje pri Jelšah	124	199	\N
2982	Šmartno ob Paki	125	199	\N
2983	Šoštanj	126	199	\N
2984	Štore	127	199	\N
2985	Tolmin	128	199	\N
2986	Trbovlje	129	199	\N
2987	Trebnje	130	199	\N
2988	Tržič	131	199	\N
2989	Turnišče	132	199	\N
2990	Velenje	133	199	\N
2991	Velike Lašče	134	199	\N
2992	Videm	135	199	\N
2993	Vipava	136	199	\N
2994	Vitanje	137	199	\N
2995	Vodice	138	199	\N
2996	Vojnik	139	199	\N
2997	Vrhnika	140	199	\N
2998	Vuzenica	141	199	\N
2999	Zagorje ob Savi	142	199	\N
3000	Zavrč	143	199	\N
3001	Zreče	144	199	\N
3002	Železniki	146	199	\N
3003	Žiri	147	199	\N
3004	Benedikt	148	199	\N
3005	Bistrica ob Sotli	149	199	\N
3006	Bloke	150	199	\N
3007	Braslovče	151	199	\N
3008	Cankova	152	199	\N
3009	Cerkvenjak	153	199	\N
3010	Dobje	154	199	\N
3011	Dobrna	155	199	\N
3012	Dobrovnik/Dobronak	156	199	\N
3013	Dolenjske Toplice	157	199	\N
3014	Grad	158	199	\N
3015	Hajdina	159	199	\N
3016	Hoče-Slivnica	160	199	\N
3017	Hodoš/Hodos	161	199	\N
3018	Horjul	162	199	\N
3019	Jezersko	163	199	\N
3020	Komenda	164	199	\N
3021	Kostel	165	199	\N
3022	Križevci	166	199	\N
3023	Lovrenc na Pohorju	167	199	\N
3024	Markovci	168	199	\N
3025	Miklavž na Dravskem polju	169	199	\N
3026	Mirna Peč	170	199	\N
3027	Oplotnica	171	199	\N
3028	Podlehnik	172	199	\N
3029	Polzela	173	199	\N
3030	Prebold	174	199	\N
3031	Prevalje	175	199	\N
3032	Razkrižje	176	199	\N
3033	Ribnica na Pohorju	177	199	\N
3034	Selnica ob Dravi	178	199	\N
3035	Sodražica	179	199	\N
3036	Solčava	180	199	\N
3037	Sveta Ana	181	199	\N
3038	Sveta Andraž v Slovenskih Goricah	182	199	\N
3039	Šempeter-Vrtojba	183	199	\N
3040	Tabor	184	199	\N
3041	Trnovska vas	185	199	\N
3042	Trzin	186	199	\N
3043	Velika Polana	187	199	\N
3044	Veržej	188	199	\N
3045	Vransko	189	199	\N
3046	Žalec	190	199	\N
3047	Žetale	191	199	\N
3048	Žirovnica	192	199	\N
3049	Žužemberk	193	199	\N
3050	Šmartno pri Litiji	194	199	\N
3051	Apače	195	199	\N
3052	Cirkulane	196	199	\N
3053	Kosanjevica na Krki	197	199	\N
3054	Makole	198	199	\N
3055	Mokronog-Trebelno	199	199	\N
3056	Poljčane	200	199	\N
3057	Renče-Vogrsko	201	199	\N
3058	Središče ob Dravi	202	199	\N
3059	Straža	203	199	\N
3060	Sveta Trojica v Slovenskih Goricah	204	199	\N
3061	Sveti Tomaž	205	199	\N
3062	Šmarjeske Topliče	206	199	\N
3063	Gorje	207	199	\N
3064	Log-Dragomer	208	199	\N
3065	Rečica ob Savinji	209	199	\N
3066	Sveti Jurij v Slovenskih Goricah	210	199	\N
3067	Šentrupert	211	199	\N
3068	Banskobystrický kraj	BC	201	\N
3069	Bratislavský kraj	BL	201	\N
3070	Košický kraj	KI	201	\N
3071	Nitriansky kraj	NI	201	\N
3072	Prešovský kraj	PV	201	\N
3073	Trnavský kraj	TA	201	\N
3074	Trenčiansky kraj	TC	201	\N
3075	Žilinský kraj	ZI	201	\N
3076	Eastern	E	202	\N
3077	Northern	N	202	\N
3078	Southern (Sierra Leone)	S	202	\N
3079	Western Area (Freetown)	W	202	\N
3080	Acquaviva	01	203	\N
3081	Chiesanuova	02	203	\N
3082	Domagnano	03	203	\N
3083	Faetano	04	203	\N
3084	Fiorentino	05	203	\N
3085	Borgo Maggiore	06	203	\N
3086	San Marino	07	203	\N
3087	Montegiardino	08	203	\N
3088	Serravalle	09	203	\N
3089	Diourbel	DB	204	\N
3090	Dakar	DK	204	\N
3091	Fatick	FK	204	\N
3092	Kaffrine	KA	204	\N
3093	Kolda	KD	204	\N
3094	Kédougou	KE	204	\N
3095	Kaolack	KL	204	\N
3096	Louga	LG	204	\N
3097	Matam	MT	204	\N
3098	Sédhiou	SE	204	\N
3099	Saint-Louis	SL	204	\N
3100	Tambacounda	TC	204	\N
3101	Thiès	TH	204	\N
3102	Ziguinchor	ZG	204	\N
3103	Awdal	AW	205	\N
3104	Bakool	BK	205	\N
3105	Banaadir	BN	205	\N
3106	Bari	BR	205	\N
3107	Bay	BY	205	\N
3108	Galguduud	GA	205	\N
3109	Gedo	GE	205	\N
3110	Hiirsan	HI	205	\N
3111	Jubbada Dhexe	JD	205	\N
3112	Jubbada Hoose	JH	205	\N
3113	Mudug	MU	205	\N
3114	Nugaal	NU	205	\N
3115	Saneag	SA	205	\N
3116	Shabeellaha Dhexe	SD	205	\N
3117	Shabeellaha Hoose	SH	205	\N
3118	Sool	SO	205	\N
3119	Togdheer	TO	205	\N
3120	Woqooyi Galbeed	WO	205	\N
3121	Brokopondo	BR	206	\N
3122	Commewijne	CM	206	\N
3123	Coronie	CR	206	\N
3124	Marowijne	MA	206	\N
3125	Nickerie	NI	206	\N
3126	Paramaribo	PM	206	\N
3127	Para	PR	206	\N
3128	Saramacca	SA	206	\N
3129	Sipaliwini	SI	206	\N
3130	Wanica	WA	206	\N
3131	Northern Bahr el-Ghazal	BN	207	\N
3132	Western Bahr el-Ghazal	BW	207	\N
3133	Central Equatoria	EC	207	\N
3134	Eastern Equatoria	EE8	207	\N
3135	Western Equatoria	EW	207	\N
3136	Jonglei	JG	207	\N
3137	Lakes	LK	207	\N
3138	Upper Nile	NU	207	\N
3139	Unity	UY	207	\N
3140	Warrap	WR	207	\N
3141	Príncipe	P	208	\N
3142	São Tomé	S	208	\N
3143	Ahuachapán	AH	209	\N
3144	Cabañas	CA	209	\N
3145	Chalatenango	CH	209	\N
3146	Cuscatlán	CU	209	\N
3147	La Libertad	LI	209	\N
3148	Morazán	MO	209	\N
3149	La Paz	PA	209	\N
3150	Santa Ana	SA	209	\N
3151	San Miguel	SM	209	\N
3152	Sonsonate	SO	209	\N
3153	San Salvador	SS	209	\N
3154	San Vicente	SV	209	\N
3155	La Unión	UN	209	\N
3156	Usulután	US	209	\N
3157	Dimashq	DI	211	\N
3158	Dar'a	DR	211	\N
3159	Dayr az Zawr	DY	211	\N
3160	Al Hasakah	HA	211	\N
3161	Homs	HI	211	\N
3162	Halab	HL	211	\N
3163	Hamah	HM	211	\N
3164	Idlib	ID	211	\N
3165	Al Ladhiqiyah	LA	211	\N
3166	Al Qunaytirah	QU	211	\N
3167	Ar Raqqah	RA	211	\N
3168	Rif Dimashq	RD	211	\N
3169	As Suwayda'	SU	211	\N
3170	Tartus	TA	211	\N
3171	Hhohho	HH	212	\N
3172	Lubombo	LU	212	\N
3173	Manzini	MA	212	\N
3174	Shiselweni	SH	212	\N
3175	Al Baṭḩah	BA	214	\N
3176	Baḩr al Ghazāl	BG	214	\N
3177	Būrkū	BO	214	\N
3178	Shārī Bāqirmī	CB	214	\N
3179	Innīdī	EN	214	\N
3180	Qīrā	GR	214	\N
3181	Ḥajjar Lamīs	HL	214	\N
3182	Kānim	KA	214	\N
3183	Al Buḩayrah	LC	214	\N
3184	Lūqūn al Gharbī	LO	214	\N
3185	Lūqūn ash Sharqī	LR	214	\N
3186	Māndūl	MA	214	\N
3187	Shārī al Awsaṭ	MC	214	\N
3188	Māyū Kībbī ash Sharqī	ME	214	\N
3189	Māyū Kībbī al Gharbī	MO	214	\N
3190	Madīnat Injamīnā	ND	214	\N
3191	Waddāy	OD	214	\N
3192	Salāmāt	SA	214	\N
3193	Sīlā	SI	214	\N
3194	Tānjilī	TA	214	\N
3195	Tibastī	TI	214	\N
3196	Wādī Fīrā	WF	214	\N
3197	Région du Centre	C	216	\N
3198	Région de la Kara	K	216	\N
3199	Région Maritime	M	216	\N
3200	Région des Plateaux	P	216	\N
3201	Région des Savannes	S	216	\N
3202	Krung Thep Maha Nakhon Bangkok	10	217	\N
3203	Samut Prakan	11	217	\N
3204	Nonthaburi	12	217	\N
3205	Pathum Thani	13	217	\N
3206	Phra Nakhon Si Ayutthaya	14	217	\N
3207	Ang Thong	15	217	\N
3208	Lop Buri	16	217	\N
3209	Sing Buri	17	217	\N
3210	Chai Nat	18	217	\N
3211	Saraburi	19	217	\N
3212	Chon Buri	20	217	\N
3213	Rayong	21	217	\N
3214	Chanthaburi	22	217	\N
3215	Trat	23	217	\N
3216	Chachoengsao	24	217	\N
3217	Prachin Buri	25	217	\N
3218	Nakhon Nayok	26	217	\N
3219	Sa Kaeo	27	217	\N
3220	Nakhon Ratchasima	30	217	\N
3221	Buri Ram	31	217	\N
3222	Surin	32	217	\N
3223	Si Sa Ket	33	217	\N
3224	Ubon Ratchathani	34	217	\N
3225	Yasothon	35	217	\N
3226	Chaiyaphum	36	217	\N
3227	Amnat Charoen	37	217	\N
3228	Nong Bua Lam Phu	39	217	\N
3229	Khon Kaen	40	217	\N
3230	Udon Thani	41	217	\N
3231	Loei	42	217	\N
3232	Nong Khai	43	217	\N
3233	Maha Sarakham	44	217	\N
3234	Roi Et	45	217	\N
3235	Kalasin	46	217	\N
3236	Sakon Nakhon	47	217	\N
3237	Nakhon Phanom	48	217	\N
3238	Mukdahan	49	217	\N
3239	Chiang Mai	50	217	\N
3240	Lamphun	51	217	\N
3241	Lampang	52	217	\N
3242	Uttaradit	53	217	\N
3243	Phrae	54	217	\N
3244	Nan	55	217	\N
3245	Phayao	56	217	\N
3246	Chiang Rai	57	217	\N
3247	Mae Hong Son	58	217	\N
3248	Nakhon Sawan	60	217	\N
3249	Uthai Thani	61	217	\N
3250	Kamphaeng Phet	62	217	\N
3251	Tak	63	217	\N
3252	Sukhothai	64	217	\N
3253	Phitsanulok	65	217	\N
3254	Phichit	66	217	\N
3255	Phetchabun	67	217	\N
3256	Ratchaburi	70	217	\N
3257	Kanchanaburi	71	217	\N
3258	Suphan Buri	72	217	\N
3259	Nakhon Pathom	73	217	\N
3260	Samut Sakhon	74	217	\N
3261	Samut Songkhram	75	217	\N
3262	Phetchaburi	76	217	\N
3263	Prachuap Khiri Khan	77	217	\N
3264	Nakhon Si Thammarat	80	217	\N
3265	Krabi	81	217	\N
3266	Phangnga	82	217	\N
3267	Phuket	83	217	\N
3268	Surat Thani	84	217	\N
3269	Ranong	85	217	\N
3270	Chumphon	86	217	\N
3271	Songkhla	90	217	\N
3272	Satun	91	217	\N
3273	Trang	92	217	\N
3274	Phatthalung	93	217	\N
3275	Pattani	94	217	\N
3276	Yala	95	217	\N
3277	Narathiwat	96	217	\N
3278	Phatthaya	S	217	\N
3279	Gorno-Badakhshan	GB	218	\N
3280	Khatlon	KT	218	\N
3281	Sughd	SU	218	\N
3282	Aileu	AL	220	\N
3283	Ainaro	AN	220	\N
3284	Baucau	BA	220	\N
3285	Bobonaro	BO	220	\N
3286	Cova Lima	CO	220	\N
3287	Díli	DI	220	\N
3288	Ermera	ER	220	\N
3289	Lautem	LA	220	\N
3290	Liquiça	LI	220	\N
3291	Manufahi	MF	220	\N
3292	Manatuto	MT	220	\N
3293	Oecussi	OE	220	\N
3294	Viqueque	VI	220	\N
3295	Ahal	A	221	\N
3296	Balkan	B	221	\N
3297	Daşoguz	D	221	\N
3298	Lebap	L	221	\N
3299	Mary	M	221	\N
3300	Aşgabat	S	221	\N
3301	Tunis	11	222	\N
3302	Ariana	12	222	\N
3303	Ben Arous	13	222	\N
3304	La Manouba	14	222	\N
3305	Nabeul	21	222	\N
3306	Zaghouan	22	222	\N
3307	Bizerte	23	222	\N
3308	Béja	31	222	\N
3309	Jendouba	32	222	\N
3310	Le Kef	33	222	\N
3311	Siliana	34	222	\N
3312	Kairouan	41	222	\N
3313	Kasserine	42	222	\N
3314	Sidi Bouzid	43	222	\N
3315	Sousse	51	222	\N
3316	Monastir	52	222	\N
3317	Mahdia	53	222	\N
3318	Sfax	61	222	\N
3319	Gafsa	71	222	\N
3320	Tozeur	72	222	\N
3321	Kebili	73	222	\N
3322	Gabès	81	222	\N
3323	Medenine	82	222	\N
3324	Tataouine	83	222	\N
3325	'Eua	01	223	\N
3326	Ha'apai	02	223	\N
3327	Niuas	03	223	\N
3328	Tongatapu	04	223	\N
3329	Vava'u	05	223	\N
3330	Adana	01	224	\N
3331	Adıyaman	02	224	\N
3332	Afyonkarahisar	03	224	\N
3333	Ağrı	04	224	\N
3334	Amasya	05	224	\N
3335	Ankara	06	224	\N
3336	Antalya	07	224	\N
3337	Artvin	08	224	\N
3338	Aydın	09	224	\N
3339	Balıkesir	10	224	\N
3340	Bilecik	11	224	\N
3341	Bingöl	12	224	\N
3342	Bitlis	13	224	\N
3343	Bolu	14	224	\N
3344	Burdur	15	224	\N
3345	Bursa	16	224	\N
3346	Çanakkale	17	224	\N
3347	Çankırı	18	224	\N
3348	Çorum	19	224	\N
3349	Denizli	20	224	\N
3350	Diyarbakır	21	224	\N
3351	Edirne	22	224	\N
3352	Elazığ	23	224	\N
3353	Erzincan	24	224	\N
3354	Erzurum	25	224	\N
3355	Eskişehir	26	224	\N
3356	Gaziantep	27	224	\N
3357	Giresun	28	224	\N
3358	Gümüşhane	29	224	\N
3359	Hakkâri	30	224	\N
3360	Hatay	31	224	\N
3361	Isparta	32	224	\N
3362	Mersin	33	224	\N
3363	İstanbul	34	224	\N
3364	İzmir	35	224	\N
3365	Kars	36	224	\N
3366	Kastamonu	37	224	\N
3367	Kayseri	38	224	\N
3368	Kırklareli	39	224	\N
3369	Kırşehir	40	224	\N
3370	Kocaeli	41	224	\N
3371	Konya	42	224	\N
3372	Kütahya	43	224	\N
3373	Malatya	44	224	\N
3374	Manisa	45	224	\N
3375	Kahramanmaraş	46	224	\N
3376	Mardin	47	224	\N
3377	Muğla	48	224	\N
3378	Muş	49	224	\N
3379	Nevşehir	50	224	\N
3380	Niğde	51	224	\N
3381	Ordu	52	224	\N
3382	Rize	53	224	\N
3383	Sakarya	54	224	\N
3384	Samsun	55	224	\N
3385	Siirt	56	224	\N
3386	Sinop	57	224	\N
3387	Sivas	58	224	\N
3388	Tekirdağ	59	224	\N
3389	Tokat	60	224	\N
3390	Trabzon	61	224	\N
3391	Tunceli	62	224	\N
3392	Şanlıurfa	63	224	\N
3393	Uşak	64	224	\N
3394	Van	65	224	\N
3395	Yozgat	66	224	\N
3396	Zonguldak	67	224	\N
3397	Aksaray	68	224	\N
3398	Bayburt	69	224	\N
3399	Karaman	70	224	\N
3400	Kırıkkale	71	224	\N
3401	Batman	72	224	\N
3402	Şırnak	73	224	\N
3403	Bartın	74	224	\N
3404	Ardahan	75	224	\N
3405	Iğdır	76	224	\N
3406	Yalova	77	224	\N
3407	Karabük	78	224	\N
3408	Kilis	79	224	\N
3409	Osmaniye	80	224	\N
3410	Düzce	81	224	\N
3411	Arima	ARI	225	\N
3412	Chaguanas	CHA	225	\N
3413	Couva-Tabaquite-Talparo	CTT	225	\N
3414	Diego Martin	DMN	225	\N
3415	Eastern Tobago	ETO	225	\N
3416	Penal-Debe	PED	225	\N
3417	Port of Spain	POS	225	\N
3418	Princes Town	PRT	225	\N
3419	Point Fortin	PTF	225	\N
3420	Rio Claro-Mayaro	RCM	225	\N
3421	San Fernando	SFO	225	\N
3422	Sangre Grande	SGE	225	\N
3423	Siparia	SIP	225	\N
3424	San Juan-Laventille	SJL	225	\N
3425	Tunapuna-Piarco	TUP	225	\N
3426	Western Tobago	WTO	225	\N
3427	Funafuti	FUN	226	\N
3428	Niutao	NIT	226	\N
3429	Nukufetau	NKF	226	\N
3430	Nukulaelae	NKL	226	\N
3431	Nanumea	NMA	226	\N
3432	Nanumanga	NMG	226	\N
3433	Nui	NUI	226	\N
3434	Vaitupu	VAI	226	\N
3435	Changhua	CHA	227	\N
3436	Chiay City	CYI	227	\N
3437	Chiayi	CYQ	227	\N
3438	Hsinchu	HSQ	227	\N
3439	Hsinchui City	HSZ	227	\N
3440	Hualien	HUA	227	\N
3441	Ilan	ILA	227	\N
3442	Keelung City	KEE	227	\N
3443	Kaohsiung City	KHH	227	\N
3444	Kaohsiung	KHQ	227	\N
3445	Miaoli	MIA	227	\N
3446	Nantou	NAN	227	\N
3447	Penghu	PEN	227	\N
3448	Pingtung	PIF	227	\N
3449	Taoyuan	TAO	227	\N
3450	Tainan City	TNN	227	\N
3451	Tainan	TNQ	227	\N
3452	Taipei City	TPE	227	\N
3453	Taipei	TPQ	227	\N
3454	Taitung	TTT	227	\N
3455	Taichung City	TXG	227	\N
3456	Taichung	TXQ	227	\N
3457	Yunlin	YUN	227	\N
3458	Arusha	01	228	\N
3459	Dar-es-Salaam	02	228	\N
3460	Dodoma	03	228	\N
3461	Iringa	04	228	\N
3462	Kagera	05	228	\N
3463	Kaskazini Pemba	06	228	\N
3464	Kaskazini Unguja	07	228	\N
3465	Kigoma	08	228	\N
3466	Kilimanjaro	09	228	\N
3467	Kusini Pemba	10	228	\N
3468	Kusini Unguja	11	228	\N
3469	Lindi	12	228	\N
3470	Mara	13	228	\N
3471	Mbeya	14	228	\N
3472	Mjini Magharibi	15	228	\N
3473	Morogoro	16	228	\N
3474	Mtwara	17	228	\N
3475	Mwanza	18	228	\N
3476	Pwani	19	228	\N
3477	Rukwa	20	228	\N
3478	Ruvuma	21	228	\N
3479	Shinyanga	22	228	\N
3480	Singida	23	228	\N
3481	Tabora	24	228	\N
3482	Tanga	25	228	\N
3483	Manyara	26	228	\N
3484	Vinnyts'ka Oblast'	05	229	\N
3485	Volyns'ka Oblast'	07	229	\N
3486	Luhans'ka Oblast'	09	229	\N
3487	Dnipropetrovs'ka Oblast'	12	229	\N
3488	Donets'ka Oblast'	14	229	\N
3489	Zhytomyrs'ka Oblast'	18	229	\N
3490	Zakarpats'ka Oblast'	21	229	\N
3491	Zaporiz'ka Oblast'	23	229	\N
3492	Ivano-Frankivs'ka Oblast'	26	229	\N
3493	Kyïvs'ka mis'ka rada	30	229	\N
3494	Kyïvs'ka Oblast'	32	229	\N
3495	Kirovohrads'ka Oblast'	35	229	\N
3496	Sevastopol	40	229	\N
3497	Respublika Krym	43	229	\N
3498	L'vivs'ka Oblast'	46	229	\N
3499	Mykolaïvs'ka Oblast'	48	229	\N
3500	Odes'ka Oblast'	51	229	\N
3501	Poltavs'ka Oblast'	53	229	\N
3502	Rivnens'ka Oblast'	56	229	\N
3503	Sums 'ka Oblast'	59	229	\N
3504	Ternopil's'ka Oblast'	61	229	\N
3505	Kharkivs'ka Oblast'	63	229	\N
3506	Khersons'ka Oblast'	65	229	\N
3507	Khmel'nyts'ka Oblast'	68	229	\N
3508	Cherkas'ka Oblast'	71	229	\N
3509	Chernihivs'ka Oblast'	74	229	\N
3510	Chernivets'ka Oblast'	77	229	\N
3511	Central	C	230	\N
3512	Eastern	E	230	\N
3513	Northern	N	230	\N
3514	Western	W	230	\N
3515	Johnston Atoll	67	231	\N
3516	Midway Islands	71	231	\N
3517	Navassa Island	76	231	\N
3518	Wake Island	79	231	\N
3519	Baker Island	81	231	\N
3520	Howland Island	84	231	\N
3521	Jarvis Island	86	231	\N
3522	Kingman Reef	89	231	\N
3523	Palmyra Atoll	95	231	\N
3524	Alaska	AK	232	\N
3525	Alabama	AL	232	\N
3526	Arkansas	AR	232	\N
3527	American Samoa	AS	232	\N
3528	Arizona	AZ	232	\N
3529	California	CA	232	\N
3530	Colorado	CO	232	\N
3531	Connecticut	CT	232	\N
3532	District of Columbia	DC	232	\N
3533	Delaware	DE	232	\N
3534	Florida	FL	232	\N
3535	Georgia	GA	232	\N
3536	Guam	GU	232	\N
3537	Hawaii	HI	232	\N
3538	Iowa	IA	232	\N
3539	Idaho	ID	232	\N
3540	Illinois	IL	232	\N
3541	Indiana	IN	232	\N
3542	Kansas	KS	232	\N
3543	Kentucky	KY	232	\N
3544	Louisiana	LA	232	\N
3545	Massachusetts	MA	232	\N
3546	Maryland	MD	232	\N
3547	Maine	ME	232	\N
3548	Michigan	MI	232	\N
3549	Minnesota	MN	232	\N
3550	Missouri	MO	232	\N
3551	Northern Mariana Islands	MP	232	\N
3552	Mississippi	MS	232	\N
3553	Montana	MT	232	\N
3554	North Carolina	NC	232	\N
3555	North Dakota	ND	232	\N
3556	Nebraska	NE	232	\N
3557	New Hampshire	NH	232	\N
3558	New Jersey	NJ	232	\N
3559	New Mexico	NM	232	\N
3560	Nevada	NV	232	\N
3561	New York	NY	232	\N
3562	Ohio	OH	232	\N
3563	Oklahoma	OK	232	\N
3564	Oregon	OR	232	\N
3565	Pennsylvania	PA	232	\N
3566	Puerto Rico	PR	232	\N
3567	Rhode Island	RI	232	\N
3568	South Carolina	SC	232	\N
3569	South Dakota	SD	232	\N
3570	Tennessee	TN	232	\N
3571	Texas	TX	232	\N
3572	United States Minor Outlying Islands	UM	232	\N
3573	Utah	UT	232	\N
3574	Virginia	VA	232	\N
3575	Virgin Islands	VI	232	\N
3576	Vermont	VT	232	\N
3577	Washington	WA	232	\N
3578	Wisconsin	WI	232	\N
3579	West Virginia	WV	232	\N
3580	Wyoming	WY	232	\N
3581	Armed Forces Americas (except Canada)	AA	232	\N
3582	Armed Forces Africa, Canada, Europe, Middle East	AE	232	\N
3583	Armed Forces Pacific	AP	232	\N
3584	Artigas	AR	233	\N
3585	Canelones	CA	233	\N
3586	Cerro Largo	CL	233	\N
3587	Colonia	CO	233	\N
3588	Durazno	DU	233	\N
3589	Florida	FD	233	\N
3590	Flores	FS	233	\N
3591	Lavalleja	LA	233	\N
3592	Maldonado	MA	233	\N
3593	Montevideo	MO	233	\N
3594	Paysandú	PA	233	\N
3595	Río Negro	RN	233	\N
3596	Rocha	RO	233	\N
3597	Rivera	RV	233	\N
3598	Salto	SA	233	\N
3599	San José	SJ	233	\N
3600	Soriano	SO	233	\N
3601	Tacuarembó	TA	233	\N
3602	Treinta y Tres	TT	233	\N
3603	Andijon	AN	234	\N
3604	Buxoro	BU	234	\N
3605	Farg'ona	FA	234	\N
3606	Jizzax	JI	234	\N
3607	Namangan	NG	234	\N
3608	Navoiy	NW	234	\N
3609	Qashqadaryo	QA	234	\N
3610	Qoraqalpog'iston Respublikasi	QR	234	\N
3611	Samarqand	SA	234	\N
3612	Sirdaryo	SI	234	\N
3613	Surxondaryo	SU	234	\N
3614	Toshkent	TK	234	\N
3615	Toshkent	TO	234	\N
3616	Xorazm	XO	234	\N
3617	Charlotte	01	236	\N
3618	Saint Andrew	02	236	\N
3619	Saint David	03	236	\N
3620	Saint George	04	236	\N
3621	Saint Patrick	05	236	\N
3622	Grenadines	06	236	\N
3623	Distrito Federal	A	237	\N
3624	Anzoátegui	B	237	\N
3625	Apure	C	237	\N
3626	Aragua	D	237	\N
3627	Barinas	E	237	\N
3628	Bolívar	F	237	\N
3629	Carabobo	G	237	\N
3630	Cojedes	H	237	\N
3631	Falcón	I	237	\N
3632	Guárico	J	237	\N
3633	Lara	K	237	\N
3634	Mérida	L	237	\N
3635	Miranda	M	237	\N
3636	Monagas	N	237	\N
3637	Nueva Esparta	O	237	\N
3638	Portuguesa	P	237	\N
3639	Sucre	R	237	\N
3640	Táchira	S	237	\N
3641	Trujillo	T	237	\N
3642	Yaracuy	U	237	\N
3643	Zulia	V	237	\N
3644	Dependencias Federales	W	237	\N
3645	Vargas	X	237	\N
3646	Delta Amacuro	Y	237	\N
3647	Amazonas	Z	237	\N
3648	Lai Châu	01	240	\N
3649	Lào Cai	02	240	\N
3650	Hà Giang	03	240	\N
3651	Cao Bằng	04	240	\N
3652	Sơn La	05	240	\N
3653	Yên Bái	06	240	\N
3654	Tuyên Quang	07	240	\N
3655	Lạng Sơn	09	240	\N
3656	Quảng Ninh	13	240	\N
3657	Hoà Bình	14	240	\N
3658	Hà Tây	15	240	\N
3659	Ninh Bình	18	240	\N
3660	Thái Bình	20	240	\N
3661	Thanh Hóa	21	240	\N
3662	Nghệ An	22	240	\N
3663	Hà Tỉnh	23	240	\N
3664	Quảng Bình	24	240	\N
3665	Quảng Trị	25	240	\N
3666	Thừa Thiên-Huế	26	240	\N
3667	Quảng Nam	27	240	\N
3668	Kon Tum	28	240	\N
3669	Quảng Ngãi	29	240	\N
3670	Gia Lai	30	240	\N
3671	Bình Định	31	240	\N
3672	Phú Yên	32	240	\N
3673	Đắc Lắk	33	240	\N
3674	Khánh Hòa	34	240	\N
3675	Lâm Đồng	35	240	\N
3676	Ninh Thuận	36	240	\N
3677	Tây Ninh	37	240	\N
3678	Đồng Nai	39	240	\N
3679	Bình Thuận	40	240	\N
3680	Long An	41	240	\N
3681	Bà Rịa-Vũng Tàu	43	240	\N
3682	An Giang	44	240	\N
3683	Đồng Tháp	45	240	\N
3684	Tiền Giang	46	240	\N
3685	Kiên Giang	47	240	\N
3686	Vĩnh Long	49	240	\N
3687	Bến Tre	50	240	\N
3688	Trà Vinh	51	240	\N
3689	Sóc Trăng	52	240	\N
3690	Bắc Kạn	53	240	\N
3691	Bắc Giang	54	240	\N
3692	Bạc Liêu	55	240	\N
3693	Bắc Ninh	56	240	\N
3694	Bình Dương	57	240	\N
3695	Bình Phước	58	240	\N
3696	Cà Mau	59	240	\N
3697	Hải Duong	61	240	\N
3698	Hà Nam	63	240	\N
3699	Hưng Yên	66	240	\N
3700	Nam Định	67	240	\N
3701	Phú Thọ	68	240	\N
3702	Thái Nguyên	69	240	\N
3703	Vĩnh Phúc	70	240	\N
3704	Điện Biên	71	240	\N
3705	Đắk Nông	72	240	\N
3706	Hậu Giang	73	240	\N
3707	Cần Thơ	CT	240	\N
3708	Đà Nẵng	DN	240	\N
3709	Hà Nội	HN	240	\N
3710	Hải Phòng	HP	240	\N
3711	Hồ Chí Minh [Sài Gòn]	SG	240	\N
3712	Malampa	MAP	241	\N
3713	Pénama	PAM	241	\N
3714	Sanma	SAM	241	\N
3715	Shéfa	SEE	241	\N
3716	Taféa	TAE	241	\N
3717	Torba	TOB	241	\N
3718	A'ana	AA	243	\N
3719	Aiga-i-le-Tai	AL	243	\N
3720	Atua	AT	243	\N
3721	Fa'asaleleaga	FA	243	\N
3722	Gaga'emauga	GE	243	\N
3723	Gagaifomauga	GI	243	\N
3724	Palauli	PA	243	\N
3725	Satupa'itea	SA	243	\N
3726	Tuamasaga	TU	243	\N
3727	Va'a-o-Fonoti	VF	243	\N
3728	Vaisigano	VS	243	\N
3729	Abyān	AB	244	\N
3730	'Adan	AD	244	\N
3731	'Amrān	AM	244	\N
3732	Al Bayḑā'	BA	244	\N
3733	Aḑ Ḑāli‘	DA	244	\N
3734	Dhamār	DH	244	\N
3735	Ḩaḑramawt	HD	244	\N
3736	Ḩajjah	HJ	244	\N
3737	Ibb	IB	244	\N
3738	Al Jawf	JA	244	\N
3739	Laḩij	LA	244	\N
3740	Ma'rib	MA	244	\N
3741	Al Mahrah	MR	244	\N
3742	Al Ḩudaydah	MU	244	\N
3743	Al Maḩwīt	MW	244	\N
3744	Raymah	RA	244	\N
3745	Şa'dah	SD	244	\N
3746	Shabwah	SH	244	\N
3747	Şan'ā'	SN	244	\N
3748	Tā'izz	TA	244	\N
3749	Eastern Cape	EC	246	\N
3750	Free State	FS	246	\N
3751	Gauteng	GP	246	\N
3752	Limpopo	LP	246	\N
3753	Mpumalanga	MP	246	\N
3754	Northern Cape	NC	246	\N
3755	North-West (South Africa)	NW	246	\N
3756	Western Cape	WC	246	\N
3757	Kwazulu-Natal	ZN	246	\N
3758	Western	01	247	\N
3759	Central	02	247	\N
3760	Eastern	03	247	\N
3761	Luapula	04	247	\N
3762	Northern	05	247	\N
3763	North-Western	06	247	\N
3764	Southern (Zambia)	07	247	\N
3765	Copperbelt	08	247	\N
3766	Lusaka	09	247	\N
3767	Bulawayo	BU	248	\N
3768	Harare	HA	248	\N
3769	Manicaland	MA	248	\N
3770	Mashonaland Central	MC	248	\N
3771	Mashonaland East	ME	248	\N
3772	Midlands	MI	248	\N
3773	Matabeleland North	MN	248	\N
3774	Matabeleland South	MS	248	\N
3775	Masvingo	MV	248	\N
3776	Mashonaland West	MW	248	\N
\.


--
-- Name: spree_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_states_id_seq', 3776, true);


--
-- Data for Name: spree_stock_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_stock_items (id, stock_location_id, variant_id, count_on_hand, created_at, updated_at, backorderable, deleted_at) FROM stdin;
23	1	23	10	2015-03-31 08:20:30.076896	2015-03-31 08:20:31.176815	t	\N
24	1	24	10	2015-03-31 08:20:30.172085	2015-03-31 08:20:31.252873	t	\N
25	1	25	10	2015-03-31 08:20:30.273007	2015-03-31 08:20:31.304527	t	\N
26	1	26	10	2015-03-31 08:20:30.39522	2015-03-31 08:20:31.357783	t	\N
3	1	3	10	2015-03-31 08:20:21.116442	2015-03-31 08:20:31.414674	t	\N
1	1	1	10	2015-03-31 08:20:20.531781	2015-03-31 08:20:31.473402	t	\N
2	1	2	10	2015-03-31 08:20:20.856874	2015-03-31 08:20:31.522142	t	\N
4	1	4	10	2015-03-31 08:20:21.394092	2015-03-31 08:20:31.568043	t	\N
17	1	17	10	2015-03-31 08:20:29.452759	2015-03-31 08:20:31.625111	t	\N
13	1	13	10	2015-03-31 08:20:23.795788	2015-03-31 08:20:31.678649	t	\N
5	1	5	10	2015-03-31 08:20:21.633102	2015-03-31 08:20:31.809203	t	\N
14	1	14	10	2015-03-31 08:20:24.068593	2015-03-31 08:20:31.868315	t	\N
7	1	7	10	2015-03-31 08:20:22.194591	2015-03-31 08:20:31.924985	t	\N
6	1	6	10	2015-03-31 08:20:21.899011	2015-03-31 08:20:31.978381	t	\N
8	1	8	10	2015-03-31 08:20:22.451208	2015-03-31 08:20:32.037233	t	\N
18	1	18	10	2015-03-31 08:20:29.567451	2015-03-31 08:20:32.092135	t	\N
15	1	15	10	2015-03-31 08:20:24.327988	2015-03-31 08:20:32.144985	t	\N
9	1	9	10	2015-03-31 08:20:22.712769	2015-03-31 08:20:32.205444	t	\N
16	1	16	10	2015-03-31 08:20:24.571363	2015-03-31 08:20:32.268011	t	\N
19	1	19	10	2015-03-31 08:20:29.675752	2015-03-31 08:20:32.325151	t	\N
10	1	10	10	2015-03-31 08:20:22.980333	2015-03-31 08:20:32.37745	t	\N
11	1	11	10	2015-03-31 08:20:23.252786	2015-03-31 08:20:32.42298	t	\N
12	1	12	10	2015-03-31 08:20:23.545038	2015-03-31 08:20:32.467718	t	\N
20	1	20	10	2015-03-31 08:20:29.774326	2015-03-31 08:20:32.520607	t	\N
21	1	21	10	2015-03-31 08:20:29.871032	2015-03-31 08:20:32.5679	t	\N
22	1	22	10	2015-03-31 08:20:29.978692	2015-03-31 08:20:32.612542	t	\N
\.


--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_stock_items_id_seq', 26, true);


--
-- Data for Name: spree_stock_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_stock_locations (id, name, created_at, updated_at, "default", address1, address2, city, state_id, state_name, country_id, zipcode, phone, active, backorderable_default, propagate_all_variants, admin_name) FROM stdin;
1	default	2015-03-31 08:19:45.677987	2015-03-31 08:19:45.677987	f	\N	\N	\N	\N	\N	\N	\N	\N	t	t	t	\N
\.


--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_stock_locations_id_seq', 1, true);


--
-- Data for Name: spree_stock_movements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_stock_movements (id, stock_item_id, quantity, action, created_at, updated_at, originator_id, originator_type) FROM stdin;
1	23	10	\N	2015-03-31 08:20:31.058865	2015-03-31 08:20:31.058865	\N	\N
2	24	10	\N	2015-03-31 08:20:31.231269	2015-03-31 08:20:31.231269	\N	\N
3	25	10	\N	2015-03-31 08:20:31.28664	2015-03-31 08:20:31.28664	\N	\N
4	26	10	\N	2015-03-31 08:20:31.342993	2015-03-31 08:20:31.342993	\N	\N
5	3	10	\N	2015-03-31 08:20:31.397929	2015-03-31 08:20:31.397929	\N	\N
6	1	10	\N	2015-03-31 08:20:31.456037	2015-03-31 08:20:31.456037	\N	\N
7	2	10	\N	2015-03-31 08:20:31.508582	2015-03-31 08:20:31.508582	\N	\N
8	4	10	\N	2015-03-31 08:20:31.553419	2015-03-31 08:20:31.553419	\N	\N
9	17	10	\N	2015-03-31 08:20:31.608759	2015-03-31 08:20:31.608759	\N	\N
10	13	10	\N	2015-03-31 08:20:31.665272	2015-03-31 08:20:31.665272	\N	\N
11	5	10	\N	2015-03-31 08:20:31.794399	2015-03-31 08:20:31.794399	\N	\N
12	14	10	\N	2015-03-31 08:20:31.853058	2015-03-31 08:20:31.853058	\N	\N
13	7	10	\N	2015-03-31 08:20:31.907474	2015-03-31 08:20:31.907474	\N	\N
14	6	10	\N	2015-03-31 08:20:31.96371	2015-03-31 08:20:31.96371	\N	\N
15	8	10	\N	2015-03-31 08:20:32.021468	2015-03-31 08:20:32.021468	\N	\N
16	18	10	\N	2015-03-31 08:20:32.075071	2015-03-31 08:20:32.075071	\N	\N
17	15	10	\N	2015-03-31 08:20:32.131372	2015-03-31 08:20:32.131372	\N	\N
18	9	10	\N	2015-03-31 08:20:32.175741	2015-03-31 08:20:32.175741	\N	\N
19	16	10	\N	2015-03-31 08:20:32.254807	2015-03-31 08:20:32.254807	\N	\N
20	19	10	\N	2015-03-31 08:20:32.310383	2015-03-31 08:20:32.310383	\N	\N
21	10	10	\N	2015-03-31 08:20:32.365328	2015-03-31 08:20:32.365328	\N	\N
22	11	10	\N	2015-03-31 08:20:32.409496	2015-03-31 08:20:32.409496	\N	\N
23	12	10	\N	2015-03-31 08:20:32.453554	2015-03-31 08:20:32.453554	\N	\N
24	20	10	\N	2015-03-31 08:20:32.509769	2015-03-31 08:20:32.509769	\N	\N
25	21	10	\N	2015-03-31 08:20:32.553692	2015-03-31 08:20:32.553692	\N	\N
26	22	10	\N	2015-03-31 08:20:32.598683	2015-03-31 08:20:32.598683	\N	\N
\.


--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_stock_movements_id_seq', 26, true);


--
-- Data for Name: spree_stock_transfers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_stock_transfers (id, type, reference, source_location_id, destination_location_id, created_at, updated_at, number) FROM stdin;
\.


--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_stock_transfers_id_seq', 1, false);


--
-- Data for Name: spree_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_stores (id, name, url, meta_description, meta_keywords, seo_title, mail_from_address, default_currency, code, "default", created_at, updated_at) FROM stdin;
1	Spree Demo Site	http://localhost:3000				spree@example.com	\N	spree	t	2015-03-31 08:19:56.319413	2015-03-31 14:09:36.463908
\.


--
-- Name: spree_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_stores_id_seq', 1, true);


--
-- Data for Name: spree_tax_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_tax_categories (id, name, description, is_default, deleted_at, created_at, updated_at, tax_code) FROM stdin;
1	Clothing	\N	f	\N	2015-03-31 08:20:19.918594	2015-03-31 08:20:19.918594	\N
2	Food	\N	f	\N	2015-03-31 08:20:19.9624	2015-03-31 08:20:19.9624	\N
\.


--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_tax_categories_id_seq', 2, true);


--
-- Data for Name: spree_tax_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_tax_rates (id, amount, zone_id, tax_category_id, included_in_price, created_at, updated_at, name, show_rate_in_label, deleted_at) FROM stdin;
1	0.05000	2	1	f	2015-03-31 08:20:20.105203	2015-03-31 08:20:20.105203	North America	t	\N
\.


--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_tax_rates_id_seq', 1, true);


--
-- Data for Name: spree_taxonomies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_taxonomies (id, name, created_at, updated_at, "position") FROM stdin;
1	Categories	2015-03-31 08:20:24.792307	2015-03-31 08:20:47.369836	1
2	Brand	2015-03-31 08:20:24.889538	2015-03-31 08:20:47.369836	2
\.


--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_taxonomies_id_seq', 2, true);


--
-- Data for Name: spree_taxons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_taxons (id, parent_id, "position", name, permalink, taxonomy_id, lft, rgt, icon_file_name, icon_content_type, icon_file_size, icon_updated_at, description, created_at, updated_at, meta_title, meta_description, meta_keywords, depth) FROM stdin;
6	5	0	Shirts	categories/clothing/shirts	1	7	8	\N	\N	\N	\N	\N	2015-03-31 08:20:25.347022	2015-03-31 08:20:45.662636	\N	\N	\N	2
7	5	0	T-Shirts	categories/clothing/t-shirts	1	9	10	\N	\N	\N	\N	\N	2015-03-31 08:20:25.491841	2015-03-31 08:20:46.269037	\N	\N	\N	2
5	1	0	Clothing	categories/clothing	1	6	11	\N	\N	\N	\N	\N	2015-03-31 08:20:25.281181	2015-03-31 08:20:46.269037	\N	\N	\N	1
11	2	0	Rails	brand/rails	2	20	21	\N	\N	\N	\N	\N	2015-03-31 08:20:26.003733	2015-03-31 08:20:43.00783	\N	\N	\N	1
9	2	0	Apache	brand/apache	2	16	17	\N	\N	\N	\N	\N	2015-03-31 08:20:25.711478	2015-03-31 08:20:43.42823	\N	\N	\N	1
10	2	0	Spree	brand/spree	2	18	19	\N	\N	\N	\N	\N	2015-03-31 08:20:25.80964	2015-03-31 08:20:47.354417	\N	\N	\N	1
2	\N	0	Brand	brand	2	13	22	\N	\N	\N	\N	\N	2015-03-31 08:20:24.899017	2015-03-31 08:20:47.354417	\N	\N	\N	0
8	2	0	Ruby	brand/ruby	2	14	15	\N	\N	\N	\N	\N	2015-03-31 08:20:25.632706	2015-03-31 08:20:43.871015	\N	\N	\N	1
1	\N	0	Categories	categories	1	1	12	\N	\N	\N	\N	\N	2015-03-31 08:20:24.811698	2015-03-31 08:20:47.354417	\N	\N	\N	0
4	1	2	Mugs	categories/mugs	1	4	5	\N	\N	\N	\N	\N	2015-03-31 08:20:25.170202	2015-03-31 08:20:47.354417	\N	\N	\N	1
3	1	1	Bags	categories/bags	1	2	3	\N	\N	\N	\N	\N	2015-03-31 08:20:25.028466	2015-03-31 08:20:44.820071	\N	\N	\N	1
\.


--
-- Name: spree_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_taxons_id_seq', 11, true);


--
-- Data for Name: spree_taxons_promotion_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_taxons_promotion_rules (id, taxon_id, promotion_rule_id) FROM stdin;
\.


--
-- Name: spree_taxons_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_taxons_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_taxons_prototypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_taxons_prototypes (id, taxon_id, prototype_id) FROM stdin;
\.


--
-- Name: spree_taxons_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_taxons_prototypes_id_seq', 1, false);


--
-- Data for Name: spree_trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_trackers (id, analytics_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_trackers_id_seq', 1, false);


--
-- Data for Name: spree_user_authentications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_user_authentications (id, user_id, provider, uid, created_at, updated_at) FROM stdin;
1	2	facebook	883011825088173	2015-03-31 10:13:51.662178	2015-03-31 10:13:51.662178
3	4	google_oauth2	104577813728950688233	2015-03-31 12:11:53.6831	2015-03-31 12:11:53.6831
4	4	linkedin	GnpwTUREb_	2015-03-31 14:06:08.813065	2015-03-31 14:06:08.813065
\.


--
-- Name: spree_user_authentications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_user_authentications_id_seq', 4, true);


--
-- Data for Name: spree_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_users (id, encrypted_password, password_salt, email, remember_token, persistence_token, reset_password_token, perishable_token, sign_in_count, failed_attempts, last_request_at, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, login, ship_address_id, bill_address_id, authentication_token, unlock_token, locked_at, reset_password_sent_at, created_at, updated_at, spree_api_key, remember_created_at, deleted_at, confirmation_token, confirmed_at, confirmation_sent_at) FROM stdin;
1	8bd06340e380911dc5394fd22e9b4b21f74f202187682dc1a9296bbdb5e6d69c182a2e1a4b2a2eef1f00c82d2abd59221bb1a63ebf223f4a1bc447c9b053f898	zB38WubQX8usxPghwG2N	spree@example.com	\N	\N	\N	\N	2	0	\N	2015-03-31 09:55:49.878648	2015-03-31 08:33:23.980692	127.0.0.1	127.0.0.1	spree@example.com	\N	\N	\N	\N	\N	\N	2015-03-31 08:20:16.329317	2015-03-31 09:55:49.879987	abdd7369987a914581651182bc69696fbae31ed80d421ea7	\N	\N	\N	\N	\N
3	1dfa09f0f0d1406979e95ea754fa1c2a0defb6887147576fff74a7dc39418c8d830b2ac22a6274861a0a8d34cc5088b238bef079edf58220796e2de0497f8920	xczAsmpr74SoVTuQfEWu	da32b777-7d39-4a9c-8dab-6d52077709f1@example.net	\N	\N	\N	\N	1	0	\N	2015-03-31 10:55:56.124717	2015-03-31 10:55:56.124717	127.0.0.1	127.0.0.1	da32b777-7d39-4a9c-8dab-6d52077709f1@example.net	\N	\N	\N	\N	\N	\N	2015-03-31 10:55:56.087886	2015-03-31 11:35:25.30462	\N	\N	2015-03-31 11:35:25.297727	\N	\N	\N
4	b7f125f95a3f91e5139c6fbd6f4ff861816db86c2a39d5392028ca038038f9d8987c9a256fdd0c5a1baacdf703ad5b3493631b2b8753f4426339a79e5c1e7377	X4yv-sxsSjs2GSbpWws5	harish@ourdesignz.com	\N	\N	354jmL6yZgXso3QCtnyz	\N	4	0	\N	2015-03-31 14:10:48.57331	2015-03-31 14:10:32.820597	127.0.0.1	127.0.0.1	harish@ourdesignz.com	\N	\N	\N	\N	\N	\N	2015-03-31 12:11:53.680023	2015-03-31 14:10:48.57417	\N	\N	\N	\N	\N	\N
2	\N	\N	harish8verma@gmail.com	\N	\N	\N	\N	4	0	\N	2015-03-31 15:03:23.830474	2015-03-31 11:37:13.396257	127.0.0.1	127.0.0.1	harish8verma@gmail.com	\N	\N	\N	\N	\N	\N	2015-03-31 10:13:51.657588	2015-03-31 15:03:23.831717	\N	\N	\N	\N	\N	\N
\.


--
-- Name: spree_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_users_id_seq', 4, true);


--
-- Data for Name: spree_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_variants (id, sku, weight, height, width, depth, deleted_at, is_master, product_id, cost_price, "position", cost_currency, track_inventory, tax_category_id, updated_at, stock_items_count) FROM stdin;
10	SPR-00015	0.00	\N	\N	\N	\N	t	10	17.00	1	USD	t	\N	2015-03-31 08:20:45.350221	1
9	SPR-00013	0.00	\N	\N	\N	\N	t	9	17.00	1	USD	t	\N	2015-03-31 08:20:45.653116	1
8	SPR-00001	0.00	\N	\N	\N	\N	t	8	17.00	1	USD	t	\N	2015-03-31 08:20:46.256933	1
15	SPR-00016	0.00	\N	\N	\N	\N	t	15	15.00	1	USD	t	\N	2015-03-31 08:20:46.819364	1
17	ROR-00001	0.00	\N	\N	\N	\N	f	3	17.00	1	USD	t	\N	2015-03-31 08:20:33.426583	1
18	ROR-00002	0.00	\N	\N	\N	\N	f	3	17.00	2	USD	t	\N	2015-03-31 08:20:34.022092	1
16	SPR-00014	0.00	\N	\N	\N	\N	t	16	11.00	1	USD	t	\N	2015-03-31 08:20:47.342364	1
19	ROR-00003	0.00	\N	\N	\N	\N	f	3	17.00	3	USD	t	\N	2015-03-31 08:20:34.624428	1
20	ROR-00004	0.00	\N	\N	\N	\N	f	3	17.00	4	USD	t	\N	2015-03-31 08:20:35.187687	1
21	ROR-00005	0.00	\N	\N	\N	\N	f	3	17.00	5	USD	t	\N	2015-03-31 08:20:35.762613	1
22	ROR-00006	0.00	\N	\N	\N	\N	f	3	17.00	6	USD	t	\N	2015-03-31 08:20:36.346366	1
23	ROR-00007	0.00	\N	\N	\N	\N	f	3	17.00	7	USD	t	\N	2015-03-31 08:20:37.024091	1
24	ROR-00008	0.00	\N	\N	\N	\N	f	3	17.00	8	USD	t	\N	2015-03-31 08:20:37.635887	1
25	ROR-00009	0.00	\N	\N	\N	\N	f	3	17.00	9	USD	t	\N	2015-03-31 08:20:38.225895	1
26	ROR-00010	0.00	\N	\N	\N	\N	f	3	17.00	10	USD	t	\N	2015-03-31 08:20:38.814615	1
1	ROR-00011	0.00	\N	\N	\N	\N	t	1	17.00	1	USD	t	\N	2015-03-31 08:20:39.468465	1
2	ROR-00012	0.00	\N	\N	\N	\N	t	2	21.00	1	USD	t	\N	2015-03-31 08:20:39.760783	1
3	ROR-001	0.00	\N	\N	\N	\N	t	3	17.00	1	USD	t	\N	2015-03-31 08:20:40.3376	1
4	ROR-00013	0.00	\N	\N	\N	\N	t	4	17.00	1	USD	t	\N	2015-03-31 08:20:40.63479	1
13	ROR-00014	0.00	\N	\N	\N	\N	t	13	11.00	1	USD	t	\N	2015-03-31 08:20:41.216198	1
5	ROR-00015	0.00	\N	\N	\N	\N	t	5	17.00	1	USD	t	\N	2015-03-31 08:20:41.766472	1
14	ROR-00016	0.00	\N	\N	\N	\N	t	14	15.00	1	USD	t	\N	2015-03-31 08:20:42.997428	1
7	APC-00001	0.00	\N	\N	\N	\N	t	7	17.00	1	USD	t	\N	2015-03-31 08:20:43.416724	1
6	RUB-00001	0.00	\N	\N	\N	\N	t	6	17.00	1	USD	t	\N	2015-03-31 08:20:43.859521	1
12	SPR-00012	0.00	\N	\N	\N	\N	t	12	21.00	1	USD	t	\N	2015-03-31 08:20:44.167267	1
11	SPR-00011	0.00	\N	\N	\N	\N	t	11	13.00	1	USD	t	\N	2015-03-31 08:20:44.80913	1
\.


--
-- Name: spree_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_variants_id_seq', 26, true);


--
-- Data for Name: spree_zone_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_zone_members (id, zoneable_id, zoneable_type, zone_id, created_at, updated_at) FROM stdin;
1	179	Spree::Country	1	2015-03-31 08:20:15.48412	2015-03-31 08:20:15.48412
2	70	Spree::Country	1	2015-03-31 08:20:15.513015	2015-03-31 08:20:15.513015
3	183	Spree::Country	1	2015-03-31 08:20:15.533535	2015-03-31 08:20:15.533535
4	188	Spree::Country	1	2015-03-31 08:20:15.557463	2015-03-31 08:20:15.557463
5	57	Spree::Country	1	2015-03-31 08:20:15.579344	2015-03-31 08:20:15.579344
6	75	Spree::Country	1	2015-03-31 08:20:15.601673	2015-03-31 08:20:15.601673
7	201	Spree::Country	1	2015-03-31 08:20:15.624059	2015-03-31 08:20:15.624059
8	100	Spree::Country	1	2015-03-31 08:20:15.64433	2015-03-31 08:20:15.64433
9	199	Spree::Country	1	2015-03-31 08:20:15.768032	2015-03-31 08:20:15.768032
10	102	Spree::Country	1	2015-03-31 08:20:15.788457	2015-03-31 08:20:15.788457
11	12	Spree::Country	1	2015-03-31 08:20:15.801776	2015-03-31 08:20:15.801776
12	68	Spree::Country	1	2015-03-31 08:20:15.857127	2015-03-31 08:20:15.857127
13	110	Spree::Country	1	2015-03-31 08:20:15.8792	2015-03-31 08:20:15.8792
14	20	Spree::Country	1	2015-03-31 08:20:15.901395	2015-03-31 08:20:15.901395
15	196	Spree::Country	1	2015-03-31 08:20:15.922514	2015-03-31 08:20:15.922514
16	135	Spree::Country	1	2015-03-31 08:20:15.944333	2015-03-31 08:20:15.944333
17	22	Spree::Country	1	2015-03-31 08:20:15.955238	2015-03-31 08:20:15.955238
18	77	Spree::Country	1	2015-03-31 08:20:15.966349	2015-03-31 08:20:15.966349
19	133	Spree::Country	1	2015-03-31 08:20:15.978682	2015-03-31 08:20:15.978682
20	55	Spree::Country	1	2015-03-31 08:20:16.001135	2015-03-31 08:20:16.001135
21	134	Spree::Country	1	2015-03-31 08:20:16.023168	2015-03-31 08:20:16.023168
22	153	Spree::Country	1	2015-03-31 08:20:16.045599	2015-03-31 08:20:16.045599
23	59	Spree::Country	1	2015-03-31 08:20:16.066227	2015-03-31 08:20:16.066227
24	166	Spree::Country	1	2015-03-31 08:20:16.077459	2015-03-31 08:20:16.077459
25	64	Spree::Country	1	2015-03-31 08:20:16.101241	2015-03-31 08:20:16.101241
26	232	Spree::Country	2	2015-03-31 08:20:16.122482	2015-03-31 08:20:16.122482
27	38	Spree::Country	2	2015-03-31 08:20:16.145762	2015-03-31 08:20:16.145762
\.


--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_zone_members_id_seq', 27, true);


--
-- Data for Name: spree_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_zones (id, name, description, default_tax, zone_members_count, created_at, updated_at, kind) FROM stdin;
1	EU_VAT	Countries that make up the EU VAT zone.	f	25	2015-03-31 08:20:15.369191	2015-03-31 08:20:15.369191	\N
2	North America	USA + Canada	f	2	2015-03-31 08:20:15.43472	2015-03-31 08:20:15.43472	\N
\.


--
-- Name: spree_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_zones_id_seq', 2, true);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: spree_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_addresses
    ADD CONSTRAINT spree_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_adjustments
    ADD CONSTRAINT spree_adjustments_pkey PRIMARY KEY (id);


--
-- Name: spree_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_assets
    ADD CONSTRAINT spree_assets_pkey PRIMARY KEY (id);


--
-- Name: spree_authentication_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_authentication_methods
    ADD CONSTRAINT spree_authentication_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_calculators
    ADD CONSTRAINT spree_calculators_pkey PRIMARY KEY (id);


--
-- Name: spree_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_countries
    ADD CONSTRAINT spree_countries_pkey PRIMARY KEY (id);


--
-- Name: spree_credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_credit_cards
    ADD CONSTRAINT spree_credit_cards_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_customer_returns
    ADD CONSTRAINT spree_customer_returns_pkey PRIMARY KEY (id);


--
-- Name: spree_gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_gateways
    ADD CONSTRAINT spree_gateways_pkey PRIMARY KEY (id);


--
-- Name: spree_inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_inventory_units
    ADD CONSTRAINT spree_inventory_units_pkey PRIMARY KEY (id);


--
-- Name: spree_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_line_items
    ADD CONSTRAINT spree_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_log_entries
    ADD CONSTRAINT spree_log_entries_pkey PRIMARY KEY (id);


--
-- Name: spree_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_option_types
    ADD CONSTRAINT spree_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_option_values
    ADD CONSTRAINT spree_option_values_pkey PRIMARY KEY (id);


--
-- Name: spree_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_orders
    ADD CONSTRAINT spree_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_capture_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_payment_capture_events
    ADD CONSTRAINT spree_payment_capture_events_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_payment_methods
    ADD CONSTRAINT spree_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_payments
    ADD CONSTRAINT spree_payments_pkey PRIMARY KEY (id);


--
-- Name: spree_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_preferences
    ADD CONSTRAINT spree_preferences_pkey PRIMARY KEY (id);


--
-- Name: spree_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_prices
    ADD CONSTRAINT spree_prices_pkey PRIMARY KEY (id);


--
-- Name: spree_product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_product_option_types
    ADD CONSTRAINT spree_product_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_product_properties
    ADD CONSTRAINT spree_product_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_products
    ADD CONSTRAINT spree_products_pkey PRIMARY KEY (id);


--
-- Name: spree_products_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_products_taxons
    ADD CONSTRAINT spree_products_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_action_line_items
    ADD CONSTRAINT spree_promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_actions
    ADD CONSTRAINT spree_promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_categories
    ADD CONSTRAINT spree_promotion_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_rules
    ADD CONSTRAINT spree_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_promotions
    ADD CONSTRAINT spree_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_properties
    ADD CONSTRAINT spree_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_prototypes
    ADD CONSTRAINT spree_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_refund_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_refund_reasons
    ADD CONSTRAINT spree_refund_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_refunds
    ADD CONSTRAINT spree_refunds_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursement_credits
    ADD CONSTRAINT spree_reimbursement_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursement_types
    ADD CONSTRAINT spree_reimbursement_types_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursements
    ADD CONSTRAINT spree_reimbursements_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorization_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_return_authorization_reasons
    ADD CONSTRAINT spree_return_authorization_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_return_authorizations
    ADD CONSTRAINT spree_return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: spree_return_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_return_items
    ADD CONSTRAINT spree_return_items_pkey PRIMARY KEY (id);


--
-- Name: spree_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_roles
    ADD CONSTRAINT spree_roles_pkey PRIMARY KEY (id);


--
-- Name: spree_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_shipments
    ADD CONSTRAINT spree_shipments_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_categories
    ADD CONSTRAINT spree_shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_method_categories
    ADD CONSTRAINT spree_shipping_method_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_methods
    ADD CONSTRAINT spree_shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_rates
    ADD CONSTRAINT spree_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_skrill_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_skrill_transactions
    ADD CONSTRAINT spree_skrill_transactions_pkey PRIMARY KEY (id);


--
-- Name: spree_state_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_state_changes
    ADD CONSTRAINT spree_state_changes_pkey PRIMARY KEY (id);


--
-- Name: spree_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_states
    ADD CONSTRAINT spree_states_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_stock_items
    ADD CONSTRAINT spree_stock_items_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_stock_locations
    ADD CONSTRAINT spree_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_stock_movements
    ADD CONSTRAINT spree_stock_movements_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_stock_transfers
    ADD CONSTRAINT spree_stock_transfers_pkey PRIMARY KEY (id);


--
-- Name: spree_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_stores
    ADD CONSTRAINT spree_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_tax_categories
    ADD CONSTRAINT spree_tax_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_tax_rates
    ADD CONSTRAINT spree_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_taxonomies
    ADD CONSTRAINT spree_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_taxons
    ADD CONSTRAINT spree_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_taxons_promotion_rules
    ADD CONSTRAINT spree_taxons_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_taxons_prototypes
    ADD CONSTRAINT spree_taxons_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_trackers
    ADD CONSTRAINT spree_trackers_pkey PRIMARY KEY (id);


--
-- Name: spree_user_authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_user_authentications
    ADD CONSTRAINT spree_user_authentications_pkey PRIMARY KEY (id);


--
-- Name: spree_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_users
    ADD CONSTRAINT spree_users_pkey PRIMARY KEY (id);


--
-- Name: spree_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_variants
    ADD CONSTRAINT spree_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_zone_members
    ADD CONSTRAINT spree_zone_members_pkey PRIMARY KEY (id);


--
-- Name: spree_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_zones
    ADD CONSTRAINT spree_zones_pkey PRIMARY KEY (id);


--
-- Name: email_idx_unique; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX email_idx_unique ON spree_users USING btree (email);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_addresses_on_firstname ON spree_addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_addresses_on_lastname ON spree_addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_adjustments_on_order_id ON spree_adjustments USING btree (adjustable_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_id ON spree_assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_type_and_type ON spree_assets USING btree (viewable_type, type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_inventory_units_on_order_id ON spree_inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_inventory_units_on_shipment_id ON spree_inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_inventory_units_on_variant_id ON spree_inventory_units USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON spree_option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_product_properties_on_product_id ON spree_product_properties USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_product_id ON spree_products_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON spree_products_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_product_group_id ON spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_user_id ON spree_promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON spree_promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_user_id ON spree_promotion_rules_users USING btree (user_id);


--
-- Name: index_refunds_on_refund_reason_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_refunds_on_refund_reason_id ON spree_refunds USING btree (refund_reason_id);


--
-- Name: index_return_authorizations_on_return_authorization_reason_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_return_authorizations_on_return_authorization_reason_id ON spree_return_authorizations USING btree (return_authorization_reason_id);


--
-- Name: index_return_items_on_customer_return_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_return_items_on_customer_return_id ON spree_return_items USING btree (customer_return_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shipments_on_number ON spree_shipments USING btree (number);


--
-- Name: index_spree_addresses_on_country_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_addresses_on_country_id ON spree_addresses USING btree (country_id);


--
-- Name: index_spree_addresses_on_state_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_addresses_on_state_id ON spree_addresses USING btree (state_id);


--
-- Name: index_spree_adjustments_on_adjustable_id_and_adjustable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_adjustable_id_and_adjustable_type ON spree_adjustments USING btree (adjustable_id, adjustable_type);


--
-- Name: index_spree_adjustments_on_eligible; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_eligible ON spree_adjustments USING btree (eligible);


--
-- Name: index_spree_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_order_id ON spree_adjustments USING btree (order_id);


--
-- Name: index_spree_adjustments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_source_id_and_source_type ON spree_adjustments USING btree (source_id, source_type);


--
-- Name: index_spree_calculators_on_calculable_id_and_calculable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_calculators_on_calculable_id_and_calculable_type ON spree_calculators USING btree (calculable_id, calculable_type);


--
-- Name: index_spree_calculators_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_calculators_on_id_and_type ON spree_calculators USING btree (id, type);


--
-- Name: index_spree_credit_cards_on_address_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_credit_cards_on_address_id ON spree_credit_cards USING btree (address_id);


--
-- Name: index_spree_credit_cards_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_credit_cards_on_payment_method_id ON spree_credit_cards USING btree (payment_method_id);


--
-- Name: index_spree_credit_cards_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_credit_cards_on_user_id ON spree_credit_cards USING btree (user_id);


--
-- Name: index_spree_gateways_on_active; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_gateways_on_active ON spree_gateways USING btree (active);


--
-- Name: index_spree_gateways_on_test_mode; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_gateways_on_test_mode ON spree_gateways USING btree (test_mode);


--
-- Name: index_spree_inventory_units_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_inventory_units_on_line_item_id ON spree_inventory_units USING btree (line_item_id);


--
-- Name: index_spree_line_items_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_order_id ON spree_line_items USING btree (order_id);


--
-- Name: index_spree_line_items_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_tax_category_id ON spree_line_items USING btree (tax_category_id);


--
-- Name: index_spree_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_variant_id ON spree_line_items USING btree (variant_id);


--
-- Name: index_spree_log_entries_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_log_entries_on_source_id_and_source_type ON spree_log_entries USING btree (source_id, source_type);


--
-- Name: index_spree_option_types_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_option_types_on_position ON spree_option_types USING btree ("position");


--
-- Name: index_spree_option_values_on_option_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_option_values_on_option_type_id ON spree_option_values USING btree (option_type_id);


--
-- Name: index_spree_option_values_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_option_values_on_position ON spree_option_values USING btree ("position");


--
-- Name: index_spree_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_option_values_variants_on_variant_id ON spree_option_values_variants USING btree (variant_id);


--
-- Name: index_spree_orders_on_approver_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_approver_id ON spree_orders USING btree (approver_id);


--
-- Name: index_spree_orders_on_bill_address_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_bill_address_id ON spree_orders USING btree (bill_address_id);


--
-- Name: index_spree_orders_on_completed_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_completed_at ON spree_orders USING btree (completed_at);


--
-- Name: index_spree_orders_on_confirmation_delivered; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_confirmation_delivered ON spree_orders USING btree (confirmation_delivered);


--
-- Name: index_spree_orders_on_considered_risky; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_considered_risky ON spree_orders USING btree (considered_risky);


--
-- Name: index_spree_orders_on_created_by_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_created_by_id ON spree_orders USING btree (created_by_id);


--
-- Name: index_spree_orders_on_guest_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_guest_token ON spree_orders USING btree (guest_token);


--
-- Name: index_spree_orders_on_number; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_number ON spree_orders USING btree (number);


--
-- Name: index_spree_orders_on_ship_address_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_ship_address_id ON spree_orders USING btree (ship_address_id);


--
-- Name: index_spree_orders_on_shipping_method_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_shipping_method_id ON spree_orders USING btree (shipping_method_id);


--
-- Name: index_spree_orders_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_user_id ON spree_orders USING btree (user_id);


--
-- Name: index_spree_orders_on_user_id_and_created_by_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_user_id_and_created_by_id ON spree_orders USING btree (user_id, created_by_id);


--
-- Name: index_spree_orders_promotions_on_order_id_and_promotion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_promotions_on_order_id_and_promotion_id ON spree_orders_promotions USING btree (order_id, promotion_id);


--
-- Name: index_spree_payment_capture_events_on_payment_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_payment_capture_events_on_payment_id ON spree_payment_capture_events USING btree (payment_id);


--
-- Name: index_spree_payment_methods_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_payment_methods_on_id_and_type ON spree_payment_methods USING btree (id, type);


--
-- Name: index_spree_payments_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_payments_on_order_id ON spree_payments USING btree (order_id);


--
-- Name: index_spree_payments_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_payments_on_payment_method_id ON spree_payments USING btree (payment_method_id);


--
-- Name: index_spree_payments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_payments_on_source_id_and_source_type ON spree_payments USING btree (source_id, source_type);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_preferences_on_key ON spree_preferences USING btree (key);


--
-- Name: index_spree_prices_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_prices_on_deleted_at ON spree_prices USING btree (deleted_at);


--
-- Name: index_spree_prices_on_variant_id_and_currency; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_prices_on_variant_id_and_currency ON spree_prices USING btree (variant_id, currency);


--
-- Name: index_spree_product_option_types_on_option_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_option_type_id ON spree_product_option_types USING btree (option_type_id);


--
-- Name: index_spree_product_option_types_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_position ON spree_product_option_types USING btree ("position");


--
-- Name: index_spree_product_option_types_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_product_id ON spree_product_option_types USING btree (product_id);


--
-- Name: index_spree_product_properties_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_product_properties_on_position ON spree_product_properties USING btree ("position");


--
-- Name: index_spree_product_properties_on_property_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_product_properties_on_property_id ON spree_product_properties USING btree (property_id);


--
-- Name: index_spree_products_on_available_on; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_available_on ON spree_products USING btree (available_on);


--
-- Name: index_spree_products_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_deleted_at ON spree_products USING btree (deleted_at);


--
-- Name: index_spree_products_on_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_name ON spree_products USING btree (name);


--
-- Name: index_spree_products_on_shipping_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_shipping_category_id ON spree_products USING btree (shipping_category_id);


--
-- Name: index_spree_products_on_slug; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_products_on_slug ON spree_products USING btree (slug);


--
-- Name: index_spree_products_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_tax_category_id ON spree_products USING btree (tax_category_id);


--
-- Name: index_spree_products_taxons_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_position ON spree_products_taxons USING btree ("position");


--
-- Name: index_spree_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_product_id ON spree_products_taxons USING btree (product_id);


--
-- Name: index_spree_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_taxon_id ON spree_products_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_action_line_items_on_promotion_action_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotion_action_line_items_on_promotion_action_id ON spree_promotion_action_line_items USING btree (promotion_action_id);


--
-- Name: index_spree_promotion_action_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotion_action_line_items_on_variant_id ON spree_promotion_action_line_items USING btree (variant_id);


--
-- Name: index_spree_promotion_actions_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_deleted_at ON spree_promotion_actions USING btree (deleted_at);


--
-- Name: index_spree_promotion_actions_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_id_and_type ON spree_promotion_actions USING btree (id, type);


--
-- Name: index_spree_promotion_actions_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_promotion_id ON spree_promotion_actions USING btree (promotion_id);


--
-- Name: index_spree_promotion_rules_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotion_rules_on_promotion_id ON spree_promotion_rules USING btree (promotion_id);


--
-- Name: index_spree_promotions_on_advertise; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_advertise ON spree_promotions USING btree (advertise);


--
-- Name: index_spree_promotions_on_code; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_code ON spree_promotions USING btree (code);


--
-- Name: index_spree_promotions_on_expires_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_expires_at ON spree_promotions USING btree (expires_at);


--
-- Name: index_spree_promotions_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_id_and_type ON spree_promotions USING btree (id, type);


--
-- Name: index_spree_promotions_on_promotion_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_promotion_category_id ON spree_promotions USING btree (promotion_category_id);


--
-- Name: index_spree_promotions_on_starts_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_starts_at ON spree_promotions USING btree (starts_at);


--
-- Name: index_spree_reimbursement_types_on_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_reimbursement_types_on_type ON spree_reimbursement_types USING btree (type);


--
-- Name: index_spree_reimbursements_on_customer_return_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_reimbursements_on_customer_return_id ON spree_reimbursements USING btree (customer_return_id);


--
-- Name: index_spree_reimbursements_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_reimbursements_on_order_id ON spree_reimbursements USING btree (order_id);


--
-- Name: index_spree_return_items_on_exchange_inventory_unit_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_return_items_on_exchange_inventory_unit_id ON spree_return_items USING btree (exchange_inventory_unit_id);


--
-- Name: index_spree_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_roles_users_on_role_id ON spree_roles_users USING btree (role_id);


--
-- Name: index_spree_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_roles_users_on_user_id ON spree_roles_users USING btree (user_id);


--
-- Name: index_spree_shipments_on_address_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_address_id ON spree_shipments USING btree (address_id);


--
-- Name: index_spree_shipments_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_order_id ON spree_shipments USING btree (order_id);


--
-- Name: index_spree_shipments_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_stock_location_id ON spree_shipments USING btree (stock_location_id);


--
-- Name: index_spree_shipping_method_categories_on_shipping_method_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_shipping_method_categories_on_shipping_method_id ON spree_shipping_method_categories USING btree (shipping_method_id);


--
-- Name: index_spree_shipping_methods_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_shipping_methods_on_deleted_at ON spree_shipping_methods USING btree (deleted_at);


--
-- Name: index_spree_shipping_methods_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_shipping_methods_on_tax_category_id ON spree_shipping_methods USING btree (tax_category_id);


--
-- Name: index_spree_shipping_rates_on_selected; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_shipping_rates_on_selected ON spree_shipping_rates USING btree (selected);


--
-- Name: index_spree_shipping_rates_on_tax_rate_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_shipping_rates_on_tax_rate_id ON spree_shipping_rates USING btree (tax_rate_id);


--
-- Name: index_spree_state_changes_on_stateful_id_and_stateful_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_state_changes_on_stateful_id_and_stateful_type ON spree_state_changes USING btree (stateful_id, stateful_type);


--
-- Name: index_spree_state_changes_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_state_changes_on_user_id ON spree_state_changes USING btree (user_id);


--
-- Name: index_spree_states_on_country_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_states_on_country_id ON spree_states USING btree (country_id);


--
-- Name: index_spree_stock_items_on_backorderable; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_backorderable ON spree_stock_items USING btree (backorderable);


--
-- Name: index_spree_stock_items_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_deleted_at ON spree_stock_items USING btree (deleted_at);


--
-- Name: index_spree_stock_items_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_stock_location_id ON spree_stock_items USING btree (stock_location_id);


--
-- Name: index_spree_stock_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_variant_id ON spree_stock_items USING btree (variant_id);


--
-- Name: index_spree_stock_locations_on_active; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_active ON spree_stock_locations USING btree (active);


--
-- Name: index_spree_stock_locations_on_backorderable_default; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_backorderable_default ON spree_stock_locations USING btree (backorderable_default);


--
-- Name: index_spree_stock_locations_on_country_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_country_id ON spree_stock_locations USING btree (country_id);


--
-- Name: index_spree_stock_locations_on_propagate_all_variants; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_propagate_all_variants ON spree_stock_locations USING btree (propagate_all_variants);


--
-- Name: index_spree_stock_locations_on_state_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_state_id ON spree_stock_locations USING btree (state_id);


--
-- Name: index_spree_stock_movements_on_stock_item_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_movements_on_stock_item_id ON spree_stock_movements USING btree (stock_item_id);


--
-- Name: index_spree_stock_transfers_on_destination_location_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_destination_location_id ON spree_stock_transfers USING btree (destination_location_id);


--
-- Name: index_spree_stock_transfers_on_number; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_number ON spree_stock_transfers USING btree (number);


--
-- Name: index_spree_stock_transfers_on_source_location_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_source_location_id ON spree_stock_transfers USING btree (source_location_id);


--
-- Name: index_spree_stores_on_code; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stores_on_code ON spree_stores USING btree (code);


--
-- Name: index_spree_stores_on_default; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stores_on_default ON spree_stores USING btree ("default");


--
-- Name: index_spree_stores_on_url; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_stores_on_url ON spree_stores USING btree (url);


--
-- Name: index_spree_tax_categories_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_tax_categories_on_deleted_at ON spree_tax_categories USING btree (deleted_at);


--
-- Name: index_spree_tax_categories_on_is_default; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_tax_categories_on_is_default ON spree_tax_categories USING btree (is_default);


--
-- Name: index_spree_tax_rates_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_deleted_at ON spree_tax_rates USING btree (deleted_at);


--
-- Name: index_spree_tax_rates_on_included_in_price; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_included_in_price ON spree_tax_rates USING btree (included_in_price);


--
-- Name: index_spree_tax_rates_on_show_rate_in_label; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_show_rate_in_label ON spree_tax_rates USING btree (show_rate_in_label);


--
-- Name: index_spree_tax_rates_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_tax_category_id ON spree_tax_rates USING btree (tax_category_id);


--
-- Name: index_spree_tax_rates_on_zone_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_zone_id ON spree_tax_rates USING btree (zone_id);


--
-- Name: index_spree_taxonomies_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_taxonomies_on_position ON spree_taxonomies USING btree ("position");


--
-- Name: index_spree_taxons_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_taxons_on_position ON spree_taxons USING btree ("position");


--
-- Name: index_spree_taxons_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_taxons_promotion_rules_on_promotion_rule_id ON spree_taxons_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_spree_taxons_promotion_rules_on_taxon_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_taxons_promotion_rules_on_taxon_id ON spree_taxons_promotion_rules USING btree (taxon_id);


--
-- Name: index_spree_taxons_prototypes_on_prototype_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_taxons_prototypes_on_prototype_id ON spree_taxons_prototypes USING btree (prototype_id);


--
-- Name: index_spree_taxons_prototypes_on_taxon_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_taxons_prototypes_on_taxon_id ON spree_taxons_prototypes USING btree (taxon_id);


--
-- Name: index_spree_trackers_on_active; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_trackers_on_active ON spree_trackers USING btree (active);


--
-- Name: index_spree_users_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_users_on_deleted_at ON spree_users USING btree (deleted_at);


--
-- Name: index_spree_users_on_spree_api_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_users_on_spree_api_key ON spree_users USING btree (spree_api_key);


--
-- Name: index_spree_variants_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_variants_on_deleted_at ON spree_variants USING btree (deleted_at);


--
-- Name: index_spree_variants_on_is_master; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_variants_on_is_master ON spree_variants USING btree (is_master);


--
-- Name: index_spree_variants_on_position; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_variants_on_position ON spree_variants USING btree ("position");


--
-- Name: index_spree_variants_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_variants_on_product_id ON spree_variants USING btree (product_id);


--
-- Name: index_spree_variants_on_sku; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_variants_on_sku ON spree_variants USING btree (sku);


--
-- Name: index_spree_variants_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_variants_on_tax_category_id ON spree_variants USING btree (tax_category_id);


--
-- Name: index_spree_variants_on_track_inventory; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_variants_on_track_inventory ON spree_variants USING btree (track_inventory);


--
-- Name: index_spree_zone_members_on_zone_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_zone_members_on_zone_id ON spree_zone_members USING btree (zone_id);


--
-- Name: index_spree_zone_members_on_zoneable_id_and_zoneable_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_zone_members_on_zoneable_id_and_zoneable_type ON spree_zone_members USING btree (zoneable_id, zoneable_type);


--
-- Name: index_spree_zones_on_default_tax; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_zones_on_default_tax ON spree_zones USING btree (default_tax);


--
-- Name: index_spree_zones_on_kind; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_zones_on_kind ON spree_zones USING btree (kind);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_taxons_on_parent_id ON spree_taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_taxons_on_permalink ON spree_taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_taxons_on_taxonomy_id ON spree_taxons USING btree (taxonomy_id);


--
-- Name: spree_shipping_rates_join_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX spree_shipping_rates_join_index ON spree_shipping_rates USING btree (shipment_id, shipping_method_id);


--
-- Name: stock_item_by_loc_and_var_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX stock_item_by_loc_and_var_id ON spree_stock_items USING btree (stock_location_id, variant_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: unique_spree_shipping_method_categories; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_spree_shipping_method_categories ON spree_shipping_method_categories USING btree (shipping_category_id, shipping_method_id);


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

