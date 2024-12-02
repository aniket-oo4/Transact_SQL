-- how to add history table to existing table

-- Altering Existing Table
alter table [dbo].[tbltransaction]  
add
ValidFrom datetime2(2) GENERATED ALWAYS AS ROW START   CONSTRAINT def_ValidFrom DEFAULT SYSUTCDATETIME()  -- defaultvalue for first time insertion  -- because both validfromand to is nonnullable columns 
, ValidTo datetime2(2) GENERATED ALWAYS AS ROW END CONSTRAINT def_ValidTo DEFAULT
  CONVERT(datetime2(2), '9999-12-31 23:59:59')
 , PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo) 

alter table dbo.tblEmployee
set (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tblEmployeeHistory2))


ALTER TABLE [dbo].tblEmployee SET ( SYSTEM_VERSIONING = OFF  )