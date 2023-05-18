--Calculate the total amount per BE on all orders in the system
select BusinessEntityId, SUM(TotalPrice)
from Orders
group by BusinessEntityId

--Count all orders per Customer

select c.Name, COUNT(*) as TotalNumOfOrders
from Orders o
inner join 
Customers c
on c.Id = o.CustomerId
group by c.[Name]

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20
select BusinessEntityId, SUM(TotalPrice) as TotalAmount
from Orders
where CustomerId < 20
group by BusinessEntityId

--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system
select be.[Name], MAX(TotalPrice) as MaxAmount, MIN(TotalPrice) as MinAmount, AVG(TotalPrice) as AvgAmount
from Orders o
inner join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]

--find all entities for which the total amount is greater than 500 000
select BusinessEntityId, SUM(TotalPrice) as TotalAmount
from Orders
group by BusinessEntityId
having SUM(TotalPrice) > 500000

--Find the Maximal Order amount, and the Average Order amount per BusinessEntity 
--on all orders in the system. Filter only records where Maximum order 
--amount is more then 4x bigger then average
--List all BusinessEntity names next to the other details

select be.[Name], MAX(TotalPrice) as MaxAmount, AVG(TotalPrice) as AvgAmount
from Orders o
inner join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]
having Max(TotalPrice) > 4*AVG(TotalPrice)

--find most ordered products
select ProductId, COUNT(*) as c
from OrderDetails
group by ProductId
order by c desc



