{{ config(materialized='ephemeral') }}

select * from {{ source('woven-surface-450008-a3', 'Orders') }}