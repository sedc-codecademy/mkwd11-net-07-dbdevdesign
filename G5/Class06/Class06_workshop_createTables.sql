CREATE DATABASE PizzaStore

USE PizzaStore
GO

CREATE TABLE Users(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Firstname NVARCHAR(100) NOT NULL,
Lastname NVARCHAR(100) NOT NULL,
[Address] NVARCHAR(250) NOT NULL,
Phone NVARCHAR(50) NOT NULL
)

CREATE TABLE Orders(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
IsDelivered BIT NOT NULL DEFAULT 0,
Price DECIMAL(4,2) NOT NULL,
UserId INT NOT NULL
)

CREATE TABLE Toppings(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(200) NOT NULL,
Price DECIMAL(4,2) NOT NULL
)

CREATE TABLE PizzaSizes(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(200) NOT NULL,
)

CREATE TABLE Pizzas(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(200) NOT NULL,
Price DECIMAL(4,2) NOT NULL,
SizeId INT NOT NULL,
OrderId INT NOT NULL
)

--pizza with Id 1 has two toppings ketchup (topping with id 1) and cheese (topping with id 2)
--pizza with Id 2 has two toppings ketchup (topping with id 1) and pepperoni (topping with id 3)
--mant to many relationahio between pizza and toppings requires a new table
CREATE TABLE PizzaToppings(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
PizzaId INT NOT NULL,
ToppingId INT NOT NULL
)

--------Id----PizzaId-----ToppingId
--------1-----1----------1
--------2-----1----------2
--------3-----2----------1
--------4-----2----------3

--SELECT Toppings.Name FROM PizzaTopping INNER JOIN Toppings ON Id = ToppingId WHERE PizzaId = 1