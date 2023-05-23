Select MIN(tempTable.Total),
      AVG(tempTable.Total)
From (
Select o.BusinessEntityId, 
		be.[Name], 
		Count(*) as TotalOrders, 
		SUM(TotalPrice) as Total
From Orders o
Inner Join BusinessEntities be ON o.BusinessEntityId = be.Id
Group By o.BusinessEntityId, be.[Name]
) as tempTable