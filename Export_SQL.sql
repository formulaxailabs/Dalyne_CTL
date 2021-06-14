-- Export RAW Table 

drop table if exists public.core_module_exportrawtable;

CREATE TABLE public.core_module_exportrawtable
(
    --id bigint NOT NULL DEFAULT nextval('core_module_exportrawtable_id_seq'::regclass),
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
    "SB_NO" integer,
    "UNIT_RATE_WITH_FOB_INR" numeric(25,10),
    "PER_UNT_FOB" numeric(25,10),
    "FOB_INR" numeric(20,7),
    "FOB_FC" numeric(20,7),
    "FOB_USD" numeric(25,10),
    "EXCHANGE_RATE" numeric(25,10),
    "IMPORTER_NAME" text COLLATE pg_catalog."default",
    "IMPORTER_ADDRESS" text COLLATE pg_catalog."default",
    "COUNTRY_OF_ORIGIN" text COLLATE pg_catalog."default",
    "PORT_OF_DISCHARGE" text COLLATE pg_catalog."default",
    "MODE_OF_PORT" text COLLATE pg_catalog."default",
    "PORT_OF_LODING" text COLLATE pg_catalog."default",
    "PORT_CODE" text COLLATE pg_catalog."default",
    "IEC" text COLLATE pg_catalog."default",
    "EXPORTER_NAME" text COLLATE pg_catalog."default",
    "EXPORTER_ADDRESS" text COLLATE pg_catalog."default",
    "EXPORTER_CITY" text COLLATE pg_catalog."default",
    "EXPORTER_PIN" text COLLATE pg_catalog."default",
    "EXPORTER_PHONE" text COLLATE pg_catalog."default",
    "EXPORTER_EMAIL" text COLLATE pg_catalog."default",
    "EXPORTER_CONTACT_PERSON" text COLLATE pg_catalog."default",
    "RECORD_ID" text COLLATE pg_catalog."default"
    --CONSTRAINT core_module_exportrawtable_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.core_module_exportrawtable
    OWNER to postgres;
    
commit;




-- Export Main TABLE

drop table if exists public.core_module_exporttable;
drop SEQUENCE if exists core_module_exporttable_seq;

CREATE TABLE public.core_module_exporttable
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
    "INVOICE_NO" text COLLATE pg_catalog."default",
    "SB_NO" integer,
    "UNIT_RATE_WITH_FOB_INR" numeric(25,10),
    "PER_UNT_FOB" numeric(25,10),
    "FOB_INR" numeric(20,7),
    "FOB_FC" numeric(20,7),
    "FOB_USD" numeric(25,10),
    "EXCHANGE_RATE" numeric(25,10),
    "IMPORTER_NAME" text COLLATE pg_catalog."default",
    "IMPORTER_ADDRESS" text COLLATE pg_catalog."default",
    "COUNTRY_OF_ORIGIN" text COLLATE pg_catalog."default",
    "PORT_OF_DISCHARGE" text COLLATE pg_catalog."default",
    "MODE_OF_PORT" text COLLATE pg_catalog."default",
    "PORT_OF_LODING" text COLLATE pg_catalog."default",
    "PORT_CODE" text COLLATE pg_catalog."default",
    "IEC" text COLLATE pg_catalog."default",
    "EXPORTER_NAME" text COLLATE pg_catalog."default",
    "EXPORTER_ADDRESS" text COLLATE pg_catalog."default",
    "EXPORTER_CITY" text COLLATE pg_catalog."default",
    "EXPORTER_PIN" text COLLATE pg_catalog."default",
    "EXPORTER_PHONE" text COLLATE pg_catalog."default",
    "EXPORTER_EMAIL" text COLLATE pg_catalog."default",
    "EXPORTER_CONTACT_PERSON" text COLLATE pg_catalog."default",
    "RECORD_ID" text COLLATE pg_catalog."default",
    "COUNTRY" text COLLATE pg_catalog."default",
    CONSTRAINT core_module_exporttable_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.core_module_exporttable
    OWNER to postgres;
  
commit;

-- Sequence 

CREATE SEQUENCE IF NOT EXISTS core_module_exporttable_seq  INCREMENT  BY  1 
MINVALUE 1
OWNED BY core_module_exporttable.id;

commit;

ALTER TABLE public.core_module_exporttable ALTER COLUMN id SET DEFAULT nextval('core_module_exporttable_seq'::regclass);

commit;

describe public.core_module_exporttable;
describe public.core_module_exportrawtable;


select * from  public.core_module_exportrawtable;
select * from  public.core_module_exporttable;



