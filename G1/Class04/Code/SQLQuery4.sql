CREATE FUNCTION dbo.fn_EmployeeFullName (@EmployeeId int)
RETURNS NVARCHAR(2000)
AS
BEGIN

DECLARE @Result NVARCHAR(2000)
SELECT @Result = e.FirstName + N' ' +e.LastName
FROM Employees e
WHERE Id = @EmployeeId

RETURN @Result

END
GO

--how to call it
SELECT dbo.fn_EmployeeFullName(1)