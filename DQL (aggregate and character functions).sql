-- No.of rows in the employee table.
select Count(*) from employee;
--No. of employees in department ‘Accounting’.
select
	count(a.empname)
from
	employee a
inner join department b on
	a.deptno = b.deptno
where
	b.dname = 'Accounting';

--total pay for all employees in the organization.
select sum (salary) from employee;

--department ID,the Average ,maximum & minimum, pay of  all departments.                   
select
	deptno,
	count(deptno),
	max(salary),
	avg(salary),
	min(salary)
from
	employee
group by
	deptno; 

--above information for all departments having more than 2 employees.
select
	deptno,
	count(deptno),
	max(salary),
	avg(salary),
	min(salary)
from
	employee
group by
	deptno
having
	count(deptno)>1 ; 

--Display current date.
select CURRENT_DATE;

--Display name and annual salary for all employees.
select
	empname,
	salary,
	salary * 12 as annual_salary
from
	employee ;