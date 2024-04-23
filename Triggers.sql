create table Employees(EmployeeID int, FirstName varchar(50), LastName varchar(50), Position varchar(50))

-- Recreate the AuditLog table with LogID as an identity column
CREATE TABLE AuditLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    EventType VARCHAR(50),
    EventDateTime DATETIME,
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50)
);
-- employee
alter TRIGGER AfterInsertEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    --INSERT INTO AuditLog (EventType, EventDateTime, EmployeeID, FirstName, LastName, Position)
    --SELECT 'Insert', GETDATE(), i.EmployeeID, i.FirstName, i.LastName, i.Position
    --FROM inserted i; 
	--insert into  Employees(EmployeeID,FirstName,LastName,Position)
	--select EmployeeID,FirstName,LastName,Position
	--FROM inserted; 
	END;
--UPDATE

ALTER TRIGGER AfterInsertEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    UPDATE Employees
    SET EmployeeID = 3
    FROM Employees e
    INNER JOIN inserted i ON e.EmployeeID = i.EmployeeID
    WHERE i.FirstName = 'Ramya'; 
END;


	INSERT INTO Employees (EmployeeID, FirstName, LastName, Position)
VALUES (2,'Ramya','Billu','HR'); 

use Ramya
select * from Employees
DELETE FROM Employees where FirstName='Ramya'



-- insert operation on triggers
alter TRIGGER AfterInsertEmployee
ON Employees
After Insert
as
begin 
set nocount on ;
insert into AuditLog(EventType,EventDateTime,EmployeeID,FirstName,LastName,Position)
select 'Insert',GetDate(),i.EmployeeID,i.FirstName,i.LastName,i.Position from inserted i
end
insert into Employees(EmployeeID,FirstName,LastName,Position) values(3,'Lokesh','Ramisetty','Developer')

-- Delete Operation Triggers
alter TRIGGER AfterInsertEmployee
ON Employees
After Delete
as
begin 
set nocount on ;
insert into AuditLog(EventType,EventDateTime,EmployeeID,FirstName,LastName,Position)
select 'Delete',GetDate(),i.EmployeeID,i.FirstName,i.LastName,i.Position from Deleted i
end

delete from Employees where EmployeeID=2;

-- Update the triggers table
alter TRIGGER AfterInsertEmployee
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

     Handling INSERT operations
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO AuditLog (EventType, EventDateTime, EmployeeID, FirstName, LastName, Position)
        SELECT 'Insert', GETDATE(), i.EmployeeID, i.FirstName, i.LastName, i.Position
        FROM inserted i;
    END
IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO AuditLog (EventType, EventDateTime, EmployeeID, FirstName, LastName, Position)
        SELECT 'Update', GETDATE(), d.EmployeeID, d.FirstName, d.LastName, d.Position
        FROM deleted d;
    END
end 

update Employees Set Position='CEO' WHERE EmployeeID=3

 SELECT * FROM AuditLog
