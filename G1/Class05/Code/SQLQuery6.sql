--SELECT * FROM Products
--GO

DROP PROCEDURE IF EXISTS uspFindProductByName
GO

CREATE OR ALTER PROCEDURE uspFindProductByName
(
	--The parameters
	@Product_name nvarchar(100),
	@Product_count int OUT,
	@Price_out decimal OUT
)
AS
BEGIN
--The logic
	SELECT Name, Code, Price
	FROM dbo.Products
	WHERE Name Like '%'+@Product_name+'%'

	SELECT @Product_count = @@ROWCOUNT
	--@@ROWCOUNT returns the number of rows affected by the last statement
	SET @Price_out = (SELECT Price from Products
	WHERE Name=@Product_name)
END
GO

DECLARE 
		@Count int,
		@Cena decimal

EXEC uspFindProductByName 'Raw bars', @Count output, @Cena output

SELECT @Count as 'Number of products found'
SELECT @Cena as Cena
GO