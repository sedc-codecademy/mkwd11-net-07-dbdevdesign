Create View vv_CustomerOrders
As
Select CustomerId, Sum(TotalPrice) as TotalPerCustomer
From Orders
Group By CustomerId
Go