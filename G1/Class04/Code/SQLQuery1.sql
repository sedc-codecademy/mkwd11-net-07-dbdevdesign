--scalar variable
DECLARE
@FirstName nvarchar(100),
@LastName nvarchar(100)
SET @FirstName = 'Aleksandar'
SET @LastName = 'Stojanovski'

DECLARE @FullName nvarchar(100)
SET @FullName = @FirstName + ' ' + @LastName

SELECT *, @FullName FROM Employees
WHERE FirstName = @FirstName AND LastName = @LastName
GO

--table variable
DECLARE @FemaleEmployeeList TABLE
(EmployeeId int not null, FirstName nvarchar(100) null, Lastname nvarchar(100));

INSERT INTO @FemaleEmployeeList (EmployeeId, FirstName, Lastname)
VALUES (101,'Ana','Nikolova')

SELECT * FROM @FemaleEmployeeList
GO

--Temp table
CREATE TABLE #FemaleEmployeeList 
(EmployeeId int not null, FirstName nvarchar(100) null, Lastname nvarchar(100));

INSERT INTO #FemaleEmployeeList  (EmployeeId, FirstName, Lastname)
VALUES (102,'Bojan','Damchevski')

INSERT INTO #FemaleEmployeeList  (EmployeeId, FirstName, Lastname)
VALUES (103,'Tosho','Micevski')

SELECT * FROM #FemaleEmployeeList
GO