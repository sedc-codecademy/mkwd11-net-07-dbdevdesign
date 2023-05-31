declare @firstName nvarchar(30);
set @firstName = 'Aleksandar'

select * from Employees
where FirstName = @firstName

declare @femaleEmployees table (EmployeeId int, DateOfBirth datetime2);

INSERT INTO @femaleEmployees 
SELECT Id, DateOfBirth FROM Employees
WHERE Gender = 'f'

select * from @femaleEmployees

create table #femaleEmployees (EmployeeId int, DateOfBirth datetime2);
insert into #femaleEmployees
SELECT Id, DateOfBirth From Employees
where Gender = 'f';
Go
SELECT * FROM #femaleEmployees

create table #maleEmployees(LastName nvarchar(100), HireDate datetime2);

insert into #maleEmployees
SELECT LastName, HireDate From Employees
WHERE FirstName Like 'A%' and Gender = 'm'

SELECT * From #maleEmployees
WHERE LEN(LastName) = 7

CREATE Function fn_EmployeeFullName(@EmployeeId int)
RETURNS nvarchar(200)
as
begin
	declare @toReturn nvarchar(200);
	SELECT @toReturn = FirstName + ' ' + LastName From Employees
	Where Id = @EmployeeId;

	return @toReturn
end
go
CREATE Function fn_FullName(@FirstName nvarchar(100), @LastName nvarchar(100))
RETURNS nvarchar(200)
AS
BEGIN
	return @FirstName + ' ' + @LastName
END
CREATE Function fn_fullNameLenght(@FirstName nvarchar(100), @LastName nvarchar(100))
RETURNS int
AS
BEGIN
	return len(@FirstName + ' ' + @LastName)
END
go

SELECT 
	dbo.fn_fullNameLenght(FirstName, LastName) FullNameCharacterLenght, 
	Count(*) CountWithThatLenght
FROM 
	Employees
Group by 
	dbo.fn_fullNameLenght(FirstName, LastName)
-- fullNameLenght

go

SELECT dbo.fn_FullName(FirstName, LastName) FROM Employees

SELECT dbo.fn_EmployeeFullName(1)

SELECT dbo.fn_EmployeeFullName(Id) FROM dbo.Employees

Go
CREATE Function fn_FormatProductName(@code nvarchar(100), @name nvarchar(100), @price decimal(18,2))
RETURNS NVARCHAR(20)
AS 
BEGIN
	return Substring(@code, 2, 2) + '-' + RIGHT(@name, 3) + '-' + CAST(@price as nvarchar(18))
END

SELECT dbo.fn_FormatProductName(Code, Name, Price), * FROM Products

