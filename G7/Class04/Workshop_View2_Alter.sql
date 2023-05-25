--Alter the view to show only sales from Business entities belonging to region 'Skopski'

ALTER VIEW vv_EmployeeOrders
AS
Select  e.FirstName + ' ' + e.LastName as FullName,
		p.[Name] as ProductName,
		SUM(od.Quantity) as TotalQuantity
From Orders o
INNER JOIN OrderDetails od ON o.Id = od.OrderId
INNER JOIN Employees e ON e.Id = o.EmployeeId
INNER JOIN Products p ON p.Id = od.ProductId
INNER JOIN BusinessEntities be ON be.Id = o.BusinessEntityId
WHERE be.Region = 'Skopski'
GROUP BY p.[Name], e.FirstName, e.LastName
GO