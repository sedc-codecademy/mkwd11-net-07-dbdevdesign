USE [master]
GO

--DROP DATABASE IF EXISTS PizzaDb
--GO

CREATE DATABASE PizzaDb
GO

USE [PizzaDb]
GO

CREATE TABLE Toppings(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	Name NVARCHAR(255) NOT NULL,
	Price DECIMAL(4, 2) NOT NULL
)
GO

CREATE TABLE PizzaSizes(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	Name NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE Pizzas(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	Name NVARCHAR(255) NOT NULL,
	Price DECIMAL(4, 2) NOT NULL,
	SizeId INT NOT NULL,
	OrderId INT NOT NULL
)
GO

CREATE TABLE PizzaToppings(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	PizzaId INT NOT NULL,
	ToppingId INT NOT NULL
)
GO

CREATE TABLE Users(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	FirstName NVARCHAR(255) NOT NULL,
	LastName NVARCHAR(255) NOT NULL,
	Address NVARCHAR(255) NOT NULL,
	Phone NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE Orders(
	Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
	Price DECIMAL(4, 2) NOT NULL,
	IsDelivered BIT NOT NULL DEFAULT 0,
	UserId INT NOT NULL
)
GO

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Users FOREIGN KEY (UserId) REFERENCES dbo.Users(Id);
GO

ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_PizzaSizes FOREIGN KEY (SizeId) REFERENCES dbo.PizzaSizes(Id);
GO

ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_Orders FOREIGN KEY (OrderId) REFERENCES dbo.Orders(Id);
GO

ALTER TABLE PizzaToppings ADD CONSTRAINT FK_PizzaToppings_Pizzas FOREIGN KEY (PizzaId) REFERENCES dbo.Pizzas(Id);
GO

ALTER TABLE PizzaToppings ADD CONSTRAINT FK_PizzaToppings_Toppings FOREIGN KEY (ToppingId) REFERENCES dbo.Toppings(Id);
GO


USE PizzaDB
GO

INSERT INTO Users( FirstName, LastName, Address, Phone)
VALUES('Bob', 'Bobsky', 'Bob Street 22', '070111222')

INSERT INTO Users( FirstName, LastName, Address, Phone)
VALUES( 'Jill', 'Wayne', 'Jill Street 22', '070222333')

INSERT INTO Users( FirstName, LastName, Address, Phone)
VALUES( 'Greg', 'Gregsky', 'Greg Street 22', '070333444')

GO

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

INSERT INTO PizzaSizes(Name)
VALUES('Small')

INSERT INTO PizzaSizes( Name)
VALUES('Medium')

INSERT INTO PizzaSizes( Name)
VALUES('Large')

INSERT INTO PizzaSizes( Name)
VALUES('Family')

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Orders( Price, IsDelivered, UserId)
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

USE PizzaDB
GO

/* Order 1 */
INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Capricciosa', 1, 2, 1)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Pepperoni', 3, 3.7, 1)

/* Order 2 */

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Margarita', 1, 1.6, 2)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Seafood', 2, 2.9, 2)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Hawaiian', 2, 2.7, 2)

/* Order 3 */

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Capricciosa', 2, 2.5, 3)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Pepperoni', 4, 4.8, 3)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Capricciosa', 3, 3.2, 3)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Hawaiian', 4, 5.2, 3)

/* Order 4 */

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Capricciosa', 3, 3, 4)

/* Order 5 */

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Margarita', 4, 4, 5)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Seafood', 3, 4.5, 5)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
VALUES( 'Pepperoni', 3, 4.2, 5)

INSERT INTO Pizzas( Name, SizeId, Price, OrderId)
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

USE PizzaDB
GO

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 1, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES( 1, 3)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
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

--There should be a function that concatenates Fist and Last name of the user
CREATE FUNCTION GetFullName(
	@firstName nvarchar(255),
	@lastName nvarchar(255)
)
RETURNS nvarchar(511)
AS
BEGIN
	RETURN @firstName + ' ' + @lastName
END
GO

SELECT dbo.GetFullName('Bob','Bobsky') as User_FullName
GO

--There should be a view to show all pizzas that are not delivered yet and the full names of the users waiting for them
CREATE VIEW [Undelivered Pizzas] AS
	SELECT p.Name, p.SizeId, p.OrderId, dbo.GetFullName(u.FirstName, u.LastName) AS [USER] FROM Pizzas AS p
	JOIN Orders AS o ON o.Id = p.OrderId
	JOIN Users AS u ON u.Id = o.UserId
GO

SELECT * FROM [Undelivered Pizzas]
GO

--There should be a stored procedure that when provided an OrderId, can return the full price of a whole order
CREATE OR ALTER PROCEDURE GetFullPriceOfOrder @OrderId int
AS 
BEGIN
	DECLARE @pizzasPrice DECIMAL(4, 2)
	DECLARE @toppingsPrice DECIMAL(4, 2)
	DECLARE @orderPrice DECIMAL(4, 2)

	SELECT @pizzasPrice = SUM(p.Price), @toppingsPrice = SUM(t.Price) FROM Orders AS o
	JOIN Pizzas AS p
	ON o.Id = p.OrderId
	JOIN PizzaToppings AS pt
	ON p.Id = pt.PizzaId
	JOIN Toppings as t
	ON t.Id = pt.ToppingId
	WHERE o.Id = @OrderId

	SELECT @orderPrice = Price FROM Orders
	WHERE Id = @OrderId

	SELECT @OrderId AS [Order Id], @orderPrice AS [Order Price], @pizzasPrice AS [Pizzas Price], @toppingsPrice AS [Toppings Price], SUM(@pizzasPrice + @toppingsPrice + @orderPrice) AS [Full Price]
END
GO

EXEC dbo.GetFullPriceOfOrder @OrderId = 3
GO

/* There should be a view that lists pizzas by the number of times ordered, starting from the most popular one ( Most times ordered )​ */
CREATE OR ALTER VIEW [Pizza Popularity] AS
	SELECT p.Name, COUNT(p.Name) AS [Number of times ordered] FROM Orders AS o
	JOIN Pizzas AS p ON o.Id = p.OrderId
	GROUP bY p.Name
GO

SELECT * FROM [Pizza Popularity]
ORDER BY [Number of times ordered] DESC
GO


/* There should be a view that lists toppings by the number of times ordered, starting from the most popular one ( Most times ordered )​ */

CREATE VIEW [Topping Popularity] AS
	SELECT t.Name, COUNT(t.Name) AS [Number of times ordered] FROM Orders AS o
	JOIN Pizzas AS p
	ON o.Id = p.OrderId
	JOIN PizzaToppings AS pt
	ON p.Id = pt.PizzaId
	JOIN Toppings AS t
	ON t.Id = pt.ToppingId
	GROUP BY t.Name
GO

SELECT * FROM [Topping Popularity]
ORDER BY [Number of times ordered] DESC

/* There should be a view with users and the amount of pizzas they ordered​ */

CREATE OR ALTER VIEW [Pizzas Ordered By Users] AS
	SELECT dbo.GetFullName(u.FirstName, u.LastName) AS [User] ,COUNT(u.Id) AS [Pizzas Ordered] FROM Users AS u
	JOIN Orders AS o
	ON u.Id = o.UserId
	JOIN Pizzas AS p
	ON o.Id = p.OrderId
	GROUP BY dbo.GetFullName(u.FirstName, u.LastName)
GO

SELECT * FROM [Pizzas Ordered By Users]
ORDER BY [Pizzas Ordered] DESC