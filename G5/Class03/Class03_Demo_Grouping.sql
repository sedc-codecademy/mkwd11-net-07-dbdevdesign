USE SEDC

SELECT BusinessEntityId, SUM(TotalPrice) as Total
FROM [Orders]
WHERE CustomerId < 20 
GROUP BY BusinessEntityId
HAVING SUM(TotalPrice) > 100

SELECT Size, COUNT(*) AS [Count]
FROM BusinessEntities
GROUP BY Size
HAVING Size <> 'Medium'

SELECT [Name], Code, COUNT(*) AS ProductCount
FROM Products
GROUP BY [Name], Code
HAVING [Name] LIKE '%W%'
