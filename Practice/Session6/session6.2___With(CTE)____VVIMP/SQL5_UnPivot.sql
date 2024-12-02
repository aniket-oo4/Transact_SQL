with  myTable as 
(select year(DateOfTransaction) as TheYear, month (DateOfTransaction)  as TheMonth
,sum(amount) as Amount  from tblTransaction group by year(DateOfTransaction)  ,month (DateOfTransaction)  ) 
  Select  TheYear ,ISNULL([1],0)as 'january' ,  -- january
				   ISNULL([2],0)as [2] ,  -- fed
				   ISNULL([3],0)as [3] ,   --march
				   ISNULL([4],0)as [4] ,
				   ISNULL([5],0)as [5] ,
				   ISNULL([6],0)as [6] ,
				   ISNULL([7],0)as [7] ,
				   ISNULL([8],0)as [8] ,
				   ISNULL([9],0)as [9] ,
				   ISNULL([10],0)as [10] ,
				   ISNULL([11],0)as [11] ,
				   ISNULL([12],0)as [12] from myTable
	pivot(sum(amount)  for thEmonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS MYPIVOT
go
	-- storing pivot into a table 
	with  myTable as 
(select year(DateOfTransaction) as TheYear, month (DateOfTransaction)  as TheMonth
,sum(amount) as Amount  from tblTransaction group by year(DateOfTransaction)  ,month (DateOfTransaction)  ) 
  Select  TheYear ,ISNULL([1],0)as [1] ,  -- january
				   ISNULL([2],0)as [2] ,  -- fed
				   ISNULL([3],0)as [3] ,   --march
				   ISNULL([4],0)as [4] ,
				   ISNULL([5],0)as [5] ,
				   ISNULL([6],0)as [6] ,
				   ISNULL([7],0)as [7] ,
				   ISNULL([8],0)as [8] ,
				   ISNULL([9],0)as [9] ,
				   ISNULL([10],0)as [10] ,
				   ISNULL([11],0)as [11] ,
				   ISNULL([12],0)as [12]  into tblPivot from myTable
	pivot(sum(amount)  for thEmonth in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS MYPIVOT
	go
										
select * from tblPivot
go

-- unpivoting  the pivot table 
select * from tblPivot
unpivot (amount for month in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as TblUnpivot  
go
select * from tblPivot
unpivot (amount for month in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) as TblUnpivot  
where amount <> 0
go
									
	
