--Calculate the total amount on all orders in the system
SELECT SUM(TotalPrice) AS Total
FROM dbo.Orders
GO

--Calculate the total amount per BusinessEntity on all orders in the system
SELECT b.Name, SUM(o.TotalPrice) as Total
FROM dbo.Orders o
join dbo.BusinessEntities b on o.BusinessEntityId = b.Id
GROUP BY b.Name
GO

SELECT b.Region, SUM(o.TotalPrice) as Total
FROM dbo.Orders o
join dbo.BusinessEntities b on o.BusinessEntityId = b.Id
GROUP BY b.Region
GO

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20
SELECT b.Name, SUM(o.TotalPrice) as Total
FROM dbo.Orders o
join dbo.BusinessEntities b on o.BusinessEntityId = b.Id
WHERE o.CustomerId < 20
GROUP BY b.Name
ORDER BY Total DESC
--ORDER BY SUM(o.TotalPrice) DESC we can do it like this also
GO

--Find the Maximun Order amount and the Average Order amount per BusinessEntity on all orders in the system
SELECT b.Region, b.Name as Business_Entity_Name, c.Name as Customer_Name, MIN(TotalPrice) as MinOrder, MAX(TotalPrice) as Total, AVG(TotalPrice) as Average
FROM dbo.Orders o
join dbo.BusinessEntities b on o.BusinessEntityId = b.Id
join dbo.Customers c on o.CustomerId = c.Id
GROUP BY b.Region, b.Name, c.Name
GO

SELECT BusinessEntityId, SUM(TotalPrice) as Total
FROM dbo.Orders
WHERE CustomerId < 20
GROUP BY BusinessEntityId
HAVING SUM(TotalPrice) > 628920