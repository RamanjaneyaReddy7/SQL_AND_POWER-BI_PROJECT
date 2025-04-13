create database Project
use Project
select*from Additional
select*from data
--combining additional table and data table and 
--creating new_table as sales
select * into sales_table from Additional
union all
select*from data
----
select*from sales_table
select*from customers
-- combining sales table and customers table on common-column 'Customer_Code' using inner join and 
-- creating new_table as Merge_Data
select sales_table.Date,
sales_table.Sales_Rep,
sales_table.Customer_Code,
sales_table.Sales,
sales_table.Profit,
sales_table.Region,
customers.Customer,
customers.Association_Date
into Combined_Data from sales_table
inner join customers
on sales_table.Customer_Code=customers.Customer_Code
----
select*from Combined_Data
----
--finding highest_sales with respect to Sales_Rep and Region from Merge_Data 
-- creating new_tables as High_Sales 
select Sales_Rep,Region,max(Sales) as Highest_Sales
into High_Sales
from Combined_Data
group by Region,Sales_Rep
----
select*from High_Sales
----
--finding Sales_Rep,Region,Sales and profit from Merge_Data
-- storeing the values into Table3
select Sales_Rep,Region,Sales,profit
into Combined_table
from Combined_Data
----
select*from Combined_table
----
--finding max,min,average and sum of the sales and profit 
--by Sales_Rep,Region,Customer from Merge_Data
-- with any two Sales_Rep and storing the values in Table4.
select  Sales_Rep,Region,Customer,
min(Sales)as Min_Sales,max(Sales) as Max_sales,
avg(Sales)as Avg_Sales,sum(Sales)as Sum_Sales,
min(profit)as Min_Profit,max(profit)as max_Profit,
avg(profit) as Average_Profit,sum(profit)as Sum_Profit
into Combined_table1 from Combined_Data
where Sales_Rep in('Rajat','Bruce')
group by Sales_Rep,Region,Customer
----
select*from Combined_table1
