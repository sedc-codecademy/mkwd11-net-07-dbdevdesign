--List all Business Entities that has any order 

select *
from BusinessEntities be
inner join Orders o
on o.BusinessEntityId = be.Id

select be.Name, o.OrderDate, o.TotalPrice
from BusinessEntities be
inner join Orders o
on o.BusinessEntityId = be.Id

--find date and price of all orders made from Vitalia Bitola
select o.OrderDate, o.TotalPrice
from Orders o
inner join BusinessEntities be
on o.BusinessEntityId = be.Id
where be.Name like '%Vitalia Bitola%'

--For each order find which customer (name) made it (Customers), name of Employee that made it (Employees), get its date and total price (Orders)
select *
from Orders o
inner join Employees e
on o.EmployeeId = e.Id
inner join Customers c
on o.CustomerId = c.Id

select e.FirstName, e.LastName, o.OrderDate, o.TotalPrice, c.[Name]
from Orders o
inner join Employees e
on o.EmployeeId = e.Id
inner join Customers c
on o.CustomerId = c.Id
