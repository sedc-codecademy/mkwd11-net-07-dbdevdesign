CREATE DATABASE PizzaDb

CREATE TABLE Users(
	Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(200) NOT NULL,
	Address nvarchar(500) NOT NULL,
	PhoneNumber nvarchar(20) NOT NULL
)

CREATE TABLE Orders(
 Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
 IsDelivered BIT NOT NULL,
 Price DECIMAL(18,2) NOT NULL,
 UserId INT NOT NULL
)

CREATE TABLE Pizzas(
  Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  OrderId INT NOT NULL,
  PizzaSizeId INT NOT NULL,
  Name nvarchar(200) NOT NULL,
  Price decimal(18,2) NOT NULL
)


CREATE TABLE PizzaSizes(
  Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL
)

CREATE TABLE Toppings(
  Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(200) NOT NULL,
  Price decimal(18,2) NOT NULL
)

CREATE TABLE PizzaToppings(
  Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  PizzaId INT NOT NULL,
  ToppingId INT NOT NULL
)


ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Users FOREIGN KEY(UserId) REFERENCES Users(Id)
ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_Orders FOREIGN KEY(OrderId) REFERENCES Orders(Id)
ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_PizzaSizes FOREIGN KEY(PizzaSizeId) REFERENCES PizzaSizes(Id)
ALTER TABLE PizzaToppings ADD CONSTRAINT FK_PizzaToppings_Pizzas FOREIGN KEY(PizzaId) REFERENCES Pizzas(Id)
ALTER TABLE PizzaToppings ADD CONSTRAINT FK_PizzaToppings_Toppings FOREIGN KEY(ToppingId) REFERENCES Toppings(Id)



/* ------------------------------------------------------------------------ */

INSERT INTO Users(FirstName, LastName, Address, PhoneNumber)
VALUES('Bob', 'Bobsky', 'Bob Street 22', '070111222')

INSERT INTO Users(FirstName, LastName, Address, PhoneNumber)
VALUES('Jill', 'Wayne', 'Jill Street 22', '070222333')

INSERT INTO Users( FirstName, LastName, Address, PhoneNumber)
VALUES('Greg', 'Gregsky', 'Greg Street 22', '070333444')

GO

/* ------------------------------------------------------------------------ */



INSERT INTO PizzaSizes( Name)
VALUES('Small')

INSERT INTO PizzaSizes( Name)
VALUES('Medium')

INSERT INTO PizzaSizes( Name)
VALUES('Large')

INSERT INTO PizzaSizes( Name)
VALUES('Family')

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Orders (Price, IsDelivered, UserId)
VALUES( 0.5, 1, 1)

INSERT INTO Orders( Price, IsDelivered, UserId)
VALUES( 0.5, 1, 1)

INSERT INTO Orders( Price, IsDelivered, UserId)
VALUES( 0.6, 0, 1)

INSERT INTO Orders( Price, IsDelivered, UserId)
VALUES( 0.3, 0, 2)

INSERT INTO Orders( Price, IsDelivered, UserId)
VALUES( 0.5, 1, 3)

/* ------------------------------------------------------------------------ */



/* Order 1 */
INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Capricciosa', 1, 2, 1)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Pepperoni', 3, 3.7, 1)

/* Order 2 */

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Margarita', 1, 1.6, 2)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Seafood', 2, 2.9, 2)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Hawaiian', 2, 2.7, 2)

/* Order 3 */

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Capricciosa', 2, 2.5, 3)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Pepperoni', 4, 4.8, 3)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Capricciosa', 3, 3.2, 3)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Hawaiian', 4, 5.2, 3)

/* Order 4 */

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Capricciosa', 3, 3, 4)

/* Order 5 */

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Margarita', 4, 4, 5)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Seafood', 3, 4.5, 5)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Pepperoni', 3, 4.2, 5)

INSERT INTO Pizzas( Name, PizzaSizeId, Price, OrderId)
VALUES( 'Capricciosa', 4, 3.7, 5)

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Toppings( Name, Price)
VALUES( 'Cheese', 0.4)

INSERT INTO Toppings( Name, Price)
VALUES( 'Mushrooms', 0.8)

INSERT INTO Toppings( Name, Price)
VALUES( 'Bacon', 1)

INSERT INTO Toppings( Name, Price)
VALUES( 'Onions', 0.2)

INSERT INTO Toppings( Name, Price)
VALUES( 'Garlic', 0.3)

/* ------------------------------------------------------------------------ */



INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 1, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 1, 3)

INSERT INTO PizzaToppings (PizzaId, ToppingId)
VALUES( 2, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 4, 3)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 4, 5)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 6, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 7, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 9, 2)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 10, 4)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 11, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 11, 5)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 12, 4)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 14, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 14, 2)
GO


--There should be a function that concatenates First and Last Name of a user
-- FIRST WAY
CREATE FUNCTION GetFullNameFromNames (
	@FirstName nvarchar(100),
	@LastName nvarchar(200)
)
RETURNS NVARCHAR(310)
AS
BEGIN
DECLARE @FullName nvarchar(310)

SET @FullName = CONCAT(@FirstName, ' ', @LastName)

Return @FullName
END
GO

SELECT dbo.GetFullNameFromNames('SEDC', 'Test')
GO

--SECOND WAY
CREATE FUNCTION GetFullNameById(
	@UserId int 
)
RETURNS NVARCHAR(310)
AS
BEGIN

DECLARE @FullName nvarchar(310)

SELECT @FullName = (
		SELECT FirstName + ' ' + LastName
		From Users
		Where Id = @UserId
)

RETURN @FullName

END
GO

SELECT dbo.GetFullNameById(1) as FullName
GO

CREATE VIEW [Undelivered Pizzas] AS
	SELECT p.Name, p.PizzaSizeId, p.OrderId, dbo.GetFullNameFromNames(u.FirstName, u.LastName) AS [User] FROM Pizzas AS p
	JOIN Orders AS o
	ON o.Id = p.OrderId
	JOIN Users AS u
	ON u.Id = o.UserId
	WHERE o.IsDelivered = 0
GO

SELECT * FROM [Undelivered Pizzas]
GO

--There should be a stored procedure that when provided an Order Id, 
--can return the full price of a whole order ( Delivery(order Price) + All Pizza + All Toppings )
CREATE PROCEDURE sp_GetOrderTotalPrice
  @OrderId INT,
  @TotalPrice DECIMAL(18, 2) OUTPUT
AS
BEGIN
  DECLARE @DeliveryPrice DECIMAL(18, 2);
  DECLARE @PizzaPrice DECIMAL(18, 2);
  DECLARE @ToppingsPrice DECIMAL(18, 2);
  
  -- Get the delivery price for the order
  SELECT @DeliveryPrice = Price
  FROM Orders
  WHERE Id = @OrderId;
  
  -- Get the total price of all pizzas in the order
  SELECT @PizzaPrice = SUM(Price)
  FROM Pizzas
  WHERE OrderId = @OrderId;
  
  -- Get the total price of all toppings in the order
  SELECT @ToppingsPrice = SUM(T.Price)
  FROM Pizzas AS P
  JOIN PizzaToppings AS PT ON P.Id = PT.PizzaId
  JOIN Toppings AS T ON PT.ToppingId = T.Id
  WHERE P.OrderId = @OrderId;
  
  -- Calculate the total price of the order
  SET @TotalPrice = @DeliveryPrice + @PizzaPrice + @ToppingsPrice;
END
GO


--There should be a view that lists pizzas by the number of times ordered ( Call this view ordered by the most popular pizza on top )
CREATE VIEW MostPopularPizza
AS
select p.[Name], COUNT(p.[Name]) as NumOfTimesIncluded
from Pizzas p
inner join Orders o 
on o.Id = p.OrderId
GROUP BY p.[Name]
GO

SELECT *
FROM MostPopularPizza
ORDER BY NumOfTimesIncluded desc
GO

--There should be a view with users and the amount of pizzas they ordered​

CREATE VIEW [Pizzas Ordered By Users] AS
	SELECT u.Id, dbo.GetFullNameFromNames(u.FirstName, u.LastName) AS [User] ,COUNT(u.Id) AS [Pizzas Ordered] FROM Users AS u
	JOIN Orders AS o
	ON u.Id = o.UserId
	JOIN Pizzas AS p
	ON o.Id = p.OrderId
	GROUP BY u.Id, dbo.GetFullNameFromNames(u.FirstName, u.LastName)
GO

SELECT * FROM [Pizzas Ordered By Users]
ORDER BY [Pizzas Ordered] DESC
--There should be a view that lists toppings by the number of times ordered ( Call this view ordered by the most popular topping on top )
--example: Mushrooms is mostly included topping in the pizzas ordered in our store

SELECT *
FROM 
Toppings t
inner join PizzaToppings pt
on t.Id = pt.ToppingId
GO
--inner join Pizzas p
--on pt.PizzaId = p.Id
--inner join Orders o
--on p.OrderId = o.Id

CREATE VIEW MostPopularTopping
AS
SELECT t.Id, t.[Name], COUNT(t.Id) as ToppingCount
FROM 
Toppings t
inner join PizzaToppings pt
on t.Id = pt.ToppingId
--inner join Pizzas p
--on pt.PizzaId = p.Id
--inner join Orders o
--on p.OrderId = o.Id
GROUP BY t.Id, t.[Name]
GO

SELECT *
FROM MostPopularTopping
ORDER BY ToppingCount DESC