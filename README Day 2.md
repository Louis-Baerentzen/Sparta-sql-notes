# <i><b> My SQL<br> DAY 2 NOTES </b></i>
---
## <b><i>Normal Forms</b> <br>'Keep it clean'</i>
---
This is a standard in SQL to avoid redundancy in our data for a database. There are multiple tiers/levels to the Normal Form standard and apply to the tables.

### 1st Normal Form

- Data should be broken down into as many attributes as possible/as small as it can be, this is called making the data atomic.
- There can also be no repeating groups

### 2nd Normal Form

- It must be 1NF compliant
- All non key attributes depend on that tables primary key. In a way it can make sense to see this as making sure your keys are atomic to.<br><br> <b>
In other words; if there is an opportunity to separate data from an existing table into its own table with a new primary key, it should be taken. This can be taken to its logical conclusion by looking at... </b>

### 6th Normal Form:

- It must be 5 NF Compliant
- EVERY TABLE must consist of ONE Primary Key & ONE non-key attribute ONLY.

This minimises dependencies and means that the data is irreducible. Essentially the whole database is now atomic. Every possible piece of information has its own table and its own primary key.

<b>HOWEVER</b>

In business logic, this level of normalisation is a tad extreme. Entities such as products in a store have more than one attribute, such as a unit price and a description that are directly relevant. Therefore this level of normalcy is an overreach for data like this and is also not 6NF Compliant.

Furthermore if data is broken down to this level, it makes generating a table for a query very laborious as every single piece of data would need its own join, compared to every table with less strict tiers of Normal Form.

### 3rd Normal Form

- It must be 2NF compliant
- There must be NO transitive functional dependency. Transitive Dependencies are things that depend on non-key attributes.<br><br>
For Example: If A has dependency on C when A depends on B and B depends on C. It has transitive dependency. This should be avoided to prevent redundant data from forming in a database.

---
## <b><i>Null Values</b><br>'Does what it says on the imaginary tin'</i>
---
These are not technically a value, this is a way of telling us that there is no data to show in a field/cell.

##### Examples:
- 'Null' in a string is a value
- a value of 0 is not null as 0 is a value
- values can't equal null as it is an undefined value

---
## <b><i>Security & PCIDSS</i></b>
---

### <b>P</b> <i>ayment</i> <br> <b>C</b> <i>ard</i> <br> <b>I</b> <i>ndustry</i> <br> <b>D</b> <i>ata</i> <br> <b>S</b> <i>ecure</i> <br> <b>S</b> <i>tandard</i>


This is an information security standard that organisations abide by; thus  guaranteeing safe and secure archiving of branded credit cards from the major schemes such as Visa & Mastercard <br>

#### Standards in database security
The recovery of data if a server is down or lost is a vital component in maintaining security of the data that is stored. Duplicates to be accessed as a back up in this scenario is a good idea.

The integrity of a database is also a critical component of what makes a functional database. Integrity of a database is keeping it up to date and maintaining that practice to keep the data stored relevant and not redundant.

---
## <b><i>Data Types</i></b>
---

### Numeric Data Types
<b>Know your powers of 2</b><br><br>
The values in powers of 2 accommodate both negative numbers as well as positive numbers.
A 4 bit integer for instance holds 16 values however the highest positive value it will store is 7 <br><br>

##### Full range of a 2 bit sized integer (16 values)
<table>
<tr>
<td colspan ="8">NEGATIVE VALUES</td>
<td colspan ="8">POSITIVE VALUES</td>
</tr>
<tr>
<td>-8</td><td>-7</td><td>-6</td><td>-5</td><td>-4</td><td>-3</td><td>-2</td><td>-1</td><td>0</td><td>+1</td><td>+2</td><td>+3</td><td>+4</td><td>+5</td><td>+6</td><td>+7</td>
</tr>
</table> <br>
(2^4) = 16 <br>
((2^4)/2) = 8 <br>
(2^3) - 1 = 7
<br><br>

##### Exact Integer Data Types

```sql
BIT 1 -- 0 or 1 and includes NULL (2^1 = 2) --
```
- A good boolean substitute <br><br>

```sql
TINYINT 127 -- 8 bit or 1 byte sized integer (2^8 = 256) --
```
- (2^7) - 1 = 127 <br><br>

```sql
SMALLINT 32767 -- 16 bit or 2 byte integer (2^16 = 65536) --
```
- The former row limit in an Excel spreadsheet <br><br>

```sql
INT 2147483647 -- 32 bit or 4 byte integer (2^32 = 4294967296) --
```
- A common limit for number values in video games <br><br>

```sql
BIGINT 9223372036854775807 -- 8 byte integer (2^64 = 18446744073709551616) --
```
- (2^63) - 1 = 9223372036854775807 <br><br>

```sql
DECIMAL(10,2) 75847826.03 -- The braces represent (Precision,Scale) --
```
- The defaults are 38 for precision and 0 for scale, these are best defined by the user and he value that needs to be stored.<br><br>

##### Approximate Integer Data Types
This can vary depending on the implementation of the SQL program, it also depends on how many decimal values you want to store.

```sql
FLOAT(6) 4096.00 -- 6 value float --
```
- Can store up to 64 digits, which is also the default unless specified.<br><br>

```sql
REAL 1E-3 -- this equals 0.001 --
```
- Again, can store up to 64 digits, which doesn't need to be specified.<br><br>

<b>IMPORTANT NOTE: dont use commas in any number's value to separate thousands from millions or any other order of magnitude.</b><br><br>

### Date & Time Data Types
```sql
DATE 'yyyy-mm-dd' -- 2020-05-24 --
```
- Formats the date by Year, Month then Day. <br><br>

```sql
DATETIME 'yyyy-mm-dd hh:mi:ss' -- 2020-05-24 18:30:05 --
```
- Formats the date by Year, Month, Day and time <br><br>

```sql
DATETIME2(7) 'YYYY-MM-DD hh:mm:ss.0000000' -- 2020-05-24 18:30:05.5783495 --
```
- A more advanced datatype for storing dates, which can be adapted to store fractional seconds up to nanoseconds. <br><br>

```sql
SMALLDATETIME 'YYYY-MM-DD hh:mm:ss'
```
- A more memory friendly datatype for dates, which have a smaller range & rounds to the nearest minute. <br><br>

```sql
DATETIMEOFFSET 'YYYY-MM-DD hh:mm:ss.0000000 hh:mm'
```
- A datatype for storing dates, along with a timezone. <br><br>

```sql
TIME 'hh:mm:ss.0000000'
```
- Accepts time values exclusively, which can also be adapted to store fractional seconds up to nanoseconds. <br><br>

### Character Data Types & Unicode Character Data Types
A subtle yet important difference between the two. Unicode data needs two bits per character, twice the amount of non-unicode characters.

```sql
CHAR(10) 'Louis' -- Stored as 'Louis_____' --
NCHAR(10) 'Louis' -- Stored just the same but takes twice the space --
```
- A performance efficient way of storing values as a string, due to the constraint specified by the number given. The processor will see this as an absolute amount and therefore doesn't need to consider different values for each entry. <br><br>

```sql
VARCHAR(10) 'Louis' -- Stored as 'Louis' --
VARCHAR(MAX) 'Dont get carpel tunnel now' -- Stores (2^31)-1 characters --
NVARCHAR(10) 'Louis' -- Stored just the same but takes twice the space --
```
- A memory efficient way of storing input as a string with a variable width, again due to the specified value given. The processor will see this as a potential amount and truncate what isn't used by the allocated amount in memory.<br><br>

```sql
TEXT(10) 'Louis' -- Stored as 'Louis' --
TEXT(MAX) 'The entire works of Shakespeare' -- Stores 2GB of text data --
NTEXT(MAX) 'Half the entire works' -- Stores 1GB of text data --
```
- Used to store larger blocks of text that vary larger in size in instances of a database.<br><br>

### Binary Data Types
```sql
SELECT CAST( 123456 AS BINARY(4) ); -- Equal to 0X0001e240 when casted --
```
- In this case, is used to convert another data type and display it as binary.<br>

```
BLOB (Binary Large OBject) stores a large binary object, this can include data for images.
```
