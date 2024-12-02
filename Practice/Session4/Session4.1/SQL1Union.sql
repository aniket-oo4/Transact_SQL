use Practice
select * from inserted
union 
select * from deleted

select convert(char(5),'hi') as Greeting
union all  -- without union it gives separate columns if we use union then it gives all data in one table
select convert(char(11),'hello there') as GreetingNow
union all     -- union all does not remove the duplicates in table 
select convert(char(11),'bonjour')
union-- all   -- just use union because we want to remove duplicates 
select CONVERT(char(11),'hi');

-- union -- does not take duplicate values |  union all takes duplcate values also 
-- for union allthe vales must be of same data type means within limit of highest datatype otherwise it throws :Conversion failed when converting the varchar value 'hi   ' to data type int.
-- column name is taken from first select statement 
-- and the data type of column is  the highest data type of the value inside the select statement 
-- for union number of columns in both tables also be same 

select convert(tinyint, 45) as Mycolumn
union
select convert(bigint, 456)    -- data type of column is bigint
--

select 4
union
select 'hi there'
--Conversion failed when converting the varchar value 'hi there' to data type int.

with ctemp as  -- temparary query 
(
select convert(tinyint, 45) as Mycolumn
union
select convert(bigint, 456) 
) 
select myColumn
into tbltemp   -- created new table 
from ctemp
select * from tbltemp