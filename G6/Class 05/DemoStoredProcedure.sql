ALTER PROCEDURE TestStoredProcedure 
(
   @First as INT = 0,
   @Second as INT = 1,
   @Third as  nvarchar(10) = 'Test'
)
AS
BEGIN
	PRINT 'FIRST'
	PRINT @First
	PRINT 'SECOND'
	PRINT @Second
	PRINT 'THIRD'
	PRINT @Third
END

--default values for parameters
EXEC TestStoredProcedure
EXEC TestStoredProcedure
EXEC TestStoredProcedure

--sending values for params
EXEC TestStoredProcedure @First = 5
EXEC TestStoredProcedure @First = 5, @Third = 'Hello'
EXEC TestStoredProcedure 2, 3, 'Bye'


DECLARE @ReturnValue INT

EXEC @ReturnValue = TestStoredProcedure

SELECT @ReturnValue

