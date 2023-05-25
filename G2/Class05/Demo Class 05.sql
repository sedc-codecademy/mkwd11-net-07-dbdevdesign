--Workshop view - example 1
CREATE VIEW DBO.vv_CustomerOrders
AS
SELECT o.CustomerId, SUM(o.TotalPrice) as Total
FROM DBO.Orders o
GROUP BY O.CustomerId
go
ALTER VIEW DBO.vv_CustomerOrders as
select c.Name, SUM(o.TotalPrice) as Total
from dbo.Customers c
inner join dbo.Orders o on o.CustomerId = c.Id
group by c.Name
go
select *
from dbo.vv_CustomerOrders
order by Total desc


--Variable
DECLARE @FirstName nvarchar(15)
SET @FirstName = 'Ana'

--select @FirstName

SELECT *
FROM DBO.Employees
WHERE FirstName = @FirstName


--TEMP TABLE
CREATE TABLE #Employees
(
   FirstName nvarchar(50),
   LastName nvarchar(50)
)

select *
from #Employees

INSERT INTO #Employees (FirstName,LastName)
values('Dana','Tasevska')

INSERT INTO #Employees (FirstName,LastName)
values('Trajko','Trajkovski')

--GLOBAL TABLE 
CREATE TABLE ##Employees
(
   FirstName nvarchar(50),
   LastName nvarchar(50)
)

INSERT INTO ##Employees (FirstName,LastName)
values('Dana','Tasevska')

INSERT INTO ##Employees (FirstName,LastName)
values('Trajko','Trajkovski')

select *
from ##Employees

--TABLE VARIABLE
DECLARE @Employee TABLE
(
   FirstName nvarchar(50),
   LastName nvarchar(50)
)

INSERT INTO @Employee (FirstName,LastName)
VALUES ('Dana','Tasevska')

SELECT * FROM @Employee

--IF/ELSE
DECLARE @GENDER NVARCHAR(1)
SET @GENDER = 'M'

IF (@GENDER = 'M')
BEGIN

    SELECT *
	FROM dbo.Employees
	WHERE Gender = 'M'

END

ELSE
BEGIN
    
	SELECT *
	FROM dbo.Employees
	WHERE Gender = 'F'
	   
END
GO

--CASE
CREATE VIEW dbo.vv_BEsize
as
SELECT *,
CASE WHEN Size = 'Small' THEN '0-50'
     WHEN Size = 'Medium' THEN '51-100'
	 WHEN Size = 'Large' THEN '>100'
	 ELSE '' END as NumEmployees
FROM dbo.BusinessEntities


select * from dbo.vv_BEsize

--BUILD-IN Functions
SELECT FirstName,
       LastName,
	   REPLACE(FIRSTNAME, 'A' ,'X') as example_replace,
	   SUBSTRING(FIRSTNAME,1,3) AS substring_example,
	   LEFT(FIRSTNAME,3) as left_example,
	   RIGHT(FIRSTNAME,3) as right_example,
	   LEN(FIRSTNAME) as len_example,
	   CONCAT(FIRSTNAME , ' / ', LastName) AS concat_example,
	   getdate() as currentdatetime
FROM dbo.Employees
WHERE LEN(LastName)=7

--workshop
SELECT */*REVERSE(FirstName),**/
INTO #MaleEmployees
FROM dbo.Employees
WHERE GendeR = 'M' and 
--FirstName like 'A%'
--SUBSTRING(firstname,1,1)='A'
Left(firstname,1)='A'

select * from #MaleEmployees
--datetime build-in functions
select getdate()

declare @Today datetime
set @Today = getdate()

select @Today,
       dateadd(day,-7,@today) as dateaddday_example,
	   dateadd(month,5, @today) as dateaddmonth_example,
	   datediff(day, '2023-12-30', @Today) as datedoffday_example,
	   datediff(day, dateadd(month,7,@Today), @Today)

select convert(nvarchar(20), @today, 107)
go

--SCALAR FUNCTION
CREATE FUNCTION dbo.fn_EmployeeNames (@EmployeeID int)
RETURNS NVARCHAR(50)
AS
BEGIN 
     DECLARE @RESULT NVARCHAR(50)
	 SELECT @RESULT = FirstName + ' - ' + LastName
	 FROM DBO.Employees
	 WHERE ID = @EmployeeID
	 RETURN @RESULT
END

--call FUNCTION
--1--
SELECT [dbo].[fn_EmployeeNames](1)

--2--
SELECT *,[dbo].[fn_EmployeeNames](Id) as call_function
FROM dbo.Employees


