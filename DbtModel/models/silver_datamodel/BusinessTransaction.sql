{{
    config( materialized='table' )
}}
with BusinessTransaction as
(
    select
   cast(null as timestamp) as date,
   cast(null as text) as id /* Business key */
)
select *
from BusinessTransaction
