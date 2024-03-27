--Consider two tables, Students with columns StudentID, FirstName, LastName, 
--and Courses with columns CourseID, CourseName, and StudentID. Write SQL queries to: 

select * from Students
select * from Courses 


--Select students who have enrolled in at least one course.
select * from Students inner join Courses on Students.StudentID=Courses.StudentID

--Retrieve students who have not enrolled in any course. 
select StudentID from Students 
except
select Distinct StudentID from Courses  

select StudentID from Students 
where StudentID not in ( select Distinct StudentID from Courses  )

--Problem: Create a stored procedure that updates a 'Products' table with 
--the provided product name and price for the record that matches the provided product ID. 

alter procedure upsProducts 
@ProductID int
as 
begin
 update Product set ProductName='anu' where ProductID = @ProductID
end
 
exec upsProducts 1

--create a function that takes input of 1 and 2. if user input is 1,
--it return east if user inputs 2, it returns west. if user gives 0 input. no values are returned. 

CREATE FUNCTION ReturnValue(@input int)
returns varchar(100)
as 
begin
declare @result varchar(100)
 if @input=1
 begin 
  set @result = 'east '
 end
  if @input=2
  begin
 set @result ='west'
  end
  if @input=0
  begin
 set @result =' '
  end
 return @result 
 end 

select dbo.ReturnValue(1) ;