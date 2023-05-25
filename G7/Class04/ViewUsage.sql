Select *
From Orders

Select * 
From vv_OrdersEnhancedData


Select BusinessEntityId,o.BusinessEntityName, SUM(TotalPrice) as Total
From vv_OrdersEnhancedData o
Group By o.BusinessEntityId, o.BusinessEntityName
Having SUM(TotalPrice) > 635558
