CREATE DATABASE SEDC

USE SEDC

--when we create tables we must specify the columns, their types and whether they allow null as value
CREATE TABLE Customer(
Id int IDENTITY(1, 1) not null, --database will generate values for id, starting from 1, always incrementing by 1
[Name] nvarchar(100) not null,
City nvarchar(200) null
)

--read data
SELECT * --read all columns for each row
FROM dbo.Customer

SELECT [Name], City --read Name and City for each row
FROM dbo.Customer

--enter data in table
INSERT INTO dbo.Customer ([Name], City)
VALUES ('Vero', 'Skopje')

INSERT INTO dbo.Customer ([Name], City)
VALUES ('Kam', 'Skopje')

INSERT INTO dbo.Customer ([Name], City)
VALUES ('Tineks', 'Ohrid'), ('Ramstore', 'Kumanovo')


--edit rows
UPDATE dbo.Customer
SET [Name] = 'Tineks Ohrid'
WHERE [Name] = 'Tineks' -- filters the row that we want to update

--UPDATE without WHERE AFFECTS ALL ROWS!!!!!!!!!!!!
UPDATE dbo.Customer
SET City = 'Skopje'

DELETE 
FROM dbo.Customer
WHERE [Name] = 'Vero'

--DELETE without WHERE DELETES ALL ROWS!!!!!!!!!!!!
DELETE 
FROM dbo.Customer

DROP TABLE dbo.Customer