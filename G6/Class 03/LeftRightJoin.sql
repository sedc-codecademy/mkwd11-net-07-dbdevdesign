-- List all Customers without orders

select *
from Customers c
left join Orders o
on o.CustomerId = c.Id
where o.Id is null


select *
from Orders o
right join Customers c
on o.CustomerId = c.Id