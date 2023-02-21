-- Retail Mart Management.
/* DESCRIPTION
A data analyst of a retail shop, Happy Mart, wants to store the 
product details, the customer details, and the order details to provide 
unparalleled insights about customer behavior and product stock details daily. */

-- Write a query to create a database named SQL basics. --

create database sqlbasic;

-- Write a query to select the database SQL basics.
use sqlbasic;

/* Write a query to create a product table with fields as product code, product name, 
price, stock and category, customer table with the fields as customer id, customer name, 
customer location, and customer phone number and, sales table with the fields as date, 
order number, product code, product name, quantity, and price. */

-- product table
create table product(
p_code int not null,
p_name varchar(15) not null,
price int not null,
stock int not null,
category varchar(10)
);

-- customer table
create table customer(
c_id int not null,
c_name varchar(15) not null,
c_location varchar(15) not null,
c_phoneno int not null,
primary key(c_id)
);

-- Sales table
create table sales(
order_date varchar(15) not null,
order_no int not null,
c_id int not null,
c_name varchar(15) not null,
p_code varchar(15) not null,
p_name varchar(15) not null,
qty int not null,
price int not null,
primary key(order_date)
);

alter table sqlbasic.sales
modify order_no varchar(15) not null;

-- Write a query to insert values into the tables.

INSERT INTO sqlbasic.customer(c_id,c_name,c_location,c_phoneno) VALUES 
('9212','Jessica','banglore','1233435');

INSERT INTO 
sqlbasic.sales(order_date,order_no,c_id,c_name,p_code,p_name,qty,price)VALUES 
('2021-02-12','HM02','2123','Biyush','03','Pen','2','20');

insert into
sqlbasic.product(p_code,p_name,stock,price,category) VALUES 
('07','shampoo','5','90','hair');

-- Write a query to add two new columns such as S_no and categories to the sales table.

alter table sqlbasic.sales
ADD column s_no int not null,
ADD column categoried varchar(15) not null;

-- Write a query to change the column type of stock in the product table to varchar.

alter table sqlbasic.product
modify stock varchar(15) not null;

-- Write a query to change the table name from customer-to-customer details.
alter table sqlbasic.customer
rename to customer_details; 

-- Write a query to drop the columns S_no and categories from the sales table.
alter table sqlbasic.sales
drop s_no,
drop categoried; 

-- Write a query to display order id, customer id, order date, price, and quantity from the sales table.
select order_no,c_id,order_date,price,qty from sqlbasic.sales;

-- Write a query to display all the details in the product table if the category is stationary.
select * from sqlbasic.product
where category="stationary";

-- Write a query to display a unique category from the product table.
select distinct category from sqlbasic.product;

-- Write a query to display the sales details if quantity is greater than 2 and price is lesser than 500 from the sales table.
select * from sqlbasic.sales
where qty>2 and price<500;

-- Write a query to display the customer’s name if the name ends with a.
select c_name from sqlbasic.customer_details
where c_name like "%a";

-- Write a query to display the product details in descending order of the price.
select * from sqlbasic.product
order by price desc;

-- Write a query to display the product code and category from similar categories that are greater than or equal to 2.
SELECT p_code,category FROM sqlbasic.product 
GROUP BY category HAVING COUNT(category)>=2;

-- Write a query to display the order number and the customer name to combine the results of the order and the customer tables including duplicate rows.
SELECT order_no,c_name FROM sqlbasic.sales LEFT JOIN sqlbasic.product ON 
sales.s_code = product.p_code
UNION ALL 
SELECT order_no,c_name FROM sqlbasic.sales RIGHT JOIN sqlbasic.product ON 
sales.s_code = product.p_code