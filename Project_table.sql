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
create table Product(Product_ID varchar(30) PRIMARY KEY, Item_Name varchar(30), Item_Info varchar(300))

select * 
from Product

create table Employee (Employee_ID varchar(30) PRIMARY KEY, Employee_Name varchar(100), Email varchar(100))

select * 
from Employee
EXEC sp_help 'dbo.Production'
create table Production(Produced_Date date, Product_ID varchar(30) FOREIGN KEY REFERENCES Product(Product_ID), Employee_ID varchar(30) FOREIGN KEY REFERENCES Employee(Employee_ID), Produced_Quantity int, Total_Quantity int, Work_hours int, PRIMARY KEY(Produced_Date,Product_ID,Employee_ID)) /*Composite Primary key */

select count(*) from Production

/* Import .csv production data file */
BULK INSERT dbo.Production
   FROM 'C:\Users\Vishal Jayaraman\Downloads\Production_Table.csv' WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n',FIRSTROW=2);

INSERT into Product(Product_ID, Item_Name, Item_Info) values(
        'a1001',
        'Donut',
        'A donut, also called doughnut, is a kind of fried dough confectionery. Donuts are typically ring shaped with a hole in the middle.'
    ),
   (
        'b1002',
        'Muffin',
        'A muffin is a chemically-leavened, batter-based bakery product where the formulation is somewhere in between a low-ratio cake and quick bread.'
    ),
	(
        'c1003',
        'Bagel',
        'bagel, doughnut-shaped yeast-leavened roll that is characterized by a crisp, shiny crust and a dense interior.'

    ),
	(
        'd1004',
        'Wraps',
        'A wrap is a food dish made with a soft flatbread rolled around a filling.'

    ),
	(
        'e1005',
        'Coffee',
        'Coffee is darkly colored, bitter, slightly acidic and has a stimulating effect in humans, primarily due to its caffeine content.'
    ),
	(
        'f1006',
        'Tea',
        'Tea is an aromatic beverage prepared by pouring hot or boiling water over cured or fresh leaves of Camellia sinensis, an evergreen shrub native to China and other East Asian countries.'
    ),
	(
        'g1007',
        'Potato Wedges',
        'Potato wedges are irregular wedge-shaped slices of potato, often large and unpeeled, that are either baked or fried. They are sold at diners and fast food restaurants. '
    ),
	(
        'h1008',
        'Hashbrown',
        'Boiled potatoes that have been diced or shredded, mixed with chopped onions and shortening, and fried usually until they form a browned cake.'
    ),
	(
        'i1009',
        'Cookies',
        'A cookie is a baked or cooked snack or dessert that is typically small, flat and sweet. It usually contains flour, sugar, egg, and some type of oil, fat, or butter.'
    ),
	(
        'j1010',
        'Soups',
        'Soup is a primarily liquid food, generally served warm or hot (but may be cool or cold), that is made by combining ingredients of meat or vegetables with stock, milk, or water.'
    )

	
INSERT into Employee(Employee_ID, Employee_Name, Email) values(
        '1001',
        'Dr. Ziad Kobti',
        'kobti@uwindsor.ca'
    ),
   (
        '1002',
        'Dr. Abedalrhman Alkhateeb',
        'alkhate@uwindsor.ca'
    ),
	(
        '1003',
        'Dr. Prashanth Cheluvasai Ranga',
        'Prashanth.CheluvasaiRanga@uwindsor.ca'
    ),
	(
        '1004',
        'Dr. Usama Mir',
        'Usama.Mir@uwindsor.ca'

    ),
	(
        '1005',
        'Dr. Kalyani Selvarajah',
        'Kalyani.Selvarajah@uwindsor.ca'
    ),
	(
        '1006',
        'Ms. Melissa Robinet',
        'Melissa.Robinet@uwindsor.ca'
    ),
	(
        '1007',
        'Dr. Shafaq Khan',
        'Shafaq.Khan@uwindsor.ca'
    ),
	(
        '1008',
        'Mr. Vishal Jayaraman',
        'jayaram3@uwindsor.ca'
    ),
	(
        '1009',
        'Mr. Eswaran Badrinarayanan Venkateswaran',
        'badrina@uwindsor.ca'
    ),
	(
        '1010',
        'Mr. Lakshmi Narayanan Shankar',
        'shankarl@uwindsor.ca'
    )

/* 
Work Efficiency calculation for a particular period
Produced_Quantity/Total_Quantity = 80/200 = 0.4 80 = x 
Produced_Quantity/Total_hrs per day = 80/8 = 10 prod per hr = y
*/