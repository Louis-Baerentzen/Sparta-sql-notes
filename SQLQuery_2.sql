USE Northwind

-- Select all employees from london --
SELECT * FROM employees WHERE city ='London'

-- Select all where they have a title of doctor --
SELECT * FROM employees WHERE TitleOfCourtesy ='Dr.'

-- Select all from products table --
SELECT * FROM products

SELECT * FROM Customers

-- Select discontinued products only --
SELECT * FROM products WHERE Discontinued = 1

-- Select products where unit price is less than 100 --
SELECT * FROM products WHERE UnitPrice < 100.0000


SELECT * FROM Suppliers s WHERE s.CompanyName LIKE '%''%' 

SP_HELP Products

/*
ALIASING
use an alias title to rename the table to be able to access the columns inside that table
this can be any title you like 
*/

-- SELECT ALL ENTRIES WHERE THE CITY IS IN FRANCE --
SELECT louis.CompanyName, louis.City
FROM Customers louis WHERE louis.Country='France'

-- SELECT THE TOP 10 ENTRIES WHERE THE CITY IS IN FRANCE --
SELECT TOP 10 c.CompanyName, c.City
FROM Customers c WHERE c.Country='France'

-- SELECTING TWO COLUMNS BASED ON CRITERIA FROM OTHER COLUMNS --
SELECT p.ProductName, p.UnitPrice -- SHOWING THESE 2 COLUMNS --
FROM Products p WHERE p.CategoryID = 1 AND p.Discontinued = 0 -- BASED ON THESE CRITERIA --

SELECT p.ProductName, p.UnitPrice
FROM Products p WHERE p.UnitsInStock > 0 AND p.UnitPrice > 29.99

SELECT DISTINCT c.Country
FROM Customers c WHERE c.ContactTitle = 'Owner'  

-- The Like operator and wildcards --

/* Used as a substitute for 0 or more characters 
L% L is the first character in string
%L% L is anywhere in the string
_i% i is the second character in the string

CHARLIST SORT OF LIKE AN ARRAY 
'[LMS]%' only names starting with LMS
'[^LMS]%' only names except LMS
*/

-- SELECT first character from FirstName --
SELECT e.FirstName
FROM Employees e WHERE e.FirstName LIKE 'L%'

SELECT e.FirstName
FROM Employees e WHERE e.FirstName LIKE '_i%'

SELECT e.FirstName
FROM Employees e WHERE e.FirstName LIKE '[^LMS]%'

SELECT e.LastName
FROM Employees e WHERE e.LastName LIKE '%a'

SELECT e.FirstName
FROM Employees e WHERE e.FirstName LIKE '%a__'

-- ALL regions where the second character is a

SELECT *
FROM Customers c WHERE c.Region LIKE '%a__'


--IN OPERATOR SAVE TIME & USE BRACES --
-- Find customers in two specific named regions
SELECT * 
FROM Customers c WHERE c.Region IN ('WA','SP')


-- BETWEEN VALUES --
SELECT * 
FROM EmployeeTerritories et
WHERE et.TerritoryID >= 06800 AND et.TerritoryID <= 09999 

-- LESS THAN VALUE --
SELECT *
FROM Products p WHERE p.UnitPrice < 5.00

-- SELECT --
SELECT *
FROM Categories cat
WHERE cat.CategoryName LIKE '[BS]%'

-- COUNTING AND GROUP DATA--
--SELECT A COUNT OF ALL --
SELECT COUNT (*) 
-- FROM the ORDERS table aliased as o -- 
FROM Orders o
-- Where we retrieve 2 employees (number 5 and 7) 
WHERE o.EmployeeID IN (5,7)

-- COUNT ALL THE ORDERS FROM EACH EMPLOYEE THEN GENERATING A TEMPORARY COLUMN IN RED --
SELECT o.EmployeeID,COUNT(o.OrderID) AS "ORDERS PER EMPLOYEE"
-- 1. FROM THE TABLE ORDERS --
FROM Orders o
-- 2. WHERE WE SELCET FROM 2 EMPLOYEES ONLY FILTER IN TOT EMPLOYEES --
WHERE o.EmployeeID IN (5,7)
-- 3. GROUP BY THE EMPLOYEE ID SO WE CAN SEPARATE THE VALUES --
GROUP BY o.EmployeeID

SELECT * FROM Orders
SELECT * FROM Customers


--CONCAT--
SELECT
c.CompanyName AS "Company Name",
CONCAT(c.City , ', ' , c.Country) AS "City"

FROM Customers c

-- CONCAT COLUMNS --
SELECT e.FirstName + ' ' + e.LastName  AS "FULL NAME" 
FROM Employees e

SELECT
-- THIS ACTS AS A NAME CHANGE REPLACING THE COLUMN TITLE --
c.CompanyName AS "Company Name",
-- THIS IS WHERE THE CONCATENATION OCCOURS INSIDE THE BRACES --
CONCAT (c.City , ', ' , c.Country) AS "Location"
-- FROM THIS TABLE --
FROM Customers c
-- WHERE THE REGION IS NULL OR NO VALUE IS APPLIED --
WHERE c.Region IS NULL


--HOMEWORK TASK 2--
SELECT c.Country
FROM Customers c
WHERE c.Region IS NOT NULL

SELECT * FROM Customers