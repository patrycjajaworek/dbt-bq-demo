WITH orders AS (
    SELECT 
        order_id,
        customer_id,
        date_with_macro,
        status
    FROM {{ref("stg_orders_macro")}}
),

payments AS (
    SELECT
        order_id,
        payment_method,
        {{ clean_amount('amount') }} AS total_amount_cleaned
    FROM raw.Payments
)

SELECT 
    o.order_id,
    o.customer_id,
    o.date_with_macro,
    o.status,
    p.payment_method,
    p.total_amount_cleaned
FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.total_amount_cleaned IS NOT NULL



