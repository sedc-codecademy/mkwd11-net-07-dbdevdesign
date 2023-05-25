USE SEDC

--Declare scalar variable for storing FirstName values
--Assign value ‘Aleksandar’ to the FirstName variable
--Find all Employees having FirstName same as the variable

DECLARE @Firstname NVARCHAR(100)
SET @Firstname = 'Aleksandar'

SELECT *
FROM Employees
WHERE FirstName = @Firstname
GO

--Declare table variable that will contain EmployeeId and DateOfBirth
--Fill the table variable with all Female employees
DECLARE @FemaleEmployees TABLE
(EmployeeId INT, DateOfBirth DATE)

INSERT INTO @FemaleEmployees
SELECT Id, DateOfBirth
FROM Employees
WHERE Gender = 'F'

SELECT *
FROM @FemaleEmployees
GO

--Declare temp table that will contain LastName and HireDate columns
--Fill the temp table with all Male employees having First Name starting with ‘A’
--Retrieve the employees from the table which last name is with 7 characters
CREATE TABLE #MaleEmployeeList
(LastName NVARCHAR(100), HireDate DATE)

INSERT INTO #MaleEmployeeList
SELECT Lastname, HireDate
FROM Employees
WHERE FirstName LIKE 'A%' AND Gender = 'M'

SELECT *
FROM #MaleEmployeeList
WHERE LEN(LastName) = 7
GO