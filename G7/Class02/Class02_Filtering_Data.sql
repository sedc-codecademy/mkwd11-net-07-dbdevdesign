Select *
From Employee
Where FirstName = 'Marko'
GO

--Update Employee Set Town = 'Veles' Where Town IS NULL

--Select *
--From Employee
--Where FirstName LIKE '%ris%'

Select * From Employee Where Town = 'Veles' OR Gender = 'F'
GO

Select *
From Employee
Where FirstName LIKE '%ris'
GO

Select * 
From Employee
Where LastName LIKE 'G%'

Select FirstName, LastName
From Employee
Where DateOfBirth > '1991-01-01'

Select *
From Employee
Where Gender = 'm' --Gender = 'M'

Select *
From Employee
Where HireDate >= '2023-04-01' AND HireDate < '2023-05-01'


Select *
From Employee
Where HireDate >= '2023-05-01' 
	  AND HireDate < '2023-06-01' 
	  AND LastName Like 'M%'

Select *
From Employee
Order By FirstName ASC


Select *
From Employee
--Where HireDate >= '2023-04-01' AND HireDate < '2023-05-01'
Order By Gender, DateOfBirth ASC

Select * 
From Employee
Where FirstName LIKE '%ris%'
Order By LastName

Select *
From Employee
Order by FirstName

Select *
From Employee
Where Gender = 'M'
Order By HireDate DESC