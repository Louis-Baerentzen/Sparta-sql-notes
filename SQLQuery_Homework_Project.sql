-- TASK FOR FRIDAY 22/5/2020 --

SELECT * FROM Suppliers
SELECT * FROM Employees
SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM Categories

---------------------------------------------------------------------------------------
--------------------------------- E X E R C I S E   1 ---------------------------------
---------------------------------------------------------------------------------------

--1 COMPLETE--
/*Write a query that lists all Customers in either Paris or London.
Include Customer ID, Company Name and all address fields. */
SELECT c.CustomerID, c.CompanyName, c.Address, c.City, c.Country
FROM Customers c
WHERE c.City = 'Paris' OR c.City = 'London'



--2 COMPLETE--
/* List all products stored in bottles */
SELECT p.QuantityPerUnit AS "Products with Bottles",
p.ProductName,
p.UnitsInStock
FROM Products p
-- just look for what you want inbetween the %symbols% --
WHERE p.QuantityPerUnit LIKE '%bottles%'



--3 COMPLETE--
/* Repeat question above, but add in the Supplier Name and Country. */
SELECT p.QuantityPerUnit AS "Products with Bottles",
p.ProductName,
p.UnitsInStock,
-- NEEDED SUPPLIERS NAME HERE --
s.SupplierID,
s.Country
FROM Products p
INNER JOIN Suppliers s ON s.SupplierID = p.SupplierID
-- just look for what you want inbetween the %symbols% --
WHERE p.QuantityPerUnit LIKE '%bottles%'



--4 COMPLETE--
/* Write an SQL Statement that shows how many products there are
in each category. Include Category Name in result set and list
the highest number first */
SELECT DISTINCT
c.CategoryName,
SUM(p.UnitsInStock) AS "TOTAL IN CATEGORY"
FROM Products p 
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
-- WE GROUP BY THE CATEGROIES --
GROUP BY c.CategoryName
-- THEN ORDER BY THE QUANTITY --
ORDER BY SUM(p.UnitsInStock)DESC



--5 COMPLETE--
/* List all UK employees using concatenation to join their title
of courtesy, first name and last name together. Also include their
city of residence */

SELECT * FROM Employees

SELECT DISTINCT
e.TitleOfCourtesy + ' ' + e.FirstName + ' ' + e.LastName AS "EMPLOYEE",
e.Country,
e.City
FROM Employees e 
WHERE e.Country = 'UK'



--6 COMPLETE--
/* List Sales Totals for all Sales Regions (via the Territories table
using 4 joins) with a Sales Total greater than 1,000,000. Use rounding
or FORMAT to present the numbers. */

-- Database name in braces due to spaces in title --
SELECT * FROM Territories
SELECT * FROM EmployeeTerritories
SELECT * FROM Employees
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Region

SELECT
-- WHICH REGION IS IT--
r.RegionDescription,
-- Factor in the discounts where necessary --
ROUND (SUM (od.Quantity*od.UnitPrice*(1-od.Discount)),2) AS "AFTER DISCOUNTS : FINAL",
-- Count the orders each region has made --
COUNT (o.OrderID) AS "ORDERS BY EACH REGION",
-- Find how many units of product they've bought --
SUM (od.Quantity) AS "SKU ORDERED BY EACH REGION",
-- Combine the two above to make the gross revenue --
SUM (od.Quantity*od.UnitPrice) AS "GROSS REVENUE"
FROM Territories t 
-- MAKE YOUR MULTIPLE JOINS LIKE LINKS IN A CHAIN --
-- REFERENCE THE SAME KEY FROM BOTH TABLES --
INNER JOIN EmployeeTerritories et ON et.TerritoryID = t.TerritoryID
INNER JOIN Employees e ON e.EmployeeID = et.EmployeeID
INNER JOIN Orders o ON o.EmployeeID = + e.EmployeeID
INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
INNER JOIN Region r ON t.RegionID = r.RegionID
-- DO A GROUP BY ON PK for good practice --
GROUP BY r.RegionDescription
-- PUT THE EQUATION HERE TO GET ROUND NOT BEING ABLE TO USE ALIAS NAME --
HAVING SUM (od.Quantity*od.UnitPrice) >1000000



--7 COMPLETE--
/* Count how many Orders have a Freight amount greater than 100.00 and
either USA or UK as Ship Country. */
SELECT * FROM Orders

SELECT
o.Freight AS "Freights Greater than 100",
o.ShipCountry
FROM Orders o
WHERE o.ShipCountry = 'UK' OR o.ShipCountry = 'USA'
GROUP BY o.Freight, o.ShipCountry
-- USE THE HAVING CLAUSE WHEN YOU HANDLE THESE NUMBERS --
HAVING o.freight > 100
ORDER BY o.Freight



--8 COMPLETE--
/* Write an SQL Statement to identify the Order Number of the
Order with the highest amount of discount applied to that order */ 
SELECT * FROM Orders
SELECT * FROM [Order Details]

SELECT TOP 1
o.OrderID,
COUNT (od.Discount) AS "DISCOUNTS FOR ORDER"
FROM Orders o
INNER JOIN [Order details] od ON od.orderID = o.OrderID
GROUP BY o.orderID, od.Discount
ORDER BY MAX(od.Discount) DESC

SELECT TOP 1
o.OrderID,
COUNT (od.Discount) AS "DISCOUNTS FOR ORDER"
FROM Orders o
INNER JOIN [Order details] od ON od.orderID = o.OrderID
GROUP BY o.orderID, od.Discount

SELECT TOP 1 o.OrderID, SUM(o.UnitPrice*o.Quantity*o.Discount) AS "Discount Amount"
FROM [Order Details] o
GROUP BY o.OrderID
ORDER BY SUM(o.UnitPrice*o.Quantity*o.Discount) DESC




---------------------------------------------------------------------------------------
--------------------------------- E X E R C I S E   2 ---------------------------------
---------------------------------------------------------------------------------------

--1 COMPLETE-- MARKS: 20/20
-- Write the correct SQL statement to create the following table --

USE louis_db
DROP TABLE SpartansTable

SELECT * FROM SpartansTable

CREATE TABLE SpartansTable(
    Title VARCHAR(5),
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    UniversityAttended VARCHAR(60),
    CourseStudied VARCHAR(100),
    GradeAttained VARCHAR(5),
);



--2 COMPLETE--
/* Write SQL statements to add the details of the Spartans in your course
to the table you have created. */

INSERT INTO SpartansTable (
    Title, FirstName, LastName, UniversityAttended, CourseStudied, GradeAttained
)
VALUES 
('Mr.','Louis','Baerentzen','University Of Worcester','Joint Ba.Hons in Graphic Design Multimedia & Illustration','2:1'),
('Mr.','Mohammed','Mahamud','University Of East London','BSc.Hons in Software Engineering','2:1'),
('Ms.','Sumaya','Mahamed','University Of South London','BSc.Hons in Computer Science','2:1'),
('Mr.','Arunabha','Chowdry','University Of East London','BSc.Hons in Astrology','2:1'),
('Mr.','Shariar','Halim','University Of Loughborough','BSc.Hons in Computer Science','2:1'),
('Mr.','Ricardo','Rosa','University Of North London','Joint BSc.Hons in Software Engineering & Computer Science','2:1'),
('Ms.','Elisabeth','Edge','University Of South London','Ba.Hons in History','2:1'),
('Mr.','Simon','Chen','University Of Central London','Msc.Hons in Mechanical Engineering','2:1'),
('Mr.','Alex','Matheakis','University Of East London','BSc.Hons in Software Engineering','2:1'),
('Mr.','Ebenezer','Mhango','University Of East London','BSc.Hons in Computer Science','2:1')


---------------------------------------------------------------------------------------
--------------------------------- E X E R C I S E   3 ---------------------------------
---------------------------------------------------------------------------------------

SELECT * FROM Suppliers 
SELECT * FROM Employees
SELECT * FROM [Order details]
SELECT * FROM Orders 

--1 COMPLETE-- MARKS: 5
/* List all Employees from the Employees table and who they report to */

SELECT
e.FirstName + ' ' + e.LastName AS "Employee",
e.ReportsTo
FROM Employees e

SELECT
e.FirstName + ' ' + e.LastName AS "Employee",
em.FirstName + ' ' + em.LastName AS "REPORTS TO"
FROM Employees e
LEFT JOIN Employees em ON e.ReportsTo = em.EmployeeID



--2 COMPLETE-- MARKS: 5
/* List all Suppliers with total sales over $10,000 in the Order Details
table. Include the Company Name from the Suppliers Table and present as
a bar chart as below */

SELECT DISTINCT
s.SupplierID,
s.CompanyName,
-- Doesn't need to be set in group by as it is a constructed column --
SUM(od.UnitPrice*od.Quantity) AS "TOTAL SALES",
ROUND(SUM(od.UnitPrice*od.Quantity*(1-od.Discount)),2) AS "TOTAL SALES WITH DISCOUNTS"
FROM Suppliers s
INNER JOIN Products p ON p.SupplierID = s.SupplierID
INNER JOIN [Order details] od ON od.ProductID = p.ProductID
INNER JOIN Orders o ON o.OrderID = od.OrderID
GROUP BY s.SupplierID, s.CompanyName 
HAVING SUM(od.UnitPrice*od.Quantity) >10000
-- IF YOU USE DISTINCT REMEMBER TO REFERNECE EVERYTHING --
ORDER BY ROUND (SUM(od.UnitPrice*od.Quantity*(1-od.Discount)),2) DESC



--3 COMPLETE--
/* List the Top 10 Customers YTD for the latest year in the Orders
file. Based on total value of orders shipped. No Excel required */

SELECT * FROM Customers
SELECT * FROM [Order details]
SELECT * FROM Orders 

SELECT TOP 10
-- Who are the companies --
c.CompanyName,
-- Calculate the order value from all of the customers --
ROUND (SUM (od.UnitPrice*od.Quantity*(1-od.Discount)),2) * COUNT(o.CustomerID) AS "ORDER VALUE",
-- Count how many times that copany appears --
COUNT(o.CustomerID) AS "ORDERS IN YTD",
o.CustomerID
-- from this table --
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN [Order details] od ON od.OrderID = o.OrderID
-- Select the year from this column --
WHERE DATEPART(yyyy, o.ShippedDate) =
    -- Select the highest year from the column --
    (SELECT MAX(DATEPART(yyyy, o.ShippedDate))
    -- From this table --
     FROM Orders o)
-- Group by the top companies --
GROUP BY c.CompanyName, o.CustomerID
-- and order by the order value from these customers --
ORDER BY ROUND (SUM (od.UnitPrice*od.Quantity*(1-od.Discount)),2) * COUNT(o.CustomerID) DESC


-- SAME Strategy with formatting for USD instead but we have very differnt values --

SELECT TOP 10
-- Who are the companies --
c.CompanyName,
-- Calculate the order value from all of the customers --
FORMAT( (SUM (od.UnitPrice*od.Quantity*(1-od.Discount))) * COUNT(o.CustomerID),'c') AS "ORDER VALUE",
-- Count how many times that copany appears --
COUNT(o.CustomerID) AS "ORDERS IN YTD",
o.CustomerID
-- from this table --
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN [Order details] od ON od.OrderID = o.OrderID
-- Select the year from this column --
WHERE DATEPART(yyyy, o.ShippedDate) =
    -- Select the highest year from the column --
    (SELECT MAX(DATEPART(yyyy, o.ShippedDate))
    -- From this table --
     FROM Orders o)
-- Group by the top companies --
GROUP BY c.CompanyName, o.CustomerID
-- and order by the order value from these customers --
ORDER BY FORMAT( (SUM (od.UnitPrice*od.Quantity*(1-od.Discount))) * COUNT(o.CustomerID),'c') DESC

-- Ebenezers Version --

SELECT  TOP 10 cus.CustomerID,cus.CompanyName,SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) AS "Orders Shipped",ord.OrderDate AS "Latest Year"
FROM Customers AS cus
--join  customer table and order table  
    INNER JOIN Orders AS ord ON cus.CustomerID = ord.CustomerID 
    INNER JOIN [Order Details] AS od ON ord.OrderID = od.OrderID
--WHERE  dates are located Looking for latest year in orderDate column.
--Takes part of the date whever month day or year.
WHERE DATEPART(YEAR,ord.shippedDate) = (SELECT Max(DATEPART(year,shippedDate)) from Orders)
--lists the names of customers in each country
--lists the latest orderDates.
GROUP BY cus.CompanyName,ord.OrderDate,cus.CustomerID
--Order SUM total of quantity * unite price
ORDER BY SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) DESC

-- Elizabeths Version --

SELECT TOP 10
o.CustomerID,
c.CompanyName,
FORMAT(SUM(od.UnitPrice*od.Quantity * (1-Discount)),'c') AS "Total Values"
FROM Orders o
INNER JOIN customers c ON c.CustomerID=o.CustomerID
INNER JOIN [Order Details] od ON od.OrderID=o.OrderID
WHERE YEAR(o.ShippedDate) = (SELECT MAX(YEAR(ShippedDate)) FROM Orders)
GROUP BY o.CustomerID, c.CompanyName
ORDER BY ROUND(SUM(od.UnitPrice*od.Quantity * (1-Discount)),0) DESC

-- ASTHAS VERSION --

SELECT TOP 10 c.CustomerID AS "Customer ID", c.CompanyName As "Company",
FORMAT(SUM(UnitPrice * Quantity * (1-Discount)),'C') 
AS "YTD Sales"
FROM Customers c
        INNER JOIN Orders o ON o.CustomerID=c.CustomerID
        INNER JOIN [Order Details] od ON od.OrderID=o.OrderID
    WHERE YEAR(o.ShippedDate)=(SELECT MAX(YEAR(ShippedDate)) From Orders)
    GROUP BY c.CustomerID, c.CompanyName
    ORDER BY SUM(UnitPrice * Quantity * (1-Discount)) DESC;


/* 4 Plot the Average Ship Time by month for all data in the Orders
Table using a line chart as below */

SELECT
DATEDIFF(dd, o.OrderDate, o.ShippedDate) AS "SHIPPING TIME"
FROM Orders o
--GROUP BY DATEADD (mm, DATEDIFF(mm, o.OrderDate, o.ShippedDate) ,0), o.OrderDate, o.ShippedDate --
GROUP BY MONTH(o.ShippedDate), o.OrderDate, o.ShippedDate


--4 STRAT 2--
SELECT CAST (MONTH('mm') AS CHAR(2)) + '-' + CAST(YEAR('yyyy') AS CHAR(4)), o.OrderID
FROM Orders o 
WHERE (o.OrderID = 1) AND (o.ShippedDate BETWEEN '1998-01-01' AND '1998-12-31')
GROUP BY CAST (MONTH('mm') AS CHAR(2)) + '-' + CAST(YEAR('yyyy') AS CHAR(4)), o.OrderID

-- How long is the ship time? --
-- extract the month and the year --

-- ALEXS VERSION WITH Rounded values --

SELECT 
YEAR(ord.orderDate)AS"Year",
Month(ord.orderDate)AS"Month",
AVG(DATEDIFF(DAY,ord.OrderDate,ord.ShippedDate))  AS "DAYS OF SHIPPED"
FROM orders As ord 
--Date returns a specified part of a date in this case Months.--
GROUP BY YEAR(ord.OrderDate),MONTH(ord.orderDate)
ORDER BY YEAR(ord.OrderDate),MONTH(ord.orderDate)

-- ASTHAS VERSION With decimals --

SELECT
YEAR(ord.orderDate)AS"Year",
Month(ord.orderDate)AS"Month",
AVG(CAST(DATEDIFF(Day,ord.OrderDate,ord.ShippedDate) AS DECIMAL(10,2)))  AS "DAYS OF SHIPPED"
FROM orders As ord 
--Date returns a specified part of a date in this case Months.--
GROUP BY YEAR(ord.OrderDate),MONTH(ord.orderDate)
ORDER BY YEAR(ord.OrderDate),MONTH(ord.orderDate)