
-- create view 
create view Vstudent
as 
select * from Student 

select * from Vstudent 

--see the query 
sp_helptext Vstudent 

--Modify the view 
Alter view Vstudent 
as 
select std_Name FROM Student

--drop the view 
drop view Vstudent  

-- create view of two tables 
create view vEmployee
as 
select a.id,a.age,b.emp_name from EmployeeDetails a inner join EmployeeNames b on a.id=b.id 


select * from vEmployee