CREATE DATABASE SEDC

use SEDC


CREATE TABLE BussinessEntity
(
	Id int identity(1,1),
	[Name] nvarchar(255) not null,
	[Region] nvarchar(255) not null,
	Zipcode char(4) not null,
	Size nvarchar(10) not null
)

Create table Employee
(
	Id int identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	DateOfBirth datetime2,
	Gender nchar(1),
	HireDate datetime2,
	NationalIdNumber char(15) 
)

ALTER TABLE Employee
DROP COLUMN NationalIdNumber

ALTER TABLE Employee
ADD NationalIdNumber char(13) 

INSERT INTO BussinessEntity([Name], Region, Zipcode, Size)
VALUES('Vitalia Skopje', 'Skopski', '1000', 'Large')