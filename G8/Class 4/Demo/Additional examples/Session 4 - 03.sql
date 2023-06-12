declare @Student table
(ID int, [Name] nvarchar(50), CollegeID int)

declare @College table
(ID int, [Name] nvarchar(50))

insert into @Student (ID, [Name], CollegeID)
values
	(1, 'Aco', 1)
,	(2, 'Bojan', 2)
,	(3, 'Cobe', 1)
,	(4, 'Darko', null)

insert into @College (ID, [Name])
values
	(1, 'MIT')
,	(2, 'Berkeley')
,	(3, 'Princeton')

select
	s.ID, s.[Name], c.[Name] as College
from
	@Student as s
	left outer join @College as c on s.CollegeID = c.ID

-- IS NULL
select
	s.ID, s.[Name], c.[Name] as College
from
	@Student as s
	left outer join @College as c on s.CollegeID = c.ID
where
	c.[Name] is null

-- IS NOT NULL
select
	s.ID, s.[Name], c.[Name] as College
from
	@Student as s
	left outer join @College as c on s.CollegeID = c.ID
where
	c.[Name] is not null

-- COALESCE, ISNULL
select
	s.ID, s.[Name], Coalesce(c.[Name], 'Empty String') as College_Coalesce, ISNULL(c.[Name], 'No Data') as College_IsNull, c.[Name] as CollegeName
from
	@Student as s
	left outer join @College as c on s.CollegeID = c.ID

-- NULLIF
select
	s.ID, NULLIF(s.[Name], 'Darko') as Student_NullIF, c.[Name] as College
from
	@Student as s
	left outer join @College as c on s.CollegeID = c.ID

declare @Table1 table
(Id int, Name nvarchar(20), CreatedDate date, ModifiedDate date)
INSERT INTO @Table1
SELECT 1, 'Test1', getdate(), NULL UNION
SELECT 2, 'Test2', getdate(), GETDATE()

select *, ISNULL(ModifiedDate, CreatedDate) from @Table1
where ISNULL(ModifiedDate, CreatedDate) >= '20210621'


