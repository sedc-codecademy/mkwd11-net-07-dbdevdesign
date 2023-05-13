/*this will remove the database */ 
-- DROP DATABASE [Test]
-- any comment

--create SEDC database
-- CREATE DATABASE [SEDC]

--state which database context will be used
USE [SEDC]


--create a table for Customer without primery key and auto increment of the key
--CREATE TABLE [Customer](
--[Id] [int] NOT NULL,
--[Name] [nvarchar](100) NOT NULL,
--[City] [nvarchar](100) NULL)

--create a table for Customer with primery key and auto increment of the key
--CREATE TABLE [Customer](
--[Id] [int] IDENTITY(1, 1) NOT NULL,
--[Name] [nvarchar](100) NOT NULL,
--[City] [nvarchar](100) NULL,
--CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED (
--[Id] ASC
--))

--read content out of a table
Select * From [dbo].[Customer]

--INSERT INTO [Customer] ([Name], [City]) Values ('Risto', 'Skopje') 
--INSERT INTO [Customer] ([Name], [City]) Values ('Marko', 'Skopje') 
--INSERT INTO [Customer] ([Name], [City]) Values ('Ana', 'Skopje') 
--INSERT INTO [Customer] ([Name]) Values ('Martin') 

Select Id, [Name] From dbo.Customer

--without any restriction (WHERE clause) all records will be affected with the update
--Update [Customer]
--SET City = 'Veles'

--Update [Customer]
--SET City = 'Veles'
--Where Id = 4 -- only the record with Id 4 will be updated
--Where [Name] = 'Martin' --all customers with name Martin will have their city updated to Veles

--Delete
--From Customer
----Where Id = 2
--Where City = 'Skopje'

-- Truncate behaves as Delete without Where clause, and also resets the Identity to its first value
--TRUNCATE TABLE Customer