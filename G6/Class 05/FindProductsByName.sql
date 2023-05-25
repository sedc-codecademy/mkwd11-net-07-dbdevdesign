ALTER PROCEDURE FindProductsByName
(
	@ProductName nvarchar(300),
	@Count INT OUT,
	@TotalPrice Decimal(18,2) OUT
)
AS
BEGIN

--SELECT @Count = COUNT(*)
--FROM Products
--WHERE [Name] like '%ProductName%'

SELECT *
FROM Products 
WHERE [Name] like '%'+@ProductName + '%' 

--returns the number of rows affected by last statement
SELECT @Count = @@ROWCOUNT

--find total price of products with the given name
SELECT @TotalPrice = SUM(Price)
FROM Products 
WHERE [Name] like '%'+@ProductName + '%' 

END

DECLARE @NumOfAffectedRows INT
DECLARE @TotalPriceOut INT
EXEC FindProductsByName @ProductName = 'Gluten Free', @Count = @NumOfAffectedRows OUT, @TotalPrice = @TotalPriceOut OUT

SELECT @NumOfAffectedRows, @TotalPriceOut