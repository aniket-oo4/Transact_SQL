--Creating and Dropping Temporal Table
CREATE TABLE [dbo].[tblEmployeeTemporal](
	[EmployeeNumber] [int] NOT NULL PRIMARY KEY CLUSTERED,
	[EmployeeFirstName] [varchar](50) NOT NULL,
	[EmployeeMiddleName] [varchar](50) NULL,
	[EmployeeLastName] [varchar](50) NOT NULL,
	[EmployeeGovernmentID] [char](10) NOT NULL,
	[DateOfBirth] [date] NOT NULL, [Department] [varchar](19) NULL
	, ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START -- HIDDEN
	, ValidTo datetime2(2) GENERATED ALWAYS AS ROW END -- HIDDEN
	, PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory))
GO

-- to make a temporal table we need toadd  these  additional fields   and the primary key column is must 
--, ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START -- HIDDEN
--	, ValidTo datetime2(2) GENERATED ALWAYS AS ROW END -- HIDDEN
--	, PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)
--  WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory))
--(HISTORY_TABLE = dbo.tblEmployeeHistory)   is optional it created another table at where the history stored 

INSERT INTO [dbo].[tblEmployeeTemporal]
	( [EmployeeNumber], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName]
    , [EmployeeGovernmentID], [DateOfBirth], [Department])
VALUES (123, 'Jane', NULL, 'Zwilling', 'AB123456G', '1985-01-01', 'Customer Relations'),
	(124, 'Carolyn', 'Andrea', 'Zimmerman', 'AB234578H', '1975-06-01', 'Commercial'),
	(125, 'Jane', NULL, 'Zabokritski', 'LUT778728T', '1977-12-09', 'Commercial'),
	(126, 'Ken', 'J', 'Yukish', 'PO201903O', '1969-12-27', 'HR'),
	(127, 'Terri', 'Lee', 'Yu', 'ZH206496W', '1986-11-14', 'Customer Relations'),
	(128, 'Roberto', NULL, 'Young', 'EH793082D', '1967-04-05', 'Customer Relations')


	select * from [tblEmployeeTemporal]

	update [tblEmployeeTemporal] set  EmployeeMiddleName='kaka' where EmployeeNumber =124;
		select * from [tblEmployeeTemporal]
		--when we update the temporal table then valid from is changed 
-- the table where it is saved the validFrom Is   previous changed date and valid to  next changed date is 
select * from [dbo].[tblEmployeeHistory] -- history tables 


Drop table [tblEmployeeTemporal]  -- error 
--1, Line 39
--Drop table operation failed on table 'Practice.dbo.tblEmployeeTemporal' because it is not a supported operation on system-versioned temporal tables


--- solution to delete the table 
ALTER TABLE [dbo].[tblEmployeeTemporal] SET ( SYSTEM_VERSIONING = OFF  )
DROP TABLE [dbo].[tblEmployeeTemporal]
DROP TABLE [dbo].[tblEmployeeHistory]