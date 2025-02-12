select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from {{source('woven-surface-450008-a3','Orders')}}