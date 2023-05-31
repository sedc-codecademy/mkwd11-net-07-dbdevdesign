DECLARE @EmployeeId INT

SET @EmployeeId = 5

Select @EmployeeId

Select @EmployeeId = e.Id From Employees e Where e.FirstName = 'Maja' AND e.LastName = 'Stojanovski'

Select @EmployeeId

CREATE TABLE #AllEmployeesWithLastNameStojanovski (Id INT NOT NULL, FullName NVARCHAR(500) NOT NULL, DateOfBirth Date NOT NULL)

Insert Into #AllEmployeesWithLastNameStojanovski(Id, FullName, DateOfBirth)
Select Id, FirstName + ' ' + LastName, DateOfBirth From Employees Where LastName = 'Stojanovski'

Select * From #AllEmployeesWithLastNameStojanovski

DROP TABLE #AllEmployeesWithLastNameStojanovski