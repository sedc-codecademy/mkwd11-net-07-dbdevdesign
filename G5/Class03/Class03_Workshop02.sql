USE SEDC

--Calculate the total amount per BusinessEntity on all orders in the system and filter only total orders greater than 635558
SELECT be.[Name], SUM(TotalPrice) AS Total
FROM BusinessEntities be
INNER JOIN Orders o
ON o.BusinessEntityId = be.Id
GROUP BY be.[Name]
HAVING SUM(TotalPrice) > 635558

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20 
--and filter only total orders less than 178000
SELECT be.[Name], SUM(TotalPrice) AS Total
FROM BusinessEntities be
INNER JOIN Orders o
ON o.BusinessEntityId = be.Id
WHERE CustomerId < 20
GROUP BY be.[Name]
HAVING SUM(TotalPrice) < 178000

--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system. 
--Filter only records where Total order amount is more than 4x bigger than average
SELECT be.[Name], SUM(TotalPrice) AS Total, MAX(TotalPrice) AS MaximalOrderAmount, AVG(TotalPrice) AS AverageOrderAmount
FROM BusinessEntities be
INNER JOIN Orders o
ON o.BusinessEntityId = be.Id
GROUP BY be.[Name]
HAVING SUM(TotalPrice) > 4*AVG(TotalPrice)