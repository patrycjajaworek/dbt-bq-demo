WITH orders AS (
    SELECT * FROM {{ ref('stg_jaffle_shop__orders') }}
),

payments AS (
    SELECT * FROM {{ ref('stg_stripe__payments') }}
),

order_payments AS (
    SELECT
        o.order_id,
        SUM(
            CASE 
                WHEN o.status IN ('completed', 'shipped') THEN p.amount  
                WHEN o.status = 'return_pending' THEN 0  
                WHEN o.status = 'returned' THEN -p.amount  
                ELSE 0  
            END
        ) AS total_successful_payment
    FROM orders o  
    LEFT JOIN payments p ON o.order_id = p.order_id  
    GROUP BY o.order_id
),

final AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        COALESCE(op.total_successful_payment, 0) AS amount  
    FROM orders o
    LEFT JOIN order_payments op USING (order_id)
)

SELECT * FROM final
