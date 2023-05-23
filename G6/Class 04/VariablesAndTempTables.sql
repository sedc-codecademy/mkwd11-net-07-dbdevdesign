--scalar variable (variable that holds one value)
--first batch start
DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Aleksandar'

DECLARE @LastName NVARCHAR(100), @Quantity INT
SET @LastName = 'Ivanovski'
SET @Quantity= 10 

SELECT *
FROM Employees
WHERE FirstName = @FirstName AND LastName = @LastName

--we can declare variables that get values from a query
DECLARE @FName NVARCHAR(100)
SELECT @FName 
 = (SELECT TOP(1) FirstName from Employees)

 SELECT *
FROM Employees
WHERE FirstName = @FName

--table variables
DECLARE @FemaleEmployees TABLE
(EmployeeId int not null, FirstName NVARCHAR(100), LastName NVARCHAR(100))

INSERT INTO @FemaleEmployees (EmployeeId, FirstName, LastName)
VALUES(100, 'Ana', 'Anevska')

select * from @FemaleEmployees

INSERT INTO @FemaleEmployees (EmployeeId, FirstName, LastName)
select Id, FirstName, LastName
from Employees
where Gender = 'F'

select * from @FemaleEmployees

GO
--first batch end
--table variables are available only in the batch (before GO) in which they are declared

--THIS WON'T WORK
--select * from @FemaleEmployees


--temp tables
-- they live in the script in which they are defined
-- they are not available just in batch, but among all batches

CREATE TABLE #FemaleEmployeesList
(EmployeeId int not null, FirstName NVARCHAR(100), LastName NVARCHAR(100))

INSERT INTO #FemaleEmployeesList (EmployeeId, FirstName, LastName)
VALUES(100, 'Ana', 'Anevska')

INSERT INTO #FemaleEmployeesList (EmployeeId, FirstName, LastName)
select Id, FirstName, LastName
from Employees
where Gender = 'F'

GO
--visible outside the batch
select * from #FemaleEmployeesList



