Select *
From Customers c
Cross Join Products p

Select Distinct be.*
From Orders o
Inner Join BusinessEntities be ON o.BusinessEntityId = be.Id
Order By be.Id

Select Distinct be.*
From Orders o
Right Join BusinessEntities be ON o.BusinessEntityId = be.Id
Where o.Id IS NULL
Order By be.Id

Select c.*
From Customers c
Left Join Orders o ON c.Id = o.CustomerId
Where o.Id IS NULL
Order By c.Id