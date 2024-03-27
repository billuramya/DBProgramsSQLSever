select * from EmployeeDetails;

insert EmployeeDetails values(2,'venu',23,'chittoor',30000),
(3,'jayanth',23,'nellor',34000),(4,'siva',20,'Kadapa',60000),(5,'venu',23,'chittoor',30000); 

--queary data
select id ,name from EmployeeDetails where age >= 22;

-- oderby and group by
use Employee;
SELECT
    name,city
FROM
    EmployeeDetails
WHERE
    age < 25
GROUP BY
    city
ORDER BY
    city,name DESC; 

	 -- group by to perfor the having 

use Employee;
SELECT
    city,
    COUNT (*)
FROM
    EmployeeDetails
WHERE
    age < 25
GROUP BY
    city
HAVING count(*)>=1
ORDER BY
    city; 

	--distinct
select distinct name from EmployeeDetails 

--AND or OR condition 

SELECT * FROM EmployeeDetails 
where age =22 AND name = 'ramya'; 

SELECT * FROM EmployeeDetails 
where age =23 or name = 'ramya';

-- IN keyWord
SELECT * FROM EmployeeDetails 
where age IN (20,23,24); 

-- BETWEEN Keyword 
SELECT * FROM EmployeeDetails 
where salary between 50000 and 70000;

--LIKE it using string matching 

select * from EmployeeDetails
where name like 'r%'; 

select * from EmployeeDetails
order by age
OFFSET 2 ROWS
fetch next 2 rows only; 

-- rollup query 
select salary,count(*)as rollup_col from EmployeeDetails group by Rollup(Salary) 

-- cube 
select salary,count(*)as cube_col,name from EmployeeDetails group by cube(Salary,name)

create table Emp_hyd (id int ,emp_name varchar(100),salary decimal)
create table Emp_chennai (id int ,emp_name varchar(100),salary decimal)

update Emp_hyd set salary = 500000 where emp_name = 'ramya';

select * from Emp_hyd
union
select * from Emp_chennai
union 
select id,name,Salary from EmployeeDetails

select * from Emp_hyd
union all
select * from Emp_chennai

select * from Emp_hyd
intersect
select * from Emp_chennai 

select * from Emp_hyd
except
select * from Emp_chennai