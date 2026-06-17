{{
    config( materialized='table' )
}}
with Product as
(
    select
   cast(null as text) as label,
   cast(null as text) as code, /* Business key */
   cast(null as double precision) as catalogPrice
)
select *
from Product
