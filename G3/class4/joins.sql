select * from Employees  e
inner join [Address] a
on e.Id = a.EmployeeId

select * from Orders o
inner join Customers c
on o.CustomerId = c.Id


select * from Employees

SELECT * FROM Orders o
inner join Employees e
on o.EmployeeId = e.Id
where e.FirstName = 'Aleksandar' 
and 
LastName = 'Stojanovski'

select * from [Address]

select * from Employees

select * from Orders o
inner join BusinessEntities b
on o.BusinessEntityId = b.Id
where Region = 'Skopski'

SELECT * FROM Customers c
LEFT JOIN Orders o
ON c.Id = o.CustomerId
WHERE o.Id is null

SELECT * FROM BusinessEntities b
LEFT JOIN Orders o
on b.Id = o.BusinessEntityId
WHERE o.Id is null

SELECT * FROM Orders o
RIGHT JOIN BusinessEntities b
on o.BusinessEntityId = b.Id
where o.Id is null

SELECT * FROM OrderDetails od
inner join Products p 
on p.Id = od.ProductId

SELECT * FROM Products p
left join OrderDetails od
on p.Id = od.ProductId
where  od.Id is null 


SELECT FirstName, COUNT(*) FROM Employees
WHERE FirstName like 'M%'
GROUP BY FirstName


SELECT CustomerId, SUM(TotalPrice) FROM Orders
GROUP BY CustomerId

SELECT c.[Name], SUM(TotalPrice) as TotalPrice From Orders o
inner join Customers c on o.CustomerId = c.Id
where c.id < 20
group by c.[Name]

SELECT 
	c.[Name], 
	Max(TotalPrice) as MaxTotalPrice, 
	Avg(TotalPrice) as AvgTotalPrice  
FROM 
	Orders o
inner join 
Customers c on o.CustomerId = c.Id
Group By c.[Name]
having AVG(TotalPrice) > 1500

SELECT p.[Name], COUNT(*) FROM Products p
INNER JOIN OrderDetails od
on p.Id = od.ProductId
group by p.[Name]
having COUNT(*) >= 3


SELECT 
	b.[Name], 
	Max(TotalPrice) MaxTotalPrice , 
	AVG(TotalPrice) AvgTotalPrice FROM Orders o
Inner join BusinessEntities b on b.Id = o.BusinessEntityId
Group By B.[Name]
HAVING SUM(TotalPrice) > AVG(TotalPrice) * 4
Order By AVG(TotalPrice) desc



