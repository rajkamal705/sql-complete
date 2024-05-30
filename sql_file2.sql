CREATE DATABASE temp;
SHOW DATABASES;
use temp;

CREATE TABLE customer (
id integer PRIMARY KEY,
cname VARCHAR(255),
Address VARCHAR(255),
gender CHAR(2),
city VARCHAR(255),
pincode integer
);

INSERT INTO customer 
VALUES (1251, 'Raj kamal', 'hilsa', 'M', 'patna', 801302),
       (1252, 'ankit kumar', 'hilsa', 'M', 'patna', 801303),
       (1300, 'vickey kumar', 'ekangar', 'M', 'delhi', 801304),
       (245, 'sajan kumar', 'islampur', 'M', 'patna', 801305),
	   (210, 'ankush kumar', 'goda', 'F', 'patna', 801306),
	   (500, 'ashish kumar', 'murph', 'M', 'punjab', 801307);

select * from customer;

-- part 3: start here
-- REPLACE

REPLACE INTO customer(id, city)
values(1251, 'raj_colony'); 

REPLACE INTO customer(id, city)
values(1252, 'r_colony');
select * from customer;


REPLACE INTO customer(id, cname, city)
values(1220, 'codehelp', 'c_colony');

REPLACE INTO customer SET id = 1300, cname = 'mac', city = 'ujain';
select * from customer;

REPLACE into customer(id, cname, city)
SELECT id, cname, city
FROM customer WHERE id = '500';

-- part3 - ended here.

-- part 2 start from here:
INSERT INTO customer 
VALUES (1, 'my name', 'Gaya', 'M', 'mumbai', null);
SELECT * FROM customer;

-- after 1.5 hours of video
insert into customer(id, cname)
values(121, 'bob');

-- UPDATE : at 1.57 in video
UPDATE customer SET Address = 'Mumbai', Gender='M' WHERE id = 121;
select * from customer;

-- update multiple rows : 
SET SQL_SAFE_UPDATES = 0;
UPDATE customer SET pincode = 80000;
select * from customer;

UPDATE customer SET pincode = pincode+1;

-- DELETE : 
DELETE FROM customer WHERE id = 121;
SELECT * FROM customer;

-- deleting whole table
DELETE FROM customer;

SELECT * from customer where pincode is null;

-- foreign key constraint :

create table order_details (
order_id integer PRIMARY KEY,
delivery_data DATE,
cust_id INT,
FOREIGN KEY(cust_id) references customer(id)
);

select * from customer;
INSERT INTO order_details
VALUES (3, '2019-03-11', 1);

SELECT * from order_details;

delete from customer WHERE id = 1;

create table order_details1 (
order_id integer PRIMARY KEY,
delivery_data DATE,
cust_id INT,
FOREIGN KEY(cust_id) references customer(id) ON DELETE CASCADE
);

INSERT INTO order_details1
VALUES (3, '2019-03-11', 1);
SELECT * from order_details1;

INSERT INTO order_details1
VALUES (4, '2019-03-12', 1);

-- 2.08 HOUR: 
select * from order_details1;
delete from customer where id = 1; 
select * from customer; 

create table order_details2 (
order_id integer PRIMARY KEY,
delivery_data DATE,
cust_id INT,
FOREIGN KEY(cust_id) references customer(id) ON DELETE SET NULL
);

INSERT INTO order_details2
VALUES (3, '2019-03-11', 1);

INSERT INTO order_details2
VALUES (4, '2019-03-12', 1);

select * from order_details2;
delete from customer where id = 1;
select * from customer;

-- part2 ended here.
  
-- part 1 : unique and check constraint : 

CREATE table first_account(
id int PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT,
CONSTRAINT acc_balance_chk CHECK(balance > 1000)
);

-- it will get inserted bec balance is > 1000
INSERT INTO first_account(id, name, balance)
VALUES (1, 'A', 10000);

-- it will give error bec name should be unique.
INSERT INTO first_account(id, name, balance)
VALUES (2, 'A', 5000);

-- it will show error bec balance should be greater than 1000
INSERT INTO first_account(id, name, balance)
VALUES (3, 'B', 100);

SELECT * from first_account;

-- default constraint

CREATE table sec_account (
id int PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT not null default 0
);

INSERT INTO sec_account(id, name)
VALUES (1, 'A');

INSERT INTO sec_account(id, name)
VALUES(2, 'B');

SELECT * from sec_account;

-- it will drop first_account table. 

drop table first_account;

SELECT * from first_account;

-- add new column: For adding new column
alter table sec_account add interest FLOAT NOT NULL DEFAULT 0;
select * from sec_account;

-- modify : modify the datatype of that column 
ALTER table sec_account MODIFY interest DOUBLE not null DEFAULT 0;
SELECT * from sec_account;

-- describe account: it will show data types and other information of the column
desc sec_account;

-- change column : rename column 
alter table sec_account change column interest saving_interest float not null default 0;
desc sec_account;

-- drop column
alter table sec_account drop column saving_interest;
select * from sec_account;

-- rename tha table name
alter table sec_account rename to final_account;

-- it will show error bec sec_account table don't exists. It's renewed to final_account
desc sec_account;

-- it will run fine
select * from final_account;

-- part1 end
-- part2 from line 40.

