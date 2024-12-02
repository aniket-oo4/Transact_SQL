scalar values  == that returns only one ans ex min max etc
table values == that return multiple rows 


/*Deterministic functions always return the same result any time they're called with a specific set of input values and given the same state of the database. 

Nondeterministic functions may return different results each time they're called with a specific set of input values even if the database state that they access remains the same. 
For example, the function AVG always returns the same result given the qualifications stated above,
but the GETDATE function, which returns the current datetime value, always returns a different result.

*/

/*  The following built-in functions from categories of built-in functions other than string functions are always deterministic.
ABS
ACOS
ASIN
ATAN
ATN2
CEILING
COALESCE
COS
COT
DATALENGTH
DATEADD
DATEDIFF
DAY
DEGREES
EXP
FLOOR
ISNULL
ISNUMERIC
LOG
LOG10
MONTH
NULLIF
POWER
RADIANS
ROUND
SIGN
SIN
SQRT
SQUARE
TAN
YEAR
*/



/*
The following functions aren't always deterministic, but can be used in indexed views or indexes on computed columns when they're specified in a deterministic manner.

>>all aggregate functions  ::
             All aggregate functions are deterministic unless they're specified with the OVER and ORDER BY clauses. For a list of these functions, see Aggregate Functions (Transact-SQL).
>>CAST	  ::
      Deterministic unless used with datetime, smalldatetime, or sql_variant.
>>CONVERT	 ::
      Deterministic unless one of these conditions exists:
			Source type is sql_variant.
			Target type is sql_variant and its source type is nondeterministic.
					Source or target type is datetime or smalldatetime, the other source or target type is a character string, and a nondeterministic style is specified. To be deterministic, the style parameter must be a constant. Additionally, styles less than or equal to 100 are nondeterministic, except for styles 20 and 21. Styles greater than 100 are deterministic, except for styles 106, 107, 109 and 113.
>>CHECKSUM  ::
      	Deterministic, except for CHECKSUM(*).
>>ISDATE ::
      	Deterministic only if used with the CONVERT function, the CONVERT style parameter is specified and style is not equal to 0, 100, 9, or 109.
>>  RAND	 ::
      RAND is deterministic only when a seed parameter is specified.
*/


/*
The following built-in functions from other categories are always nondeterministic.

@@CONNECTIONS
@@CPU_BUSY
@@DBTS
@@IDLE
@@IO_BUSY
@@MAX_CONNECTIONS
@@PACKET_ERRORS
@@PACK_RECEIVED
@@PACK_SENT
@@TIMETICKS
@@TOTAL_ERRORS
@@TOTAL_READ
@@TOTAL_WRITE
AT TIME ZONE
CUME_DIST
CURRENT_TIMESTAMP
DENSE_RANK
FIRST_VALUE
FORMAT
GETDATE
GETUTCDATE
GET_TRANSMISSION_STATUS
LAG
LAST_VALUE
LEAD
MIN_ACTIVE_ROWVERSION
NEWID
NEWSEQUENTIALID
NEXT VALUE FOR
NTILE
PARSENAME
PERCENTILE_CONT
PERCENTILE_DISC
PERCENT_RANK
RAND
RANK
ROW_NUMBER
TEXTPTR


*/