USE SEDC

--ALTER TABLE dbo.Products WITH CHECK
--ADD CONSTRAINT UC_Products_Code
--UNIQUE (Code)
--GO

--ALTER TABLE dbo.Products
--ADD CONSTRAINT DF_Products_Price
--DEFAULT 1 FOR Price

--ALTER TABLE dbo.Products WITH CHECK
--ADD CONSTRAINT CHK_Products_Price
--CHECK (Price <= Cost * 2)

ALTER TABLE dbo.Products WITH CHECK
ADD CONSTRAINT UC_Products_Name
UNIQUE ([Name])

--Because there is already duplication of the Name 'Gluten Free', UNIQUE constraint cannot be added. We need to update the names so they are unique, and then add the constraint
--Select * From dbo.Products Where [Name] LIKE '%Gluten Free%'
--Update dbo.Products SET [Name] = 'Gluten Free 2' Where Id = 13

Select * From dbo.Products Where [Name] LIKE '%Multigrain%'
Update dbo.Products SET [Name] = 'Multigrain 2' Where Id = 12

--ALTER TABLE dbo.Products
--ALTER COLUMN [Description] nvarchar(500)


--ALTER TABLE Orders WITH CHECK
--ADD CONSTRAINT FK_Orders_BusinessEntities
--FOREIGN KEY (BusinessEntityId)
--REFERENCES BusinessEntities (Id)

--ALTER TABLE Orders WITH CHECK
--ADD CONSTRAINT FK_Orders_Customers
--FOREIGN KEY (CustomerId)
--REFERENCES Customers (Id)

--ALTER TABLE Orders WITH CHECK
--ADD CONSTRAINT FK_Orders_Employees
--FOREIGN KEY (EmployeeId)
--REFERENCES Employees (Id)

--People
-- Person 1
-- Person 2
-- Person 3

-- Families
-- Parent 1 => Person 1
-- Parent 2 => Person 2
-- Child => Person 3