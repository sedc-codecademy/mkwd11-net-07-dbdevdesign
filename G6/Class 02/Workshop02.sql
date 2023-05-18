--Find all Employees with FirstName = Aleksandar ordered by Last Name
select *
from Employees
where FirstName = 'Aleksandar'
order by LastName --default ASC -> Ascending

--Find all Male employees ordered by HireDate, starting from the last hired
select *
from Employees
where Gender = 'M'
order by HireDate desc