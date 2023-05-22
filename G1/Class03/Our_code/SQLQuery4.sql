DROP VIEW IF EXISTS vv_CustomerOrders
GO

CREATE VIEW vv_CustomerOrders
AS
SELECT CustomerId, SUM(TotalPrice) as Total
FROM dbo.Orders o
GROUP BY CustomerId
GO

ALTER VIEW vv_CustomerOrders
AS
SELECT c.Name as CustomerName, SUM(TotalPrice) as Total
FROM dbo.Orders o
join dbo.Customers c on c.Id = o.CustomerId
GROUP BY c.Name
--ORDER BY Total DESC
GO

SELECT * FROM vv_CustomerOrders
ORDER BY Total DESC
GO

DROP VIEW IF EXISTS vv_EmployeeOrders
GO

CREATE OR ALTER VIEW vv_EmployeeOrders
AS
SELECT e.FirstName +' ' + e.LastName as Employee, p.Name as ProductName, SUM(od.Quantity) as TotalQuantity
FROM dbo.Orders o
join dbo.Employees e on o.EmployeeId = e.Id
join dbo.OrderDetails od on o.Id = od.OrderId
join dbo.Products p on od.ProductId = p.Id
join dbo.BusinessEntities be on o.BusinessEntityId = be.Id
WHERE be.Region = 'Skopski'
GROUP BY e.FirstName +' ' + e.LastName, p.Name
GO

SELECT * FROM vv_EmployeeOrders
ORDER BY TotalQuantity 
GO