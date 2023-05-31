USE PizzaStore

--insert users
INSERT INTO Users 
VALUES ('Tijana', 'Stojanovska', 'Adresa1', '070123123')

INSERT INTO Users 
VALUES ('Aleksandar', 'Ivanovski', 'Adresa2', '070123456')

INSERT INTO Users 
VALUES ('Petko', 'Petkovski', 'Adresa3', '070456456')

--insert pizza sizes
INSERT INTO PizzaSizes
VALUES ('Small')

INSERT INTO PizzaSizes
VALUES ('Medium'), ('Large'), ('Family')

--insert orders
INSERT INTO Orders (IsDelivered, Price, UserId)
VALUES(0, 3, 1)

INSERT INTO Orders (IsDelivered, Price, UserId)
VALUES(0, 2, 3)

INSERT INTO Orders (IsDelivered, Price, UserId)
VALUES(0, 2.5, 2)

INSERT INTO Orders (IsDelivered, Price, UserId)
VALUES(1, 4, 1)

--insert pizzas
INSERT INTO Pizzas([Name], Price, SizeId, OrderId)
VALUES ('Capricciosa', 2.5, 2, 5)

INSERT INTO Pizzas([Name], Price, SizeId, OrderId)
VALUES( 'Margarita', 1.6, 1, 7 )

INSERT INTO Pizzas([Name], Price, SizeId, OrderId)
VALUES( 'Seafood', 2.9, 2, 5)

INSERT INTO Pizzas ([Name], Price, SizeId, OrderId)
VALUES( 'Hawaiian', 2.7,  2, 6)


INSERT INTO Pizzas([Name], Price, SizeId, OrderId)
VALUES ('Capricciosa', 2.5, 2, 6)

INSERT INTO Pizzas([Name], Price, SizeId, OrderId)
VALUES( 'Margarita', 1.6, 1, 5 )

INSERT INTO Pizzas([Name], Price, SizeId, OrderId)
VALUES( 'Seafood', 3, 2, 7)

INSERT INTO Pizzas ([Name], Price, SizeId, OrderId)
VALUES( 'Hawaiian', 3.1,  3, 5)

INSERT INTO Pizzas ([Name], Price, SizeId, OrderId)
VALUES( 'Hawaiian', 3.1,  3, 7)

--insert Toppings
INSERT INTO Toppings( [Name], Price)
VALUES('Cheese', 0.4)

INSERT INTO Toppings( [Name], Price)
VALUES('Mushrooms', 0.8)

INSERT INTO Toppings( [Name], Price)
VALUES('Bacon', 1)

INSERT INTO Toppings( [Name], Price)
VALUES('Onions', 0.2)

INSERT INTO Toppings( [Name], Price)
VALUES ('Garlic', 0.3)

--insert pizzatoppings

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(1, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(1, 3)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(2, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(4, 3)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(4, 5)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(6, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(3, 5)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(5, 1)

INSERT INTO PizzaToppings( PizzaId, ToppingId)
VALUES(7, 1)