select * from tblEmployee where EmployeeMiddleName is null
-------------------------------------------------------------------
declare @myOption as varchar(10) = 'Option B'
select isnull(@myOption, 'No Option') as MyOptions  -- is null is a method wich accepts  only one value and the default value to provide user if the value is being null '
-- if @myOption is null then it provides 'No Option' if it is not null it provide its original values ='Option B'

go
-------------------------------------------------------------------
declare @myFirstOption as varchar(10) --= 'Option A'    --  do it null  - then check 
declare @mySecondOption as varchar(10)--= 'Option B'   -- do it  null and do optionA not null then check 
													-- other wise do both of them null then ceck 

select coalesce(@myFirstOption, @mySecondOption,'No Option default value') as MyOptions    -- coalesce () takes anu number of arguments it check each  in order if first argument is null thenn check second if second is null then third ,and lastly we can asiign default value to be return   if not then it will take null 
--                
go
------------------------------------------------------------------- 
select isnull('ABC',1) as MyAnswer   -- it gives first not null type   isnull works on different data types also as it accept only two argument
select isnull(null,1) as MyAnswer   -- it gives first not null type 

select coalesce('ABC',1) as MyOtherAnswer  -- it does not give this type of answer it throws 
--  Conversion failed when converting the varchar value 'ABC' to data type int. other wise iffirst one
select coalesce(1,'ABC') as MyOtherAnswer   -- coalesce will  work n multiple data types but it check limit of conversio or  all the other variables are null and one isnot null 
go

select isnull(null,null) as MyAnswer  -- it allow both null 
select coalesce(null,null) as MyOtherAnswer  -- it  mmustbe atleast one is expression 
select coalesce(null,null,8,null) as MyOtherAnswer   -- return not null one  
go

-- creating a talbe  
create table tblExample
(myOption nvarchar(10) null)
go
insert into tblExample (myOption)
values ('Option A')

-- creating table using Coalesce  -- it creates nullable column 
select coalesce(myOption, 'No option') as MyOptions
into tblIsCoalesce
from tblExample 

-- is null is used to check the (column)value is null or not 
select case when myOption is not null then myOption else 'No option' end as myOptions from tblExample 
go
-----------------------------------
--creating table using isnull  -- it creates not nullable columns 
select isnull(myOption, 'No option') as MyOptions
into tblIsNull
from tblExample 
go

drop table tblExample
drop table tblIsCoalesce
drop table tblIsNull
remember that    isnull()  and Is null is different 
isnull() is method 
 Is null is  used with where clause  to check only one value 