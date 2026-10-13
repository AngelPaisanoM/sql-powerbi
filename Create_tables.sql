-- Create_tables


CREATE TABLE IF NOT EXISTS public.raw_customers
(
    customer_id text COLLATE pg_catalog."default",
    customer_unique_id text COLLATE pg_catalog."default",
    customer_zip_code_prefix text COLLATE pg_catalog."default",
    customer_city text COLLATE pg_catalog."default",
    customer_state text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.raw_customers
    OWNER to admin;

CREATE TABLE IF NOT EXISTS public.raw_orders
(
    order_id text COLLATE pg_catalog."default",
    customer_id text COLLATE pg_catalog."default",
    order_status text COLLATE pg_catalog."default",
    order_purchase_timestamp text COLLATE pg_catalog."default",
    order_approved_at text COLLATE pg_catalog."default",
    order_delivered_carrier_date text COLLATE pg_catalog."default",
    order_delivered_customer_date text COLLATE pg_catalog."default",
    order_estimated_delivery_date text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.raw_orders
    OWNER to admin;


CREATE TABLE IF NOT EXISTS public.raw_payments
(
    order_id text COLLATE pg_catalog."default",
    payment_sequential text COLLATE pg_catalog."default",
    payment_type text COLLATE pg_catalog."default",
    payment_installments text COLLATE pg_catalog."default",
    payment_value text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.raw_payments
    OWNER to admin;


CREATE TABLE IF NOT EXISTS public.raw_reviews
(
    review_id text COLLATE pg_catalog."default",
    order_id text COLLATE pg_catalog."default",
    review_score text COLLATE pg_catalog."default",
    review_comment_title text COLLATE pg_catalog."default",
    review_comment_message text COLLATE pg_catalog."default",
    review_creation_date text COLLATE pg_catalog."default",
    review_answer_timestamp text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.raw_reviews
    OWNER to admin;