{{
    config( materialized='table' )
}}
with ReceiptLine as
(
    select
   cast(null as text) as product, /* Relation to Product.code */
   cast(null as integer) as quantity,
   cast(null as double precision) as storePurchasePrice,
   cast(null as text) as receiptLinesReceipt /* Relation to Receipt.id */
)
select *
from ReceiptLine
