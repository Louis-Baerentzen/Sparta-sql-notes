-- DDL COMMANDS (DECLARATION) --

-- Creates a database --
CREATE DATABASE louis_db;

-- Drop a databse --
DROP DATABASE louis_db;

-- Uses a selected databse --
USE louis_db;

-- creation of a table --
CREATE TABLE film_table (
    film_name VARCHAR(30),
    film_type VARCHAR(10),
    date_of_release DATE,
    director VARCHAR(50),
    writer VARCHAR(50),
    star VARCHAR(50),
    film_language VARCHAR(30),
    official_website VARCHAR(80),
    plot_summary VARCHAR(1000)
);

-- drop the table from the database --
DROP TABLE film_table;

-- generate results in the bottom panel --
SP_HELP film_table

-- ALTER TO ADD (NEW COLUMN) --
ALTER TABLE film_table
ADD duration TIME

-- ALTER TO ADD CONSTRAINTS TO A COLUMN --
/*EXAMPLES
    NOT NULL - must have value
    UNIQUE - must be unique value
    PRIMARY KEY - change to primary key
    FOREIGN KEY - change to foreign key
    IDENTITY - 
*/
ALTER TABLE film_table
ALTER COLUMN film_name VARCHAR(10) NOT NULL

-- ALTER COLUMN EXTEND THE AMOUNT --
ALTER TABLE film_table
ALTER COLUMN film_name VARCHAR(50)

-- DML COMMANDS (MANIPULATION) --

-- FILLING FIELDS IN A ROW --
/*
SELECT WHICH COLUMNS TO INSERT DATA VALUES INTO
THEN DECLARE VALUES TO FILL IN THOSE VALUES
BEST TO KEEP THESE IN ORDER OF FIELDS
USE, COMMAS, INBETWEEN, COLUMNS DECLARED, NEVER, FOR, THE, LAST, FIELD <-- NO COMMA 
*/
INSERT INTO film_table (
    film_name, film_type, date_of_release, director, writer, star, film_language, official_website, duration 
)
VALUES
('Star Trek', 'Sci-fi', '09-29-2009', 'JJ Abrams', 'JJ Abrams', 'Chris Pine, Zachary Quinto', 'English US', 'www.badrobotstudios.com', '2:13:34'),
('Citizen Kane', 'Political', '01-24-1942', 'Orson Welles', 'Orson Welles', 'John Houseman, Mollie Kent', 'English US', 'www.imdb.com/title/tt0033467/', '1:59:00'),
('Citizen Kane', 'Political', '01-24-1942', 'Orson Welles', 'Orson Welles', 'John Houseman, Mollie Kent', 'English US', 'www.imdb.com/title/tt0033467/', '1:59:00')

-- RETRIEVE DATA FROM A TABLE (ALL ROWS IN THIS CASE) -- 
SELECT * FROM film_table

-- ALTER A TABLR TO DROP A COLUMN --
ALTER TABLE film_table
DROP COLUMN film_type

-- ALTER A TABLE TO ADD A DEFAULT --
ALTER TABLE film_table
ADD film_type VARCHAR(50) DEFAULT 'HORROR' 

INSERT INTO film_table (
    film_name, date_of_release, director, writer, star, film_language, official_website, duration 
)
VALUES
('Citizen Kane', '01-24-1942', 'Orson Welles', 'Orson Welles', 'John Houseman, Mollie Kent', 'English US', 'www.imdb.com/title/tt0033467/', '1:59:00')

-- ALTER A TABLE TO ADD A COLUMUN (A PRIMARY KEY IN THIS CASE) --
ALTER TABLE film_table
ADD film_id INT IDENTITY (1,1) PRIMARY KEY

-- UPDATE TO SET NEW VALUES IN A TABLE (THIS CASE AFTER 'WHERE' REPLACES ALL INSTANCES OF A VALUE INSIDE THE STRING)
UPDATE film_table
SET film_name='The Matrix' WHERE film_name='Star Trek'

UPDATE film_table
SET film_name='The Matrix 2' WHERE film_name='Citizen Kane'

UPDATE film_table
SET date_of_release='2002-01-24' WHERE date_of_release='1942-01-24'

UPDATE film_table
SET plot_summary='The brash James T. Kirk tries to live up to his fathers legacy with Mr. Spock keeping him in check as a vengeful Romula' WHERE plot_summary IS NULL

USE Northwind

SELECT * FROM employees WHERE city='London'
SELECT * FROM employees WHERE Title='Doctor'