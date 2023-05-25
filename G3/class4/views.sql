

CREATE VIEW vmOrdersOverThousand AS
SELECT * FROM Orders 
WHERE TotalPrice > 1000

SELECT C.Name, Count(*) FROM vmOrdersOverThousand vm
inner join Customers c on vm.CustomerId = c.Id
GROUP By c.Name
Having SUM(TotalPrice) > 65000

-- vwEmployee , Id, FullName, Street
CREATE VIEW vmEmployee AS
SELECT e.Id, FirstName + ' ' + LastName as FullName, Street 
FROM Employees e
LEFT JOIN [Address] a on e.Id = a.EmployeeId

SELECT * FROM vmEmployee
-- join view with Customers 