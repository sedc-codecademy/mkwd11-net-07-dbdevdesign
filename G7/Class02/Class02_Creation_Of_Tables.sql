--Create Database SEDC

Use SEDC

--Create Table BusinessEntity(
--Id int Identity(1, 1) NOT NULL,
--[Name] nvarchar(100) NOT NULL,
--Region nvarchar(100) NULL,
--ZipCode nvarchar(10) NULL,
--Size nvarchar(10) NULL)

--Create Table Empoyee (
--Id int Not NULL)

Insert Into Empoyee (FirstName, LastName, DateOfBirth, Gender, HireDate) Values ('Dragan', 'Manaskov', '1995-11-28', 'M', GETDATE())

Update Empoyee Set City = 'Skopje' Where City IS NULL

--EXEC sp_rename 'Employee', 'Employee';

--EXEC sp_rename 'Employee.City', 'Town';

--ALTER TABLE Employee
--ALTER COLUMN Town nvarchar(100)

--Create Table Product (
--Id bigint NOT NULL,
--Code nvarchar(50) Not NUll,
--[Name] nvarchar(100) NOT NULL,
--[Description] nvarchar(MAX) NULL,
--[Weight] decimal(18,2) NOT NULL,
--[Price] decimal(18,2) NOT NULL,
--Cost decimal(18,2) NOT NULL
--)

--INSERT INTO [dbo].[Product]
--           ([Id]
--           ,[Code]
--           ,[Name]
--           ,[Description]
--           ,[Weight]
--           ,[Price]
--           ,[Cost])
--     VALUES
--           (1
--           ,'AABBCC'
--           ,'Coca Cola'
--           ,'Drink'
--           ,2.0
--           ,2.3
--           ,1.5)


--INSERT INTO [dbo].[Product]
--           ([Id]
--           ,[Code]
--           ,[Name]
--           ,[Description]
--           ,[Weight]
--           ,[Price]
--           ,[Cost])
--     VALUES
--           (2
--           ,'BBBBBB'
--           ,'Pepsi'
--           ,'Drink'
--           ,2.0
--           ,2.2
--           ,1.4)

Select * From dbo.Product