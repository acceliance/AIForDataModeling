{{
    config( materialized='table' )
}}
with Store as
(
    select
   cast(null as text) as label,
   cast(null as text) as code, /* Business key */
   cast(null as text) as city /* Relation to City.code */
)
select *
from Store
