SELECT * FROM [Address]
RIGHT JOIN Employees
on [Address].EmployeeId = Employees.Id


SELECT * FROM Address
CROSS JOIN Employees

SELECT distinct b.Name FROM BusinessEntities as b
INNER JOIN Orders as o
on b.Id = o.BusinessEntityId

SELECT Distinct b.Name From Orders as o
INNER JOIN BusinessEntities as b
ON b.Id = o.BusinessEntityId

SELECT b.Name FROM BusinessEntities as b
LEFT JOIN Orders as o
on b.Id = o.BusinessEntityId
WHERE o.Id is null

SELECT b.Name from Orders as o
RIGHT JOIN BusinessEntities as b
on B.Id = o.BusinessEntityId
WHERE o.Id is null


SELECT * FROM Orders o
RIGHT JOIN Customers c
on c.Id = o.CustomerId
WHere o.Id is null

SELECT * FROM Products p
LEFT join OrderDetails od
on p.Id = od.ProductId
WHERE od.Id is null


