Select * From BusinessEntity
Select * From Customer

Select [Name], [Region]
From BusinessEntity
Where Region = 'Skopski'
UNION
Select [Name], [RegionName]
From Customer
Where [RegionName] = 'Ohridski'

Select * From Customer Where [Name] = 'Zito Radovis'

Select [Name], [Region]
From BusinessEntity
Where Region = 'Skopski'
UNION
Select [Name], [RegionName]
From Customer
Where [RegionName] = 'Ohridski'

Select [Name], [Region]
From BusinessEntity
Where Region = 'Skopski'
UNION ALL
Select [Name], [RegionName]
From Customer
Where [RegionName] = 'Ohridski'

--INTERSECT
Select Region From BusinessEntity
Intersect
Select RegionName From Customer

