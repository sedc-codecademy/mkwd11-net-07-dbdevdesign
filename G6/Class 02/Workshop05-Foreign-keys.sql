ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderId) REFERENCES Orders(Id)

--We expect that if we have order details row for ProductId 2 that there is a Product with Id 2
-- That means all values in the ProductId column in OrderDetails MUST exist in column Id in Products table
SELECT *
FROM OrderDetails 
where ProductId = 2

SELECT *
FROM Products
Where Id = 2

--column ProductID in OrderDetails table will point to column Id from Products table
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY (ProductId) REFERENCES Products(Id)


--ORDERS
--column CustomerId in Orders table will point to column Id from Customers table
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerId) REFERENCES Customers(Id)

--column EmployeeId in Orders table will point to column Id from Employees table
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Employees
FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

--column BusinessEntityId in Orders table will point to column Id from BusinessEntities table
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_BusinessEntities
FOREIGN KEY (BusinessEntityId) REFERENCES BusinessEntities(Id)

--no such product
SELECT *
from Products
Where Id = 20

--exists
SELECT *
from Orders
Where Id = 1

--we try to enter 20 as value for ProductId, but it doesn't exist as Id in Products
insert into OrderDetails(OrderId, ProductId, Quantity, Price)
values(1, 20, 2, 30)