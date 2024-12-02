select *, Row_Number() over(order by (select null)) % 3 as ShouldIDelete
--into tblTransactionNew  --created new tble 
from tblTransaction
-- Row_Nmber() method gives a current number of row ie 1,2,3,4,etc
-- lecture  115

delete from tblTransactionNew
where ShouldIDelete = 1  --- deleted rows whose modulous is 1 

update tblTransactionNew
set DateOfTransaction = dateadd(day,1,DateOfTransaction)
Where ShouldIDelete = 2  -- updated values 

alter table tblTransactionNew  
drop column ShouldIDelete  -- droping the column to do union 

select * from tblTransaction -- 2486 rows  -- tbl 1
--union all  -- if we  union all then we get total 4158 rows   it gives  all of tbl1 and tbl2 with duplicates
-- union  -- if we just union then it removes duplicates  and adds different rows from another table  3327 rows    --it gives all of tbl1 and tbl2 without dulication 
--except    --  except   only gives the  unmatching  rows  of first table  1664  and  all the matching rows  --only of tbl1 except matching one 
intersect  -- intersect gives the values that are in the both tables   -values which in tbl1 and tbl2 matched 
select * from tblTransactionNew -- 1663 rows, 832 changed rows, 831 unchanged   --tbl2
order by EmployeeNumber

-- check the quiz you will get all the idea about all those easily 