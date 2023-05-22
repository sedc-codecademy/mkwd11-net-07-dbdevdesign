SELECT b.Name as BusinessEntityName, SUM(o.TotalPrice) as Total
FROM dbo.Orders o 
join dbo.BusinessEntities b on b.Id = o.BusinessEntityId
GROUP BY b.Name
HAVING SUM(TotalPrice) > 635558
GO

SELECT b.Name as BusinessEntityName, SUM(o.TotalPrice) as TOTALLL
FROM dbo.Orders o
join dbo.BusinessEntities b on o.BusinessEntityId = b.Id
WHERE CustomerId < 20
GROUP BY b.Name
HAVING SUM(o.TotalPrice) < 100000
GO

SELECT b.Name BusinessEntity, MAX(TotalPrice) as Total, AVG(TotalPrice) as Average
FROM dbo.Orders o
join dbo.BusinessEntities b on o.BusinessEntityId = b.Id
GROUP BY b.Name
HAVING MAX(TotalPrice) > 4.3*AVG(TotalPrice)
GO

SELECT o.BusinessEntityId, b.Name, MAX(TotalPrice) as Total, AVG(TotalPrice) as Average
FROM dbo.Orders o
join dbo.BusinessEntities b on o.BusinessEntityId = b.Id
GROUP BY o.BusinessEntityId, b.Name
HAVING MAX(TotalPrice) > 4.3*AVG(TotalPrice)
GO