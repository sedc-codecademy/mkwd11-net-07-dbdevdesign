Create Procedure dbo.CreateOrder
(
	@BusinessEntityId int,
	@CustomerId int,
	@EmployeeId int
)
AS
BEGIN
	INSERT INTO [dbo].[Orders]
           ([OrderDate]
           ,[BusinessEntityId]
           ,[CustomerId]
           ,[EmployeeId])
     VALUES
           (GETDATE()
           ,@BusinessEntityId
           ,@CustomerId
           ,@EmployeeId)

	--Procedure should return the total number of orders in the system for the 
	--Customer from the new order (regardless the BusinessEntity)
	Select Count(*) as TotalOrdersForCustomer
	From Orders
	Where CustomerId = @CustomerId

	--Procedure should return second resultset with the total amount 
	--of all orders for the customer and business entity on input
	Select Sum(TotalPrice) as TotalOrdersPrice
	From Orders
	Where CustomerId = @CustomerId AND BusinessEntityId = @BusinessEntityId

END