use SEDC1
--Creating Foreign Keys
insert into dbo.Orders (OrderDate, 
                        Status, 
						BusinessEntityId,
						CustomerId,
						EmployeeId,
						TotalPrice,
						Comment)
values('2023-05-20',0,7,1,1,1000,'test foreign key 1')

select *
from dbo.Orders
where BusinessEntityId = 100

select *
from dbo.BusinessEntities

UPDATE dbo.Orders
SET BusinessEntityId = 1
WHERE Comment = 'test foreign key' AND Id= 4201

ALTER TABLE dbo.Orders
ADD CONSTRAINT [FK_Orders_BusinessEntities]
FOREIGN KEY (BusinessEntityId) REFERENCES [dbo].[BusinessEntities](Id)

--JOIN TYPES

CREATE TABLE #tableA (idA int)

insert into #tableA (idA) values (1)

insert into #tableA (idA) values (2)

insert into #tableA (idA) values (3)

select *
from #tableA

CREATE TABLE #tableB (idB int)

insert into #tableB (idB) values (2)

insert into #tableB (idB) values (3)

insert into #tableB (idB) values (4)

select * from #tableB
--drop table #tableB


--INNER JOIN
--I--
SELECT a.idA, b.idB
FROM #tableA AS a
INNER JOIN #tableB as b ON a.idA = b.idB

--II--
SELECT #tableA.idA, #tableB.idB
FROM #tableA
INNER JOIN #tableB ON #tableA.idA = #tableB.idB

--LEFT JOIN
SELECT a.idA, b.idB
FROM #tableA a
LEFT JOIN #tableB b ON a.idA = b.idB

--RIGHT JOIN 
SELECT a.idA, b.idB
FROM #tableA a
RIGHT JOIN #tableB b on a.idA = b.idB

--FULL JOIN 
SELECT a.idA, b.idB
FROM #tableA a
FULL JOIN #tableB b ON a.idA = b.idB

--CROSS JOIN
SELECT *
FROM #tableA 
CROSS join #tableB


--WORKSHOP JOIN TYPES
--List all Business Entities that have any Order 

SELECT be.[Name], be.Region, od.OrderDate, od.TotalPrice
FROM dbo.BusinessEntities as be
INNER JOIN dbo.Orders as od ON be.Id = od.BusinessEntityId
WHERE be.Region = 'Bitolski'
ORDER BY od.TotalPrice desc

--List all Business Entities without orders
--I LEFT JOIN--

SELECT be.*,'-',od.*
FROM dbo.BusinessEntities be
LEFT JOIN dbo.Orders od ON be.Id=od.BusinessEntityId
WHERE od.ID is null

--II RIGHT JOIN --

SELECT be.*
FROM dbo.Orders od 
RIGHT JOIN dbo.BusinessEntities be ON be.Id=od.BusinessEntityId
WHERE od.ID is null

--FULL JOIN
SELECT be.*
FROM dbo.Orders od 
FULL JOIN dbo.BusinessEntities be ON be.Id=od.BusinessEntityId
WHERE od.ID is null

--List all possible combinations of Customer names and 
--Product names that can be ordered from specific customer 

SELECT c.Name CustomerName, p.Name  ProductName
FROM dbo.Customers c
CROSS JOIN dbo.Products p
