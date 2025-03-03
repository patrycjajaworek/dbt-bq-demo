select *
from {{ref('first_dbt_model')}}
union all
select 7 as id

