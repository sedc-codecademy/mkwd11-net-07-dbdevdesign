USE SEDC

CREATE TABLE Customers(
Id int NOT NULL,
[Name] nvarchar(100) NOT NULL,
AccountNumber nvarchar(100) NOT NULL,
City nvarchar(100) NOT NULL,
Region nvarchar(100) NULL,
CustomerSize nvarchar(10) NULL,
PhoneNumber nvarchar(20) NULL,
IsActive bit NOT NULL
)

CREATE TABLE Employees(
Id int NOT NULL,
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
DateOFBirth date NOT NULL,
Gender nchar(1) NOT NULL,
HireDate date NOT NULL,
NationIdNumber nvarchar(20) NULL,
)

CREATE TABLE Products(
Id int NOT NULL,
Code nvarchar(50) NOT NULL,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(MAX) NULL,
[Weight] decimal(18, 2) NULL,
[Price] decimal(18,2) NOT NULL,
Cost decimal(18,2) NULL
)

CREATE TABLE Orders(
Id bigint NOT NULL,
OrderDate date NOT NULL,
[Status] smallint NOT NULL,
BusinessEntityId int NOT NULL,
CustomerId int NOT NULL,
EmployeeId int NOT NULL,
TotalPrice decimal(18,2) NOT NULL,
Comment nvarchar(MAX) NULL
)

CREATE TABLE OrderDetails(
Id bigint NOT NULL,
OrderId bigint NOT NULL,
ProductId int NOT NULL,
Quantity int NOT NULL,
Price decimal(18, 2) NOT NULL
)

CREATE TABLE BusinessEntities(
Id int NOT NULL,
[Name] nvarchar(100) NOT NULL,
[Region] nvarchar(100) NULL,
ZipCode nvarchar(10) NULL,
Size nvarchar(10) NULL
)
