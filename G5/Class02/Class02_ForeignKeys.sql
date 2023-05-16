ALTER TABLE Orders 
ADD CONSTRAINT FK_Order_BusinessEntitites
FOREIGN KEY (BusinessEntityId)
REFERENCES BusinessEntities (Id)

SELECT * 
FROM Orders

SELECT * 
FROM BusinessEntities
WHERE Id = 2

ALTER TABLE Orders 
ADD CONSTRAINT FK_Order_Customers
FOREIGN KEY (CustomerId)
REFERENCES Customers (Id)

ALTER TABLE Orders 
ADD CONSTRAINT FK_Order_Employee
FOREIGN KEY (EmployeeId)
REFERENCES Employees (Id)

ALTER TABLE OrderDetails 
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderId)
REFERENCES Orders (Id)

ALTER TABLE OrderDetails 
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY (ProductId)
REFERENCES Products (Id)
