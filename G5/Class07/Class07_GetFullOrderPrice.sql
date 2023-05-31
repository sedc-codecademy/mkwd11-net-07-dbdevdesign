SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--There should be a stored procedure that when provided an Order Id,
--can return the full price of a whole order ( Delivery + All Pizza + All Toppings) 

CREATE PROCEDURE GetFullOrderPrice
	-- Add the parameters for the stored procedure here
	@OrderId INT
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @DeliveriesPrice DECIMAL(8,2), @PizzasPrice DECIMAL(8,2), @ToppingsPrice DECIMAL(8,2)

	--@PizzasPrice + @ToppingsPrice + (Select Price from orders) you cannot use select to sum the prices

	SELECT @PizzasPrice = SUM(p.Price),
	@ToppingsPrice = SUM(t.Price)
	FROM Orders o
		INNER JOIN Pizzas p
			ON p.OrderId = o.Id
	    INNER JOIN PizzaToppings pt
			ON pt.PizzaId = p.Id
		INNER JOIN Toppings t
			ON pt.ToppingId = t.Id
	WHERE o.Id = @OrderId

	SELECT @DeliveriesPrice = Price 
	FROM Orders o
	WHERE o.Id = @OrderId
	
	
	SELECT @OrderId AS OrderId, @DeliveriesPrice AS DeliveriesPrice, @ToppingsPrice AS ToppingsPrice,
	@PizzasPrice AS PizzasPrice, SUM(@PizzasPrice + @DeliveriesPrice + @ToppingsPrice) AS FullPrice

END
GO


EXEC GetFullOrderPrice @OrderId = 5

select *
from Orders