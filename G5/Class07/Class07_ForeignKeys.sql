USE PizzaStore

ALTER TABLE Orders 
ADD CONSTRAINT FK_Orders_Users
FOREIGN KEY(UserId)
REFERENCES Users(Id)

ALTER TABLE Pizzas
ADD CONSTRAINT FK_Pizzas_PizzaSizes
FOREIGN KEY (SizeId)
REFERENCES PizzaSizes(Id)

ALTER TABLE Pizzas
ADD CONSTRAINT FK_Pizzas_Orders
FOREIGN KEY (OrderId)
REFERENCES Orders(Id)

ALTER TABLE PizzaToppings
ADD CONSTRAINT FK_PizzaToppings_Pizzas
FOREIGN KEY (PizzaId)
REFERENCES Pizzas(Id)

ALTER TABLE PizzaToppings
ADD CONSTRAINT FK_PizzaToppings_Toppings
FOREIGN KEY (ToppingId)
REFERENCES Toppings(Id)

--ALTER TABLE Pizzas
--ADD CONSTRAINT PK_Pizzas PRIMARY KEY (Id)  --adding primary key constraint after table creation
