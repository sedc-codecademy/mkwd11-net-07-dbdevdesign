-- CAST, CONVERT

declare @dt datetime
set @dt = Getdate()

select
	'broj 20' as Str_Varchar
,	N'број 20' as Str_NVarchar
,	cast('20' as int) as Varchar_Cast_Int
,	cast(N'20' as int) as NVarchar_Cast_Int
,	convert(int, '20') as Varchar_Convert_Int
,	convert(int, N'20') as NVarchar_Convert_Int
,	@dt as Datetime_Default
,	convert(varchar(50), @dt, 103) as Datetime_Convert_Varchar	--dd.mm.yyyy