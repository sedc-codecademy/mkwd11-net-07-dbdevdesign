
CREATE VIEW [Employees that made orders] AS
SELECT e.FirstName, e.LastName, e.HireDate, o.TotalPrice, o.OrderDate, c.[Name]
FROM Employees e
INNER JOIN Orders o
ON e.Id = o.EmployeeId
INNER JOIN Customers c
ON c.Id = o.CustomerId
