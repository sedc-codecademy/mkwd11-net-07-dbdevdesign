CREATE OR ALTER PROCEDURE dbo.NewCustomer
(
	@Name nvarchar(100),
	@AccountNumber nvarchar(50),
	@City nvarchar(100),
	@RegionName nvarchar(100),
	@isActive bit
)
AS
BEGIN
	INSERT INTO [dbo].[Customers]([Name],[AccountNumber],[City],[RegionName],[IsActive])
	VALUES(@Name, @AccountNumber, @City, @RegionName, @isActive)

	SELECT COUNT(*) as TotalCustomerFirstLetter
	FROM [dbo].[Customers]
	WHERE SUBSTRING(Name,1,1)= SUBSTRING(@Name,1,1)

	SELECT COUNT(*) as CustomersInRegion
	FROM [dbo].[Customers]
	WHERE RegionName = @RegionName
END
GO

EXEC dbo.NewCustomer
	@Name='Vitaminka',
	@AccountNumber='1234',
	@City='Prilep',
	@RegionName='Prilepski',
	@isActive=1