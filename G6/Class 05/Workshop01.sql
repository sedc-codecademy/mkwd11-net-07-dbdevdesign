--Create new procedure called CreateOrder
--Procedure should create only Order header info (not Order details) 

-- Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity)
-- Procedure should return second resultset with the total amount (sum of total price) of all orders for the customer and business entity on input

CREATE PROCEDURE CreateOrder
(
	@CustomerId INT,
	@EmployeeId INT,
	@BusinessEntityId INT,
	@Status Smallint,
	@OrderDate Date,
	@OrdersCount INT OUT,
	@OrdersAmount Decimal(18,2) OUT
)
AS
BEGIN

--total number of orders in the system for the Customer from the new order
SELECT @OrdersCount = COUNT(*)
From Orders
WHERE CustomerId = @CustomerId

-- total amount (sum of total price) of all orders for the customer and business entity on input
SELECT @OrdersAmount = SUM(TotalPrice)
FROM Orders
WHERE CustomerId = @CustomerId AND BusinessEntityId = @BusinessEntityId

--create new order
INSERT INTO Orders(CustomerId, EmployeeId, BusinessEntityId, [Status], OrderDate)
VALUES(@CustomerId, @EmployeeId, @BusinessEntityId, @Status, @OrderDate)

END

DECLARE @Count INT
DECLARE @Amount INT

EXEC CreateOrder
@CustomerId = 4,
@EmployeeId = 1,
@BusinessEntityId = 2,
@Status = 1,
@OrderDate = '2023-05-20',
@OrdersCount = @Count OUT,
@OrdersAmount = @Amount OUT

SELECT @Count, @Amount
