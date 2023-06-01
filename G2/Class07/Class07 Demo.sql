ALTER PROCEDURE dbo.InsertOrders (
@OrderDate date,
@BusinessEntityID int,
@CustomerID int,
@EmployeeID int,
@Comment nvarchar(max)
)
AS
BEGIN
     /*comment about the SP*/
	 BEGIN TRY

	     INSERT INTO dbo.Orders (OrderDate, 
		                         BusinessEntityId, 
								 CustomerId,
								 EmployeeId,
								 Comment
								 )

		 VALUES (@OrderDate ,
				 @BusinessEntityID ,
				 @CustomerID ,
				 @EmployeeID ,
				 @Comment )

		 PRINT 'Successfull insert'

	 END TRY

	 BEGIN CATCH

	     SELECT ERROR_LINE() as err_line, 
		        ERROR_MESSAGE() as err_msg, 
				ERROR_NUMBER() as err_number, 
				ERROR_PROCEDURE() as err_sp, 
				ERROR_SEVERITY() as err_severity,
				ERROR_STATE() as err_state

	 END CATCH



END
GO

--CALL---throw error
EXEC dbo.InsertOrders '2023-06-01', 100, 1, 1, 'test error handeling'

--CALL--SUCCESSFULL
EXEC dbo.InsertOrders '2023-06-01', 7, 1, 1, 'test error handeling'


select *
from dbo.BusinessEntities

SELECT * 
FROM DBO.OrderS
WHERE OrderDate = '2023-06-01'