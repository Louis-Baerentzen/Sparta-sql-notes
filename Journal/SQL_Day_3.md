# <i><b> My SQL<br> DAY 3 NOTES </b></i>

- Group By & Order By
- Joins
- Arithmetic Operators
- String Functions
- Date Functions
- Aggregate functions
- <i>'Make Data Make Sense'</i>

---
## <i><b>Group By & Order By</b></i>
---
<b> Keep note that Group by does not always support aliasing reliably where as Order does.</b>

Group by gives us the ability to group rows with the same values and create whats called a summary row,

```sql
SELECT COUNT(Customer_ID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(Custome_ID) DESC
```

---
## <i><b>JOINS</b></i>
---
<img src="The Major Joins in SQL-01.png" />
<br><br>
Combine matched rows from two or more tables. There are 4 main types of join that can be done between tables. <br><br>

<i> I have used aliasing in these examples for the joins below </i>

```SQL
SELECT * FROM student s
INNER JOIN course c ON s.course_id = c.course_id  
```
- Used to match only common data between two tables <br><br>

```SQL
SELECT * FROM student s
LEFT JOIN course c ON s.course_id = c.course_id
```
- Used to match tables declared <b>BEFORE</b> `JOIN` and any common data between two tables. <br><br>

```SQL
SELECT * FROM student s
RIGHT JOIN course c ON s.course_id = c.course_id
```
- Used to match tables declared <b>AFTER</b> `JOIN` and any common data between two tables. <br><br>

```SQL
SELECT * FROM student s
FULL JOIN course c ON s.course_id = c.course_id
```
- Used to combine both tables together. Rarely used unless no other join is appropriate. <br><br>

---
## <i><b>Arithmetic Operators</b></i>
---

##### REMEMBER YOUR BODMAS
##### <b>B</b> <i>rackets</i> <br> <b>O</b> <i>rders</i> <br> <b>D</b> <i>ivision</i> <br> <b>M</b> <i>ultiplication</i> <br> <b>A</b> <i>ddition</i> <br> <b>S</b> <i>ubtraction</i> <br><br>

- '%' Modulus: is a remainder of an equation, the value returned is whats left after performing division.

<table>
<td> 12%5 = 2 </td>
<td>34%3 = 1 </td>
</table>

- `-` Subtract: is a subtraction of an equation
- `*` Multiply: is a Multiplication of an equation
- `+` Add: the addition of values
- `/` Divide: the division of values
- `POWER()` Orders: the indices operation in SQL
```sql
SELECT POWER(4, 4); -- Returns 256 --
```
- `EXP()` Logarithmic function: the log. function in SQL. Based on the revered Euler's Number in Mathematics. This constant is the natural base for the natural logarithmic scale and used in calculating compound interest.
```sql
SELECT EXP(1); -- Returns e = 2.7182818284590451 --
```

##### Complex equations

```SQL
12%5*(6/2)/3+5-6 -- Do the brackets --
12%5*3/3+5-6 -- Do the Modulus (remainder) --
2*1+5-6 -- Do the Multiplication --
2+5-6 -- Do the Addition and Subtraction --
1
```

---
## <i><b>String Functions</b></i>
---
Use these to manipulate the text inside a string in various ways to extract in a temporary table made in a query.<br><br>

##### SUBSTRING
``` SQL
SELECT film_name, SUBSTRING(film_Name,1,3) AS "Extracted String"
```
Extracts a specified amount of characters from a string.<br><br>
If the film name was <i>'Star Trek'</i> <br>
We would get <i>'Sta'</i> back in "Extracted String"

```SQL
SUBSTRING(film_Name,2,5) AS "Extracted String"
```
If the film name was <i>'The Revenant'</i><br>
We would get <i>'he Re'</i> back in "Extracted String"<br><br>

If no character is found it will give you a 0 <br><br>

##### CHARINDEX

This returns a number value to you, telling you the location of a specified character in a string.

```sql
SELECT film_name, CHARINDEX('S', film_Name) AS "Position of character"
```
<b>THIS TITLE</b> for instance would return a 4 as it is the fourth character in the sequence of this string.<br> A very important note to take here is that this counting is NOT zero indexed. 0 is reserved for when a result isn't found.<br><br>

##### LEFT & RIGHT

These locate a character from the left or right of a string and select the character from the value given.

```SQL
SELECT film_name, RIGHT(film_Name, 2) AS "Position of character"
```

If the film name was 'Star Trek'<br>
We would get 'ek' back in "Extracted String" <br><br>

##### REPLACE

These replace a specified character with another character defined in the parameters.

```sql
SELECT film_name, REPLACE( film_Name,' ', '_ ') AS "Replaced String"
```
This would replace any spaces with underscores in a string.<br><br>

##### LEN

Returns the length of a given string as a number value.  

```SQL
SELECT first_name, LEN('Louis Baerentzen') AS "Length of String" -- Returns 16 --
```
<b>Remember that blank spaces count as a character in a string.</b>
<br><br>
##### UPPER & LOWER

Converts the case of the characters in the string to upper or lower case
```SQL
SELECT first_name, UPPER('Louis Baerentzen') AS "FIRST_NAME" -- Returns LOUIS BAERENTZEN --
```
---
## <i><b>Date Functions</b></i>
---
##### GETDATE()
Returns the current date and time

```SQL
SELECT GETDATE(); -- Returns the systems datetime in real time in YYYY-MM-DD HH:MM:SS.000 --
```
<br>

##### SYSDATETIME()
Returns the systems date and time with a higher accuracy

```SQL
SELECT SYSDATETIME(); -- Returns the systems datetime in real time in YYYY-MM-DD HH:MM:SS.0000000 --
```
<br>

##### DATEADD
<i>(sort, number, column or string)</i> <br>
Adds a value of sorts (days, months or years) onto a date to create another date.

```SQL
SELECT DATEADD(year, 1, '2020/05/24') AS DateAdd; -- Returns 2021/05/24 00:00:00.000 --
```
<table>
<td>&rarr;</td>
<td> 2021/05/24 00:00:00.000 </td>
</table

d or dd equals day <br>
m or mm equals month <br>
yy or yyyy equals year <br>

If you want to show a due date from the date ordered you can use this below.

##### DATEDIFF()
Calculate the difference between a set of dates given in a query.
```SQL
SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;
```
<table>
<td>&rarr;</td>
<td> -6 </td>
</table

- Can return negative values also.

##### YEAR/MONTH/DAY
Extract portions from a date in a query.

```SQL
SELECT YEAR(OrderDate) AS "Order Year"
SELECT MONTH(OrderDate) AS "Order Month"
SELECT DAY(OrderDate) AS "Order Day"
```
<table>
<tr>
<td></td>
<td>Order Year</td>
<td>Order Month</td>
<td>Order Day</td>
</tr>
<tr>
<td>&rarr;</td>
<td> 2020 </td>
<td> 05 </td>
<td> 24 </td>
</tr>
</table>
<br>

##### ISDATE()
Returns a boolean to determine if the value in the string is a date.

```SQL
SELECT ISDATE('2017-08-25'); -- Returns 1 --
SELECT ISDATE('2017-90-32'); -- Returns 0 --
```

---
## <i><b>Aggregate Functions</b></i>
---
Used to calculate totals usually in conjunction with the GROUP BY clause. Using the Northwind sample database as an example, we have the whole of the Products table below, with various queries manipulating the data in this table.

<img src="Nothwinds Products Table.png"/>
<br><br>

##### SUM()
Returns the total sum of a column with numerical data (Aliasing allowed)
```SQL
SELECT SUM(p.UnitsOnOrder) AS "TOTAL ON ORDER"
FROM Products p
```
<table>
<tr>
<td></td>
<td>TOTAL ON ORDER</td>
</tr>
<tr>
<td>1</td>
<td> 780 </td>
</tr>
</table>
<br>

```SQL
SELECT SUM(p.UnitsInStock) AS "TOTAL IN STOCK"
FROM Products p
```
<table>
<tr>
<td></td>
<td>TOTAL ON ORDER</td>
</tr>
<tr>
<td>1</td>
<td> 3119 </td>
</tr>
</table>
<br>

##### AVG()
Returns an average from all the numerical data from a column (Aliasing allowed)
```SQL
SELECT AVG(p.ReorderLevel) AS "AVERAGE REORDER"
FROM Products p
```
<table>
<tr>
<td></td>
<td>AVERAGE REORDER</td>
</tr>
<tr>
<td>1</td>
<td> 12 </td>
</tr>
</table>
<br>

##### MIN()
Returns the lowest value from a column with numerical data (Aliasing allowed)
```SQL
SELECT MIN(p.UnitPrice) AS "SMALLEST ON ORDER"
FROM Products p
```
<table>
<tr>
<td></td>
<td>SMALLEST UNIT PRICE</td>
</tr>
<tr>
<td>1</td>
<td> 2.5000 </td>
</tr>
</table>
<br>

##### MAX()
Returns the highest value from a column with numerical data (Aliasing allowed)
```SQL
SELECT MAX(p.UnitPrice) AS "LARGEST UNIT PRICE"
FROM Products p
```
<table>
<tr>
<td></td>
<td>LARGEST UNIT PRICE</td>
</tr>
<tr>
<td>1</td>
<td> 263.5000 </td>
</tr>
</table>
<br>

---
## Make Data <br> Make Sense
---
When handling data and using operations such as aggregates, it is in your best interest to use aliasing and other functions to describe what you are showing to a user, based on what you are building in your query. <br>

<table>
<tr>
<td></td>
<td>LARGEST UNIT PRICE</td>
</tr>
<tr>
<td>1</td>
<td> 263.5000 </td>
</tr>
</table>
<br>

Using the example above, this query returns the correct data we want. But it doesn't give us any other context for this result. What the product is or how many there are in stock, are 2 examples of important data we'd want to know in this case. This is where we use `GROUP BY` and `ORDER BY` to extend our queries and generate more meaningful results.
<br>

```SQL
-- TOP 1 WILL RESTRICT THE RESULTS TO THE FIRST ENTRY ONLY BASED ON THIS QUERY --
SELECT TOP 1
p.ProductName,
MAX(p.UnitPrice) AS "LARGEST UNIT PRICE",
p.UnitsInStock AS "QUANTITY IN STOCK"
FROM Products p
GROUP BY p.ProductName, p.UnitsInStock
ORDER BY MAX(p.UnitPrice) DESC

/* GROUP BY IS GROUPING BY THE NAME OF THE PRODUCT
MAKE SURE EACH COLUMN IS REFERENCED HERE THAT ISN'T
PART OF AN AGGREGATE FUNCTION */

/* ORDER BY IS USING THE AGGREGATE FUNCTION ONLY
NO ALIASING IS ALLOWED HERE */
-- DESC IS USED TO REVERSE THE ORDER SO THE HIGHEST VALUE COMES UP FIRST --
```
<table>
<tr>
<td></td>
<td>ProductName</td>
<td>LARGEST UNIT PRICE</td>
<td>QUANTITY IN STOCK</td>
</tr>
<tr>
<td>1</td>
<td>Côte de Blaye</td>
<td> 263.5000 </td>
<td>17</td>
</tr>
</table>
<br>

```SQL
SELECT TOP 1
p.ProductName,
MAX(p.UnitPrice) AS "LARGEST UNIT PRICE",
p.UnitsInStock AS "QUANTITY IN STOCK",
-- HOW MUCH IS THE SITTING STOCK WORTH FOR THIS PRODUCT? --
FORMAT (SUM (p.UnitsInStock * p.UnitPrice),'c', 'en-gb') AS "STOCK VALUE (EN)",
FORMAT (SUM (p.UnitsInStock * p.UnitPrice * 92.49),'c', 'gb-in') AS "STOCK VALUE (IN)",
FORMAT (SUM (p.UnitsInStock * p.UnitPrice * 131.17),'c', 'en-jp') AS "STOCK VALUE (JP)",
FORMAT (SUM (p.UnitsInStock * p.UnitPrice * 4.47),'c', 'en-ae') AS "STOCK VALUE (AE DIR)"
FROM Products p
GROUP BY p.ProductName, p.UnitsInStock
ORDER BY MAX(p.UnitPrice) DESC

/* USE SUMS TO COMBINE COLUMNS WITH NUMBER VALUES TO
FURTHER INTERPRET THE DATA IN MORE USEFUL WAYS. */

/* FORMAT THE SUM ITSELF AND USE AN IDENTIFIER AS
'language-country' TO SET THE CURRENCY IT IS SET
US DOLLARS BY DEFAULT. */

/* USE A Multiplication to convert the quantity appropriately */

```
<table>
<tr>
<td></td>
<td>ProductName</td>
<td>LARGEST UNIT PRICE</td>
<td>QUANTITY IN STOCK</td>
<td>STOCK VALUE (EN)</td>
<td>STOCK VALUE (IN)</td>
<td>STOCK VALUE (JP)</td>
<td>STOCK VALUE (AE DIR)</td>
</tr>
<tr>
<td>1</td>
<td>Côte de Blaye</td>
<td> 263.5000 </td>
<td>17</td>
<td>£4,479.50</td>
<td>₹414,308.96</td>
<td>¥587,576.02</td>
<td>د.إ.‏20,023.37</td>
</tr>
</table>
<br>

<b> I AM AWARE THAT THE CURRENCY RATES HERE HAVE BEEN HARD CODED AND OBVIOUSLY RATES FLUCTUATE IN VALUE, THIS WAS ONLY AN EXERCISE IN SHOWING HOW DIFFERENT CURRENCIES CAN BE DISPLAYED USING THE RIGHT FORMATTING (VALUES ACCURATE AS OF 25/5/2020) </b><br>

Getting currency rates in real time requires a JSON API. The link below goes into detail on how this is done.
https://blog.devart.com/getting-real-currency-exchange-rates-with-data-generator-for-sql-server.html
