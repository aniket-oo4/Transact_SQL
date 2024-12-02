/*
declare @myDateTime As datetime='2024-07-09 12:34:33.124'
select @myDateTime
select YEAR(@myDateTime);
select month(@myDateTime);
select day(@myDateTime);
*/
select Current_timestamp as rgithow
select GETDATE() as rgithow
select SYSDATETIME() as rgithow
select DATEADD(YEAR,2, GETDATE()) as mydyear
select DATENAME(weekday,getdate()) as daye
select DATEPART(HOUR, SYSDATETIME()) as myhour
select DATEDIFF(month,'2004-06-04 01:00:00',getdate()) as months

select SYSDATETIME() as ofee

-- string conversion
select 'todays date was  '+ CONVERT(nvarchar(20),getdate())

select convert(datetime,'Jul  9 2024  4:37PM') as datetm
select parse('Jul  9 2024  4:37PM' as datetime) as datetm

select format(cast ('Jul  9 2024  4:37PM'as datetime),'D') as myFormat
select format(cast ('Jul  9 2024  4:37PM'as datetime),'d') as myFormat
select format(cast ('Jul  9 2024  4:37PM'as datetime),'y') as myFormat
select format(cast ('Jul  9 2024  4:37PM'as datetime),'m') as myFormat
select format(cast ('Jul  9 2024  4:37PM'as datetime),'dd-MM-yy') as myFormat
