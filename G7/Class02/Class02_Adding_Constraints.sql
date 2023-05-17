ALTER TABLE Customer
ADD CONSTRAINT DF_Customer_IsActive
DEFAULT 1 FOR IsActive
GO

ALTER TABLE dbo.Product
WITH CHECK
ADD CONSTRAINT CHK_Product_Weight
CHECK ([Weight] > 0)
GO

Select * From Product