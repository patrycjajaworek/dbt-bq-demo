With stg_products AS (
   SELECT
      product_id,
      product_name,
      price,
      {{ get_date_parts('expiration_date') }} as date_column,
      category
     
   FROM {{source('woven-surface-450008-a3','Products')}}
)

Select * from stg_products