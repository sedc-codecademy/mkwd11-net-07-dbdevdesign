--Create new view (vv_EmployeeOrders) that will List all Employees (FirstName and LastName) , 
--Product name and total quantity sold 

Create View vv_EmployeeOrders
AS
Select e.FirstName + ' ' + e.LastName as FullName,
		p.[Name] as ProductName,
		SUM(od.Quantity) as TotalQuantity
From Orders o
INNER JOIN OrderDetails od ON o.Id = od.OrderId
INNER JOIN Employees e ON e.Id = o.EmployeeId
INNER JOIN Products p ON p.Id = od.ProductId
GROUP BY p.[Name], e.FirstName, e.LastName
GO