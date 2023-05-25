CREATE PROCEDURE GetEmployeesCountByGender
(
	@Gender nvarchar(1),
	@GenderCount INT OUT
)
AS
BEGIN

SELECT @GenderCount = COUNT(*)
FROM Employees
WHERE Gender = @Gender

END
GO

DECLARE @GenderCountResult INT

--when we change the value of @GenderCount param inside the stored procedure, it will reflect on @GenderCountResult variable
EXEC GetEmployeesCountByGender @Gender = 'M', @GenderCount = @GenderCountResult OUT

Select @GenderCountResult



