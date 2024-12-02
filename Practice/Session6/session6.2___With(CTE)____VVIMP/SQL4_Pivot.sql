
/*
pivot is just like a transpose of matrix 
it converts the roww into columns 
and columns into first row 

it can be done on any table not just by using with
*/

Select * from (select year(dateOftransaction) as TheYear ,month(dateOftransaction) as TheMonth,Amount 
from tblTransaction) as myTable
Pivot(sum(amount) for TheMonth in ([1],[2],[3],[4],[5],[6],[7])  ) as MyPivot
Order by TheYear 


-- which is also done by CTE as 

with  myTable as 
(select year(dateOftransaction) as TheYear ,month(dateOftransaction) as TheMonth,Amount 
from tblTransaction)


Select * from myTable
Pivot(sum(amount) for TheMonth in ([1],[2],[3],[4],[5],[6],[7])  ) as MyPivot
Order by TheYear               -- there are mentioned row numbers as column 

-- we can also abl to write multiple CTE's with single with thats why it isneed to break the problems into smaller parts 



---- 15. Replacing Nulls with Zeros in Pivot
with myTable as
(select year(DateOfTransaction) as TheYear, month(DateOfTransaction) as TheMonth, Amount from tblTransaction)

select TheYear, isnull([1],0) as [1], 
                isnull([2],0) as [2], 
				isnull([3],0) as [3],
				isnull([4],0) as [4],
				isnull([5],0) as [5],
				isnull([6],0) as [6],
				isnull([7],0) as [7],
				isnull([8],0) as [8],
				isnull([9],0) as [9],
				isnull([10],0) as [10],
				isnull([11],0) as [11],
				isnull([12],0) as [12] from myTable
PIVOT (sum(Amount) for TheMonth in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) as myPvt
ORDER BY TheYear 



--tip summarize the data before going to pivot 