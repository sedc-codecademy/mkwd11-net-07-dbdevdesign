CREATE PROCEDURE spCreateNewCustomer(
@name nvarchar(100), 
@accountNumber nvarchar(100),
@city nvarchar(100),
@regionName nvarchar(100),
@size nvarchar(10),
@phoneNumber nvarchar(20))
as
begin
	INSERT INTO Customers(
	[Name],
	[AccountNumber],
	[City], 
	[RegionName], 
	[CustomerSize],
	[PhoneNumber],
	[IsActive])
	VALUES
	(@name,
	@accountNumber,
	@city,
	@regionName,
	@size,
	@phoneNumber,
	1)
	SELECT COUNT(*) FROM Customers
	where LEFT([Name], 1) = LEFT(@name, 1)

	SELECT COUNT(*) FROM Customers
	WHERE RegionName = @regionName and Id != SCOPE_IDENTITY()
end
go;

EXEC spCreateNewCustomer
	@name = 'Viva',
	@accountNumber = '123123213',
	@city = 'Skopje',
	@regionName = 'Skopski',
	@size = 'Small',
	@phoneNumber = '077/675-348'
