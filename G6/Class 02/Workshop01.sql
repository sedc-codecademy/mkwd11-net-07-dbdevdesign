--Find all Employees with FirstName = Goran
Select *
from dbo.Employees
where FirstName = 'Goran'

--Find all Employees with LastName starting With ‘S’
select *
from Employees
where LastName like 'S%' 

--Find all employees hired in January/1998
select *
from Employees
where HireDate >= '1998-01-01' and HireDate <= '1998-01-31'

----Find all employees hired on 1st of January/1998
select *
from Employees
where HireDate = '1998-01-01'

--Find all Employees with LastName starting With ‘A’ hired in January/1998
select *
from Employees
where LastName like 'A%' and HireDate >= '1998-01-01' and HireDate <= '1998-01-31' 

--Find all Male employees
select *
from Employees
where Gender = 'M'

--Find all employees hired in January/1998 or March/1998
select *
from Employees
where (HireDate >= '1998-01-01' and HireDate <= '1998-01-31') or (HireDate >= '1998-03-01' and HireDate <= '1998-03-31')