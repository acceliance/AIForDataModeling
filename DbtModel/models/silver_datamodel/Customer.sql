{{
    config( materialized='table' )
}}
with Customer as
(
    select
   cast(null as text) as secondName,
   cast(null as text) as firstName,
   cast(null as text) as id /* Business key */
)
select *
from Customer
