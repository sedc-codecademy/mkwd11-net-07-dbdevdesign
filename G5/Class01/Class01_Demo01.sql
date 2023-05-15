CREATE DATABASE SEDC

--DROP DATABASE SEDC

USE SEDC

CREATE TABLE [User](
[Id] int NOT NULL,
[FirstName] nvarchar(50) NOT NULL,
[LastName] nvarchar(50) NOT NULL,
[Age] int NULL
)

SELECT *
FROM [User]

INSERT INTO [User]
VALUES (1, 'Tijana', 'Stojanovska', 23)

SELECT *
FROM [User]

INSERT INTO [User]
VALUES (2, 'Aleksandar', 'Ivanovski', null)

--INSERT INTO [User]
--VALUES (3, 'Aleksandar2', 'Ivanovski2')  mora da se vnesat vrednosti za site koloni, iako se null

SELECT *
FROM [User]

UPDATE [User] SET Age = 24
WHERE FirstName = 'Tijana'

SELECT FirstName, LastName
FROM [User]

DELETE 
FROM [User]
WHERE FirstName = 'Tijana'

SELECT *
FROM [User]

TRUNCATE TABLE [User]