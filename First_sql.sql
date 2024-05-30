CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'MONIKA', 'ARORA', 100000, '14-02-20 09.00.00', 'HR'),
(002, 'NIHARIKA', 'VERMA', 80000, '14-06-11 09.00.00', 'ADMIN'),
(003, 'VISHAL', 'SINGHAL', 300000, '14-02-20 09.00.00', 'HR'),
(004, 'AMITABH', 'SINGH', 500000, '14-02-20 09.00.00', 'ADMIN'),
(005, 'VIVEK', 'BHATI', 500000, '14-06-11 09.00.00', 'ADMIN'),
(006, 'VIPUL', 'DIWAN', 200000, '14-06-11 09.00.00', 'ACCOUNT'),
(007, 'SATISH', 'KUMAR', 75000, '14-01-20 09.00.00', 'ACCOUNT'),
(008, 'GEETHIKA', 'CHAUHAN', 90000, '14-04-11 09.00.00', 'ADMIN');

SELECT * FROM Worker;

-- child table:  
CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);

INSERT INTO Bonus 
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

SELECT * FROM Bonus;

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst.Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'lead', '2016-06-11 00:00:00');

SELECT * FROM Title;

SELECT SALARY FROM Worker;

SELECT FIRST_NAME, SALARY FROM Worker;

SELECT 44 + 11;

SELECT now();

SELECT lcase('RAJ KAMAL');

SELECT ucase('raj kamal');

SELECT * FROM Worker WHERE SALARY > 100000;
SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

-- BETWEEN keyword ka use, both inclusive.
SELECT * FROM Worker;
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 300000; 

-- reduce OR statement
-- HR, ADMIN

SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';

-- better way: IN keyword ka use intead of 'OR'  
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'ADMIN', 'ACCOUNT');

-- NOT IN - keyword ka use
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'ADMIN');

-- IS NULL
SELECT * FROM Worker WHERE salary is NULL;

-- wildcard :  '%' and '_'
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';

SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';

-- sorting order by
select * from Worker order by salary;

select * from Worker order by salary ASC;
select * from Worker order by salary DESC;

-- Distinct
SELECT department from Worker;
SELECT DISTINCT department from Worker;
 
-- group by
SELECT department from worker group by department;

SELECT department, count(*) from worker group by department;

-- find avg salary per department :
SELECT department, AVG(salary) from worker GROUP BY department;

-- MIN
SELECT department, MIN(salary) from worker GROUP BY department;

-- MAX
SELECT department, MAX(salary) from worker GROUP BY department;

-- SUM
SELECT department, SUM(salary) from worker GROUP BY department;

-- GROUP BY HAVING:
SELECT department, count(department) from worker GROUP BY department having COUNT(department) > 2;
SELECT department, count(department) from worker GROUP BY department having COUNT(department) > 1;












