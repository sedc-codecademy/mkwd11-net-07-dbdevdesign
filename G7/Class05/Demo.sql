DECLARE @FirstName NVARCHAR(100),
        @EmployeeId INT


SET @FirstName = 'Risto'
SET @EmployeeId = 10


Select @FirstName = FirstName, @EmployeeId = Id From Employees Where Id = 78

Select @FirstName
Select @EmployeeId
Go

DECLARE @FemaleEmployees TABLE (EmployeeId INT NOT NULL, FirstName NVarchar(100) NOT NULL, LastName Nvarchar(100) NOT NULL)

--Insert Into #FemaleEmployees Values (1, 'Test', 'Test')

Insert Into @FemaleEmployees (EmployeeId, FirstName, LastName)
Select Id, FirstName, LastName 
From Employees 
Where Gender = 'F'

Select * From @FemaleEmployees
Go

CREATE TABLE #FemaleEmployees_Temp (EmployeeId INT NOT NULL, FirstName NVarchar(100) NOT NULL, LastName Nvarchar(100) NOT NULL)

Insert Into #FemaleEmployees_Temp (EmployeeId, FirstName, LastName)
Select Id, FirstName, LastName 
From Employees 
Where Gender = 'F'

Select * From #FemaleEmployees_Temp

--DROP TABLE #FemaleEmployees_Temp

--You have been given a gender as a character, you need to check whether that is F, M or invalid gender

DECLARE @Gender NVARCHAR(1)
SET @Gender = 'M'

IF(@Gender = 'F' or @Gender = 'M')
	SELECT @Gender + ' is valid gender!'
ELSE
	SELECT @Gender + ' is wrong gender!'

--Built in functions

Select Region,
	LEFT(Region, 3),
	RIGHT(Region, 3),
	LEN(Region),
	SUBSTRING(Region, 2, 5),
	Replace(Region, 'ski', 'xxx')
From BusinessEntities

--Anonymous region with *****
DECLARE @SubstringTemp TABLE (Region NVARCHAR(50) NOT NULL, PartOfTheString NVARCHAR(50) NOT NULL)

INSERT INTO @SubstringTemp (Region, PartOfTheString)
Select Region, Replace(Region, SUBSTRING(Region, 2, 5), '*****') FROM BusinessEntities

Select * From @SubstringTemp

Select Replace(Region, PartOfTheString, '*****') From @SubstringTemp

