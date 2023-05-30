declare @counter int;
set @counter = 0;
declare @result nvarchar(2000);
set @result = 'Value of counter 0';

while(@counter < 25)
begin
	if(@counter % 2 = 0 and @counter != 0)
		set @result = @result + ', Value of counter ' + cast(@counter as nvarchar(2))
	set @counter = @counter + 1;
end

select @result;


declare @tableVariable table([name] nvarchar(20), age int);
insert into @tableVariable values ('Jovan', 25);

Create table #tempTable([name] nvarchar(20), age int)

SELECT FirstName + ' ' + LastName, YEAR(GETDATE()) - YEAR(DateOfBirth) From Employees
INSERT INTO #tempTable(Name,age)

SELECT * FROM #tempTable
drop table #tempTable

SELECT Replace(FirstName, 'An', 'B') FROM Employees
