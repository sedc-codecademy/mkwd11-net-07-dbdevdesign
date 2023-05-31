--There should be a view with users and the amount of pizzas they ordered

CREATE VIEW OrderedPizzasByUser
AS
SELECT dbo.UserFullName(u.Firstname, u.Lastname) AS UserFullName, COUNT(u.Id) AS PizzasOrdered
FROM Users u
	INNER JOIN Orders o
		ON u.Id = o.UserId
	INNER JOIN Pizzas p
		ON p.OrderId = o.Id
GROUP BY dbo.UserFullName(u.Firstname, u.Lastname)
GO

SELECT *
FROM OrderedPizzasByUser
ORDER BY PizzasOrdered DESC