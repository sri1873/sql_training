--Get the empno, name, deptno and department names of all employees.
select
	empno,
	empname,
	b.deptno,
	b.dname
from
	employee a
inner join department b on
	a.deptno = b.deptno ;

-- employee details along with their department details using full outer join, Left outer join and Right outer join.
select * from employee a left join department b on a.deptno = b.deptno ;
select * from employee a right join department b on a.deptno = b.deptno ;
select * from employee a full outer join department b on a.deptno = b.deptno ;

--Create a table Cust_dtls such that the content of the column Cust_no is unique and not null,Cust_name shoud be in Upper case,Cust_city starts with alphabet ‘H’.
create table Cust_dtls (
cust_no int unique not null,
cust_name varchar(50) check (upper(cust_name)= cust_name),
cust_city varchar(20) check (cust_city like 'H%')
);

--Add  constraints  to employee table
alter table employee add constraint PK_employee primary key (empno);
alter table employee alter column empname set not null;
alter table employee alter column comm set default 0;
alter table employee  add constraint FK_Employee foreign key (deptno) references department (deptno);

--all the constraints on the dept and emp table 
select * from pg_catalog.pg_constraint pc;

--Add and drop the constraints on Loc column of dept table that restricts the Loc column to have only unique values.
alter table department add constraint U_Loc unique(Loc);
alter table department drop constraint U_Loc;

--Disable the check constraint on cust_name column from cust_dtls table.
alter table cust_dtls drop constraint cust_dtls_cust_name_check;
