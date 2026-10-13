--E_comerce_analysis_view

-- View: public.vw_ecommerce_analytics

-- DROP VIEW public.vw_ecommerce_analytics;

CREATE OR REPLACE VIEW public.vw_ecommerce_analytics
 AS
 WITH payments_agg AS (
         SELECT raw_payments.order_id,
            sum(raw_payments.payment_value::numeric) AS total_payment
           FROM raw_payments
          GROUP BY raw_payments.order_id
        ), reviews_agg AS (
         SELECT raw_reviews.order_id,
            max(raw_reviews.review_score::integer) AS review_score
           FROM raw_reviews
          GROUP BY raw_reviews.order_id
        )
 SELECT o.order_id,
    o.order_status,
    o.order_purchase_timestamp::timestamp without time zone AS purchase_date,
    o.order_delivered_customer_date::date AS delivery_date,
    o.order_estimated_delivery_date::date AS estimated_date,
    o.order_delivered_customer_date::date - o.order_estimated_delivery_date::date AS delay_days,
    c.customer_state,
    c.customer_city,
    p.total_payment,
    r.review_score
   FROM raw_orders o
     LEFT JOIN raw_customers c ON o.customer_id = c.customer_id
     LEFT JOIN payments_agg p ON o.order_id = p.order_id
     LEFT JOIN reviews_agg r ON o.order_id = r.order_id
  WHERE o.order_status = 'delivered'::text AND o.order_delivered_customer_date IS NOT NULL AND o.order_estimated_delivery_date IS NOT NULL;

ALTER TABLE public.vw_ecommerce_analytics
    OWNER TO admin;

