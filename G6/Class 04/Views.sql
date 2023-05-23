-- list all customer ids and sum of price of all orders made by each customer
CREATE VIEW CustomerOrders
as
select CustomerId, SUM(TotalPrice) as Price
from Orders
group by CustomerId
GO


select *
from CustomerOrders

select CustomerId
from CustomerOrders
GO

--Change the view to show Customer Names instead of CustomerId
ALTER VIEW CustomerOrders
as
select c.[Name], SUM(o.TotalPrice) as Price
from Customers c
inner join Orders o
on o.CustomerId = c.Id
group by c.[Name]
GO


select *
from CustomerOrders
GO

--Change the view to show the results ordered by the customer with biggest total price
-- THIS WILL GIVE AN ERROR!!! ORDER BY is not allowed
ALTER VIEW CustomerOrders
as
select c.[Name], SUM(o.TotalPrice) as Price
from Customers c
inner join Orders o
on o.CustomerId = c.Id
group by c.[Name]
order by Price desc
GO

--VALID WAY
select *
from CustomerOrders
order by Price desc
GO

--Create new view (vv_EmployeeOrders) that will List all Employees 
 --(FirstName and LastName) Employee, 
 --Product name 
 --and total quantity they sold 
 CREATE VIEW vv_EmployeeOrders
 AS
 select e.FirstName, e.LastName, p.[Name], SUM(od.Quantity) as TotalQuantity
 from
 Employees e
 inner join Orders o
 on e.Id = o.EmployeeId
 inner join OrderDetails od
 on o.Id = od.OrderId
 inner join Products p
 on p.Id = od.ProductId
 group by e.FirstName, e.LastName, p.[Name]
 GO

 select *
 from vv_EmployeeOrders
 GO

 -- Alter the view to show only sales from Business entities  belonging to region 'Skopski'

 ALTER VIEW vv_EmployeeOrders
 AS
 select e.FirstName, e.LastName, p.[Name], SUM(od.Quantity) as TotalQuantity
 from
 Employees e
 inner join Orders o
 on e.Id = o.EmployeeId
 inner join OrderDetails od
 on o.Id = od.OrderId
 inner join Products p
 on p.Id = od.ProductId
 inner join BusinessEntities be
 on be.Id = o.BusinessEntityId
 where be.Region like '%Skopski'
 group by e.FirstName, e.LastName, p.[Name]
 GO

 select *
 from vv_EmployeeOrders
 GO