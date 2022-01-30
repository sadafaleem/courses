drop table sales;
drop table customers;
drop table items;
drop table companies;

create table customers
(
customer_id int,
first_name varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int,
primary key (customer_id),
unique key (email_address)
);

drop table customers;
create table customers
(
customer_id int,
first_name varchar(255),
last_name varchar(255),
email_address varchar(255),
number_of_complaints int,
primary key (customer_id)
);

ALTER table customers
ADD Unique key (email_address);

ALTER table customers
DROP Index email_address;

drop table customers;
CREATE TABLE customers 
(
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

Alter table customers
ADD COLUMN gender ENUM('M','F') AFTER last_name;
INSERT INTO customers(first_name,last_name,gender,email_address,number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0)
;

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name,last_name,gender)
VALUES ('Peter', 'Figaro', 'M');

SELECT *FROM customers;

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;