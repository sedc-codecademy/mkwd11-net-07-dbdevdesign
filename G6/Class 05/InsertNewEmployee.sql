CREATE PROCEDURE InsertNewEmployee
(
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@Gender nchar(1),
	@HireDate DATE,
	@NationalIdNumber nvarchar(20),
	@NewEmployeeId INT OUT
)
AS
BEGIN

INSERT INTO Employees (FirstName, LastName, Gender, HireDate, NationalIdNumber)
VALUES (@FirstName, @LastName, @Gender, @HireDate, @NationalIdNumber)

--return the id from the last inserted row in the batch, stored procedure, function..
--set the value of @NewEmployeeId to the id of the new employee (last inserted employee)
SET @NewEmployeeId = Scope_Identity()

END

DECLARE @EmployeeId INT

EXEC InsertNewEmployee 
@FirstName = 'Test',
@LastName = 'Test Employee',
@Gender = 'M',
@HireDate = '2023-03-03',
@NationalIdNumber = '1111111',
@NewEmployeeId = @EmployeeId OUT

Select @EmployeeId

