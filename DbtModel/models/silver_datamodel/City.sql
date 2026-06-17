{{
    config( materialized='table' )
}}
with City as
(
    select
   cast(null as text) as label,
   cast(null as text) as code /* Business key */
)
select *
from City
