-- Import RAW Table 

drop table if exists public.core_module_importrawtable;

CREATE TABLE public.core_module_importrawtable
(
    --id bigint NOT NULL DEFAULT nextval('core_module_importrawtable_id_seq'::regclass),
    "TYPE" character varying(50) COLLATE pg_catalog."default",
    "BE_DATE" character varying(50) COLLATE pg_catalog."default",
    "MONTH" character varying(10) COLLATE pg_catalog."default",
    "YEAR" integer,
    "HS_CODE" integer,
    "TWO_DIGIT" text COLLATE pg_catalog."default",
    "FOUR_DIGIT" text COLLATE pg_catalog."default",
    "HS_CODE_DESCRIPTION" text COLLATE pg_catalog."default",
    "COMMODITY_DESCRIPTION" text COLLATE pg_catalog."default",
    "UQC" text COLLATE pg_catalog."default",
    "QUANTITY" numeric(15,2),
    "CURRENCY" text COLLATE pg_catalog."default",
    "UNT_PRICE_FC" numeric(20,7),
    "INV_VALUE_FC" numeric(20,7),
    "UNT_PRICE_INR" numeric(20,2),
    "INVOICE_NO" text COLLATE pg_catalog."default",
    "BE_NO" integer,
    "UNT_RATE_WITH_DUTY_INR" numeric(25,10),
    "PER_UNT_DUTY_INR" numeric(25,10),
    "DUTY_INR" numeric(20,7),
    "DUTY_USD" numeric(20,7),
    "DUTY_FC" numeric(25,10),
    "DUTY_PERCT" numeric(25,10),
    "EX_TOTAL_VALUE_INR" numeric(25,10), 
    "ASS_VALUE_INR" numeric(25,10),
    "ASS_VALUE_USD" numeric(25,10),
    "ASS_VALUE_FC" numeric(25,10),
    "IMPORTER_VALUE_INR" numeric(25,10),
    "IMPORTER_VALUE_USD" numeric(25,10),
    "IMPORTER_VALUE_FC" numeric(25,10),
    "EXCHANGE_RATE" numeric(25,10),
    "EXPORTER_NAME" text COLLATE pg_catalog."default",
    "EXPORTER_ADDRESS" text COLLATE pg_catalog."default",
    "COUNTRY_OF_ORIGIN" text COLLATE pg_catalog."default",
    "PORT_OF_LOADING" text COLLATE pg_catalog."default",
    "PORT_CODE" text COLLATE pg_catalog."default",
    "PORT_OF_DISCHARGE" text COLLATE pg_catalog."default",
    "MODE_OF_PORT" text COLLATE pg_catalog."default",
    "IMPORTER_ID" text COLLATE pg_catalog."default",
    "IMPORTER_NAME" text COLLATE pg_catalog."default",
    "IMPORTER_ADDRESS" text COLLATE pg_catalog."default",
    "IMPORTER_CITY_OR_STATE" text COLLATE pg_catalog."default",
    "IMPORTER_PIN" text COLLATE pg_catalog."default",
    "IMPORTER_PHONE" text COLLATE pg_catalog."default",
    "IMPORTER_EMAIL" text COLLATE pg_catalog."default",
    "IMPORTER_CONTACT_PERSON" text COLLATE pg_catalog."default",
    "BE_TYPE" text COLLATE pg_catalog."default",
    "CHA_NAME" text COLLATE pg_catalog."default",
    "RECORD_ID" text COLLATE pg_catalog."default"
--    CONSTRAINT core_module_importrawtable_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.core_module_importrawtable
    OWNER to postgres;
    
commit;




-- Import Main TABLE

-- Import Main TABLE

drop table if exists public.core_module_importtable;
drop SEQUENCE if exists core_module_importtable_seq;

CREATE TABLE public.core_module_importtable
(
    id bigint NOT NULL,
    "TYPE" character varying(50) COLLATE pg_catalog."default",
    "BE_DATE" character varying(50) COLLATE pg_catalog."default",
    "MONTH" character varying(10) COLLATE pg_catalog."default",
    "YEAR" integer,
    "HS_CODE" integer,
    "TWO_DIGIT" text COLLATE pg_catalog."default",
    "FOUR_DIGIT" text COLLATE pg_catalog."default",
    "HS_CODE_DESCRIPTION" text COLLATE pg_catalog."default",
    "COMMODITY_DESCRIPTION" text COLLATE pg_catalog."default",
    "UQC" text COLLATE pg_catalog."default",
    "QUANTITY" numeric(15,2),
    "CURRENCY" text COLLATE pg_catalog."default",
    "UNT_PRICE_FC" numeric(20,7),
    "INV_VALUE_FC" numeric(20,7),
    "UNT_PRICE_INR" numeric(20,2),
    "INVOICE_NO" integer,
    "BE_NO" integer,
    "UNT_RATE_WITH_DUTY_INR" numeric(25,10),
    "PER_UNT_DUTY_INR" numeric(25,10),
    "DUTY_INR" numeric(20,7),
    "DUTY_USD" numeric(20,7),
    "DUTY_FC" numeric(25,10),
    "DUTY_PERCT" numeric(25,10),
    "EX_TOTAL_VALUE_INR" numeric(25,10), 
    "ASS_VALUE_INR" numeric(25,10),
    "ASS_VALUE_USD" numeric(25,10),
    "ASS_VALUE_FC" numeric(25,10),
    "IMPORTER_VALUE_INR" numeric(25,10),
    "IMPORTER_VALUE_USD" numeric(25,10),
    "IMPORTER_VALUE_FC" numeric(25,10),
    "EXCHANGE_RATE" numeric(25,10),
    "EXPORTER_NAME" text COLLATE pg_catalog."default",
    "EXPORTER_ADDRESS" text COLLATE pg_catalog."default",
    "COUNTRY_OF_ORIGIN" text COLLATE pg_catalog."default",
    "PORT_OF_LOADING" text COLLATE pg_catalog."default",
    "PORT_CODE" text COLLATE pg_catalog."default",
    "PORT_OF_DISCHARGE" text COLLATE pg_catalog."default",
    "MODE_OF_PORT" text COLLATE pg_catalog."default",
    "IMPORTER_ID" text COLLATE pg_catalog."default",
    "IMPORTER_NAME" text COLLATE pg_catalog."default",
    "IMPORTER_ADDRESS" text COLLATE pg_catalog."default",
    "IMPORTER_CITY_OR_STATE" text COLLATE pg_catalog."default",
    "IMPORTER_PIN" text COLLATE pg_catalog."default",
    "IMPORTER_PHONE" text COLLATE pg_catalog."default",
    "IMPORTER_EMAIL" text COLLATE pg_catalog."default",
    "IMPORTER_CONTACT_PERSON" text COLLATE pg_catalog."default",
    "BE_TYPE" text COLLATE pg_catalog."default",
    "CHA_NAME" text COLLATE pg_catalog."default",
    "RECORD_ID" text COLLATE pg_catalog."default",
    "COUNTRY" text COLLATE pg_catalog."default",
    CONSTRAINT core_module_importtable_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.core_module_importtable
    OWNER to postgres;
  
commit;

-- Sequence 

CREATE SEQUENCE IF NOT EXISTS core_module_importtable_seq  INCREMENT  BY  1 
MINVALUE 1
OWNED BY core_module_importtable.id;

commit;

ALTER TABLE public.core_module_importtable ALTER COLUMN id SET DEFAULT nextval('core_module_importtable_seq'::regclass);

commit;

describe public.core_module_importtable;
describe public.core_module_importrawtable;



