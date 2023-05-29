SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--Create new procedure called CreateOrder
-- Insert few orders in the system
--Procedure should create only Order header info (not Order details) 
--Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity)
--Procedure should return second resultset with the total amount of all orders for the customer and business entity on input


CREATE PROCEDURE CreateOrder
	-- Add the parameters for the stored procedure here
	@OrderDate DATE,
	@Status SMALLINT,
	@BusinessEntityId INT,
	@CustomerId INT,
	@EmployeeId INT,
	@TotalPrice DECIMAL(18, 2),
	@Comment NVARCHAR(MAX) NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert few orders in the system
	INSERT INTO Orders
	VALUES (@OrderDate, @Status, @BusinessEntityId, @CustomerId, @EmployeeId, @TotalPrice, @Comment)

	--Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity)
	SELECT COUNT(*) AS TotalOrdersForCustomer
	FROM Orders
	WHERE CustomerId = @CustomerId

	--Procedure should return second resultset with the total amount of all orders for the customer and business entity on input
	SELECT SUM(TotalPrice) AS TotalOrderPrice
	FROM Orders
    WHERE CustomerId = @CustomerId AND BusinessEntityId = @BusinessEntityId

END
GO

EXEC CreateOrder @OrderDate = '11.11.2023', @Status = 0, @BusinessEntityId = 5, 
@CustomerId = 7, @EmployeeId = 10, @TotalPrice = 100, @Comment = ''
GO