/*Procedure should take the single price for item from Product table (Price column)
Procedure should add details for specific order 
	(new record for new Product/Quantity for specific order)
When the order detail is inserted procedure should correct the TotalPrice 
	column in the main table (dbo.order)
Output from this procedure should be resultset with order details in a form of pairs: 
	ProductName and TotalPrice per product (Price*Quantity)*/

	--Order = 8.5e
	--Coca cola * 2 = 4e
	--Beer * 3 = 4.5e

CREATE PROCEDURE dbo.CreateOrderDetail (
@OrderId int,
@ProductId int,
@Quantity int
)
AS
BEGIN
	DECLARE @Price decimal(18,2),
			@TotalPrice decimal(18,2)

	Select @Price = p.Price * @Quantity
	From dbo.Products p
	Where p.Id = @ProductId

	INSERT INTO dbo.OrderDetails(OrderId, ProductId, Quantity, Price)
	VALUES (@OrderId, @ProductId, @Quantity, @Price)

	Select @TotalPrice = SUM(od.Price)
	From dbo.OrderDetails od
	Where od.OrderId = @OrderId

	Update dbo.Orders
	Set TotalPrice = @TotalPrice
	Where Id = @OrderId

	Select [dbo].[fn_PrintBill] (@OrderId)
END


--Coca Cola ID = 5 Price = 2e
--Beer ID = 7 Price 1.5e

------------------Order 10 TotalPrice = 10e---------------------
--OrderDetails Order = 10, Product = 5, Quantity = 2, Price = 4e
--OrderDetails Order = 10, PRoduct = 7, Quantity = 4, Price = 6e

------------------Order 12 TotalPrice = 30e--------------------
--OrderDetails Order = 12, Product = 10, Quantity = 2, Price = 14e
--OrderDetails Order = 12, PRoduct = 11, Quantity = 4, Price = 16e

--EXEC => 10, 5, 2
--EXEC => 10, 7, 4
