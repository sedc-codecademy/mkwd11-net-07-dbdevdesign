CREATE OR ALTER PROCEDURE CreateOrder(
 @orderDate datetime2,
 @status smallint,
 @businessEntityId int,
 @customerId int,
 @employeeId int,
 @totalPrice decimal(18,2),
 @comment nvarchar(MAX)
)
AS
BEGIN
	INSERT INTO Orders(
		[OrderDate],
		[Status],
		[BusinessEntityId],
		[CustomerId],
		[EmployeeId],
		[TotalPrice],
		[Comment]
	)
	VALUES (
		@orderDate,
		@status,
		@businessEntityId,
		@customerId,
		@employeeId,
		@totalPrice,
		@comment
	);
	SELECT COUNT(*) FROM Orders
	WHERE CustomerId = @customerId;

	SELECT SUM(TotalPrice) FROM Orders
	WHERE CustomerId = @customerId and BusinessEntityId = @businessEntityId;
END
GO
DECLARE @now datetime2;
SET @now = GETDATE();
EXEC CreateOrder
	@orderDate = @now,
	@status = 1,
	@businessEntityId = 1,
	@customerId = 1,
	@employeeId = 1,
	@totalPrice = 100,
	@comment = 'great'


DECLARE @price decimal(18,2)

SELECT @price = Price FROM Products
WHERE Id = 1
SELECT @price
go
CREATE OR ALTER PROCEDURE createOrderDetails(@orderId bigint, @productId int, @quantity int)
as
begin
	SELECT TotalPrice FROM Orders where ID = @orderId

	-- will store price of a single product based on product id parmetar
	declare @price decimal(18,2);
	select @price = Price from Products
	where Id = @productId -- zemi cena za ovoj id

	SELECT @price as ProductPrice;

	-- insert
	INSERT INTO OrderDetails([OrderId], ProductId, [Quantity], [Price])
	VALUES(@orderId, @productId, @quantity, @price);

	DECLARE @totalPrice decimal(18,2);
	-- recalculate total price
	SELECT @totalPrice = SUM(Price * Quantity) FROM OrderDetails
	WHERE OrderId = @orderId
	-- update total price
	UPDATE [Orders]
	SET TotalPrice = @totalPrice
	WHERE Id = @orderId
	SELECT TotalPrice FROM Orders where ID = @orderId
end
go


exec createOrderDetails
	@orderId = 1,
	@productId = 1,
	@quantity = 2