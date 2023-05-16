USE SEDC

SELECT [Name]
FROM BusinessEntities
UNION 
SELECT [Name]
FROM Customers

SELECT [Name]
FROM BusinessEntities
UNION ALL
SELECT [Name]
FROM Customers

SELECT *
FROM Employees
WHERE FirstName = 'Aleksandar'
INTERSECT
SELECT *
FROM Employees
WHERE LastName = 'Nikolovski'

SELECT Region
FROM BusinessEntities
INTERSECT
SELECT Region
FROM Customers



