select
        id as payment_id,
        order_id,
        payment_method,
        amount / 100 as amount
from {{source('woven-surface-450008-a3','Payments')}}