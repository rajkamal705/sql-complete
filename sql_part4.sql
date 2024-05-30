CREATE DATABASE setOperation;
use setOperation;

CREATE table dept1 (
empid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(25),
role VARCHAR(255)
);

INSERT INTO dept1
(empid, name, role) VALUES 
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');

select * from dept1;

CREATE table dept2 (
empid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(25),
role VARCHAR(255)
);

INSERT INTO dept2
(empid, name, role) VALUES 
(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman');

SELECT * from dept2;

-- set operations :
-- list out all the employees in the company.
select * from dept1
UNION
select * from dept2;

-- list out all the employees in all departments who work as salesman
select * from dept1 WHERE role = 'salesman'
UNION
select * from dept2 WHERE role = 'salesman';

-- list out all the employees who work for both the department:
-- INTERSECT 
select * from dept1 INNER JOIN dept2 using(empid);

-- it will not increase the no of cols for above problem.
select dept1.* from dept1 INNER JOIN dept2 using(empid);

-- list out all the employees who work in dept1 but not in dept2 : 
-- MINUS
select dept1.* from dept1 LEFT JOIN dept2 using(empid)
WHERE dept2.empid is null;

