----Modify an existing table by adding, modifying, or dropping columns or constraints Deletes 
----an existing table and all its data.Inserts new rows into a table.Modifies existing rows in
----a table.Removes rows from a table.Deletes all rows from a table while keeping the table structure intact. 

USE Employee;
INSERT INTO EmployeeDetails(id,age,Address,Salary)
Values(8,25,'Tirupathi',30000),(10,45,'Godavari',40000),(9,36,'Hyd',50000);

SELECT * FROM EmployeeDetails; 
use Employee;
Create Table EmployeeNames(id int ,emp_name varchar(255));

insert into EmployeeNames(id,emp_name)Values(1,'ramya'),(2,'uma'),(3,'venkat'),(4,'anjali'),(5,'naresh');


 sp_rename 'EmployeeDetails.city','Address' 

 select * from EmployeeDetails 

 alter table EmployeeDetails drop column name; 
 delete from EmployeeDetails where id=5; 

 --inner join
 select * from EmployeeNames emp inner join EmployeeDetails ed on (emp.id=ed.id)
 -- left join
 select * from EmployeeNames emp left join EmployeeDetails ed on (emp.id=ed.id)
 -- right join
 select * from EmployeeNames emp right join EmployeeDetails ed on (emp.id=ed.id)
 -- full join
 select * from EmployeeNames emp full join EmployeeDetails ed on (emp.id=ed.id)
 -- cross join
 select * from EmployeeNames emp cross join EmployeeDetails ed
  
  select * from employeeDetails where id=10;

  --create an index
CREATE CLUSTERED INDEX EMP_INDEX on EmployeeDetails(id asc)
-- to see index
sp_helpindex employeeDetails 

-- drop index 

drop index employeedetails.EMP_INDEX

CREATE nonCLUSTERED INDEX EMP_INDEX on EmployeeDetails(id asc)





