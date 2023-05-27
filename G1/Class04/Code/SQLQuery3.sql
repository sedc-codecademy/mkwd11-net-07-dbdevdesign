--String functions
SELECT
	FirstName,
	LastName,
	replace(FirstName, 'ks', 'X') as Replace_ks_X,
	substring(FirstName, 4, 2) as Substring_4_2,
	left(FirstName, 3) as Left_3,
	right(FirstName, 2) as Right_2,
	len(FirstName) as LenColumn,
	concat(FirstName, N' ',LastName) as Concat_Name
FROM
	Employees
WHERE
	FirstName = 'Aleksandar' and LastName = 'Stojanovski'
GO