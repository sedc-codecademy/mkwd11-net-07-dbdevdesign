DECLARE @FilterFemales BIT
SET @FilterFemales = 1

IF(@FilterFemales <> 1)
select *
From Employees
ELSE
select * from Employees
where Gender = 'F'