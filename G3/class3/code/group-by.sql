SELECT p.Name FROM Products p
LEFT join OrderDetails od
on p.Id = od.ProductId
WHERE od.Id is null

SELECT * FROM OrderDetails od
RIGHT JOIN Products p
on od.ProductId = p.Id 
WHERE od.Id is null

SELECT FirstName,LastName, Count(*) FROM Employees
WHERE FirstName LIke 'M%'
GROUP BY FirstName


SELECT COUNT(*) FROM Employees

SELECT CustomerId, SUM(TotalPrice) FROM Orders
GROUP BY CustomerId

SELECT BusinessEntityId, SUM(TotalPrice) As TotalPrice FROM Orders
Group By BusinessEntityId

SELECT b.Name, SUM(o.TotalPrice) as TotalPrice FROM Orders o
INNER JOIN BusinessEntities b
on b.Id = o.BusinessEntityId
WHERE CustomerId < 20
GROUP BY b.Name
Order By Sum(TotalPrice) desc

SELECT B.Name, MAX(TotalPrice) AS MaxPrice, AVG(TotalPrice) AvgPrice FROM Orders o
Inner join BusinessEntities b
on b.Id = o.BusinessEntityId
Group By b.Name


SELECT b.Name, SUM(o.TotalPrice) as TotalPrice FROM Orders o
INNER JOIN BusinessEntities b
on b.Id = o.BusinessEntityId
GROUP BY b.Name
HAVING Sum(TotalPrice) >= 631758
Order By Sum(TotalPrice) desc
