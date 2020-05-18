-- DDL COMMANDS --

-- Creates a database --
CREATE DATABASE louis_db;
-- Uses a selected databse --
USE louis_db;

-- creation of a table --
CREATE TABLE film_table (
    film_name VARCHAR(10),
    film_type VARCHAR(6),
    date_of_release DATETIME,
    director VARCHAR(50),
    writer VARCHAR(50),
    star VARCHAR(50),
    film_language VARCHAR(30),
    official_website VARCHAR(50),
    plot_sumary VARCHAR(1000)
);

-- drop the table from the database --
DROP TABLE film_table;

-- generate results in the bottom panel --
SP_HELP film_table