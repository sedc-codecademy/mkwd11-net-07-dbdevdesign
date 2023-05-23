SELECT FirstName, LastName,
replace(FirstName, 'Ale', 'x') as replacement,
Substring(FirstName, 4, 2) as substr,
left(FirstName, 3) as leftStr,
RIGHT(FirstName, 3) as rightStr,
Len(FirstName) as strLen,
Concat(FirstName, N' ', LastName) as FullName
from Employees
