With stg_products AS (
   SELECT
      product_id,
      product_name,
      price,
      expiration_date,
      category
     
   FROM {{source('woven-surface-450008-a3','Products')}}
)

Select * from stg_products