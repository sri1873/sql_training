--various jobs & total no of employees in each job group.
select
	distinct job,
	count(job)
from
	employee
group by
	job;

--various jobs along with total salary for each job group where total salary is greater than 5,000.
select
	distinct job,
	sum(salary)
from
	employee
group by
	job
having
	sum(salary)>5000;

--empno, name, deptno and Salary. Sort the rows on name & within name  by deptno & within deptno by salary.
select
	empno,
	empname,
	deptno,
	salary
from
	employee
order by
	empname,
	deptno,
	salary ;

--names of employees along with their annual salary, employee earning highest salary should come First
select
	empname,
	salary,
	salary * 12 as annual_salary
from
	employee
order by
	annual_salary desc;

--USING SUBQUERIES
--name of employee who gets the maximum pay.
select
	empname,
	salary
from
	employee
where
	salary =(
	select
		max(salary)
	from
		employee) ;
	
--names of all employees whose pay is Gretar than the average pay.
select
	empname
from
	employee
where
	salary>(select avg(salary)
	from employee);

--names of all employees whose salary is greater than at least one employee working in department 30.
select
	empname
from
	employee
where
	salary>(select min(salary) from employee)
	and deptno = 30 ;

-- names of all employees whose salary is greater than that of each employee working in department sales.
select
	empname,
	b.dname
from
	employee a
inner join department b on
	a.deptno = b.deptno
where
	salary>(
	select
		max(salary)
	from
		employee
	where
		b.dname like 'Sales');
	
--employees whose manager name is JAMES.
select
	empname,
	deptno
from
	employee
where
	deptno = (
	select
		deptno
	from
		employee
	where
		empname like 'James'
		and job like 'Manager')
	and job not like 'Manager';

--names of those managers whose salary is greater than average salary or equal to average salary of the Company.
select
	empname
from
	employee
where
	salary >=(
	select
		avg(salary)
	from
		employee);

