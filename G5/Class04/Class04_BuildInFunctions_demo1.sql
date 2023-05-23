USE SEDC
GO

SELECT FirstName, 
   LEFT(FirstName,3) AS LeftFunction, 
   RIGHT(FirstName,3) AS RightFunction, 
   LEN(FirstName) AS LenFunction,
   SUBSTRING(FirstName,1,4) AS SubstringFunction,
   REPLACE(FirstName,'Ale','X-') AS ReplaceFunction
FROM dbo.Employees

