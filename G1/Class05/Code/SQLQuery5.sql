CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee
(
	@FirstName nvarchar(100), @LastName nvarchar(100), @DateOfBirth date, @Gender nchar(1), @HireDate date, @NationalIdNumber nvarchar(20),
	@EmployeeID int OUT
)
AS
BEGIN
	INSERT INTO dbo.Employees ([FirstName],[LastName],[DateOfBirth],[Gender],[HireDate],[NationalIdNumber])
	VALUES(@FirstName,@LastName,@DateOfBirth,@Gender,@HireDate,@NationalIdNumber)
	
	--Scope_Identity - Returns the last identity value inserted into an indentity column in the same scope. A scope is a module: a stored procedure, function or batch
	set @EmployeeID = SCOPE_IDENTITY();
END
GO

DECLARE @EmployeeIdOut int

EXEC dbo.usp_InsertEmployee @FirstName = 'TestName',@LastName='TestLastName',@DateOfBirth='1900-01-01',@Gender='M',@HireDate='1900-01-01',@NationalIdNumber='111111111', @EmployeeId = @EmployeeIdOut OUT

SELECT @EmployeeIdOut as ProcedureResult_Last_inserted_id

--SELECT * FROM Employees