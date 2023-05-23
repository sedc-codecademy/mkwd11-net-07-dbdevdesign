--Declare scalar function (fn_FormatProductName) for retrieving the Product description for specific ProductId in the following format:
--Second and Third character from the Code
--Last three characters from the Name
--Product Price
--example: XY-PLE-100

CREATE FUNCTION fn_FormatProductName (@ProductId int)
RETURNS NVARCHAR(100)
AS
BEGIN

DECLARE @Description NVARCHAR(100)

Select @Description = 
(SELECT SUBSTRING(Code, 2, 2) + '-' + RIGHT([Name], 3) + '-' + CAST(Price as nvarchar(10))
FROM Products
Where Id = @ProductId
)

RETURN @Description

END
GO

SELECT dbo.fn_FormatProductName(1)
SELECT dbo.fn_FormatProductName(2)