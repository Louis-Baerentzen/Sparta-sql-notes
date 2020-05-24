Use Northwind

SELECT film_name, CHARINDEX('s', film_name)
AS "Position of Character"
FROM film_table ;
 
SELECT film_name,
SUBSTRING(film_name, 1, 3)
AS "Extracted String"
FROM film_table
 
SELECT film_name,
RIGHT(film_name, 2)
AS "Extracted String"
FROM film_table
 
SELECT film_name,
RTRIM(film_name)
AS "Trimmed String"
FROM film_table
 
SELECT film_name,
REPLACE(film_name,' ','A')
AS "Replaced String"
FROM film_table
 
SELECT film_name,
LEN(film_name)
AS "LENGTH of String"
FROM film_table
 
SELECT film_name,
UPPER(film_name)
AS "Uppercase String",
LOWER(film_name)
AS "Lowercase String"
FROM film_table


-- SELECTING LENGTH --
SELECT c.PostalCode AS "Post Code",
-- Start from the left, find the space and stop reading string at this point -- 
LEFT (c.PostalCode, CHARINDEX (' ',PostalCode)-1) AS "Post Code Reigon",
-- Calculate length and repeat process above to give us the string length --
LEN(LEFT (c.PostalCode, CHARINDEX (' ',PostalCode)-1)) AS " LENGTH of Post Code Reigon",
-- Tell us where the position of space is located in string --
CHARINDEX(' ',PostalCode) AS "Space Found",
c.Country
FROM Customers c
WHERE c.Country = 'UK'

SELECT * FROM Products

SELECT p.ProductName AS "Product Name"
FROM Products p
-- Return names that have more than 0 apostrophes: an escape character --
WHERE CHARINDEX ('''', p.ProductName) >0


-- DATE DIFFERNECE --

-- EXTENDING THE DATE BY 5 DAYS --
SELECT
-- adds 5 days onto the date --
DATEADD(d,5,o.OrderDate) AS "Due Date",
-- comparing values from 2 columns to return the days in shipping --
DATEDIFF(d,o.OrderDate,o.ShippedDate) AS "Ship Days"
FROM Orders o


SELECT * FROM Employees


-- Date Diff to obtain the age of an employee --

-- We first conatenate two columns to make alias column full name --
SELECT e.FirstName+ ' ' +e.LastName AS "Employees Name",
/* Then calc the age from current year minus the birthdate 
returning the values under a new column called "Age" */
DATEDIFF(YEAR,e.BirthDate,GETDATE()) AS "Age"
-- From this table --
FROM Employees e
/* The date diff calculates the current year against
the value in birthdate column from the employees table
to generate our age in new column */

-- Determine if shipments are overdue based on a 10 day schedule --

SELECT DATEDIFF(dd,o.OrderDate,o.ShippedDate) AS "Shipping Days",
-- Creates a case for a status to determine a value --
CASE
-- WHEN the differnece between the dates is less than 10 -- 
WHEN DATEDIFF(dd,o.OrderDate,o.ShippedDate) <10 
-- return this --
THEN 'ON TIME'
-- if not return this --
ELSE 'OVERDUE'
-- end case and create this column --
END AS "Status"
-- From the table --
FROM Orders o



-- We conatenate two columns to make alias column full name --
SELECT e.FirstName+ ' ' +e.LastName AS "Employees Name",
-- Expression to calculate employee age --
DATEDIFF(YEAR,e.BirthDate,GETDATE()) AS "Age",
-- Start Case --
CASE
-- When we calc the age and it is over 65 --
WHEN DATEDIFF(YEAR,e.BirthDate,GETDATE()) > 65 
-- We return this result --
THEN 'Retired'
-- When we calc the age and it is over 60 --
WHEN DATEDIFF(YEAR,e.BirthDate,GETDATE()) > 60 
-- We return this result --
THEN 'Retirement Due'
-- Else we return this --
ELSE 'More than 5 Years to go'
-- End the clause and Title the column as
END AS "Retirement Status"
-- From this table --
FROM Employees e
/* The date diff calculates the current year against
the value in birthdate column from the employees table
to generate our age in new column */

-- AGGREGATE FUNCTIONS --

-- Obtain a value from calc an entire column --
SELECT SUM(p.UnitsOnOrder) AS "TOTAL ON ORDER"
FROM Products p

-- AVERAGE FROM THE WHOLE COLUMN --
SELECT AVG(p.UnitsOnOrder) AS "AVERAGE OVER ORDER"
FROM Products p

-- LOWEST VALUE FROM THE WHOLE COLUMN --
SELECT MIN(p.UnitsOnOrder) AS "SMALLEST ON ORDER"
FROM Products p

-- HIGHEST FROM THE WHOLE COLUMN --
SELECT MAX(p.UnitsOnOrder) AS "LARGEST ON ORDER"
FROM Products p


/*
When using group by its going to do the same operation.
But count how many orders each supplier has then perform
the agg. functions on those results
*/
SELECT p.SupplierID,
SUM(p.UnitsOnOrder) AS "TOTAL ON ORDER",
AVG(p.UnitsOnOrder) AS "AVERAGE OVER ORDERS",
MAX(p.UnitsOnOrder) AS "LARGEST ON ORDER"
FROM Products p
GROUP BY SupplierID

SELECT * FROM Products

-- GROUP BY TO CALC AVERAGE REORDER FOR ALL PRODUCTS BY THE CATEGORY ID --
-- YOU need the same amount of columns in GROUP BY as your select --
SELECT p.CategoryID, AVG(ReorderLevel) AS "AVERAGE REORDER AMOUNT"
FROM Products p
GROUP BY p.CategoryID
ORDER BY AVG(ReorderLevel) DESC


SELECT SupplierID,
SUM(p.UnitsOnOrder) AS "TOTAL ON ORDER",
AVG(p.UnitsOnOrder) AS "AVG ON ORDER"
FROM Products p
GROUP BY SupplierID
HAVING AVG(UnitsOnOrder) >5


-- WHEN YOU NEED TO MATCH ROWS FROM OTHER TABLES --
-- INNER JOIN --
SELECT * FROM student s
INNER JOIN course c ON s.course_id = c.c_id

-- LEFT JOIN --
SELECT * FROM student s
LEFT JOIN course c
ON s.course_id=c.c_id

-- RIGHT JOIN --
SELECT * FROM student s
RIGHT JOIN course c
ON s.course_id=c.c_id

-- FULL JOIN --
SELECT * FROM student s
FULL JOIN course c
ON s.course_id=c.c_id


/*
AFTER SESSION
AFTER SESSION
AFTER SESSION
AFTER SESSION
AFTER SESSION
*/

-- HOMEWORK 1 --
SELECT
o.OrderID,
o.OrderDate,
-- THANKS TO INNER JOIN Customers c --
c.CompanyName,
-- We can even join columns too from other tabless --
e.FirstName+ ' ' +e.LastName AS "Employees Name",
o.Freight 
FROM ((Orders o 
-- THESE, NOW BEING ACCESSED ALLOW US TO USE e. and c. IN THE SELECT CLAUSE --
INNER JOIN Customers c ON o.CustomerID = c.CustomerID)
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID)

-- HOMEWORK 2 --
SELECT DISTINCT
-- From join --
s.CompanyName,
-- Running a function to create a column --
AVG(p.UnitsOnOrder) AS "AVERAGE UNITS ON ORDER"
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY p.SupplierID, s.CompanyName
