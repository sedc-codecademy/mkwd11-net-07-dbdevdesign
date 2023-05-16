--create database
/*CREATE DATABASE SEDC*/

USE SEDC

--create table
CREATE TABLE dbo.Customer (

Id INT NOT NULL,
FirstName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
City NVARCHAR(50) NULL

)
--inserts values into table
INSERT INTO dbo.Customer (Id,FirstName,LastName,City)
VALUES (1,'Dana','Tasevska','London')

INSERT INTO dbo.Customer (Id,FirstName,LastName,City)
VALUES (2,'Trajce','Trajkovski','Berlin')

INSERT INTO dbo.Customer (Id,FirstName,LastName,City)
VALUES (3,'Ana','Mitevska','Skopje')

--read values from table
SELECT *--FirstName,LastName
FROM dbo.Customer
WHERE City = 'London' and FirstName='Dana'

--deletes table as an object from the database
DROP TABLE dbo.Customer


CREATE TABLE dbo.Customer(
Id INT IDENTITY(1,1),
FirstName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
City NVARCHAR(50) NULL,
CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (Id)
)

INSERT INTO dbo.Customer (FirstName,LastName,City)
VALUES ('Dana','Tasevska','London')

INSERT INTO dbo.Customer (FirstName,LastName,City)
VALUES ('Ana','Stojanovska','Viena')

INSERT INTO dbo.Customer (FirstName,LastName)
VALUES ('Trajce','Trajkovski')


SELECT *
FROM dbo.Customer


--updates values in table

UPDATE dbo.Customer
SET City = 'Berlin'
--WHERE Id = 3


SELECT *
FROM dbo.Customer
WHERE Id = 3


-- deletes rows in table 

DELETE FROM dbo.Customer
WHERE Id=1

SELECT * 
FROM dbo.Customer

INSERT INTO dbo.Customer (FirstName,LastName,City)
VALUES ('Dana','Tasevska','London')


DELETE FROM dbo.Customer

TRUNCATE TABLE dbo.Customer

INSERT INTO dbo.Customer (FirstName,LastName,City)
VALUES ('Dana','Tasevska','London')

SELECT * 
FROM dbo.Customer