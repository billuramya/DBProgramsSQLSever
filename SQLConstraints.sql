create database Constraints;
use Constraints;

CREATE TABLE Default_Contrains(
id int not null,
first_Name varchar(100),
Last_Name varchar(100),
city varchar(100) DEFAULT 'Mumboi',
dateOfBirth date DEFAULT GETDATE(),
Salary decimal(18,2) DEFAULT 50000.0); 

insert into Default_Contrains(id,first_Name,Last_Name)values(1,'Ramya','Billu')
insert into Default_Contrains(id,first_Name,Last_Name,city,dateOfBirth,Salary)values(1,'Ramya','Billu','Hyd','2023-04-26',40000.00)

select * from Default_Contrains;

use Constraints;

CREATE TABLE Not_Null(
id int not null,
name varchar(100),
mobNo char(10) not null)

insert Not_Null values(1,'veni','2345678');
--insert Not_Null values(null,null,null);

select * from Not_Null; 

CREATE TABLE Unique_Table(
id int UNIQUE,
name varchar(100) unique,
mobNo char(10) UNIQUE); 

insert Unique_Table values(1,'siva','2345678')-- allowed 
--insert Unique_Table values(2,'siva','2345678') -- its not allowed
insert Unique_Table values(2,null,null)-- allowed

select * from Unique_Table; 


CREATE TABLE Unique_Contrains(
id int Constraint Cid_Unique Unique,
name varchar(100),
mobNo varchar(100),
Email_Id varchar(100) Constraint email_unique unique,
Constraint Unique_Name unique(name),Constraint unique_mobNo unique(mobNo));

select * from Unique_Contrains;

drop table Unique_Contrains;

Use constraints
CREATE TABLE Check_Constraint(
emp_id int not null check(emp_id between 0 and 1000),
emp_Name varchar(100) not null ,
entered_date datetime check(entered_date <= current_Timestamp),
Dept_id int check(Dept_id >0 and Dept_id<=100)); 

INSERT Check_Constraint values(1000,'geetha','2024-02-23 12:23:46.813',10)
INSERT Check_Constraint values(1001,'muni','2024-02-23 12:23:46.813',10) 

CREATE TABLE Primary_Constraint(
id int not null primary key,
first_Name varchar(100),
Last_Name varchar(100));

create table Foreign_keyTable(
id int,
name varchar(100),
foreign_no int foreign key References  Primary_Constraint(id));



select * from Check_Constraint;

