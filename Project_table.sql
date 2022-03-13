------------------- Follow up Milestone ------------------
/*
Team Details:
1. Eswaran Badrinarayanan Venkateswaran
2. Hani Pankajkumar Bhavsar
3. Vishal Jayaraman
*/
create database Employee_Performance
use Employee_Performance

Select * from sys.tables
create table Product(Product_ID varchar(30) PRIMARY KEY, Item_Name varchar(30), Item_Info varchar(30))

select * 
from Product

create table Employee (Employee_ID varchar(30) PRIMARY KEY, Employee_Name varchar(30), Email varchar(30))

select * 
from Employee
EXEC sp_help 'dbo.Production'
create table Production(Produced_Date date, Product_ID varchar(30) FOREIGN KEY REFERENCES Product(Product_ID), Employee_ID varchar(30) FOREIGN KEY REFERENCES Employee(Employee_ID), Produced_Quantity int, Total_Quantity int, Work_hours int, PRIMARY KEY(Produced_Date,Product_ID,Employee_ID)) /*Composite Primary key */

select * from Production


/* 
Work Efficiency calculation for a particular period
Produced_Quantity/Total_Quantity = 80/200 = 0.4 80 = x 
Produced_Quantity/Total_hrs per day = 80/8 = 10 prod per hr = y
*/