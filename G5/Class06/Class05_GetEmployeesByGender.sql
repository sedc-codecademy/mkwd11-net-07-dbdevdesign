
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetEmployeesByGender
	-- Add the parameters for the stored procedure here
	@Gender NVARCHAR(1) = 'M',
	@GenderCount INT OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Employees
	WHERE Gender = @Gender

	SELECT @GenderCount = Count(*)
	FROM Employees
	WHERE Gender = @Gender
END
GO

DECLARE	@GenderCount int

EXEC  [dbo].[GetEmployeesByGender]
		@Gender = N'F',
		@GenderCount = @GenderCount OUTPUT

SELECT	@GenderCount as 'Count'

