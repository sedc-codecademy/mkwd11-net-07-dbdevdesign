CREATE FUNCTION fn_PrintBill (@OrderId INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN

DECLARE @Result NVARCHAR(MAX)

Select @Result = STRING_AGG(p.Name + ' x ' + CAST(od.Quantity as nvarchar(100)) + ' = ' + CAST((od.Quantity * od.Price) as nvarchar(MAX)), ', ')
From Orders o 
INNER JOIN OrderDetails od ON o.Id = od.OrderId
INNER JOIN Products p ON p.Id = od.ProductId
WHERE o.Id = @OrderId
GROUP BY o.Id

RETURN @Result
END