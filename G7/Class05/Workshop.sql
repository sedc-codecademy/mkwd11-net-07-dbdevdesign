--Workshop 1
--Declare scalar variable for storing FirstName values
--Assign value ‘Aleksandar’ to the FirstName variable
--Find all Employees having FirstName same as the variable

DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Aleksandar'

Select * From Employees Where FirstName = @FirstName

--Workshop 2
--Declare table variable that will contain EmployeeId and DateOfBirth
--Fill the table variable with all Female employees
DECLARE @FemaleEmployeesData TABLE (EmployeeId INT NOT NULL, DateOfBirth DATE NULL)

INSERT INTO @FemaleEmployeesData (EmployeeId, DateOfBirth)
Select Id, DateOfBirth
From Employees
Where Gender = 'F'

Select * From @FemaleEmployeesData

--Workshop 3
--Declare temp table that will contain LastName and HireDate columns
--Fill the temp table with all Male employees having First Name starting with ‘A’
--Retrieve the employees from the table which last name is with 7 characters

CREATE TABLE #MaleEmployeesWithFirstNameA (LastName NVARCHAR(100) NOT NULL, HireDate Date NULL)

INSERT INTO #MaleEmployeesWithFirstNameA (LastName, HireDate)
Select LastName, HireDate
From Employees
Where Gender = 'M' AND FirstName Like 'A%'

Select *
From #MaleEmployeesWithFirstNameA
Where LEN(LastName) = 7

DROP TABLE #MaleEmployeesWithFirstNameA