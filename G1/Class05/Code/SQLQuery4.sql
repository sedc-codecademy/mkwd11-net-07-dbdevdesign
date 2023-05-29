CREATE PROCEDURE usp_GetEmployeeByGender
(
	@Gender nchar(1) = 'M',
	@GenderCount int OUT
)
AS
BEGIN
	SELECT *
	FROM dbo.Employees
	WHERE Gender = @Gender

	SELECT @GenderCount = COUNT(*)
	FROM dbo.Employees
	WHERE Gender = @Gender
END
GO

DECLARE 
@ReturnValue int,
@GenderCountOut int		

EXEC @ReturnValue = usp_GetEmployeeByGender @Gender = 'M',@GenderCount =  @GenderCountOut OUTPUT;

SELECT @GenderCountOut as GenderCountOut