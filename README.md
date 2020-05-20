# <i><b> My SQL<br> DAY 1 NOTES </b></i>
---
#### (DML) Data Manipulation Language

These commands allow for the manipulation of entries to an existing database

- `SELECT`

- `UPDATE`

- `INSERT`

- `DELETE`

---
#### (DDL) DATA DEFINITION Language

Definition language allows for the creation or removal of entities in a database

- `DROP`

- `CREATE`

- `ALTER`

- `TRUNCATE`

---
#### (DCL) DATA CONTROL Language

These control permissions to allow access to areas of a database

###### - <i>`GRANT`: Allows access and privileges to to a user </i> <br><br>
ie `GRANT CREATE TABLE TO username` &rarr; grants access to the user to create a database <br><br>

###### - <i>`REVOKE`: Denies access to portions of a database </i> <br><br>
ie `REVOKE CREATE TABLE FROM username` &rarr; will reverse the permissions that were used above

---
#### (TCL) TRANSACTION CONTROL Language

These are used in the context of a transaction of data between a client and a database. Used to manage changes declared by DML statements to a table. These are a major feature in online banking apps, enabling the transaction of money to and from user accounts.

###### - <i>`COMMIT`: Persist the changes specified </i> <br><br>

###### - <i>`ROLLBACK`: Revert the changes made to the databse </i> <br><br>

###### - <i>`SAVEPOINT`: Adds ability to save transactions temporarily and rollback to that stage when necessary </i> <br><br>
