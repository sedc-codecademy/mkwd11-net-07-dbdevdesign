CREATE VIEW vv_OrdersEnhancedData
AS
Select o.Id as OrderId,
	   o.[Status] as OrderStatus,
	   o.OrderDate,
	   be.Id as BusinessEntityId,
	   be.[Name] as BusinessEntityName,
	   c.Id as CustomerId,
	   c.[Name] as CutomerName,
	   e.Id as EmployeeId,
	   e.FirstName + ' ' + e.LastName as FullName,
	   o.TotalPrice
From Orders o
INNER JOIN BusinessEntities be ON be.Id = o.BusinessEntityId
INNER JOIN Customers c ON c.Id = o.CustomerId
INNER JOIN Employees e ON e.Id = o.EmployeeId