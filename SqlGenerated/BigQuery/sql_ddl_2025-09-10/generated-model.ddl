create table if not exists business_transaction
(
   date DATE,
   id STRING primary key
);
create table if not exists invoice
(
   total_amount FLOAT64,
   id STRING primary key,
   customer_id string
);
create table if not exists invoice_line
(
   product_code STRING,
   quantity INT64,
   purchase_price FLOAT64,
   id STRING primary key,
   product_code string,
   invoice_id string
);
create table if not exists product
(
   code STRING primary key,
   label STRING,
   catalog_price FLOAT64
);
create table if not exists customer
(
   name STRING,
   id STRING primary key
);
create table if not exists receipt
(
   id STRING primary key
);
create table if not exists receipt_line
(
   quantity INT64,
   store_purchase_price FLOAT64,
   id STRING primary key,
   product_code string,
   receipt_id string
);
create table if not exists store
(
   code STRING primary key,
   label STRING,
   city_code string
);
create table if not exists city
(
   code STRING primary key,
   label STRING
);
alter table invoice add constraint business_transaction_mother foreign key (id) references business_transaction (id);
alter table invoice_line add constraint invoice_invoice_lines foreign key (invoice_id) references invoice (id);
alter table invoice add constraint customer_customer foreign key (customer_id) references customer (id);
alter table invoice_line add constraint product_product foreign key (product_code) references product (code);
alter table receipt add constraint business_transaction_mother foreign key (id) references business_transaction (id);
alter table receipt_line add constraint receipt_receipt_lines foreign key (receipt_id) references receipt (id);
alter table receipt_line add constraint product_product foreign key (product_code) references product (code);
alter table store add constraint city_city foreign key (city_code) references city (code);
comment on table business_transaction is 'A business transaction is an exchange of goods for payment.';
comment on column business_transaction.date is 'The date the transaction is executed';
comment on column business_transaction.id is 'Primary Key';
comment on table invoice is 'An invoice is a type of business transaction.';
comment on column invoice.total_amount is 'The total amount of the invoice';
comment on column invoice.id is 'Primary Key';
comment on constraint customer_customer on invoice is 'The invoice is linked to a customer who is a legal entity';
comment on table invoice_line is 'Invoice line contains product code, number of products purchased, and purchase price.';
comment on column invoice_line.product_code is 'Code of the product';
comment on column invoice_line.quantity is 'Number of products purchased';
comment on column invoice_line.purchase_price is 'Purchase price per product';
comment on column invoice_line.id is 'Primary Key';
comment on constraint product_product on invoice_line is 'Invoice line is linked to a product';
comment on table product is 'Product is a bill of materials with a code and a label and a catalog price.';
comment on column product.code is 'Code of the product - Primary Key';
comment on column product.label is 'Label of the product';
comment on column product.catalog_price is 'Catalog price of the product';
comment on table customer is 'A customer who is a legal entity.';
comment on column customer.name is 'Name of the customer/legal entity';
comment on column customer.id is 'Primary Key';
comment on table receipt is 'Receipt is a type of business transaction representing an in-store purchase.';
comment on column receipt.id is 'Primary Key';
comment on table receipt_line is 'Receipt line linked to a product, contains number of products and store purchase price possibly discounted.';
comment on column receipt_line.quantity is 'Number of products purchased';
comment on column receipt_line.store_purchase_price is 'Store purchase price, possibly discounted in marketing campaign';
comment on column receipt_line.id is 'Primary Key';
comment on constraint product_product on receipt_line is 'Receipt line is linked to a product';
comment on table store is 'Store is a coded list with code and label, part of retail functional area.';
comment on column store.code is 'Code of the store - Primary Key';
comment on column store.label is 'Label of the store';
comment on constraint city_city on store is 'Store is located in a city (codified list: code and label).';
comment on table city is 'City is a codified list with code and label.';
comment on column city.code is 'Code of the city - Primary Key';
comment on column city.label is 'Label of the city';
