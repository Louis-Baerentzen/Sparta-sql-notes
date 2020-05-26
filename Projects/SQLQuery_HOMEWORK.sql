CREATE DATABASE louis_db
USE louis_db

DROP TABLE rentalAccount
DROP TABLE cars
TRUNCATE TABLE rentalAccount
TRUNCATE TABLE cars
SELECT * FROM cars
SELECT * FROM rentalAccount

-- Table 1 --

CREATE TABLE cars (
    carID INT NOT NULL IDENTITY(1,1),
    carMake VARCHAR(20),
    carModel VARCHAR(20),
    
    PRIMARY KEY (carID),
) 

INSERT INTO cars (
    CarMake, CarModel
)
VALUES 
('Volvo','XC90'),
('Ford','GT40'),
('Ford','Focus RS'),
('Mercedes-Benz','SLK 55'),
('Porsche','Cayman Turbo S')

-- Table 2 -- 

CREATE TABLE rentalAccount (
    accountID INT NOT NULL IDENTITY(1,1),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50),
    carInUse INT

    PRIMARY KEY (accountID),
    FOREIGN KEY (carInUse) REFERENCES cars(carID) ON DELETE CASCADE
    -- WE RETAIN INTEGRITY OF OUR DATA BY ALLOWING THIS TO CASCADE IF DELETED --
)

INSERT INTO rentalAccount (
    firstName, lastName, email, carInUse
)
VALUES 
('Mark','Wahlberg','m.w@gmail.com','2'),
('Ryan','Reynolds','r.r@gmail.com','3'),
('Marcello','Barenghi','m.b@gmail.com','5')

ALTER TABLE cars
DROP CONSTRAINT FK_carID

-- DATA INTEGRITY--
-- THIS WORKS THANKS TO CASCADE --
DELETE FROM cars
WHERE carID = 2

-- You would have to run this also if deleting w/out CASCADE --
DELETE FROM rentalAccount
WHERE carInUse = 2