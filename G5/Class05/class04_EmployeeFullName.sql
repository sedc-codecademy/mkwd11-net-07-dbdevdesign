SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		G5
-- Create date: 25.05.2023
-- Description:	A function that return employee full name by id
-- =============================================
CREATE FUNCTION EmployeeFullName  --public string EmployeeFullName(employeeId int)
(
	@EmployeeId INT --this is the employeeId param
)
RETURNS NVARCHAR(202) -- this is the string return type
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result NVARCHAR(202)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = Firstname + N' ' + Lastname
	FROM Employees
	WHERE Id = @EmployeeId

	-- Return the result of the function
	RETURN @Result

END
GO

SELECT dbo.EmployeeFullName(15) -- always call it with the schema (dbo)

--SELECT dbo.EmployeeFullName(15), HireDate
--FROM Employees
--WHERE Id = 15
GO
