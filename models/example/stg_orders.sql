SELECT
    o.Order_ID,
    c.Customer_ID,
    c.Customer_Name,
    p.Product_ID,
    p.Product_Name,
    o.Quantity,
    {{get_date_parts('order_date')}} as date_extract
FROM
    raw.Orders o
JOIN
    {{ ref("stg_customers") }} c ON o.Customer_ID = c.Customer_ID
JOIN
    raw.Products p ON o.Product_ID = p.Product_ID