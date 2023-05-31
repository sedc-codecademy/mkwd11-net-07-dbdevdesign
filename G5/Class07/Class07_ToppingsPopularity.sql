--There should be a view that lists toppings by the number of times ordered ( Call this view ordered by the most popular topping on top )

CREATE VIEW ToppingsPopularity
AS
SELECT t.[Name], COUNT(t.Id) AS NumberOfTimesOrdered
FROM Orders o
	INNER JOIN Pizzas p
		ON p.OrderId = o.Id
	INNER JOIN PizzaToppings PT
		ON PT.PizzaId = p.Id
	INNER JOIN Toppings t
		ON t.Id = pt.ToppingId
GROUP BY t.[Name]
GO

SELECT *
FROM ToppingsPopularity
ORDER BY NumberOfTimesOrdered DESC