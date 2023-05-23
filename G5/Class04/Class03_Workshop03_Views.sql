USE SEDC
GO

--Create new view (vv_CustomerOrders) that will List all CustomerIds and sum of total Orders per customer
CREATE VIEW vv_CustomerOrders 
AS
SELECT CustomerId, SUM(TotalPrice) AS Total
FROM Orders o
GROUP BY CustomerId
GO

SELECT * 
FROM vv_CustomerOrders
GO

--Change the view to show Customer Names instead of CustomerId
ALTER VIEW vv_CustomerOrders 
AS
SELECT c.[Name], SUM(TotalPrice) AS Total
FROM Orders o
INNER JOIN Customers c
ON o.CustomerId = c.Id
GROUP BY c.[Name]
GO

SELECT * 
FROM vv_CustomerOrders
GO

--Change the view to show the results ordered by the customer with biggest total price
ALTER VIEW vv_CustomerOrders 
AS
SELECT  c.[Name], SUM(TotalPrice) AS Total
--SELECT TOP(100000) c.[Name], SUM(TotalPrice) AS Total
FROM Orders o
INNER JOIN Customers c
ON o.CustomerId = c.Id
GROUP BY c.[Name]
--ORDER BY SUM(TotalPrice) DESC         --if we have order by, we need to use top
GO

SELECT * 
FROM vv_CustomerOrders
ORDER BY Total DESC
GO


--Create new view (vv_EmployeeOrders) that will List all Employees (FirstName and LastName) , Product name and total quantity sold 
CREATE VIEW vv_EmployeeOrders
AS
SELECT e.FirstName + ' ' + e.LastName AS EmployeeFullName, p.[Name], SUM(od.Quantity) AS TotalQuantity
FROM Orders o
INNER JOIN Employees e
ON e.Id = o.EmployeeId
INNER JOIN OrderDetails od
ON od.OrderId = o.Id
INNER JOIN Products p
ON p.Id = od.ProductId
GROUP BY e.FirstName + ' ' + e.LastName, p.[Name]
GO

SELECT *
FROM vv_EmployeeOrders
GO

--Alter the view to show only sales from Business entities belonging to region 'Skopski' and TotalQuantity is bigger than 2
ALTER VIEW vv_EmployeeOrders
AS
SELECT e.FirstName + ' ' + e.LastName AS EmployeeFullName, p.[Name], SUM(od.Quantity) AS TotalQuantity, be.Region
FROM Orders o
INNER JOIN Employees e
ON e.Id = o.EmployeeId
INNER JOIN OrderDetails od
ON od.OrderId = o.Id
INNER JOIN Products p
ON p.Id = od.ProductId
INNER JOIN BusinessEntities be
ON o.BusinessEntityId = be.Id
WHERE be.Region = 'Skopski'
GROUP BY e.FirstName + ' ' + e.LastName, p.[Name], be.Region
HAVING SUM(Quantity) > 2
--HAVING be.Region = 'Skopski' --you can use having, but in this case 'where' is more practical, because we don't need the grouped result to filter by region
GO
