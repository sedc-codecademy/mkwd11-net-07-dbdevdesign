USE SEDC

SELECT Firstname, LEN(Firstname) AS FirstnameLen
FROM Employees

SELECT [Description], SUBSTRING([Description], 1, 4 ) AS ShortDesc
FROM Products

SELECT Code, REPLACE(Code, '1', '3')
FROM Products

SELECT FirstName, LastName, REPLACE(LastName, 'Stojanovski', 'Stojanovska')
FROM Employees
WHERE Gender = 'F' AND LastName = 'Stojanovski'

SELECT Code, LEFT(Code, 3) AS NamePartOfCode
FROM Products

SELECT Lastname, RIGHT(Lastname, 1) AS LastLetterFromLastName
FROM Employees
