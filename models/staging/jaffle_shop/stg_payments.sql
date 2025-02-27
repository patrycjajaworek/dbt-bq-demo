WITH payments AS (
    SELECT
        id,
        order_id,
        payment_method,
        {{ calculate_total('amount') }} AS amount_cleaned
    FROM raw.Payments
)

SELECT * FROM payments
WHERE amount_cleaned IS NOT NULL
