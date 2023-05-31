SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

--There should be a function that concatenates First and Last Name of a user

CREATE FUNCTION UserFullName (
-- Add the parameters for the function here
@Firstname NVARCHAR(100),
@Lastname NVARCHAR(100)
)

RETURNS NVARCHAR(201)
AS
BEGIN

	--return a + b //in c#
	-- Return the result of the function
	RETURN @Firstname + ' ' + @Lastname 

END
GO

SELECT dbo.UserFullName(Firstname, Lastname)
FROM Users
GO

SELECT dbo.UserFullName('Tijana', 'Stojanovska')
GO