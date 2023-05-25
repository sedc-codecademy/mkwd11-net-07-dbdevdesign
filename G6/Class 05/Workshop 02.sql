CREATE PROCEDURE CreateOrderDetails
(
 @OrderId INT,
 @ProductId INT,
 @Quantity INT,
 @Price decimal(18,2)
)
AS
BEGIN

--1. Create new Order Details

SELECT *
FROM OrderDetails
Where OrderId = @OrderId

INSERT INTO OrderDetails(OrderId, ProductId, Quantity, Price)
VALUES(@OrderId, @ProductId, @Quantity, @Price)

SELECT *
FROM OrderDetails
Where OrderId = @OrderId

--2. Recalculate of total price for the given @OrderId
DECLARE @TotalPrice decimal(18,2)

SELECT @TotalPrice = SUM(Quantity * Price) 
FROM OrderDetails
Where OrderId = @OrderId

SELECT @TotalPrice as TotalPrice

UPDATE Orders
SET TotalPrice = @TotalPrice
WHERE Id = @OrderId

END



EXEC CreateOrderDetails
@OrderId = 51,
@ProductId = 1,
@Quantity = 3,
@Price = 100