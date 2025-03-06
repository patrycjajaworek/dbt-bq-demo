{{config(materialized='incremental', unique_key='t_time_sk')}}


SELECT *
FROM `woven-surface-450008-a3.raw.Time`
WHERE TIME(CAST(T_HOUR AS INT64), CAST(T_MINUTE AS INT64), CAST(T_SECOND AS INT64))
      <= CURRENT_TIME()


{% if is_incremental() %}


AND t_time_sk NOT IN (SELECT DISTINCT t_time_sk FROM {{ this }})


{% endif %}
