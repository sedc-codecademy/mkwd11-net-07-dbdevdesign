USE SEDC

--Total Employees
SELECT COUNT(*) AS Total
FROM Employees

SELECT Gender, COUNT(*) AS Total
FROM Employees 
GROUP BY Gender

SELECT COUNT(Code)
FROM Products

SELECT COUNT(DISTINCT FirstName)
FROM Employees 

SELECT e.FirstName, COUNT(FirstName)
FROM Employees e
GROUP BY e.FirstName

SELECT SUM(Price) AS ProductsSum
FROM Products

SELECT MIN(Price) AS MinimalPrice
FROM Products

SELECT MAX(Price) AS MaximalPrice
FROM Products

SELECT MAX([Name]) AS LongestName
FROM Customers

SELECT AVG(Price)
FROM Products

SELECT STRING_AGG(FirstName, ', ') AS 'Employee Name'
FROM Employees