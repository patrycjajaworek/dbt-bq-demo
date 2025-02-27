 select
    id as customer_id,
    first_name,
    last_name


from {{source('woven-surface-450008-a3','Customers')}}