SELECT * FROM Orders

-- Format a date however you like --
SELECT
o.OrderID,
FORMAT(o.OrderDate, 'dd/mm/yyyy')
FROM Orders o

-- Research THESE --
-- ROUND 
-- FORMAT

/*
SUBQUERIES
SUBQUERIES
SUBQUERIES
SUBQUERIES

a query inside a query 
we use braces to operate inner queries. Allows us to show
that this clause contains this operation in the braces as
it operates.
*/

-- WHO has not ordered --
SELECT c.CompanyName AS "Customer"
FROM Customers c
WHERE CustomerID NOT IN
    (SELECT CustomerID FROM Orders)

-- Creates a subquery as a column to get round conflicts --
SELECT OrderID, ProductID, UnitPrice, Quantity, Discount,
    (SELECT MAX(Unitprice) FROM [Order Details] od) AS "MAX PRICE"
FROM [Order Details] od

-- Creates a subquery as a table --
SELECT
od.ProductID,
sq1.totalamt AS "TOTAL SOLD FOR THE PRODUCT",
od.UnitPrice,
od.UnitPrice*od.Quantity/sq1.totalamt*100 AS "% of Total"
FROM [Order Details] od
INNER JOIN
    (SELECT od.ProductID, SUM(od.UnitPrice*od.Quantity) AS totalamt
    FROM [Order Details] od
    GROUP BY od.ProductID) sq1 ON sq1.ProductID=od.ProductID


SELECT * FROM [Order Details]
SELECT * FROM Products


-- SAME OPERATION 2 DIFFERENT WAYS --
-- JOINS VS SUBQUERIES --

SELECT 
od.OrderID,
od.ProductID,
od.Quantity,
od.UnitPrice,
od.Discount
FROM [Order Details] od
WHERE od.ProductID IN
/* 
The common column can allow us to access a tables columns via a subquery
and also run a similar hierarchy of functions
*/
    (SELECT p.ProductID
    FROM Products p
    WHERE p.Discontinued=1)



SELECT
od.OrderID,
od.ProductID,
od.Quantity,
od.UnitPrice,
od.Discount
FROM [Order Details] od
INNER JOIN Products p ON p.ProductID = od.ProductID


--union--
SELECT * FROM Employees
SELECT * FROM Suppliers

SELECT e.Firstname AS "EMPLOYEE/SUPPLIER"
FROM Employees e
UNION
SELECT s.ContactName
FROM Suppliers s

-- order by can have a value representing the column number to select the column you want -- 



