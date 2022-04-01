use Employee_Performance
Select * from Employee

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

-- this query calculates the work efficiency
Create or alter view efficiency as SELECT Employee.Employee_Name,Production.Produced_Date,CAST(Produced_Quantity AS DECIMAL(5,2))*100/Total_Quantity AS  'Successful_Produced_Quantity' , CAST (Produced_Quantity As DECIMAL(5,1))/Work_hours As 'Product_per_hour' FROM Production INNER JOIN Employee ON Employee.Employee_ID=Production.Employee_ID where Production.Produced_Date between '2019/03/01' and '2019/03/31';
select * from efficiency
select Employee.Employee_ID,Employee.Employee_Name, avg(Successful_Produced_Quantity) as  Avg_Successful_Produced_Quantity, avg(Product_per_hour) as Avg_Product_per_hour from efficiency inner join Employee on efficiency.Employee_Name = Employee.Employee_Name group by Employee.Employee_ID, Employee.Employee_Name order by Employee.Employee_ID
 
