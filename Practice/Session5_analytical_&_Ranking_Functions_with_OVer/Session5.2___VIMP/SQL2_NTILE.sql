--10. NTILE
--  it divides each partition into 10 sub buckets with equally distributed rows

select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
ROW_NUMBER() OVER(partition by E.EmployeeNumber ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheRowNumber
from tblEmployee as E join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
-- there ar total 22 rows in first partition where employee number is 123
-----   we can divide this partition in sub 10 buckets then divide 22/10 =2 is quotient and 2 is remainder again distribute this remainder eequally to top rows 
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
ntile(10) OVER(partition by E.EmployeeNumber ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheTile
from tblEmployee as E join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber

--ntile(230) is the number of partitions 
-----------




select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
NTILE(10) OVER(PARTITION BY E.EmployeeNumber    --
          ORDER BY A.AttendanceMonth) as TheNTile,
convert(int,(ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber
                               ORDER BY A.AttendanceMonth)-1)
 / (count(*) OVER(PARTITION BY E.EmployeeNumber 
		          ORDER BY A.AttendanceMonth 
				  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)/10.0))+1 as MyNTile
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth <'2015-05-01'


select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
ntile(10) OVER(partition by E.EmployeeNumber ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheTile
from tblEmployee as E join tblAttendance A
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth <'20150501'