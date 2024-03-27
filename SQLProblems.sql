--Imagine a table named Products with columns ProductID, ProductName,
--Price, and StockQuantity. Write SQL queries to:
--Select products with a price less than 50.
--Retrieve products with a stock quantity greater than 100.
--Select products with a price between 20 and 100.

create table Product
(ProductID int, 
ProductName varchar(100),
Price decimal, 
StockQuantity int)

insert into Product(ProductID, ProductName,
Price, StockQuantity) VALUES(7,'lokhesh',40,238)
drop table Product


select ProductID, ProductName,
Price,StockQuantity from Product
where price < 50 and StockQuantity >100 and  price between 20 and 100 


--Consider a table named Orders with columns OrderID, CustomerID, OrderDate, and TotalAmount. Write SQL queries to:
--Select all orders and arrange them in descending order based on the OrderDate.
--Retrieve orders for a specific CustomerID and arrange them in ascending order based on TotalAmount.
--Select orders with a total amount greater than 500, ordered by TotalAmount in descending order. 
-- Create the Orders table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- Insert sample values into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) 
VALUES
    (1, 101, '2024-03-25', 300.50),
    (2, 102, '2024-03-24', 550.75),
    (3, 103, '2024-03-23', 700.00),
    (4, 101, '2024-03-22', 450.25),
    (5, 102, '2024-03-21', 800.00);


select OrderID, CustomerID, OrderDate,TotalAmount from Orders 
order by orderDate desc

select * from Orders where TotalAmount > 500 order by TotalAmount desc


--Consider two tables, Customers with columns CustomerID, FirstName, LastName, and Orders
--with columns OrderID, CustomerID, OrderDate, and TotalAmount. Write SQL queries to:
--Retrieve the customer information along with their order details.
--Select customers who have not placed any orders.
--Find the total amount spent by each customer.



	select * from Customers
	where CustomerID not in (select distinct CustomerID from  orders) 


	select FirstName, sum(orders.TotalAmount) as total_Amounr from Customers INNER join Orders on
	Customers.CustomerID=Orders.CustomerID
	group by Customers.CustomerID,FirstName

--Consider two tables, Customers with columns CustomerID, FirstName, LastName, 
--and Orders with columns OrderID, CustomerID, OrderDate, and TotalAmount. Write SQL queries to:
--Find the average total amount spent by customers.
--Retrieve a list of customers who have spent more than the average total amount.

select firstName,LastName,avg(totalAmount) as avg_total from customers inner join orders on Customers.CustomerID=Orders.CustomerID
group by Customers.CustomerID,FirstName,LastName

select sum(totalAmount) from orders

--Consider two tables, Students with columns StudentID, FirstName, 
--LastName, and Courses with columns CourseID, CourseName, and StudentID. Write SQL queries to:
--Select students who have enrolled in at least one course.
--Retrieve students who have not enrolled in any course.


select DISTINCT Students.studentId from Students inner join Courses on Students.studentID=Courses.StudentID

select * from Courses 
where studentID NOT IN (SELECT DISTINCT StudentID from students)




-- Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Insert sample values into the Students table
INSERT INTO Students (StudentID, FirstName, LastName) 
VALUES
    (1, 'John', 'Doe'),
    (2, 'Jane', 'Smith'),
    (3, 'Alice', 'Johnson'),
    (4, 'Bob', 'Brown');

-- Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Insert sample values into the Courses table
INSERT INTO Courses (CourseID, CourseName, StudentID) 
VALUES
    (101, 'Math', 1),
    (102, 'Physics', 2),
    (103, 'Biology', 3),
    (104, 'Chemistry', 1),
    (105, 'History', 4);


--6)Imagine three tables, Products with columns ProductID, ProductName, Price, CategoryID, 
--and SupplierID, Categories with columns CategoryID and CategoryName, and Suppliers with columns
--SupplierID and SupplierName. Write SQL queries to:
--Retrieve a list of all products with their corresponding category and supplier information.
--Select products from a specific category along with the supplier information.

create table Categories(
CategoryID int PRIMARY KEY,
CategoryName varchar(100)) 
insert Categories values(1,'category_1'),(2,'category_2'),(3,'category_3')

CREATE TABLE Suppliers (
SupplierID int, SupplierName varchar(50))
insert Suppliers values(1,'Suppliers_1'),(2,'Suppliers_2'),(3,'Suppliers_3')


select * from Suppliers 
select * from Product 
select * from Categories

select * from Product inner join Categories c on Product.ProductID = C.CategoryID 
inner join Suppliers on Suppliers.SupplierID = c.CategoryID
 where Product.ProductID=2;  

-- 7)Consider three tables, Employees with columns EmployeeID, FirstName, LastName,
-- Projects with columns ProjectID and ProjectName, and Assignments with columns AssignmentID,
-- EmployeeID, and ProjectID. Write SQL queries to:
--Retrieve a list of all employees with their corresponding assigned projects.
--Select employees along with the project information for a specific project. 
create table Employee(
EmployeeID INT,FirstName varchar(50),LastName varchar(50) ) 

create table Projects (
ProjectID INT,ProjectName varchar(100)) 

create table Assignment (
AssignmentID INT,
EmployeeID int ,
ProjectID INT,
foreign key (EmployeeID) references Employee(EmployeeID),
foreign key (ProjectID) references Project(ProjectID))
