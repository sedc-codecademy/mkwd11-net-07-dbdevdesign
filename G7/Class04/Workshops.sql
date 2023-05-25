--1
Select SUM(TotalPrice) as Total
From Orders
--2
Select BusinessEntityId, be.[Name], SUM(TotalPrice) as Total
From Orders o
INNER JOIN BusinessEntities be ON be.Id = o.BusinessEntityId
Group By BusinessEntityId, be.[Name]

Select BusinessEntityId, be.[Name], SUM(TotalPrice) as Total
From BusinessEntities be
INNER JOIN Orders o ON be.Id = o.BusinessEntityId
Group By o.BusinessEntityId, be.[Name]

--3
Select o.BusinessEntityId, be.[Name], SUM(TotalPrice) as Total
From Orders o
INNER JOIN BusinessEntities be ON be.Id = o.BusinessEntityId
Where o.CustomerId < 20
Group By BusinessEntityId, be.[Name]

--4
Select BusinessEntityId, be.[Name], MAX(TotalPrice) as MaxTotalPrice, AVG(TotalPrice) as AvgTotalPrice
From Orders o
INNER JOIN BusinessEntities be ON be.Id = o.BusinessEntityId
Group By BusinessEntityId, be.[Name]


--Bonus
Select o.BusinessEntityId, be.[Name], SUM(TotalPrice) as Total
From Orders o
INNER JOIN BusinessEntities be ON be.Id = o.BusinessEntityId
INNER JOIN Customers c ON c.Id = o.CustomerId
Where c.City = 'Skopje'
Group By BusinessEntityId, be.[Name]
-- Workshop 2
--1
Select BusinessEntityId, SUM(TotalPrice) as Total
From Orders o
Group By o.BusinessEntityId
Having SUM(TotalPrice) > 635558


--2
--Calculate the total amount per BusinessEntity on all orders in the system from 
--Customers with ID < 20 and filter only total orders less than 100000

Select BusinessEntityId, SUM(TotalPrice) as Total
From Orders
Where CustomerID < 20
Group by BusinessEntityId
Having SUM(TotalPrice) > 100000



--3
--Find the Maximal Order amount, and the Average Order amount per BusinessEntity 
--on all orders in the system. 
--Filter only records where Total order amount is more than 4x bigger than average
--*Filter only records where max order amount is more than 4x bigger than average


Select BusinessEntityId, MAX(TotalPrice) as MaxTotalPrice, AVG(TotalPrice) as AvgTotalPrice
From Orders
Group By BusinessEntityId
Having SUM(TotalPrice) > 4 * AVG(TotalPrice)
--*Having MAX(TotalPrice) > 4 * AVG(TotalPrice)