USE SEDC

Select * From vv_OrdersEnhancedData

--Select CustomerId, Sum(TotalPrice) as TotalPerCustomer
--From Orders
--Group By CustomerId
--Order By CustomerId

--Select *
--From vv_CustomerOrders
--Order By TotalPerCustomer DESC

--Select c.[Name], Sum(TotalPrice) as TotalPerCustomer
--From Orders o
--INNER JOIN Customers c ON c.Id = o.CustomerId
--Group By CustomerId, c.[Name]

Select * From vv_EmployeeOrders