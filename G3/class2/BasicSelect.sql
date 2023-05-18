SELECT * FROM Employees
WHERE LastName Like 'S%' and FirstName like 'M%';

SELECT * FROM Employees
WHERE DateOfBirth > '01.01.1988'

SELECT * FROM Employees
WHERE Gender = 'M'

SELECT * FROM Employees
WHERE HireDate >= '01.01.1998' and HireDate <= '01.31.1998'

SELECT * FROM Employees
WHERE LastName like 'A%' 
and 
HireDate >= '01.01.2019' 
and 
HireDate <= '01.31.2019'

SELECT * FROM Employees
WHERE FirstName = 'Aleksandar'
Order by LastName desc

SELECT * FROM Employees
Order By FirstName

SELECT * FROM Employees
WHERE Gender = 'M'
Order By HireDate Desc

SELECT  Region FROM BusinessEntities
Intersect
SELECT  RegionName FROM Customers

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
Foreign Key(OrderId) references [Orders](Id)

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY(ProductId) references Products(Id)

ALTER TABLE ORDERS
ADD CONSTRAINT FK_Orders_BusinessEntities
Foreign Key(BusinessEntityId) 
references BusinessEntities(Id)

ALTER TABLE ORDERS
ADD CONSTRAINT FK_Orders_Empolyees
Foreign Key(EmployeeId) references Employees(Id);



