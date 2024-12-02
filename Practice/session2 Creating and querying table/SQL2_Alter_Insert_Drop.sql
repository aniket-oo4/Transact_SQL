Alter table tblEmployee
add Department varchar(50);

select * from tblEmployee;

insert into tblEmployee 
	values
	(132,'shaya','kkaka','bhood','hccb908999','2000-07-25','consumer help');


insert into tblEmployee (EmployeeFirstName,EmployeeMiddleName,EmployeeLastName,EmployeeGovernmentID,DateOfBirth,Department,EmployeeNumber)
	values
	('haka','bukka','tukka','hccb908996','2000-08-25','consumer help',133);
Go

insert into tblEmployee 
	values
	(132,'shaya','kkaka','bhood','hccb908fg','2000-07-25','consumer help'),
	(133,'haka','bukka','tukka','hccb908sd6','2000-08-25','consumer help');

--deleting specific record 
delete  from tblEmployee
where EmployeeNumber=133
go
