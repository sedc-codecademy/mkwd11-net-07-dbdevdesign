--There should be a view that lists pizzas by the number of times ordered ( Call this view ordered by the most popular pizza on top )

CREATE VIEW PizzaPopularity 
AS
SELECT p.[Name], COUNT(p.Id) AS NumbersOfTimesOrdered
FROM Orders o
INNER JOIN Pizzas p
ON p.OrderId = o.Id
GROUP By p.[Name]
GO

SELECT * 
FROM PizzaPopularity
ORDER BY NumbersOfTimesOrdered DESC