create table Student(
id int primary key,
Std_Name varchar(100),
class varchar(50),
Math int,
Sceince int,
Eng int) 

select * from Student 


WITH cteStudent 
as 
(select id,Std_Name,(Math+Eng+Sceince)as total,(Math+Eng+Sceince)/3 as avg_total,
case when (Math+Eng+Sceince)/3 >70 then 'A' 
when (Math+Eng+Sceince)/3 >50 and (Math+Eng+Sceince)/3 <70 then 'B'
else 'F'
end as Grade
from Student)
select * from cteStudent;