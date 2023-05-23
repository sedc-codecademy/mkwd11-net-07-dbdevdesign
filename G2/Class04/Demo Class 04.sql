SELECT c.Name as CustomerName, od.ProductId, SUM(od.Quantity) as SUMQuantity
FROM dbo.Customers as c
INNER JOIN dbo.Orders as o ON c.id = o.CustomerId
INNER JOIN dbo.OrderDetails as od ON o.id = od.OrderId
WHERE c.Name LIKE '%Bitola' and ProductId = 1
GROUP BY c.Name, od.ProductId
ORDER BY 1,2


--SELECT COUNT(id)
--FROM Customers


--WORKSHOP 1
--Calculate the total amount on all orders in the system

select count(o.totalprice) as totalamountoforders,
       min(o.totalprice) as minprice,
	   max(o.totalprice) as maxprice,
	   avg(o.totalprice) as avgprice,
	   sum(o.totalprice) as sumprice
--select min(o.totalprice), count(o.businessentityid)
from dbo.Orders as o


--Calculate the total amount per BusinessEntity on all orders in the system

select be.name, count(o.id), avg(totalprice)
from dbo.Orders o
inner join dbo.BusinessEntities as be on be.id = o.BusinessEntityId
where (CustomerId<20)
group by be.name
order by 1

--HAVING

SELECT c.Name as CustomerName, od.ProductId, SUM(od.Quantity) as SUMQuantity
FROM dbo.Customers as c
INNER JOIN dbo.Orders as o ON c.id = o.CustomerId
INNER JOIN dbo.OrderDetails as od ON o.id = od.OrderId
--WHERE c.Name LIKE '%Bitola' and ProductId = 1
GROUP BY c.Name, od.ProductId
HAVING SUM(od.Quantity)>100
ORDER BY 1,2

--VIEW

CREATE VIEW dbo.vw_QuantityByCustomer
as
SELECT c.Name as CustomerName, od.ProductId, SUM(od.Quantity) as SUMQuantity
FROM dbo.Customers as c
INNER JOIN dbo.Orders as o ON c.id = o.CustomerId
INNER JOIN dbo.OrderDetails as od ON o.id = od.OrderId
GROUP BY c.Name, od.ProductId



ALTER VIEW dbo.vw_QuantityByCustomer
as
SELECT c.Name as CustomerName, p.Name, SUM(od.Quantity) as SUMQuantity
FROM dbo.Customers as c
INNER JOIN dbo.Orders as o ON c.id = o.CustomerId
INNER JOIN dbo.OrderDetails as od ON o.id = od.OrderId
INNER JOIN dbo.Products as p on p.id= od.ProductId
GROUP BY c.Name, p.name


select * from dbo.vw_QuantityByCustomer
where CustomerName like '%Bitola'