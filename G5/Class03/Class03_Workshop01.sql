USE SEDC

--Calculate the total amount on all orders in the system
SELECT SUM(TotalPrice) AS Total
FROM Orders

--Calculate the total amount per BusinessEntity on all orders in the system
SELECT be.[Name], SUM (TotalPrice) AS Total
FROM Orders o
INNER JOIN BusinessEntities be
ON be.Id = o.BusinessEntityId
GROUP BY be.[Name]

--Calculate the total amount per BusinessEntity on all orders in the system with LEFT OUTER JOIN
SELECT be.[Name], SUM (o.TotalPrice) AS Total
FROM BusinessEntities be
LEFT OUTER JOIN Orders o
ON be.Id = o.BusinessEntityId
WHERE o.BusinessEntityId IS NOT NULL 
GROUP BY be.[Name]

--Calculate the total amount per BusinessEntity on all orders in the system with RIGHT OUTER JOIN
SELECT be.[Name], SUM (o.TotalPrice) AS Total
FROM Orders o
RIGHT OUTER JOIN BusinessEntities be
ON be.Id = o.BusinessEntityId
WHERE o.BusinessEntityId IS NOT NULL 
GROUP BY be.[Name]

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 50
SELECT be.[Name], SUM (TotalPrice) AS Total, o.CustomerId
FROM Orders o
INNER JOIN BusinessEntities be
ON be.Id = o.BusinessEntityId
WHERE CustomerId < 50
GROUP BY be.[Name], o.CustomerId

--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system
SELECT be.[Name], MAX (TotalPrice) AS MaximalOrderPrice, AVG(TotalPrice) AS AverageOrderPrice
FROM Orders o
INNER JOIN BusinessEntities be
ON be.Id = o.BusinessEntityId
GROUP BY be.[Name]