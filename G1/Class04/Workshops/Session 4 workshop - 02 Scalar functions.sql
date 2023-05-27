
DROP FUNCTION IF EXISTS dbo.fn_FormatProductName;
GO

CREATE FUNCTION dbo.fn_FormatProductName (@ProductId int)
RETURNS Nvarchar(100)
AS 
BEGIN

DECLARE @Output Nvarchar(100)

select @Output = SUBSTRING(Code,2,2) + '-' + right(Name,3) + '-' + cast(Price as nvarchar(10))
from dbo.Products
where id = @ProductId

RETURN @Output

END
GO

-- test execution
select *,dbo.fn_FormatProductName (id) as FunctionOutput
from dbo.Products

