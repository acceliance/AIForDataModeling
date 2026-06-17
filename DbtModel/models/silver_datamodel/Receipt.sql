{{
    config( materialized='table' )
}}
with Receipt as
(
    select
   cast(null as text) as store, /* Relation to Store.code */
   cast(null as text) as idBusinessTransaction, /* Inheritance key relation to table.column Receiptid.BusinessTransaction */
   cast(null as text) as id /* Business key */
)
select *
from Receipt
