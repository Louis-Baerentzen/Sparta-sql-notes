# <b><i>WHERE <br>CLAUSES</i></b>
---
The where clause allows you to filter rows of data towards your queries in SQL.

##### A simple query with where would look like this:

```SQL
SELECT --COLUMNS--
FROM --TABLE--
WHERE --CONDITION--
```
<br>

##### And the clause's condition consists of three parameters:
- `COLUMN` The column you need
- `OPERATOR` The comparison you need to make
- `VALUE` The value you need to filter by

```SQL
WHERE --COLUMN-- --OPERATOR-- --VALUE--
```
<br>

##### These clauses can also be chained together using:
- `AND` Where all the conditions must be met
- `OR` Where only ONE of the conditions must be met

```SQL
WHERE --COLUMN-- --OPERATOR-- --VALUE--
AND --COLUMN-- --OPERATOR-- --VALUE--
```

```SQL
WHERE --COLUMN-- --OPERATOR-- --VALUE--
OR --COLUMN-- --OPERATOR-- --VALUE--
```
<br>

### What if there are a zillion values?
We can use the `IN()` keyword to save us time in picking the values we want.

```SQL
WHERE --COLUMN--
IN ('Strings in quotes', 'Dates in quotes', 123 ) --Numbers don't--
```
<br>

Using `NOT IN()` allows us to do the opposite and excludes the results in the string, taking them out of the results we will end up with.

```SQL
WHERE --COLUMN--
NOT IN ('Strings in quotes', 'Dates in quotes', 123 ) --Numbers don't--
```
<br>

### What if I need to filter by a range of values?
We can use the `BETWEEN` keyword to filter within a range we want.

```SQL
WHERE --COLUMN--
BETWEEN --MINIMUM VALUE --
AND --MAXIMUM VALUE--
```
<br>
- It is most appropriate for numerical and date data in a database.

```SQL
--FOR DATES--
WHERE --COLUMN--
BETWEEN "YOUR EARLIEST DATE"
AND "YOUR LATEST DATE"

--FOR NUMBERS--
WHERE --COLUMN--
BETWEEN 300
AND 450
```
<br>

### What if I actually need to filter a string?
We use a <i>Wildcard</i> operator. These are extremely useful in filtering a string to find a specific set of characters. Especially when you don't know the location of that <i>'pattern'</i> or, for this example word you want to find. <br>
- Wildcard operators for representing characters look like this `%` and use the `LIKE` function in a query.

```SQL
--FOR FINDING A WORD ANYWHERE IN A STRING PUT IT ON BOTH ENDS--
WHERE --COLUMN--
LIKE "%PATTERN%"

--FOR FINDING THE START OF A STRING PUT IT ON THE RIGHT--
WHERE --COLUMN--
LIKE "PATTERN%"

--FOR FINDING THE END OF A STRING PUT IT ON THE LEFT--
WHERE --COLUMN--
LIKE "%PATTERN"
```
<br>

##### You can also chain these too:
```SQL
WHERE --COLUMN--
LIKE "%PATTERN%" AND LIKE "%PATTERN%"
```
<br>

### What if there are gaps in my data?
We use the `IS NULL` keyword.
```SQL
WHERE --COLUMN-- --OPERATOR-- --VALUE--
AND --COLUMN--
IS NULL
```
<br>
A good example of this in use is for an assignment hand in. Where you are looking for all of the people who haven't yet handed in their assignment. In your table you would have a column for hand ins such as <i>'date_submitted'</i> for example; where all of the fields would start with null values and be filled in for each student as hand ins got submitted.<br><br>
The opposite to this is also possible where we can use the `IS NOT NULL` keyword.

```SQL
WHERE --COLUMN-- --OPERATOR-- --VALUE--
AND --COLUMN--
IS NOT NULL
```
<br>

### What if i want a query that references 2 tables with the where clause?
It is possible by using the following structure, and works similarly to how a join would, by matching the column that share the same data between them:
```SQL
SELECT
order_num,
lname,
fname
FROM customer, orders
WHERE customer.customer_num = orders.customer_num;
```
<br>

- Multi table connections are possible like this as well. Just reference all your tables in `FROM` and connect the common data in `WHERE` like you would a typical `JOIN`.
