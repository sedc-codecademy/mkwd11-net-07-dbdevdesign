USE SEDC

SELECT *
FROM Employees
WHERE FirstName = 'Aleksandar'
ORDER BY LastName ASC

SELECT *
FROM Employees
ORDER BY FirstName 

SELECT *
FROM Employees
WHERE Gender = 'M'
ORDER BY HireDate DESC