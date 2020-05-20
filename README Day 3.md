# <i><b> My SQL<br> DAY 3 NOTES </b></i>
---
#### GROUP BY & ORDER BY
&rarr; <b><i> Keep note that Group by does not always support aliasing reliably where as Order does. </i></b>

Group by gives us the ability to group rows with the same values and create a summary row,

IE. <br><br>
`SELECT * FROM Customers`


#### Arithmetic Operators

- REMEMBER YOUR BODMAS
Brackets
Orders
Division
Multiplication
Addition
Subtraction

- '%' Modulus: is a remainder of an equation

`12%5` = 2 <br>
`34%3` = 1

- `-` Minus: is a subtraction of an equation

- `*` Multiply: is a Multiplication of an equation

- More complex Equations <br><br>

`12%5*(6/2)/3+5-6`<br>
Do the brackets<br>
`12%5*3/3+5-6`<br>
Do the Modulus (remainder)<br>
`2*1+5-6`<br>
Do the Multiplication<br>
`2+5-6`<br>
Do the add and subrtaction<br>
`1`

## String Functions

Use these to manipulate the text inside a string in various ways

###### SUBSTRING
`SELECT film_name, SUBSTRING(film_Name,1,3) AS "Extracted String"`

Extracts a specified amount of characters from a string.

If the film name was 'Star Trek'
wed get 'Sta' back in "Extracted String"

`SUBSTRING(film_Name,2,5) AS "Extracted String"`

If the film name was 'The Revenant'
wed get 'he Re' back in "Extracted String"

If no character is found it will give you a 0

###### CHARINDEX

These return a value to you telling you the location of a specified character in a string.

`SELECT film_name, CHARINDEX('s', film_Name) AS "Position of character"`

###### LEFT & RIGHT

These locate a character from the left or right of a string and select the character from the value given.

`SELECT film_name, RIGHT(film_Name, 2) AS "Position of character"`

If the film name was 'Star Trek'
wed get 'ek' back in "Extracted String"

###### REPLACE

These replace a

`SELECT film_name, REPLACE( film_Name,' ', '_ ') AS "Replaced String"`

This would replace any spaces with underscores in a title

###### LEN

Display the length of a string  

`SELECT film_name, LEN('s', film_Name) AS "Length of String"`

###### UPPER & LOWER

Converts the case of the characters in the string to upper or lower case


## Date Functions

###### GETDATE()
returns the current date and time

###### SYSDATETIME()
returns the systems date and time used

###### DATEADD
(d,5,OrderDate)
adds a value of days from a value to create the due date.

d or dd equals day
m or mm equals month
yy or yyyy equals year

If you want to show a due date from the date ordered you can use this.

###### DATEDIFF()
Calculate the difference between a set of dates

###### YEAR
SELECT YEAR(OrderDate) AS "Order Month"
extract the year from a date

## Aggregate Functions
Used to calculate totals usually in conjunction with the GROUP BY clause.

- SUM(): Returns the total sum of a column with numerical data<br><br>
- AVG(): Returns an average from all the numerical data from a column<br><br>
- MAX(): Returns the highest value from a column with numerical data<br><br>
- MIN(): Returns the lowest value from a column with numerical data<br><br>

#### JOINS

Combine matched rows from two or more tables
