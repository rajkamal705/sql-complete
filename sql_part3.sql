CREATE DATABASE joins;
use joins;

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

-- INNER JOIN :
-- Enlist all the employees id's, names along with the project allocated to them.

SELECT e.id, e.fname, e.lname, p.id, p.cname from employee as e 
INNER JOIN project as p ON e.id = p.empId;

-- joining both table using inner join
SELECT * from employee as e 
INNER JOIN project as p ON e.id = p.empId;

-- fetch all the employee id's and their contact details who have been working from jaipur with 
-- the clients name working in hyderabad

select e.id, e.emailId, e.phoneNo, e.city, c.fname, c.lname from employee as e
INNER JOIN client_table as c ON e.id = c.empId WHERE e.city = 'jaipur' AND c.city = 'hydrabad';

-- left join:
-- Fetch out each project allocated to each employee
SELECT * from employee as e 
LEFT JOIN project as p on e.id = p.empId;

-- right join 
-- List out all the projects along with the employee's name and their respective allocated email Id.
select p.id, p.cname, e.fname, e.lname, e.emailId from employee as e 
RIGHT JOIN project as p
ON e.id = p.empId;

-- cross join 
-- List out all the combinations possible for the employee's name and projects that can exist.

SELECT e.fname, e.lname, p.id, p.cname FROM employee as e
CROSS JOIN project as p;

-- Q> Can we use join without using join keyword -> Yes
-- example :
-- We remove 'INNER JOIN' keyword with comma and replace 'ON' keyword with 'WHERE' keyword. 

SELECT e.id, e.fname, e.lname, p.id, p.cname from employee as e, project as p WHERE e.id = p.empId; 

