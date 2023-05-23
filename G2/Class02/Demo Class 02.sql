USE SEDC1
SELECT *
FROM dbo.BusinessEntities
WHERE SIZE = 'Large' AND Zipcode=1000

SELECT *
FROM dbo.Customers
--WHERE [Name] like 'Vero%'
--WHERE [Name] like '%a'
WHERE [Name] like 'V%a'
      and City = 'Bitola'

SELECT *
FROM dbo.Employee
WHERE DateOfBirth = '1980.01.01'

--workshop
SELECT *
FROM dbo.Employees
--WHERE FirstName = 'Goran'
--WHERE LastName like 'S%'
--WHERE DateOfBirth > '01.01.1988'
--WHERE Gender = 'M'
--WHERE HireDate like '1998-01%'
WHERE LastName like 'S%' AND HireDate like '1990-03%'


select *
from dbo.Employees
--where 
--order by id desc
order by FirstName asc

--workshop order 
--1--

select *
from dbo.Employees
where FirstName = 'Aleksandar'
order by LastName desc

--3--
select *
from dbo.Employees
where Gender = 'M'
order by HireDate desc


--UNION
CREATE TABLE #a(
[Name] nvarchar(10)
)

INSERT INTO #a([Name]) VALUES ('Dana')
INSERT INTO #a([Name]) VALUES ('Angel')
INSERT INTO #a([Name]) VALUES ('Filip')

SELECT * FROM #a

CREATE TABLE #b([Name] nvarchar(20))
INSERT INTO #b([Name]) values ('Maja')
INSERT INTO #b([Name]) values ('Filip')
INSERT INTO #b([Name]) values ('Igor')

SELECT * FROM #b

--UNION
select [Name]
from #a
union
select [Name]
from #b

--UNION ALL
SELECT [Name]
FROM #A
UNION ALL
SELECT [Name]
FROM #b

--INTERSECT
SELECT [Name]
FROM #A
INTERSECT
SELECT [nAME]
FROM #b


--WORKSHOP COMBINING SETS
SELECT REGION
FROM DBO.BusinessEntities
INTERSECT
SELECT REGIONNAME
FROM DBO.Customers

--CONSTRAINT
--1--DEFAULT

CREATE TABLE dbo.Product_test
(
  [Id] int identity(1,1),
  [Code] nvarchar(50) NULL,
  [Name] nvarchar(50) NULL,
  [Description] nvarchar(50) NULL,
  [Weight] decimal (18,2) NULL,
  [Cost] decimal(18,2) NULL,
  [Price] decimal(18,2) NULL
)

INSERT INTO dbo.Product_test ([Name]) values ('Granola')

select *
from dbo.Product_test

ALTER TABLE dbo.Product_test
ADD CONSTRAINT DF_Product_test_weight
DEFAULT (100) FOR [Weight]


insert into dbo.Product_test ([Name]) values('Granola')

select *
from dbo.Product_test

insert into dbo.Product_test([Name],[Weight]) 
values ('Protein', 10)


--check constraint
ALTER TABLE dbo.Product_test
with check
ADD CONSTRAINT CH_Product_test_Price
CHECK (price>=0)

insert into dbo.Product_test ([Name], [Price])
values ('Zitobar',10)

select *
from dbo.Product_test

insert into dbo.Product_test([Name], [Price])
values ('dzem',-10)

--UNIQUE
ALTER TABLE dbo.Product_test
WITH CHECK
ADD CONSTRAINT UNQ_Product_test_Name
UNIQUE([Name])

update dbo.Product_test
set [Name] = 'Granola strawberry'
--select *
--from dbo.Product_test
where id = 1


select *
from dbo.Product_test