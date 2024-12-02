select Department,EmployeeFirstName,A.EmployeeNumber,AttendanceMonth,NumberAttendance from 
tblEmployee as E 
join tblAttendance as A
on E.EmployeeNumber=A.EmployeeNumber
--group by Department,EmployeeFirstName,A.EmployeeNumber,AttendanceMonth,NumberAttendance
