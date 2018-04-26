-- >---
-- >YamlDesc: CONTENT-ARTICLE
-- >Title: Oracle Datatypes
-- >MetaDescription: 'Oracle datatypes'
-- >MetaKeywords: 'Oracle data types int, number, varchar2, clob, blob, example code, tutorials'
-- >Author: Venkata Bhattaram / tinitiate.com
-- >ContentName: oracle-datatypes
-- >---

-- ># Data Types
-- >* They are the type of data that can be stored in Columns and variables
-- >* data such as String, number, date.

-- >## Numeric Datatypes
-- >* TYPE          MIN VALUE               MAX VALUE
-- >* INTEGER       -2147483648             2147483647
-- >*               0                       4294967295

-- >## Decimal Datatypes
-- >* TYPE          MIN VALUE                   MAX VALUE
-- >* NUMBER      -1.7976931348623157E+308     -2.2250738585072014E-308
-- >* FLOAT         2.2250738585072014E-308     1.7976931348623157E+308.
-- >* In the decimal data, the value before the point(.) is called character and the value after
-- >  the point(.) is the mantissa.
-- >* For example DECIMAL(7,3) = 9999.999
-- >* Total length is SEVEN (There are SEVEN 9's) and the POINT(.) is after the
-- >  4th character.

-- >## String Datatypes
-- >* TYPE                    VALUE OF M RANGE
-- >* CHAR(M)                 0 <= M <= 2000
-- >* NCHAR(M)                0 <= M <= 2000 [Unicode Supported]
-- >  The CHAR/NCHAR is fixed length, meaning if the value is less than the specified
-- >  length then SPACES are inserted upto the MAX specified length.
-- >* VARCHAR2(M)             0 <= M <= 32767 [Unicode Supported]
-- >* BLOB                    4 GB - 1 Bytes Binary Data
-- >* CLOB                    4 GB - 1 Bytes Text Data
-- >* NCLOB                   4 GB - 1 Bytes Text Data [Unicode Supported]
-- >* LONG                    2 GB - 1 Bytes Text Data
-- >* BFILE                   Locator for a Binary File outside DB
-- >* ROWID                   Base 64 string represents, unique address of a row in a table


-- >## Other Data Types
-- >* DATE TIMESTAMP, TIMESTAMP WITH TIME ZONE
-- >* JSON
-- >* XML