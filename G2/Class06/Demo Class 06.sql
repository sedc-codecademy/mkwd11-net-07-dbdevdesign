--WORKSHOP SCALAR FUNCTIONS

ALTER FUNCTION dbo.fn_FormatProductName (@ProductID int)
returns nvarchar(200)
as
begin

	declare @Result nvarchar(200)

	select @Result = SUBSTRING(p.Code,2,2) + '-' + RIGHT(p.Name,3) + '-' + cast(p.Price as nvarchar(50))
	from dbo.Products p
	where p.Id = @ProductID
	
	return @Result

end

SELECT *, dbo.fn_FormatProductName (p.Id) as FormatProductName
from dbo.Products p

GO

--STORED PROCEDURES
ALTER PROCEDURE dbo.sp_testSP (@First int, @Second int)
AS
BEGIN
     /*
	 PRINT 'FIRST'
	 PRINT @First
	 PRINT 'SECOND'
	 PRINT @Second
	 */
	 SELECT 'FIRST'
	 SELECT @First
	 SELECT 'SECOND'
	 SELECT @Second

END
GO
--EXECUTION

---- will not work
EXEC dbo.sp_testSP

--1--
EXEC dbo.sp_testSP 1,2

--2--
DECLARE @f INT
SET @f = 5

DECLARE @s INT
SET @s = 10

EXEC dbo.sp_testSP @f, @s

--3--
EXEC dbo.sp_testSP @First = 10, @Second = 15


--EXAMPLE SP - Insert new customer

--select * from dbo.Customers

ALTER PROCEDURE dbo.sp_CreateNewCustomer (
@Name nvarchar(100),
@AccountNumber nvarchar(100),
@City nvarchar(100),
@RegionName nvarchar(100),
@CustomerSize nvarchar(10),
@Phone nvarchar(20),
@Active bit)
AS
BEGIN
/*
  Created by: Dana Tasevska
  Created date: 30.05.2023
  Ticket Number: 115
  Description: Insert values into table dbo.Customers

  Modified by: Ilija Mitev
  Modified date: 05.06.2023
  Ticket Number: 120
  Description: Correction in variables in the insert statement
*/

PRINT 'INSERTING NEW CUSTOMER'

INSERT INTO dbo.Customers(Name, AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
VALUES (@Name, @AccountNumber, @City,@RegionName, @CustomerSize,@Phone, @Active)


SELECT *
FROM dbo.Customers
WHERE RegionName =  @RegionName

SELECT CustomerSize, count(*)
FROM dbo.Customers
WHERE City = @City
GROUP BY CustomerSize

END


--execute procedure
exec dbo.sp_CreateNewCustomer 'Test Customer 3', '12345987', 'Skopje', 'Skopski', 'Small', '070774599' ,1


select *
from dbo.Customers
order by id desc