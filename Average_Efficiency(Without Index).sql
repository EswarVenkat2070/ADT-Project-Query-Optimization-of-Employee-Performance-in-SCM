use Employee_Performance


Update Employee SET Employee_Location = 'Ontario' where Employee_ID = 1001;
Update Employee SET Employee_Location = 'Quebec' where Employee_ID = 1002;
Update Employee SET Employee_Location = 'Alberta' where Employee_ID = 1003;
Update Employee SET Employee_Location = 'British Columbia' where Employee_ID = 1004;
Update Employee SET Employee_Location = 'Nova Scotia' where Employee_ID = 1005;
Update Employee SET Employee_Location = 'Alberta' where Employee_ID = 1006;
Update Employee SET Employee_Location = 'Ontario' where Employee_ID = 1007;
Update Employee SET Employee_Location = 'British Columbia' where Employee_ID = 1008;
Update Employee SET Employee_Location = 'Nova Scotia' where Employee_ID = 1009;
Update Employee SET Employee_Location = 'Alberta' where Employee_ID = 1010;




/* 
Work Efficiency calculation for a particular period
Produced_Quantity/Total_Quantity = 80/200 = 0.4 80 = x 
c per day = 80/8 = 10 prod per hr = y
*/
ALTER DATABASE Employee_Performance SET QUERY_STORE = ON
-- this query calculates the work efficiency
Create or alter view efficiency as SELECT Product.Item_Name,Employee_Name,Production.Produced_Date,Production.Product_ID,CAST(Produced_Quantity AS DECIMAL(5,2))*100/Total_Quantity AS  'Successful_Produced_Quantity' , CAST (Produced_Quantity As DECIMAL(5,1))/Work_hours As 'Product_per_hour' FROM Production INNER JOIN Employee ON Employee.Employee_ID=Production.Employee_ID inner join Product on Product.Product_ID = Production.Product_ID where Production.Produced_Date between '2019/03/01' and '2019/03/31';
select * from efficiency


Select * from Employee where Employee_Name like 'mR.%'
Select * from Production where Work_hours like 7 and Employee_ID like 1001
/*
Missing Index Details from Average_Efficiency(Without Index).sql - LAPTOP-FL539N3A.Employee_Performance (LAPTOP-FL539N3A\Vishal Jayaraman (92))
The Query Processor estimates that implementing the following index could improve the query cost by 65.0502%.
*/


USE [Employee_Performance]
GO
CREATE NONCLUSTERED INDEX employee_record
ON [dbo].[Production] ([Produced_Date])
INCLUDE ([Employee_ID],[Produced_Quantity],[Total_Quantity],[Work_hours])
GO

CREATE CLUSTERED INDEX employee_record
ON [dbo].[Production] ([Produced_Date],[Employee_ID],[Produced_Quantity],[Total_Quantity],[Work_hours])


Create or alter view Employee_Efficiency as select Employee.Employee_ID,Employee.Employee_Name,Product.Item_Name, avg(Successful_Produced_Quantity) as  Avg_Successful_Produced_Quantity, avg(Product_per_hour) as Avg_Product_per_hour from efficiency inner join Employee on efficiency.Employee_Name like Employee.Employee_Name inner join Product on Product.Product_ID = efficiency.Product_ID group by Employee.Employee_ID, Employee.Employee_Name, Product.Item_Name 
select * from Employee_Efficiency order by Employee_ID


/*
Missing Index Details from Average_Efficiency(Without Index).sql - LAPTOP-FL539N3A.Employee_Performance (LAPTOP-FL539N3A\Vishal Jayaraman (92))
The Query Processor estimates that implementing the following index could improve the query cost by 49.1937%.
*/


USE [Employee_Performance]
GO
CREATE NONCLUSTERED INDEX employee_record
ON [dbo].[Production] ([Produced_Date])
INCLUDE ([Product_ID],[Employee_ID],[Produced_Quantity],[Total_Quantity],[Work_hours])
GO












 /* Query Store - Test */
SELECT  qsq.query_id,
        qsqt.query_text_id,
        qsqt.query_sql_text
FROM    sys.query_store_query AS qsq
JOIN    sys.query_store_query_text AS qsqt
        ON qsqt.query_text_id = qsq.query_text_id;

SELECT  qsqt.query_sql_text,
        qsqt.statement_sql_handle,
        qsq.object_id,
        qsq.query_parameterization_type_desc,
        qsq.last_execution_time,
        qsq.count_compiles,
        qsq.avg_optimize_duration,
        qsq.avg_compile_duration
FROM    sys.query_store_query AS qsq
JOIN    sys.query_store_query_text AS qsqt
        ON qsqt.query_text_id = qsq.query_text_id;



ALTER TABLE Production ADD INDEX employee_record (Product_id)

drop index employee_record on Production

CREATE INDEX employee_record ON Production(Product_ID,Employee_ID,Produced_Date)

SELECT * FROM Production WITH(INDEX(employee_record))


Select Product_per_hour, Production.Produced_Date, Employee_Name from Production, efficiency where production.Produced_Date between '2019/03/01' and '2019/03/31';