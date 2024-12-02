declare  @str as nvarchar(20)=N'helloΩΩ';

select left(@str,2) as llf2,RIGHT(@str,3) as rgt3
select SUBSTRING(@str,3,4) as midle3
select Replace(@str,'l','8') as replce
select UPPER(@str) as upr
select LOWER (@str) as lwr 
select trim(@str) as trm

declare @myvar as int
select @myvar+2 


-- joining multiple string into on1 
declare @firstname as nvarchar(20),@middlename as nvarchar(20),@lastname as nvarchar(20);
set @firstname='aniket'
--set @middlename='vijay'
set @lastname='varkhade'

select @firstname +' '+ @middlename +'  ' +@lastname  as name 
select @firstname +' '+iif( @middlename is null,'', @middlename+'  ') +@lastname  as name 

select @firstname +' '+case when  @middlename is null then ''else  @middlename+'  ' end  +@lastname  as name 

select @firstname +'  '+ coalesce(@middlename,' ')+'  '+@lastname as fullname

-- joining string to integer
select 'my string is '+convert(nchar(23),2343);
select 'my salary is :'+format(13422.2,'c','fr-FR')

