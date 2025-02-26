WITH orders AS (
    SELECT 
        id AS order_id,
        user_id,
        order_date,
        status
    FROM raw.Orders
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
    o.user_id,
    o.order_date,
    o.status,
    p.payment_method,
    p.total_amount_cleaned
FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.total_amount_cleaned IS NOT NULL
