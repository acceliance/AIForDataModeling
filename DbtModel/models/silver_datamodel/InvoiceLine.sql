{{
    config( materialized='table' )
}}
with InvoiceLine as
(
    select
   cast(null as double precision) as purchasePrice,
   cast(null as text) as invoiceLinesInvoice, /* Relation to Invoice.id */
   cast(null as text) as product, /* Relation to Product.code */
   cast(null as integer) as quantity,
   cast(null as text) as productCode
)
select *
from InvoiceLine
