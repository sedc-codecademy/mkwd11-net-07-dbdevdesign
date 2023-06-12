--Exercise 1: Create a stored procedure that returns the total number of pizzas ordered by a specific user.
--Exercise 2: Create a stored procedure that updates the delivery status of an order.
--Exercise 3: Create a function that calculates the total price of a pizza, including its toppings.
--Exercise 4: Create a stored procedure that returns the top 5 most popular toppings based on the number of times they have been ordered.
--Exercise 5: Create a query that retrieves all pizzas ordered by a specific user and their respective sizes.


--Exercise 1: Create a stored procedure that returns the total number of pizzas ordered by a specific user.

CREATE PROCEDURE GetTotalPizzasOrderedByUser
  @UserId INT
AS
BEGIN
  SELECT COUNT(*) AS TotalPizzasOrdered
  FROM Pizzas AS p
  INNER JOIN Orders AS o ON p.OrderId = o.Id
  WHERE o.UserId = @UserId
END
--Exercise 2: Create a stored procedure that updates the delivery status of an order.

CREATE PROCEDURE UpdateOrderDeliveryStatus
  @OrderId INT,
  @IsDelivered BIT
AS
BEGIN
  UPDATE Orders
  SET IsDelivered = @IsDelivered
  WHERE Id = @OrderId
END
--Exercise 3: Create a function that calculates the total price of a pizza, including its toppings.

CREATE FUNCTION CalculatePizzaPrice
(
  @PizzaId INT
)
RETURNS DECIMAL(4, 2)
AS
BEGIN
  DECLARE @TotalPrice DECIMAL(4, 2)
  
  SELECT @TotalPrice = p.Price + COALESCE(SUM(t.Price), 0)
  FROM Pizzas AS p
  LEFT JOIN PizzaToppings AS pt ON p.Id = pt.PizzaId
  LEFT JOIN Toppings AS t ON pt.ToppingId = t.Id
  WHERE p.Id = @PizzaId
  
  RETURN @TotalPrice
END
--Exercise 4: Create a stored procedure that returns the top 5 most popular toppings based on the number of times they have been ordered.

CREATE PROCEDURE GetTopPopularToppings
AS
BEGIN
  SELECT TOP 5 t.Name, COUNT(*) AS OrdersCount
  FROM PizzaToppings AS pt
  JOIN Toppings AS t ON pt.ToppingId = t.Id
  GROUP BY t.Name
  ORDER BY OrdersCount DESC
END
--Exercise 5: Create a query that retrieves all pizzas ordered by a specific user and their respective sizes.

SELECT p.Name, ps.Name AS Size
FROM Pizzas AS p
JOIN PizzaSizes AS ps ON p.SizeId = ps.Id
JOIN Orders AS o ON p.OrderId = o.Id
JOIN Users AS u ON o.UserId = u.Id
WHERE u.Id = @UserId