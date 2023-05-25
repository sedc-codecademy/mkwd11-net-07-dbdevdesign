--Create procedure for adding new customer
--As output from the procedure get the following data:
--1. Total number of customers starting with the same character as the new customer
--2. Additionally in second resultset return how many customers already exist in the new customer region

CREATE PROCEDURE AddNewCustomer
(
	@Name nvarchar(200),
	@AccountNumber nvarchar(100),
	@Region nvarchar(100),
	@IsActive bit
)
AS
BEGIN

--add new customer
INSERT INTO Customers ([Name], AccountNumber, RegionName, IsActive)
VALUES(@Name, @AccountNumber, @Region, @IsActive)

--Total number of customers starting with the same character as the new customer
DECLARE @FirstCharacter nvarchar(1)
SET @FirstCharacter = LEFT(@Name, 1)

SELECT COUNT(*) as TotalCustomerWithSameFirstCharacter
FROM Customers
--WHERE LEFT([Name], 1) = @FirstCharacter
WHERE Substring([Name], 1, 1) = Substring(@Name, 1, 1)

--how many customers already exist in the new customer region
SELECT COUNT(*) - 1
FROM Customers
WHERE RegionName = @Region

END


EXEC AddNewCustomer 
@Name = 'Kam Prilep', 
@AccountNumber = '111334', 
@Region = 'Prilepski', 
@IsActive = 1
