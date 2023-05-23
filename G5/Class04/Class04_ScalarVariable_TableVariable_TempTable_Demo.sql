USE SEDC
GO

DECLARE @EmployeeId INT
SET @EmployeeId = 1

SELECT @EmployeeId
GO

--SELECT @EmployeeId --not valid after the batch where it it declared has ended (by go)

DECLARE @EmployeeList TABLE 
(EmployeeId INT NOT NULL, FirstName NVARCHAR(100), LastName NVARCHAR(100)); --you don't need to specify not null, by default every column is not null

INSERT INTO @EmployeeList
SELECT Id, FirstName, LastName 
FROM dbo.Employees

SELECT * FROM @EmployeeList
GO

CREATE TABLE #EmployeeList2 --# means that it is a temporary table
(EmployeeId int, FirstName NVARCHAR(100), LastName NVARCHAR(100));

INSERT INTO #EmployeeList2
SELECT Id, FirstName, LastName 
FROM dbo.Employees
GO

--scalar variable example
DECLARE @Firstname NVARCHAR(100), @Lastname NVARCHAR(100), @Fullname NVARCHAR(201)
SET @Firstname = 'Ana'
SET @Lastname = 'Stojanovski'

--SELECT @Firstname AS Firstname, @Lastname AS Lastname

SET @Fullname = @Firstname + ' ' + @Lastname 

--SELECT @Fullname
--SET @Firstname = 'Tijana'

SELECT *
FROM Employees
WHERE FirstName LIKE '%' + @Firstname + '%' OR LastName = @Lastname
GO

--table variable example
DECLARE @FemaleEmployeeList TABLE 
(EmployeeId INT NOT NULL, Firstname NVARCHAR(100), Lastname NVARCHAR(100))

INSERT INTO @FemaleEmployeeList (EmployeeId, Firstname, Lastname)
VALUES (101, 'Tijana', 'Stojanovska')

INSERT INTO @FemaleEmployeeList (EmployeeId, Firstname, Lastname)
VALUES (102, 'Simona', 'Nikolovska')

INSERT INTO @FemaleEmployeeList (EmployeeId, Firstname, Lastname)
SELECT Id, Firstname, Lastname
FROM Employees
WHERE Gender = 'F'

SELECT * 
FROM @FemaleEmployeeList
ORDER BY EmployeeId
GO

--temp tables example
CREATE TABLE #FemaleEmployeesList
(EmployeeId INT NOT NULL, Firstname NVARCHAR(100), Lastname NVARCHAR(100))

INSERT INTO #FemaleEmployeesList (EmployeeId, Firstname, Lastname)
VALUES (101, 'Tijana', 'Stojanovska')

INSERT INTO #FemaleEmployeesList (EmployeeId, Firstname, Lastname)
VALUES (102, 'Simona', 'Nikolovska')

INSERT INTO #FemaleEmployeesList (EmployeeId, Firstname, Lastname)
SELECT Id, Firstname, Lastname
FROM Employees
WHERE Gender = 'F'

SELECT * 
FROM #FemaleEmployeesList
ORDER BY EmployeeId
GO