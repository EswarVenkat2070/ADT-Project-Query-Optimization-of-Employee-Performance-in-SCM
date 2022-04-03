------------------- Final Milestone : Index Creation and Efficiency Calculation------------------
/*
Team Details:
1. Eswaran Badrinarayanan Venkateswaran
2. Hani Pankajkumar Bhavsar
3. Vishal Jayaraman
*/

--using Employee Performance database
use Employee_Performance

--list all the tables of the database
SELECT * FROM INFORMATION_SCHEMA.TABLES;
GO

--index created on Employee Table
CREATE INDEX index1 ON dbo.Employee (Employee_Name);

--index created on Product Table
CREATE INDEX index2 ON dbo.Product (Item_Name);

--checking index name, index keys and index description of the Product table
EXEC sp_helpindex 'dbo.Product'
GO

-- checking indexes on Product table
SELECT
 a.name AS Index_Name,
 OBJECT_NAME(a.object_id),
 COL_NAME(b.object_id,b.column_id) AS Column_Name,
 b.index_column_id,
 b.key_ordinal,
 b.is_included_column
FROM
 sys.indexes AS a
INNER JOIN
 sys.index_columns AS b
       ON a.object_id = b.object_id AND a.index_id = b.index_id
WHERE
        a.is_hypothetical = 0 AND
 a.object_id = OBJECT_ID('dbo.Product');

 --checking index name, index keys and index description of the Employee table
EXEC sp_helpindex 'dbo.Employee'
GO

 -- checking indexes on Employee table
 SELECT
 a.name AS Index_Name,
 OBJECT_NAME(a.object_id),
 COL_NAME(b.object_id,b.column_id) AS Column_Name,
 b.index_column_id,
 b.key_ordinal,
 b.is_included_column
FROM
 sys.indexes AS a
INNER JOIN
 sys.index_columns AS b
       ON a.object_id = b.object_id AND a.index_id = b.index_id
WHERE
        a.is_hypothetical = 0 AND
 a.object_id = OBJECT_ID('dbo.Employee');

 
/* 
Work Efficiency calculation for a particular period
Produced_Quantity/Total_Quantity = 80/200 = 0.4 80 = x 
c per day = 80/8 = 10 prod per hr = y
*/

-- this query calculates the work effeciency
SELECT CAST(Produced_Quantity AS DECIMAL(5,2))/Total_Quantity AS  'x' , Produced_Quantity/Work_hours AS 'Prod per hour (y)' FROM Production;


--checking the existing indexes on database
SELECT 
     TableName = t.name,
     IndexName = ind.name,
     IndexId = ind.index_id,
     ColumnId = ic.index_column_id,
     ColumnName = col.name,
     ind.*,
     ic.*,
     col.* 
FROM 
     sys.indexes ind 
INNER JOIN 
     sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
INNER JOIN 
     sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id 
INNER JOIN 
     sys.tables t ON ind.object_id = t.object_id 
WHERE 
     ind.is_primary_key = 0 
     AND ind.is_unique = 0 
     AND ind.is_unique_constraint = 0 
     AND t.is_ms_shipped = 0 
ORDER BY 
     t.name, ind.name, ind.index_id, ic.is_included_column, ic.key_ordinal;

-- creating non-clustered index on production table
CREATE INDEX DateIndex ON dbo.Production_Table (Produced_Date);

--renaming the employee table index
GO  
EXEC sp_rename N'Employee.index1', N'EmployeeNameIndex', N'INDEX';   
GO

--renaming the product table index
GO  
EXEC sp_rename N'Product.index2', N'ItemNameIndex', N'INDEX';   
GO

