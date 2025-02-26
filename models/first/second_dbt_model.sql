select *
from {{ref('first_dbt_model')}}
where id=1