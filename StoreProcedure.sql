-- create stored procedure 
CREATE PROCEDURE uspEmployeeDetails 
as 
BEGIN 
SELECT * FROM EmployeeDetails
END

-- EXECUTE Store Procedure

uspEmployeeDetails 
EXECUTE uspEmployeeDetails  
EXEC uspEmployeeDetails 

--drop store procedure 
drop proc uspEmployeeDetails  

--Alter/modify Store Procedure 
ALTER PROCEDURE uspEmployeeDetails 
as 
BEGIN 
SELECT * FROM EmployeeDetails where id=1
select * from EmployeeDetails where id=3
END

--Parameterized store procedure 
alter PROCEDURE uspEmployeeDetails
@emp_id int,
@emp_salary decimal
as 
BEGIN 
SELECT * FROM EmployeeDetails where id=@emp_id
select * from EmployeeDetails where Salary>3000
END

uspEmployeeDetails 1,4000.00 
--passing parameters
uspEmployeeDetails @emp_salary = 7000.00,@emp_id=2

-- giving default parameters
alter PROCEDURE uspEmployeeDetails
@emp_id int=5,
@emp_salary decimal = 5000.00
as 
BEGIN 
SELECT * FROM EmployeeDetails where id=@emp_id
select * from EmployeeDetails where Salary>5000
END

uspEmployeeDetails @emp_salary = 7000.00,@emp_id=2

-- if -else in stored procedure 

alter procedure uspEmployeeDetails 
as 
begin
declare @emp_age int 
select * from EmployeeDetails where age > @emp_age
  if @emp_age > 20 
    BEGIN
		PRINT 'AGE IS MORE THAN 20 YEARS'
	END
	ELSE 
		BEGIN
			PRINT 'age is less than 20 years'
		END

end
uspEmployeeDetails;
exec uspEmployeeDetails 13; 

--while loop on stored procedure  

alter procedure uspEmployeeDetails 
as 
	begin 
		declare @num1 int =1 
			while @num1 <=5
			begin
				PRINT @num1
				set @num1 +=1 
			end
end

exec uspEmployeeDetails 

-- using BREAK key word in stored procedure 

alter procedure uspEmployeeDetails 
as 
	begin 
		declare @num1 int =1 
			while @num1 <=5
			begin
				set @num1 +=1 
				IF @num1 =4
				begin
					break;
				end
				PRINT @num1
				
			end
end

exec uspEmployeeDetails 

-- Continue command in stored procedure
alter procedure uspEmployeeDetails 
as 
	begin 
		declare @num1 int =0 
			while @num1 <=5
			begin
				
				IF @num1 =4
				begin
					continue
				end
				set @num1 +=1 
				PRINT @num1
				
			end
end

exec uspEmployeeDetails  

-- using TRY CATCH in store procedure 
create procedure usingTyrCtch 
@n1 decimal,
@n2 decimal ,
@n decimal output
as
begin 
begin try 
set @n=@n1/@n2
end try 
begin catch 
select 
ERROR_LINE() as errorline,
ERROR_MESSAGE() as errorMessage,
ERROR_NUMBER() as errorNumber ,
ERROR_PROCEDURE() as errorProcedure,
ERROR_SEVERITY() as errorSeverity,
ERROR_STATE() as errorState

RAISERROR(
end catch
end;

declare @r decimal 
exec usingTyrCtch 20,4,@r output  
PRINT @r


-- raiserrors in store proc 
create procedure RaiseErrors
as
begin 
DECLARE 
    @ErrorMessage  NVARCHAR(4000), 
    @ErrorSeverity INT, 
    @ErrorState    INT;

BEGIN TRY
    RAISERROR('Error occurred in the TRY block.', 17, 1);
END TRY
BEGIN CATCH
    SELECT 
        @ErrorMessage = ERROR_MESSAGE(), 
        @ErrorSeverity = ERROR_SEVERITY(), 
        @ErrorState = ERROR_STATE();

    -- return the error inside the CATCH block
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;
end; 

--declare @r decimal 
--exec usingTyrCtch 20,0,@r output  
--PRINT @r
