--Change Products table always to insert value 1 in price column if no price is provided on insert
--we need DEFAULT constraint
ALTER TABLE Products
ADD CONSTRAINT DF_Products_Price
DEFAULT 1 FOR Price

INSERT INTO [dbo].[Products]
           ([Code]
           ,[Name]
           ,[Description]
           ,[Weight]
           ,[Cost])
     VALUES
           (
		   '111',
		   'Test DF',
		   'Test DF',
		   12.2,
		   10
		   )


select *
from Products
where Code = '111'

--Change Products table to prevent inserting Price that will more than 2x bigger then the cost price
alter table Products
add constraint CHK_Products_Price
CHECK (Price <= 2*Cost)

--This will fail because of the CHECK constraint
--INSERT INTO [dbo].[Products]
--           ([Code]
--           ,[Name]
--           ,[Description]
--           ,[Weight]
--		   ,[Price]
--           ,[Cost])
--     VALUES
--           (
--		   '111',
--		   'Test DF',
--		   'Test DF',
--		   12.2,
--		   100,
--		   10
--		   )

--Change Products table to guarantee unique names across the products
ALTER TABLE Products
ADD CONSTRAINT UC_Products_Name
UNIQUE ([Name])

--This will fail because we already have a Product with name Crunchy
--UPDATE Products
--SET [Name] = 'Crunchy'
--WHERE [Name] = 'Granola'

--if you add two products with Code 111 this constraint won't succeed
--ALTER TABLE Products
--ADD CONSTRAINT UC_Products_Code
--UNIQUE (Code)



