drop table sales;

create table Sales
(
purchase_number int not null auto_increment,
date_of_purchase date not null,
customer_id int,
item_code varchar(10) not null,
PRIMARY KEY (purchase_number),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE
);

drop table sales;
create table Sales
(
purchase_number int not null auto_increment,
date_of_purchase date not null,
customer_id int,
item_code varchar(10) not null,
PRIMARY KEY (purchase_number)
);
ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE;

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;
