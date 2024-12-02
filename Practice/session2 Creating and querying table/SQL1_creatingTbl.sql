drop table tblEmployee;
USE [Practice]
GO
create table tblEmployee
(
EmployeeNumber int not null,
EmployeeFirstName nvarchar(20) not null,
EmployeeMiddleName nvarchar(20) not null,
EmployeeLastName nvarchar(20) not null,
EmployeeGovernmentID char(10) unique null,
DateOfBirth date not null
);
select * from tblEmployee




