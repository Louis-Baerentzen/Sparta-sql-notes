# <i><b> My SQL<br> DAY 3 NOTES </b></i>
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
INNER JOIN Customers a ON a.CustomerName = b.CustomerName  
```
- Used to match only common data between two tables <br><br>

```SQL
LEFT JOIN Customers a ON a.CustomerName = b.CustomerName
```
- Used to match tables declared <b>BEFORE</b> `JOIN` and any common data between two tables. <br><br>

```SQL
RIGHT JOIN Customers a ON a.CustomerName = b.CustomerName
```
- Used to match tables declared <b>AFTER</b> `JOIN` and any common data between two tables. <br><br>

```SQL
FULL OUTER JOIN Customers a ON a.CustomerName = b.CustomerName
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
Used to calculate totals usually in conjunction with the GROUP BY clause.

- SUM(): Returns the total sum of a column with numerical data<br><br>
- AVG(): Returns an average from all the numerical data from a column<br><br>
- MAX(): Returns the highest value from a column with numerical data<br><br>
- MIN(): Returns the lowest value from a column with numerical data<br><br>
