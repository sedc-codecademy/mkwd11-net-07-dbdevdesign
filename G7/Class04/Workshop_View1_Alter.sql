ALTER VIEW vv_CustomerOrders
AS
Select CustomerId, c.[Name], Sum(TotalPrice) as TotalPerCustomer
From Orders o
INNER JOIN Customers c ON c.Id = o.CustomerId
Group By CustomerId, c.[Name]
GO
