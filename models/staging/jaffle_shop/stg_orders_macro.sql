select
    id as order_id,
    user_id as customer_id,
    {{get_date_parts('order_date')}} as date_with_macro,
    status
from {{source('woven-surface-450008-a3','Orders')}}


