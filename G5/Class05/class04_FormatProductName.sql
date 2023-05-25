SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Declare scalar function (fn_FormatProductName) for retrieving the Product description for specific ProductId in the following format:
--Second and Third character from the Code
--Last three characters from the Name
--Product Price

CREATE FUNCTION fn_FormatProductName
(
	-- Add the parameters for the function here
	@ProductId INT
)
RETURNS NVARCHAR(250)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Description NVARCHAR(250)

	-- Add the T-SQL statements to compute the return value here
	-- CAST(Price AS NVARCHAR(30)) is another converting (casting) build in function that you can use
	SELECT @Description = SUBSTRING(Code, 2, 2) + '-' + RIGHT([Name], 3) + '-' + CONVERT(NVARCHAR(30), Price) 
	FROM Products
	WHERE Id = @ProductId

	-- Return the result of the function
	RETURN @Description

END
GO


SELECT *, dbo.fn_FormatProductName(Id) AS FunctionFormatProductName
FROM Products
GO