{{
    config( materialized='table' )
}}
with Invoice as
(
    select
   cast(null as text) as idBusinessTransaction, /* Inheritance key relation to table.column Invoiceid.BusinessTransaction */
   cast(null as text) as customer, /* Relation to Customer.id */
   cast(null as double precision) as totalAmount,
   cast(null as text) as id /* Business key */
)
select *
from Invoice
