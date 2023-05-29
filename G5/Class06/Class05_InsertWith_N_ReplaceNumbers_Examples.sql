SELECT TotalPrice, 
   REPLACE(TotalPrice, '1', '2') AS ReplaceFunction
FROM dbo.Orders

SELECT TotalPrice
FROM dbo.Orders

SELECT  e.FirstName + ' ' + N'' + e.LastName + '' 
FROM dbo.Employees e

INSERT INTO Employees 
VALUES (N'??????', N'???????????', '11-11-1999', 'F', '01.11.2019', NULL)
