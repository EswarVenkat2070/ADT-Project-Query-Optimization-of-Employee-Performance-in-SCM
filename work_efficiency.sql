------------------- Follow up Milestone ------------------
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
