USE SEDC

SELECT *
FROM Employees
WHERE FirstName = 'Goran'

SELECT *
FROM Employees
WHERE LastName LIKE 'S%'

SELECT *
FROM Employees
WHERE DateOFBirth > '01.01.1988'

SELECT *
FROM Employees
WHERE Gender LIKE 'M'

SELECT *
FROM Employees
WHERE HireDate >= '01.01.1998' AND HireDate < '01.02.1998'

SELECT *
FROM Employees
WHERE LastName LIKE 'M%' AND HireDate >= '01.01.2000' AND HireDate < '01.02.2000'