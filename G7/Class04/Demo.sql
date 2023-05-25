Select Count(*)
From Orders
Where BusinessEntityId = 2


Select o.BusinessEntityId, be.[Name] as BusinessEntity, Count(*) as OrderCount
From Orders o
Inner Join BusinessEntities be ON o.BusinessEntityId = be.Id
Group By o.BusinessEntityId, be.[Name]

Select Gender, Count(*) as Total
From Employees
Group By Gender

Select Distinct(Gender)
From Employees

Select * From Employees

Select Gender, Count(*), DATEADD(DAY, AVG(DATEDIFF(DAY, '1900-01-01', DateOfBirth)), '1900-01-01') AS [AverageDate]
From Employees
Group By Gender

-- 1980-02-01 - 1900-01-01 = 29,238
-- 1980-03-01 - 1900-01-01 = 29,267
-- finds average out of all date diff. (29,253) => 1900-01-01 + 29,253 days

--Update Orders Set TotalPrice = 10000 Where Id = 1001

Select o.BusinessEntityId, 
		be.[Name], 
		Count(*) as TotalOrders, 
		SUM(TotalPrice) as Total, 
		MAX(TotalPrice) as MaxTotalPricePerOrder, 
		MIN(TotalPrice) as MinTotalPricePerOrder,
		AVG(TotalPrice) as AvgTotalPrice,
		--STRING_AGG(c.[Name], ', ') as CustomersName
From Orders o
Inner Join BusinessEntities be ON o.BusinessEntityId = be.Id
Inner Join Customers c ON c.Id = o.CustomerId
Group By o.BusinessEntityId, be.[Name]
Order By Total DESC

Select AVG(TotalPrice)
From Orders

Select STRING_AGG(FirstName + ' ' + LastName, ', ') as [All Name]
From Employees

Select FirstName
From Employees

--Having
Select BusinessEntityId, be.[Name], SUM(TotalPrice) as Total
From BusinessEntities be
INNER JOIN Orders o ON be.Id = o.BusinessEntityId
Group By o.BusinessEntityId, be.[Name]
Having SUM(TotalPrice) > 700000 AND
		be.[Name] like '%Skopje%'
