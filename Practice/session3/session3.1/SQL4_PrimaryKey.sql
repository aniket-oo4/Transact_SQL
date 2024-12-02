Alter table tblEmployee 
Add Constraint PK_tblEmployee PRIMARY KEY (EmployeeNumber)

-- compiler sorts the data acording to order of primary key if having primary key to the table
Select EmployeeNumber from tblEmployee

insert into tblEmployee
Values
(2004,'Firstname','midlname','lastname','govetidd','2010-12-12','Accounts');

/*
delete from tblEmployee
where EmployeeNumber=2004
*/
Alter table tblEmployee
Drop Constraint PK_tblEmployee 


create table tblEmployee2
(EmployeeNumber int Constraint PK_tblEmployee2 primary key IDENTITY(1,1),  -- identity automatically inserts the numbering start from 1 in frst column and adds 1  to that number for every row 
EmployeeName nvarchar (30));

insert into tblEmployee2
Values
('Accounts'),
('Accounts2');
select * from tblEmployee2

delete  from tblEmployee2

insert into tblEmployee2 -- it starts inserting number from previously inserted nubmber ie 4,5,6,
Values
('Accounts'),
('Accounts2');
select * from tblEmployee2

--if we add indentity to column we cannot able toadd the values for identity columns explicitlly 
insert into tblEmployee2 
Values
(3,'Accounts'),
(4,'Accounts2');

-- explicit value for the identity column in table 'tblEmployee2' can only be specified when a column list is used and IDENTITY_INSERT is ON.
--To insert values on that column do that

Set Identity_Insert  tblEmployee2 On    -- it will allow inputs on identty columns 

insert into tblEmployee2  (EmployeeNumber,EmployeeName)
Values
(34,'Accounts'),
(40,'Accounts2');
select * from tblEmployee2
Set Identity_Insert  tblEmployee2 Off


insert into tblEmployee2  
Values
('Accounts'),  -- insert directly 41 as identyty
('Accounts2'); --42 

select * from tblEmployee2

--for knowing current identyty check as follows 
select @@Identity  -- return current identity 42
select SCOPE_IDENTITY() ; ---- return current identity 42
select IDENT_CURRENT('dbo.tblEmployee2')  --42 


--scopeIdentity function only gives scopes identity while indent_current give specified indentity
create table tblEmployee3
(EmployeeNumber int Constraint PK_tblEmployee3 primary key IDENTITY(1,1), 
EmployeeName nvarchar (30));

insert into tblEmployee3 
Values
('Accounts'),  -- insert directly 41 as identyty
('Accounts2'); --42 
select @@Identity  -- return current identity2
select SCOPE_IDENTITY() ; ---- return current identity 2
select IDENT_CURRENT('dbo.tblEmployee2')  --42 

drop table tblEmployee2
drop table tblEmployee3