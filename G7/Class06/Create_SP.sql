CREATE PROCEDURE dbo.AddNewCustomer
(
		@Name nvarchar(100), 
		@AccountNumber nvarchar(100), 
		@City nvarchar(100), 
		@RegionName nvarchar(100), 
		@IsActive bit
)
AS
BEGIN
		INSERT INTO [dbo].[Customers]
           ([Name]
           ,[AccountNumber]
           ,[City]
           ,[RegionName]
           ,[IsActive])
     VALUES
           (@Name
           ,@AccountNumber
           ,@City
           ,@RegionName
           ,@IsActive)



END