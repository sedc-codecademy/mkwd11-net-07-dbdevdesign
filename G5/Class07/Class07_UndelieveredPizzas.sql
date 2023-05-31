--There should be a view to show all pizzas that are not delivered yet and the full names of the users waiting for them

CREATE VIEW UndelieveredPizzas
AS
SELECT p.[Name], p.SizeId, p.OrderId, o.IsDelivered, dbo.UserFullName(u.Firstname, u.Lastname) AS [User]
FROM Pizzas p	
	INNER JOIN Orders o
		ON p.OrderId = o.Id
	INNER JOIN Users u
		ON o.UserId = u.Id
WHERE o.IsDelivered = 0
GO

SELECT *
FROM UndelieveredPizzas
