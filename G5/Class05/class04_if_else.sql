USE SEDC

DECLARE @Name NVARCHAR(250)
SET @Name = 'A'
--SET @Name = 'Tijana'

IF(LEN(@Name) < 2)
	SELECT 'This name is too short'
ELSE
	SELECT @Name + ' is a suitable name'

-------------------------------------------------
DECLARE @Age INT
SET @Age = 24

IF(@Age > 120)
	SELECT 'ERROR' AS [Status]
ELSE
	SELECT 'SUCCESS' AS [Status]
