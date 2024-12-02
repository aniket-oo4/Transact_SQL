select E.EmployeeNumber, A.AttendanceMonth,
ROW_NUMBER()  as currentRow
from tblEmployee as E
join tblAttendance A
on E.EmployeeNumber=A.EmployeeNumber
--  Error The function 'ROW_NUMBER' must have an OVER clause.

select E.EmployeeNumber, A.AttendanceMonth,
ROW_NUMBER()   Over( ) as currentRow
from tblEmployee as E
join tblAttendance A
on E.EmployeeNumber=A.EmployeeNumber
--Error The function 'ROW_NUMBER' must have an OVER clause with ORDER BY.
----------------------------------------------------------------------------------------------------------
--over ()
select E.EmployeeNumber, A.AttendanceMonth,
ROW_NUMBER()   Over( order by E.Employeenumber,A.attendanceMonth) as currentRow
from tblEmployee as E
join tblAttendance A
on E.EmployeeNumber=A.EmployeeNumber

-- ordering takes  is takes time hence we can do as follows 
select * ,ROW_NUMBER() over(order by (select null)) from tblAttendance

--using partition by   it resets the row number according to partition 
select E.EmployeeNumber, A.AttendanceMonth,
ROW_NUMBER()   Over( partition by E.Employeenumber order by E.Employeenumber) as currentRow
from tblEmployee as E
join tblAttendance A
on E.EmployeeNumber=A.EmployeeNumber

-- ROW_NUMBER(partition by (optional) order by (mandatory) ) method gives the current row_number 
select E.EmployeeNumber, A.AttendanceMonth,
ROW_NUMBER()   Over( partition by E.Employeenumber order by E.Employeenumber,A.attendanceMonth) as currentRow,
Rank()   Over( partition by E.Employeenumber order by E.Employeenumber ) as Rankk,  -- add the orderby attendance month 
Dense_rank()   Over( partition by E.Employeenumber order by A.attendanceMonth) as DenseRank
from tblEmployee as E
join tblAttendance A
on E.EmployeeNumber=A.EmployeeNumber



-- when there is tie then result are
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
ROW_NUMBER() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheRowNumber,
RANK() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheRank,
DENSE_RANK() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheDenseRank
from tblEmployee as E join 
(Select * from tblAttendance union all select * from tblAttendance) as A
on E.EmployeeNumber = A.EmployeeNumber

-- Rank() -- method skips the number of ties  then goes to that number 
	-- if current row rank is 2 and there is 3 ties then  after that ties it goes to 5
-- dense_rank() does not skips the ties it goes to next number 
-- if current is 2 and there is 3 ties then after that ties it goes  to 3  for next not tied row 



---9. ROW_NUMBER, RANK and DENSE_RANK
select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
ROW_NUMBER() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheRowNumber,
RANK() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheRank,
DENSE_RANK() OVER(ORDER BY E.EmployeeNumber, A.AttendanceMonth) as TheDenseRank
from tblEmployee as E join 
(Select * from tblAttendance union all select * from tblAttendance) as A
on E.EmployeeNumber = A.EmployeeNumber

select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber
                  ORDER BY A.AttendanceMonth) as TheRowNumber,
RANK()       OVER(PARTITION BY E.EmployeeNumber
                  ORDER BY A.AttendanceMonth) as TheRank,
DENSE_RANK() OVER(PARTITION BY E.EmployeeNumber
                  ORDER BY A.AttendanceMonth) as TheDenseRank
from tblEmployee as E join 
(Select * from tblAttendance union all select * from tblAttendance) as A
on E.EmployeeNumber = A.EmployeeNumber

select *, row_number() over(order by (select null)) from tblAttendance