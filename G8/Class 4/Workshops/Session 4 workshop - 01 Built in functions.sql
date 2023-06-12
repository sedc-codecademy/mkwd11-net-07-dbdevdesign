/*
Declare scalar variable for storing FirstName values
	Assign value ‘Aleksandar’ to the FirstName variable
	Find all Employees having FirstName same as the variable

Declare table variable that will contain EmployeeId and DateOfBirth
	Fill the table variable with all Female employees

Declare temp table that will contain LastName and HireDate columns
	Fill the temp table with all Male employees having First Name starting with ‘A’

*/

-- scalar variable
DECLARE @FirstName nvarchar(100)
set @FirstName = 'Aleksandar'

SELECT * 
FROM Employees
WHERE FirstName = @FirstName
GO

SELECT * 
FROM Employees
WHERE DateOfBirth > '1988.01.01'
GO

-- table variable
DECLARE @EmployeeList TABLE 
(EmployeeId int, FirstName NVARCHAR(100), DateOfBirth date);

INSERT INTO @EmployeeList
SELECT Id, FirstName, DateOfBirth
FROM dbo.Employees
WHERE Gender = 'F'

select * from @EmployeeList
GO

-- Temp table 
CREATE TABLE #EmployeeList 
(LastName NVARCHAR(100), HireDate date);

INSERT INTO #EmployeeList
SELECT LastName, HireDate 
from dbo.Employees
where FirstName like 'A%'

SELECT * 
FROM #EmployeeList
where Len(LastName) = 7

drop table #EmployeeList
GO
