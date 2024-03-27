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
CREATE TRIGGER AfterInsertEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog (EventType, EventDateTime, EmployeeID, FirstName, LastName, Position)
    SELECT 'Insert', GETDATE(), i.EmployeeID, i.FirstName, i.LastName, i.Position
    FROM inserted i;
END;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position)
VALUES (1, 'John', 'Doe', 'Manager'); 


