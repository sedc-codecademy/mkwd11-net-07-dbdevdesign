--List all possible combinations of Customer names and Product names that can be ordered from a specific customer
SELECT c.Name as CustomerName, p.Name as ProductName
FROM dbo.Customers c
CROSS JOIN dbo.Products p
GO

--List all Business Entities that have any order
SELECT DISTINCT b.Name
FROM dbo.Orders o 
INNER JOIN dbo.BusinessEntities b on b.Id = o.BusinessEntityId
GO

SELECT DISTINCT c.Name
FROM dbo.Orders o 
INNER JOIN dbo.Customers c on c.Id = o.CustomerId
GO

--List all entities without orders
SELECT DISTINCT b.Name, o.BusinessEntityId
FROM dbo.BusinessEntities b 
LEFT JOIN dbo.Orders o on b.Id = o.BusinessEntityId
WHERE o.BusinessEntityId is NULL
GO

--List all Customers without orders (using Right Join)
SELECT c.*
FROM dbo.Orders o
RIGHT JOIN dbo.Customers c on o.CustomerId = c.Id
WHERE o.CustomerId is NULL
GO 

SELECT c.Name
FROM dbo.Customers c
LEFT JOIN dbo.Orders o on o.CustomerId = c.Id
WHERE o.CustomerId is NULL
GO

SELECT DISTINCT c.Name
FROM dbo.Customers c
LEFT JOIN dbo.Orders o on o.CustomerId = c.Id
GO