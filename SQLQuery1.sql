CREATE DATABASE Student;
Alter Database Student Modify Name =Ramya;

USE Student;
--CREATE TABLE StudentInfo(
--RollNo int,
--StudentName varchar(255),
--Age int ,
--City varchar(255));

insert into StudentInfo(
RollNo,StudentName,Age,City)
Values(1,'Ramya',22,'Tirupathi')
; 

Select * from StudentInfo

insert into StudentInfo(
RollNo,StudentName,Age,City)
Values(2,'Krish',23,'hyd'), 
(3,'Siva',26,'Kadapa'),
(4,'Priya',25,'Jarkhand'),
(5,'Sravani',20,'Prakasam'),
(6,'Triveni',21,'UK'),
(7,'Ganesh',26,'Kadapa'); 

select* from StudentInfo;

select RollNo,StudentName from StudentInfo; 

select Distinct City, StudentName from StudentInfo;

select * from StudentInfo 
where Age = 26;

select 
*
from 
StudentInfo 
where StudentName='Ramya';


update StudentInfo 
set StudentName = 'siva Ganesh'
where RollNo = 7;
select * from StudentInfo 

Delete from StudentInfo
where RollNo = 1;
select * from StudentInfo