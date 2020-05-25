# <i><b> SQL<br> Introduction </b></i>
- Introduction
- Primary Keys & Foreign Keys
- Database Types
- Data Relationships
- Language Types

---


# <b>S</b> tructured <br> <b>Q</b> uery <br> <b>L</b> anguage <br>


SQL is a standard programming language that provides the ability to build, store and manipulate databases and the data that they contain. Using the language with a firm knowledge of the syntax, logic and arithmetic allows the user writing in SQL to handle
and manipulate the data to present in a novel context. The data handled by the query can then also be transferred into software, such as Microsoft Excel seamlessly to present any results visually.

<table>
  <th></th>
  <th>Attribute A</th>
  <th>Attribute B</th>
  <th>Attribute C</th>
  <th>Attribute D</th>
  <th>Attribute E</th>
  <tr>
    <td><b>Entity</b></td>
    <td><i>ID Number</i></td>
    <td><i>A First Name</i></td>
    <td><i>A Last Name</i></td>
    <td><i>A Phone Number</i></td>
    <td><i>An Email Address</i></td>
  </tr>
  <tr>
    <td><b>Entity</b></td>
    <td><i>ID Number</i></td>
    <td><i>A First Name</i></td>
    <td><i>A Last Name</i></td>
    <td><i>A Phone Number</i></td>
    <td><i>An Email Address</i></td>
  </tr>
  <tr>
    <td><b>Entity</b></td>
    <td><i>ID Number</i></td>
    <td><i>A First Name</i></td>
    <td><i>A Last Name</i></td>
    <td><i>A Phone Number</i></td>
    <td><i>An Email Address</i></td>
  </tr>
</table>

- The first column is usually a unique identifier, which in SQL is called a <b><i>Primary Key.</i></b> This allows an entity to be a unique item, containing a group of information in a database.

- The following fields in a row (going sideways) is the data related to an entity. In SQL this is called an attribute and in SQL represent Columns in a table.

- All data related to an attribute (going downwards) will always be the same sort of data, just containing different values.

---
## <i><b> Primary Keys & Foreign Keys </b></i>
---

There are 2 types of database management:

<table>
<tr>
<td>DBMS: <b>D</b><i>ata</i>-<b>B</b><i>ase</i> <b>M</b><i>anagement</i> <b>S</b><i>ystem</i> </td>
</tr>
<tr>
<td> RDBMS: <b>R</b><i>elational</i> <b>D</b><i>ata</i>-<b>B</b><i>ase</i> <b>M</b><i>anagement</i> <b>S</b><i>ystem</i> </td>
</tr>
<table>

Primary keys and foreign keys are the two core components that allow databases to be relational. This means that multiple tables can exist in a database and allows for the amount of data stored to be:
- Massively increased
- Data that has more suitable relationships, using tables to group them appropriately in a single database
- More secure due to the more ordered structure, required for larger sized databases

### An Example of Relational Data

<table>
<th></th>
<th>Table 1</th>
<th>Table 2</th>
<tr>
<td>Library DB</td>
<td>table_books</td>
<td>table_library_platform</td>
</tr>
<tr>
<td>Bank DB</td>
<td>table_customer_Info</td>
<td>table_bank_account</td>
</tr>
</table>

### table_books
- All books have an ISBN which is unique to that publication, this is a prime candidate for a <b>PRIMARY KEY</b>

- All the books that a library has will be stored in one location, unless a member has reserved it. Therefore the libraryID is a good candidate for a <i>FOREIGN KEY</i> which enables us to keep a record of which library that book is in.

- Another good use of a foreign key is to determine whether the book is being reserved by a member of the library. This would be an aliased column so that its title has a purposeful meaning to the reader.

<table>
<tr>
<td><b></b></td>
<td><b>BookID/ISBN<b></td>
<td>BookTitle</td>
<td>BookGenre</td>
<td>BookPrice</td>
<td><i>libraryID</i></td>
<td><i>ReservedBy</i></td>
</tr>
<tr>
<td>124</td>
<td><b>745832074582</b></td>
<td>A book title</td>
<td>Banter</td>
<td>£10</td>
<td><i>252</i></td>
<td><i>JS2471984</i></td>
<tr>
</table>

### table_library_platform
- If there are multiple libraries in ownership. Then there will be a quantity of libraries so a libraryID is useful for a <b>PRIMARY KEY</b>; and a separate table for that entities attributes such as the address.

<table>
<tr>
<td><b></b></td>
<td><b>libraryID</b></td>
<td>Address</td>
</tr>
<tr>
<td>252</td>
<td><b>252</b></td>
<td>123 Fake St.</td>
<tr>
</table>

### table_customer_info
- A customer if they have joined a library and use their facilities will most likely have a library card. This would contain their accountID and is best for the <b>PRIMARY KEY</b>

<table>
<tr>
<td></td>
<td><b>libraryAccountID</b></td>
<td>firstName</td>
<td>lastName</td>
<td>email</td>
<td>phone</td>
</tr>
<tr>
<td>1435</td>
<td><b>JS2471984</b></td>
<td>John</td>
<td>Smith</td>
<td>JS@email.com</td>
<td>07555 555555</td>
<tr>
</table>

### table_bank_account
- The account members will reserve books and some may need a payment. So a bank account would probably be a prerequisite of singing up to the library.

- Although bank cards have unique details to them, these can expire over time and are therefore unreliable for a <b>PRIMARY KEY.</b> So creating a unique id number for the card is better for this, then link this entity to the right member via. the <i>FOREIGN KEY</i>

<table>
<tr>
<td></td>
<td><b>bankID</b></td>
<td>bankAccount</td>
<td>sortCode</td>
<td>cardNumber</td>
<td><i>libraryAccountID</i></td>
</tr>
<tr>
<td>252</td>
<td><b>15634</b></td>
<td>00000000</td>
<td>00-00-00</td>
<td>1234 5678 9012 3456</td>
<td><i>JS2471984</i></td>
<tr>
</table>

### Differences between the two keys

<table>
<th>Primary Keys</th>
<th>Foreign Keys</th>
<tr>
<td>No duplicates, this data is always unique</td>
<td>Can repeat, due to the nature of relational mapping</td>
</tr>
<tr>
<td>Only one is allowed per table</td>
<td>Again due to the nature of relational mapping, more than one is allowed if you need to refer to more in a query or table</td>
</tr>
<tr>
<td>Always needs an entry, so the entity is identifiable</td>
<td>These can be null. A foreign key only needs to know that the data exists first in a different table and can then be filled in later. A goood example on this can be found here:
<br><br>

https://stackoverflow.com/questions/7573590/can-a-foreign-key-be-null-and-or-duplicate
</td>
</tr>
<tr>
<td>It uniquely identifies an entity in a table</td>
<td>Refers to the field in the table, which is the primary key in  another</td>
</tr>
</table>

---
## <i><b> Database types </b></i>
---

### Flat Type
Stores everything in a single table.<br>
Examples include things such as:<br>
- Excel Spreadsheets
- CSV <i>(Comma Separated value)</i> files. These files are extremely versatile formats for data and can be opened by a text editor and almost any programming language. Transferring databases, even to an entirely new system is a relative breeze with CSV's.

### Relational databases
Separates multiple tables in a database that you can connect together using foreign keys.<br>Examples include:
- SQL databases that are in a local server for an organisation/business

### Big Data
This is the concept of literally exabytes of data on a global scale that is constantly being accessed, updated and expanded upon. Usually to the point where the database is being maintained by algorithmic means.<br>Examples of this are:<br>
- Youtube & Social Media
- Data Analysis
- Machine Learning

---
## <i><b> Data Relationships </b></i>
---

This is the concept in data that depicts the way that data itself can be linked and relational databases as a whole work upon.

### ONE &rarr; ONE
This is exclusively individual data to a single entity. It wont be related to any other information.
### ONE &rarr; MANY
This is a single entity, which has multiple instances elsewhere in a database.
### MANY &rarr; MANY
This involves a pair or multiple tables that include a junction table.
A junction table is a table consisting of usually 2 foreign keys that act together as a primary key, known as a <i>COMPOSITE PRIMARY KEY</i>

---
## <i><b> Language Types </b></i>
---

### (DML) Data Manipulation Language

These commands allow for the manipulation of entries to an existing database

##### `SELECT` <i>: Allows the retrieval of data from a database </i> <br><br>
```sql
SELECT * FROM myTable    --retrieves an entire table--
```
<br>

##### `UPDATE` <i>: Allows the rewriting/updating of data to a database </i> <br><br>
```sql
UPDATE myTable
SET
column1 = value1,
column2 = value2, ...
WHERE condition;
```
- Use of the `WHERE` clause is important to provide a specific location for the data to be manipulated.<br><br>
<br>

##### `INSERT` <i>: With </i> `INTO` <i> means you can create new entities for a table </i> <br><br>
```sql
INSERT INTO myTable
(Column1, Column2, Column3, Column4)
VALUES
(Value1, Value2, Value3, Value4,),
(Value1, Value2, Value3, Value4,),
(Value1, Value2, Value3, Value4,);
```
<br>

##### `DELETE` <i>: The deletion of data from a database </i> <br><br>
```sql
DELETE FROM myTable
WHERE ColumnName = 'value in field to delete';
```
- Again use of the `WHERE` clause is important to provide specific location for what is to be deleted from a table.<br><br>

---
### (DDL) DATA DEFINITION Language

Definition language allows for the creation or removal of entities in a database

##### `DROP` <i>: Drops data from a database </i> <br><br>
```sql
-- Removes a column in a table --
ALTER myTable
DROP COLUMN lastName;
```
<br>

##### `CREATE` <i>: Allows the creation of new elements in a database </i> <br><br>
```sql
-- Create a new table --
CREATE TABLE myTable
-- Create a new database --
CREATE DATABASE myTable
```
<br>

##### `ALTER` <i>: Allows the modification elements in a database such adding deleting or updating elements in a table or database. </i> <br><br>
```sql
-- Alter this table --
ALTER TABLE myTable
-- Add this Column/Attribute --
ADD username VARCHAR(255)
```
<br>

##### `TRUNCATE` <i>: This removes all the data inside a table but doesn't delete the table itself. </i> <br><br>
```sql
-- Truncates a table, leaving it empty --
TRUNCATE TABLE myTable
```
<br>

---
### (DCL) DATA CONTROL Language

These control permissions to allow access to areas of a database, this maintains security to a database that has multiple users towards it.

###### <i>`GRANT`: Allows access and privileges to to a user </i> <br><br>
ie `GRANT CREATE TABLE TO username` &rarr; grants access to the user to create a database <br><br>

##### `GRANT` <i>: Allows access and privileges to to a user </i> <br><br>
```sql
-- Administrators to a database can grant privileges this way to other users --
GRANT -- Privilege --
ON -- databse object such as tables or columns --
TO -- user or users --
```
<br>

##### `REVOKE` <i>: Restricts access and privileges to to a user </i> <br><br>
```sql
-- Administrators to a database can grant restrictions this way to other users --
REVOKE -- Privilege --
ON -- databse object such as tables or columns --
TO -- user or users --
```
<br>

---
### (TCL) TRANSACTION CONTROL Language

These are used in the context of a transaction of data between a client and a database. Used to manage changes declared by DML statements to a table. For instance, these are a major feature in online banking, enabling the transaction of money to and from user accounts with the grouping of the DML language, which are the steps that make up said transaction done by TCL.

##### `COMMIT` <i>: Requests the persistence of changes to be made to a database. </i> <br><br>

###### - <i>`ROLLBACK`: Revert the changes made to the database, incase a transaction failed for instance. </i> <br><br>

###### - <i>`SAVEPOINT`: Adds ability to save transactions temporarily and rollback to that stage when necessary. </i> <br><br>
