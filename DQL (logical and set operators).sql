--Names of Employees working as analyst & Drawing Salary of more than 2000.
SELECT empname
FROM   employee
WHERE  job LIKE 'Analyst'
       AND salary > 2000;

--Names of Employees with empno of those who do not  earn Commission.
SELECT empno,
       empname
FROM   employee
WHERE  comm = 0
        OR comm IS NULL;

--Names of Employees who are working as Clerk, analyst or manager & drawing salary more than 3000
SELECT empname FROM employee
WHERE  job IN ( 'Analyst', 'Clerk', 'Manager' )
       AND salary > 3000;

--Names of Employees working in Department 10, (or) 20,(or) 40 (or) Employees working as Clerk, Analyst.
SELECT empname FROM employee
WHERE  deptno IN ( 10, 20, 40 )
        OR job IN( 'Clerk', 'Analyst' );

--Employee name ,Deptno & Dept Names of all employees working in department Research.
SELECT a.empname,
       a.deptno,
       b.dname
FROM   employee a
       INNER JOIN department b
               ON a.deptno = b.deptno
WHERE  dname LIKE 'Research';

-- names of employees whose Names start with alphabet ‘B’ & ends with ’E’.
select empname from employee
where
	empname like('B%e');
--common jobs between Department 10 & 20.
select job
from employee
where
	deptno in (10, 20)
group by
	job;
-- jobs which are unique to dept no.10.
select distinct job
from employee
where
	deptno = 10;
--names of employees whose salary is more than 3000 after giving 20% raise.
select empname
from employee
where
	salary + (salary * 20.0 / 100.0)>3000;
--employees who are not working under any Manager
select empname
from employee
where
	deptno != 10;
