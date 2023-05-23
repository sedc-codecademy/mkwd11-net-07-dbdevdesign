CREATE FUNCTION fn_EmployeeFullName (@EmployeeId int)
RETURNS NVARCHAR(2000)
AS 
BEGIN

DECLARE @FullName NVARCHAR(2000)

SELECT @FullName = 
(SELECT FirstName + N' ' + LastName 
FROM Employees
Where Id = @EmployeeId)

RETURN @FullName

END
GO

SELECT dbo.fn_EmployeeFullName(1)
