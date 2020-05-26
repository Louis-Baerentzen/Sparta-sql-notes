
/*1. Create a report showing the title of courtesy and the first and last name
of all employees whose title of courtesy is not "Ms." or "Mrs.".*/
SELECT * FROM Employees

SELECT
e.TitleOfCourtesy,
(e.FirstName + ' ' + e.LastName) AS "Employee"
FROM Employees e
-- AND is important we want to exclude all of them --
WHERE e.TitleOfCourtesy != 'Ms.' AND e.TitleOfCourtesy != 'Mrs.'

--OR--

SELECT
e.TitleOfCourtesy,
(e.FirstName + ' ' + e.LastName) AS "Employee"
FROM Employees e
-- NOT IN is less confusing --
WHERE e.TitleOfCourtesy NOT IN ('Ms.', 'Mrs.')

/*2. Create a report that shows the company name, contact title, city and country of all customers 
in Mexico or in any city in Spain except Madrid(in Spain).*/
SELECT * FROM Customers

SELECT
c.CompanyName,
c.ContactTitle,
c.City,
c.Country
FROM Customers c
WHERE c.Country IN ('Mexico', 'Spain') AND c.City != 'Madrid'

/*3. Create a report showing the title of courtesy and the first and
last name of all employees whose title of courtesy begins with "M" and
is followed by any character and a period (.).*/
SELECT * FROM Employees

SELECT
e.TitleOfCourtesy,
(e.FirstName + ' ' + e.LastName) AS "Employee"
FROM Employees e
WHERE e.TitleOfCourtesy LIKE 'M_.'


/*4. Create a report showing the first and last names of
all employees whose region is defined.*/
SELECT * FROM Employees

SELECT
e.Region,
(e.FirstName + ' ' + e.FirstName) AS "Employee"
FROM Employees e
WHERE e.Region IS NOT NULL



/*5. Select the Title, FirstName and LastName columns from the Employees table.
Sort first by Title in ascending order and then by LastName 
in descending order.*/
SELECT * FROM Employees

SELECT 
e.Title,
e.FirstName,
e.LastName
FROM Employees e
ORDER BY e.Title, LastName DESC


/*6. Write a query to get the number of employees with the same job title.*/
SELECT * FROM Employees

SELECT TOP 1
COUNT (e.Title) AS "Employees in role",
e.Title
FROM Employees e
GROUP BY e.Title
ORDER BY COUNT (e.Title) DESC



/*7.
Create a report showing the Order ID, the name of the company that placed the order,
and the first and last name of the associated employee.
Only show orders placed after January 1, 1998 that shipped after they were required.
Sort by Company Name.
*/
SELECT * FROM Orders
SELECT * FROM Customers

SELECT
c.CompanyName,
o.OrderID,
CONCAT(e.FirstName,' ', e.LastName) AS "Employee"
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID 
INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
WHERE o.OrderDate > '1998-01-01' AND o.ShippedDate > o.RequiredDate
ORDER BY c.CompanyName

/*8.
Create a report that shows the total quantity of products (from OrderDetails table) ordered.
Only show records for products for which the quantity ordered is fewer than 200. 
The report should return*/
SELECT * FROM [Order Details]

SELECT
p.ProductName,
SUM(od.Quantity) AS "Units of Product Ordered"
FROM [Order Details] od
INNER JOIN Products p ON od.ProductID = p.ProductID
GROUP BY od.ProductID, p.ProductName
HAVING SUM(od.Quantity) < 200



/*9.Create a report that shows the total number of orders by Customer since December 31, 1996.
The report should only return rows for which the NumOrders is greater than 15. 
*/
SELECT * FROM Orders
SELECT * FROM Customers

SELECT
c.CompanyName,
o.CustomerID,
COUNT(o.OrderID)
FROM Customers c
INNER JOIN Orders o ON o.CustomerID = c.CustomerID
WHERE o.OrderDate > '1996-12-31'
GROUP BY o.CustomerID, c.CompanyName
HAVING COUNT(o.OrderID) > 15
ORDER BY COUNT(o.OrderID) DESC



/*10.  SQL statement will return all customers, and number of orders they might have placed. 
Include those customers as well who have not placed any orders.*/
SELECT * FROM Customers
SELECT * FROM Orders 

SELECT 
c.CompanyName,
COUNT(o.OrderID) AS "Number Of Orders"
FROM Customers c
LEFT JOIN Orders o ON o.CustomerID = c.CustomerID 
GROUP BY c.CompanyName
ORDER BY COUNT(o.OrderID)


