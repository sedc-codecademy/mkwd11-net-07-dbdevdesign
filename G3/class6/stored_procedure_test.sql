CREATE OR ALTER PROCEDURE spTest(@firstName nvarchar(100) = 'Jovan', @lastName nvarchar(100) = 'Gjorgjiev')
AS
BEGIN
	select @firstName;
	select @lastName;
	select 1;
END
Go

exec spTest 'Jovan', 'Gjorgjiev'

exec spTest @lastName = 'Petkovski', @firstName = 'Petko'

exec spTest

declare @result int;

exec @result = spTest

select @result as result;