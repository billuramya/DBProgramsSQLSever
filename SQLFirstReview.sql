--Select the names and ages of all employees who are between the ages of 25 and 35:
--Select the names and salaries of all employees who make more than $60,000 
--and work in the "IT" department:
--Select the total salary of all employees:
--Select the names of all employees who do not have a salary value:
--Select the names and ages of all employees, sorted by age in ascending order:
--Select the top 2 departments with the highest total salary:

alter table employeeDetails 
add department varchar(100)
update EmployeeDetails
set department = 'ESE'
WHERE ID IN(1,3,4,6,7)

select * from EmployeeDetails




select name ,age from EmployeeDetails
where age BETWEEN 25 AND 35;

select name,Salary from EmployeeDetails 
where Salary > 60000 and department ='IT'; 

select sum(Salary) as total_Salary from EmployeeDetails

select name ,age from EmployeeDetails order by age asc

select * from EmployeeDetails order by Salary desc offset 0 rows fetch next 2 rows only 

SELECT TOP  2 * FROM EmployeeDetails order by department;

SELECT * FROM EmployeeDetails WHERE Salary =NULL;

--DELETE FROM EmployeeDetails WHERE department ='IT' AND Address = 'HYD';