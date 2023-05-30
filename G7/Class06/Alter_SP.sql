ALTER PROCEDURE dbo.AddNewCustomer
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

	DECLARE @FirstLetter NVARCHAR(1)
	SET @FirstLetter = SUBSTRING(@Name, 1, 1)

	Select Count(*) as CustomerWithSameFirstLetter 
	From dbo.Customers c
	Where SUBSTRING(c.Name, 1, 1) = @FirstLetter	
	--Where c.Name Like @FirstLetter + '%'

	Select *
	From dbo.Customers c
	Where c.RegionName = @RegionName

END