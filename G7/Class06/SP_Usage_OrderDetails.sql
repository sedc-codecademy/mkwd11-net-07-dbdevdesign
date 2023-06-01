Select * From Employees -- Valentina Stojanovski Id = 6
Select * From Customers --Kam bitola Id = 4
Select * From BusinessEntities --Vitalia Bitola Id = 2

--EXEC dbo.CreateOrder 
--@BusinessEntityId = 2,
--@CustomerId = 4,
--@EmployeeId = 6

Select * From dbo.Orders --Id = 4203
Select * From dbo.Products --Green Teas Id = 28; Sport Supplements = 36
Select * From dbo.OrderDetails Where OrderId = 4203

--Buying Green Teas
--EXEC dbo.CreateOrderDetail
--	@OrderId = 4203,
--	@ProductId = 28,
--	@Quantity = 5

--Buying Sport Supplements
EXEC dbo.CreateOrderDetail
	@OrderId = 4203,
	@ProductId = 36,
	@Quantity = 10