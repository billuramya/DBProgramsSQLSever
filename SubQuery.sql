use Address_Book
select * from AddressBooks
select * from employee_payroll 

use Employee;
select * from Emp_hyd
where salary > (select max(salary) from Emp_chennai)
--use ALL command
select * from Emp_hyd
where salary >All (select salary from Emp_chennai) 

select * from Emp_hyd
where salary > (select min(salary) from Emp_chennai)
--use ANY command
select * from Emp_hyd
where salary <any (select salary from Emp_chennai)

-- EXISTS command
select * from Emp_hyd where exists (select * from Emp_chennai where Emp_hyd.id=Emp_chennai.id)
-- NOT Exists command
select * from Emp_hyd where not exists (select * from Emp_chennai where Emp_hyd.id=Emp_chennai.id)

--Retrieve all employees who have a salary greater than the average salary of their department
select * from Emp_hyd
where Salary > ( select avg(salary) from Emp_chennai where Emp_chennai.id = Emp_hyd.id)

select * from Emp_chennai where emp_name in (select emp_name from Emp_hyd where emp_name in ('ramya','siva'));


select a.salary,c.Address,c.department 
from ((Emp_chennai a inner join Emp_hyd b on a.id=b.id)
inner join EmployeeDetails c on a.emp_name=c.name) 
inner join EmployeeNames e on e.emp_name=a.emp_name  

-- corelated sub query
select * from Emp_hyd
where salary < (select salary from Emp_chennai)

--non corelated sub query
select * from Emp_hyd
where salary > (select salary from Emp_chennai where Emp_chennai.id = Emp_hyd.emp_name)
