SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--Create new procedure called CreateOrderDetail
--Procedure should take the single price for item from Product table (Price column)
--Procedure should add details for specific order (new record for new Product/Quantity for specific order)
--When the order detail is inserted procedure should correct the TotalPrice column in the main table (dbo.order)
--Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity)
--Insert few order details for some orders


ALTER PROCEDURE CreateOrderDetail
	-- Add the parameters for the stored procedure here
	@OrderId BIGINT, 
	@ProductId  INT,
	@Quantity INT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--get the product price
	DECLARE @Price DECIMAL(18, 2), @TotalPrice DECIMAL(18, 2)

	SELECT @Price = Price
	FROM Products
	WHERE Id = @ProductId

   --Insert few order details for some orders
   INSERT INTO OrderDetails
   VALUES(@OrderId, @ProductId, @Quantity, @Price)

   --calcute the total price
	SELECT @TotalPrice = SUM(@Quantity * @Price)
	FROM OrderDetails
	WHERE OrderId = @OrderId

  -- correct the total price in orders
   UPDATE Orders
   SET TotalPrice = @TotalPrice
   WHERE Id = @OrderId

   --Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity)
   SELECT p.[Name], SUM(od.Quantity * od.Price) AS TotalPricePerProduct
   FROM OrderDetails od
	   INNER JOIN Products p
	   ON p.Id = od.ProductId
	WHERE od.OrderId = @OrderId
  GROUP BY p.[Name]

END
GO

EXEC CreateOrderDetail @OrderId = 4202, @ProductId = 5, @Quantity = 5
EXEC CreateOrderDetail @OrderId = 4202, @ProductId =4 , @Quantity = 3