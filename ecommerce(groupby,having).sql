create database ecommerce
use ecommerce
-- In the day 2 assignment will give mathematical calculation on existing data, grouping the record, 
-- sorting the records, creation of customize reports of E-commerce orders
-- prodct ,customer , order
use bhavnacorp
create table product(productid int primary key, pname varchar(20),price numeric(10))
insert into product values(1001,'mobile',10000)
insert into product values(1002,'Laptop',50000)
insert into product values(1003,'washingmachine',30000)
insert into product values(1004,'toys',1000)
insert into product values(1005,'cosmetics',3000)
insert into product values(1006,'piano',15000)
insert into product values(1007,'books',5000)
insert into product values(1008,'battery',4000)
insert into product values(1009,'Nothing',35000)
insert into product values(1010,'skateboard',10000)
create table customers(cid int primary key, cname varchar(20),address varchar(10),productid int not null,foreign key(productid) references product(productid) )
insert into customers values(201,'jhonny','NYC',1001)
insert into customers values(202,'andrew','germany',1002)
insert into customers values(203,'bigdawg','bihar',1003)
insert into customers values(204,'rohit','delhi',1004)
insert into customers values(205,'akshay','dehradun',1005)
insert into customers values(206,'rajpurohit','noida',1006)
insert into customers values(207,'deepjot','punjab',1007)
insert into customers values(208,'hussain','banglore',1008)
insert into customers values(209,'rohit','chennai',1009)
insert into customers values(210,'mayank','mizoram',1010)

create table orders(oid int primary key, ordername varchar(20),productid int not null, foreign key(productid) references product(productid))
insert into orders values(301,'electonics',1001)
insert into orders values(102,'electronics',1002)
insert into orders values(103,'electronics',1003)
insert into orders values(104,'plastic',1004)
insert into orders values(105,'plastic',1005)
insert into orders values(106,'aluminium',1006)
insert into orders values(107,'reading',1007)
insert into orders values(108,'aluminium',1008)
insert into orders values(109,'reading',1009)
insert into orders values(110,'aluminium',1010)

select sum(price) from product group by price

select ordername from orders group by ordername

select pname,min(price) from product group by pname

select * from customers order by len(cname) desc

SELECT COUNT(oid), ordername FROM orders GROUP BY ordername HAVING count(*) >= 2   