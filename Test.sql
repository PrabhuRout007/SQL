--Question 2

Create table Department
(
	DepartmentID int primary key,
	DepartmentName varchar(15)
)

create table Employee
(
	EmployeeID   int primary key,
	EmployeeName varchar(20),
	DepartmentID int foreign key references Department(DepartmentID),
	DateOfBirth date
)


create table Salary 
(
	SalaryId int primary key,
	DepartmentID int foreign key references Department(DepartmentID),
	EmployeeID int foreign key references Employee(EmployeeID)
)

alter table Salary add Sal decimal(16,0)

--Question 3

insert into Department(DepartmentID,DepartmentName) values
(1,'Development'), (2,'SDE'), (3,'Manager')

insert into Employee(EmployeeID,EmployeeName,DepartmentID,DateOfBirth) values
(1,'Prabhu',1,'1999-05-09'),
(2,'Shuvam',2,'1999-05-09'),
(3,'Srikant',3,'1999-05-09'),
(4,'Amit',2,'1999-05-09'),
(5,'Rahul',1,'1999-05-09')

insert into Salary(SalaryId,DepartmentID,EmployeeID,Sal) values
(1,1,1,2000),
(2,2,2,5000),
(3,3,3,6000),
(4,2,4,1000),
(5,1,5,2000)

select * from Employee
select * from Salary 
select * from Department

--======================================================================================
--Qusetion 4

select E.EmployeeID, d.DepartmentID, E.EmployeeName, E.DateOfBirth,D.DepartmentName from Employee E, Department D
where E.DepartmentID = d.DepartmentID

--or

select * from Employee E, Department D
where E.DepartmentID = d.DepartmentID

--==========================================================================================
 --Question 5
 select distinct(Sal) from Salary

 --=================================================================================

 --Question 6

 insert into Department(DepartmentID,DepartmentName) values
(4,'HR')

insert into Employee(EmployeeID,EmployeeName,DepartmentID,DateOfBirth) values
(6,'Shyam',4,'1997-04-09'),
(7,'Raju',4,'1998-06-19')


 select E1.EmployeeName , D.DepartmentName from Employee E1, Department D
 where E1.DepartmentID = D.DepartmentID and D.DepartmentName = 'HR'

 --======================================================================================

 --Question 7

 select Sal from Salary where (Sal >1 and Sal <5000) or Sal = null;

 --=======================================================================================
 --Qusetion 8

 select E.EmployeeID, e.EmployeeName, s.Sal from Employee E , Salary S
 where E.EmployeeID = S.EmployeeID order by S.Sal 

 --=======================================================================================

 --Question 9

 insert into Department(DepartmentID,DepartmentName) values
(5,'Sales')

select D.DepartmentName from Department D
where( D.DepartmentID not in(
Select E.DepartmentID from Employee E)
)

--==========================================================================================

--Question 10

update Salary 
set Sal += 1000;

select * from Salary

--===========================================================================================

--Question 11

--delete  Department D
delete Department where DepartmentID in 
(
select D.DepartmentID from Department D
where D.DepartmentID not in(
select E.DepartmentID from Employee E)
)

--=============================================================================================

--Question 12

select top 2 E.EmployeeName, S.Sal from Employee E, Salary S
where S.EmployeeID = E.EmployeeID order by s.Sal

--==============================================================================================

--Question 13 A

select Sal from Salary where Sal =(Select Max(Sal) from Salary)

--Question 13 B

select EmployeeName from Employee  where DateOfBirth = (select Max(DateofBirth) from Employee)

--===============================================================================================

--Question 14

select Count(E.EmployeeName) [Numbe of HR] from Employee E , Department D
where E.DepartmentID = D.DepartmentID and D.DepartmentName='HR'


--=============================================================================================

--Question 15

select E.EmployeeID, E.EmployeeName, D.DepartmentName from Employee E , Department D
where D.DepartmentID = E.EmployeeID and 
D.DepartmentName like 'dev%'

--=============================================================================================

--Question 16

select E.EmployeeName  from Employee E
where E.EmployeeName like  '%k%'

--==============================================================================================

--Question 17

select * from Employee E
where year(E.DateOfBirth)  between 1990 and 2000

--================================================================================================

--Question 18

select E.EmployeeName, D.DepartmentName from Employee E, Department D
where D.DepartmentID = E.DepartmentID 
and D.DepartmentName in ('HR', 'Development')

--================================================================================================

--Question 19

select E.EmployeeName as E_name, D.DepartmentName as D_name, S.Sal as Salary  from Employee E, Department D, Salary S

--==================================================================================================

--Question 20

select E.EmployeeID, E.EmployeeName, D.DepartmentName, S.Sal from Employee E
join Salary S on E.EmployeeID = S.EmployeeID
join Department D on D.DepartmentID = E.EmployeeID


--=================================================================================================

--Question 21

/*Inner Join : It is one common type of join which is used to 
retreive the common data from two tables with the help of 
some common column. */
select E.EmployeeID, E.EmployeeName, S.Sal from Employee E
inner join Salary S on E.EmployeeID = S.EmployeeID

--=================================================================================================

--Question 22

 /*Left Join : Suppose we have 2 tables Table 1 and Table 2 
and we want to get all the common data from two table plus 
entire records of Table 1 so in this case we use a left join
(to Table 1) means Table 1 is consider as Left Table 
and all common records from Table 1 and Table 2 plus all records of
Table one will get retrived. */

select E.EmployeeID, E.EmployeeName, S.Sal from Employee E
left join Salary S on E.EmployeeID = S.EmployeeID

/* Here all Common records of Employee and Salary Table plus 
 all records of Employee Table will be shown*/

--=============================================================================================


--Question 23

 /*Right Join : Suppose we have 2 tables Table 1 and Table 2 
and we want to get all the common data from two table plus 
entire records of Table 2 so in this case we use a Right join
*/
 select E.EmployeeID, E.EmployeeName, S.Sal from Employee E
right join Salary S on E.EmployeeID = S.EmployeeID

/* Here all Common records of Employee and Salary Table plus 
  all records of Salary Table will be shown*/

 --=============================================================================================

 --Question 24 
 /*Full Join: In full join we will get data from both left and
right table. 

*/

select EmployeeId,EmployeeName, DepartmentName name from Department 
full join Employee  on Employee.DepartmentId = Department.DepartmentId


--===================================================================================================

--Question 25
/*
Self Join: is applicable only in single table and 
used when we want to compare columns of table with the column of
that table itself.

EX: Suppose we have one table Employee with Salary
and we want the salary of those employees whose salary is 
greater than Salary of a Particular EMployee in this type of 
situation we use SELF JOIN.
*/

create table SelfJoinEx
(
	ID int primary key,
	name varchar(20),
	Salary decimal (16,2)
)


insert into SelfJoinEx (ID,name,Salary) values 
(4, 'Rahul', 2000),
(5, 'Sekhar', 3000),
(6, 'Ram', 4000)

select S1.ID, s1.name,s1.Salary from SelfJoinEx S1, SelfJoinEx S2
where S1.Salary = S2.Salary and S2.name ='Prabhu'

--=======================================================================================================

--Question 26
/*To get all the duplicate data means in table we have 101 Id for more than 2 employee 
so by applying union we will only get 1 record of 101
*/
select EmployeeID from Employee
union 
select EmployeeID from Employee
order by EmployeeID

--To resolve this use UNION ALL
select EmployeeID from Employee
union all 
select EmployeeID from Employee
order by EmployeeID

--Now we will get all the duplicate values too.

--==========================================================================================================

--Question 27

--Groupby : used to group the similiar data based on columns

select D.DepartmentName from Department D group by D.DepartmentName

--===========================================================================================================

--Question 28

/*
Having Clause: is used to filter the group by data
having only can used with aggregate function
*/
select D.DepartmentName, Count(D.DepartmentName) from Department D
group by D.DepartmentName having  Count(D.DepartmentName) =1

--==================================================================================================

--Question 29

-- Exits : returns true if he found the subquery is return one or more true statements

select E.EmployeeName from Employee E
where Exists (select * from Salary S where S.Sal >100)

--==================================================================================================

--Question 30
/*
Any : used to return TRUE if Any one of the conditions get matched
All : used to return TRUE  if All of the conditions matches
*/

select E.EmployeeName  from Employee E
where E.EmployeeID = all (Select S.EmployeeID from Salary S where S.Sal >1000 )

select E.EmployeeName  from Employee E
where E.EmployeeID = any (Select S.EmployeeID from Salary S where S.Sal >1000 )

--=====================================================================================================

--Question 31

insert into Employee(EmployeeID , EmployeeName, DepartmentID, DateOfBirth)