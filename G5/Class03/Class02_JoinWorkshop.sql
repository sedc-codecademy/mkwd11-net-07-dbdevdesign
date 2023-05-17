USE SEDC

--List all possible combinations of Customer names and Product names that can be ordered from specific customer 
SELECT c.[Name] AS CustomerName, p.[Name] AS ProductName  --customerName & productName are the names of the columns shown in the result
FROM Customers c --c is the short name (alias) for customers table
CROSS JOIN Products p
ORDER BY c.[Name]

--List all Business Entities that have any Order 
SELECT DISTINCT be.[Name] --filter out duplicate names
FROM BusinessEntities be
INNER JOIN Orders o
ON o.BusinessEntityId = be.Id

--List all Entities without orders
SELECT DISTINCT be.[Name], o.BusinessEntityId
FROM BusinessEntities be
LEFT OUTER JOIN Orders o
ON o.BusinessEntityId = be.Id
WHERE o.BusinessEntityId IS NULL

--List all Customers without orders - LEFT OUTER JOIN
SELECT DISTINCT c.[Name], o.Id
FROM Customers c
LEFT OUTER JOIN Orders o 
ON o.CustomerId = c.Id
WHERE o.CustomerId IS NULL

--List all Customers without orders - RIGHT OUTER JOIN
SELECT DISTINCT c.[Name], o.Id, c.Id
FROM Orders o
RIGHT OUTER JOIN Customers c
ON o.CustomerId = c.Id
WHERE o.CustomerId IS NULL

SELECT *
FROM Orders
WHERE BusinessEntityId = 23