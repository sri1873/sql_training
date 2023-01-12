--Create tables employee and department.
create table employee(
empno int primary key not null,
empname varchar(30) not null,
job varchar(30) not null,
mgr int,
hiredate date not null,
salary int not null,
comm int,
deptno int);

create table department(
deptno int,
dname varchar(20) not null,
loc varchar(20) not null
); 

--Insert the Following Data into Employee table:              
insert into employee values (325,'Smith','Clerk',433,'11-01-1995',3500,1400,20);
insert into employee values (825,'James','Clerk',466,'02-08-1981',2975,null,20);
insert into employee values (433,'James','Analyst',825,'03-12-1989',3500,null,40);
insert into employee values (466,'Mike','President',null,'18-11-1997',7000,null,30);
insert into employee values (889,'Adams','Mananger',433,'23-05-1987',3250,0,10);
insert into employee values (435,'Blake','Analyst',889,'03-12-1989',4500,0,40);
insert into employee values (135,'James','Manager',889,'03-12-1989',4500,0,30);

--Insert the Following Data into Department table
insert into department values(10,'Accounting','Chicago');
insert into department values(20,'Research','Dallas');
insert into department values(30,'Sales','NewYork');
insert into department values(40,'Operations','Boston');
insert into department values(50,'Purchase','Los Angeles');

--Display the details of all Employees.
select * from employee;
--Display the Details of Department table.
select * from department;

--Display Empno, Name and job of all Employees.
select empno,empname,job from employee;
--Display Deptno & Name of Department for all Departments.
select deptno,dname from department;

--Find all jobs of Employees & remove duplicates.
select distinct job from employee;

--Add a new column to the dept table called Budget of size 10.
alter table department add column budget numeric(10);
--Modify the size of the Budget field to size 12 and add a default value of 5000.
alter table department alter column budget set data type numeric(12);
alter table department alter column budget set default 5000;

--Drop the employee table. (created by students and not the default table)
drop table employee;

--Rename the department table as dept_details.
alter table department rename to dept_details;

--Delete the department with location NewYork.
delete from dept_details where loc like 'NewYork';

--Delete the records of all employees whose salary is below the average salary at the organization.
delete from employee where salary <(select avg(salary)from employee );

--Update the deptno and dname of dept table with values 70 and ‘Distribution’ where dname is ‘Sales’.
update dept_details set dname='Distribution' ,deptno =70 where dname like 'Sales';
