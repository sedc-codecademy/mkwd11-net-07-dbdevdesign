--select the last employee that joined the company (top 1 by hiredate desc )
SELECT TOP (1) *
  FROM Employees
  ORDER BY HireDate DESC