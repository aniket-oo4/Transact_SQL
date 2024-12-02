select * from Employee
select * from Leaves
select count(*) from leaves

select E.emp_id,E.Emp_name ,L.leave_type ,L.totalLeaves Days,Format(L.ApplicationDate,'dd MMMM yyyy') AS ApplicationDate,Format(L.leave_dateFrom,'dd MMM yyyy') AS  startDate,Format(L.leave_dateTo,'dd MMM yyyy') AS endDate ,remark,status from Employee E
join Leaves L on L.emp_id=E.emp_id

SELECT FORMAT (getdate(), 'dd MMMM yyyy') as date

--Query	                                             Sample output
--SELECT FORMAT (getdate(), 'dd/MM/yyyy ') as date	21/03/2021
--SELECT FORMAT (getdate(), 'dd/MM/yyyy, hh:mm:ss ') as date	21/03/2021, 11:36:14
--SELECT FORMAT (getdate(), 'dddd, MMMM, yyyy') as date	Wednesday, March, 2021
--SELECT FORMAT (getdate(), 'MMM dd yyyy') as date	Mar 21 2021
--SELECT FORMAT (getdate(), 'MM.dd.yy') as date	03.21.21
--SELECT FORMAT (getdate(), 'MM-dd-yy') as date	03-21-21
--SELECT FORMAT (getdate(), 'hh:mm:ss tt') as date	11:36:14 AM
--SELECT FORMAT (getdate(), 'd','us') as date	03/21/2021
--SELECT FORMAT (getdate(), 'yyyy-MM-dd hh:mm:ss tt') as date	2021-03-21 11:36:14 AM
--SELECT FORMAT (getdate(), 'yyyy.MM.dd hh:mm:ss t') as date	2021.03.21 11:36:14 A
--SELECT FORMAT (getdate(), 'dddd, MMMM, yyyy','es-es') as date --Spanish	domingo, marzo, 2021
--SELECT FORMAT (getdate(), 'dddd dd, MMMM, yyyy','ja-jp') as date --Japanese	日曜日 21, 3月, 2021
--SELECT FORMAT (getdate(), 'MM-dd-yyyy ') as date	03-21-2021
--SELECT FORMAT (getdate(), 'MM dd yyyy ') as date	03 21 2021
--SELECT FORMAT (getdate(), 'yyyyMMdd') as date	20231011
--SELECT FORMAT (getdate(), 'HH:mm:dd') as time	11:36:14
--SELECT FORMAT (getdate(), 'HH:mm:dd.ffffff') as time	11:36:14.84000


--SELECT convert(varchar, getdate(), 100) -- mon dd yyyy hh:mmAM
--SELECT convert(varchar, getdate(), 101) -- mm/dd/yyyy – 10/02/2008              

--SELECT convert(varchar, getdate(), 102) -- yyyy.mm.dd – 2008.10.02           

--SELECT convert(varchar, getdate(), 103) -- dd/mm/yyyy

--SELECT convert(varchar, getdate(), 104) -- dd.mm.yyyy

--SELECT convert(varchar, getdate(), 105) -- dd-mm-yyyy

--SELECT convert(varchar, getdate(), 106) -- dd mon yyyy

--SELECT convert(varchar, getdate(), 107) -- mon dd, yyyy

--SELECT convert(varchar, getdate(), 108) -- hh:mm:ss

--SELECT convert(varchar, getdate(), 109) -- mon dd yyyy hh:mm:ss:mmmAM (or PM)

--SELECT convert(varchar, getdate(), 110) -- mm-dd-yyyy

--SELECT convert(varchar, getdate(), 111) -- yyyy/mm/dd

--SELECT convert(varchar, getdate(), 112) -- yyyymmdd

--SELECT convert(varchar, getdate(), 113) -- dd mon yyyy hh:mm:ss:mmm

--SELECT convert(varchar, getdate(), 114) -- hh:mm:ss:mmm(24h)

--SELECT convert(varchar, getdate(), 120) -- yyyy-mm-dd hh:mm:ss(24h)

--SELECT convert(varchar, getdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm

--SELECT convert(varchar, getdate(), 126) -- yyyy-mm-ddThh:mm:ss.mmm


