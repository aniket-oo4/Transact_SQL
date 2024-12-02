	declare @myvar AS numeric(7,2)=3
	Select POWER(@myvar,0.5) as powerr
	Select SQUARE(@myvar) as sqrrt
	Select SQUARE(@myvar) as sqrtt

SET @myvar=-3.7
select FLOOR(@myvar) as Floorr
select CEILING(@myvar) as ceil
select ROUND(@myvar,1) as roundd
go

select PI() as mypi
select EXP(2) as e
select abs(-12.343);
select sign(-12.343);

select Rand(5690);

-- casting of types 

select CONVERT(decimal(5,2),300);
select CONVERT(int,12.5453) + CONVERT(int,12.5453);
select cast(3 as decimal(5,2))


select system_type_id,column_id,floor(system_type_id/column_id) AS Calculation from sys.all_columns

select system_type_id,column_id,Convert(numeric(18,3),system_type_id/column_id) AS Calculation from sys.all_columns

select system_type_id,column_id,round(system_type_id/column_id,-1) AS Calculation from sys.all_columns
