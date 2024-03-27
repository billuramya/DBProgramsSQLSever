use Ramya
GO
-- how to cleate Scalar Function
 CREATE FUNCTION AddDigit( @num1 int,@num2 int)
 RETURNS int
 as
 BEGIN
 declare @result int 
 set @result=@num1+@num2  
 end
 --execute Scalar Function
 select dbo.AddDigit(2,4) 
 --alter the function
Alter FUNCTION AddDigit( @num1 int,@num2 int)
 RETURNS int
 as
 BEGIN
 declare @result int 
 set @result=@num1*@num2  
 end

 --execute Scalar Function
 select dbo.AddDigit(2,4) 

 -- drop the function
 drop function AddDigit

 CREATE FUNCTION GETtotalMarks(@id int)
 RETURNS INT 
 AS 
 begin
 DECLARE @result int 
 select @result=(Math+Eng+Sceince) from Student where id=@id
 return @result
 end
 select *,dbo.GETtotalMarks(id) FROM Student  

 --how to Create table function 
 -- inline Table value Function  
 Create Function TableValue(@Total int)
 returns Table
 as
 
 return select * from Student where (Math+Sceince+Eng) > @Total 
 
 select * from TableValue(150)


 select getdate() as date_time from Student

 -- add one day 
 select dateadd(day,6,getdate()) as tomarrow from student
 -- week name
 select datename(WEEKDAY,getdate()) as tomarrow from student 
 -- date difference 
 select datediff(year,2024-2-6,getdate()) as tomarrow from student 
 --get month
 select datepart(month,getdate()) as tomarrow from student
 --get year
 select datepart(year,getdate()) as tomarrow from student 

 --date formate
 select datefromParts(2024,3,4) as tomarrow from student 
 --time fromparts
 select timefromParts(20,3,4,5,7) as tomarrow from student  

 ---window functions 
 -- Sample data insertion
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, ProductID, SaleDate, Amount) 
VALUES
    (1, 101, '2024-01-01', 100.50),
    (2, 102, '2024-01-02', 200.75),
    (3, 101, '2024-01-03', 150.25),
    (4, 103, '2024-01-04', 120.00),
    (5, 102, '2024-01-05', 180.50);

-- Query to calculate total sales amount for each product and their ranks
SELECT 
    ProductID,
    SUM(Amount) AS TotalSalesAmount,
    RANK() OVER (ORDER BY SUM(Amount) DESC) AS SalesRank
FROM 
    Sales
GROUP BY 
    ProductID;

select * from Sales

--String Functions 
--ASCII Value
select Ascii('a')
select Ascii('z')
select Ascii('A')
select Ascii('Z')
-- char keyword 
 select char(87)
 select char(100)
 select char(125)  

 -- find the charecter index
 select charIndex('b','ramyabillu') 

 -- string concantination 

 select concat ('hello',' ','ramya',' ','how',' ','are',' ','you') 

 --concatinate multiple string with separator 
 select CONCAT_WS('_','SQL','server','Programning')
-- select specified characters right side using given charecters 
select RIGHT('HelloRamya',4) 
-- select specified characters left side using given charecters 
select left('HelloRamya',4)  

--length of string
 select len('Ramya') 
 -- LOWER CASE
 select Lower('RAMYA') 

 -- UPPER CASE 
 SELECT UPPER('ramya')

 -- PATINDEX to match the string  
 SELECT PATINDEX('%R%','HELLO RAMYA')
 --PATINDEX to match starting of the string 
 select PATINDEX('H%','HELLO RAMYA') 
 --PATINDEX to match ending of the string  
 select PATINDEX('%A','HELLO RAMYA')
 -- string REPLACE 
 select REPLACE('love you daddy','love','miss')  

 --System Functions  
 --cast key word 

 select 1+'1' as result
 select 1 + cast('1' as int) result
 select cast(5.94 as int) result
 select cast(5.94 as decimal(3,0)) result 
select cast('2024-04-27' as date) as result 
--covert operation one data type to another data type
select CONVERT(int,8.97) as result 
--iif function it's like if-else condition 
select iif(10>20,'ture','false') result 
-- choose function
select choose(1,'first','second','third') result


