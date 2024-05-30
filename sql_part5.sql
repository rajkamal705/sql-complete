CREATE database subQueries;
use subQueries;

CREATE TABLE employee (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
fname CHAR(25),
lname CHAR(25),
Age CHAR(2),
emailId VARCHAR(255),
phoneNo CHAR(10),
city VARCHAR(255)
);

-- employee table
INSERT INTO employee 
(id, fname, lname, Age, emailId, phoneNo, city) VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
(2, 'yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'raipur'),
(5, 'pk', 'Pandey', 21, 'pk@gmail.com', 555, 'jaipur');

select * from employee;

-- client table

CREATE TABLE client_table (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
fname CHAR(25),
lname CHAR(25),
Age CHAR(2),
emailId VARCHAR(255),
phoneNo CHAR(10),
city VARCHAR(255),
empId INT,
FOREIGN KEY(empId) references employee(id)
);

INSERT INTO client_table 
(id, fname, lname, Age, emailId, phoneNo, city, empId) VALUES
(1, 'Mac', 'roggers', 47, 'mac@gmail.com', 333, 'kol', 3),
(2, 'Max', 'poiriers', 27, 'max@gmail.com', 222, 'kol', 3),
(3, 'Peter', 'jain', 24, 'peter@gmail.com', 111, 'delhi', 1),
(4, 'sushant', 'Agarwal', 23, 'sushant@gmail.com', 45454, 'hydrabad', 5),
(5, 'pratap', 'singh', 36, 'pratap@gmail.com', 77767, 'mumbai', 2);

select * from client_table;

-- project table :
CREATE TABLE project (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
empId INT,
cname VARCHAR(25),
startdate DATE,
clientId INT,
FOREIGN KEY(empId) references employee(id),
FOREIGN KEY(clientId) references client_table(id)
);

INSERT INTO project 
(id, empId, cname, startdate, clientId) VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-04-12', 1),
(3, 3, 'C', '2021-04-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-04-01', 4);

SELECT * FROM project;

-- SUB QUERIES
-- WHERE clause from table
-- employees with age > 30
select * from employee where age IN (select age from employee where age > 30);

-- WHERE clause different table
-- emp details working in more than one project
select * from employee WHERE id IN (SELECT empId from project GROUP BY empId HAVING count(empId) > 1);

-- single value subquery
-- emp details having age > avg(age)
SELECT * FROM employee WHERE age > (SELECT AVG(age) FROM employee);

-- FROM clause - derived table
-- In FROM clause subqueries(code under bracket) returns a table called derived table.
-- Every derived table must have it's own alias.
-- select max age person whose first name contains 'a'
select max(age) from (SELECT * FROM employee WHERE fname LIKE '%a%') as temp;


-- Corelated sub queries:
-- Find 3rd oldest employee
SELECT * 
FROM employee e1
WHERE 3 = (
 SELECT COUNT(e2.age) 
 FROM employee e2
 WHERE e2.age >= e1.age
);
