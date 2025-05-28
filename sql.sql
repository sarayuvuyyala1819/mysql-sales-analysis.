#IMPORT EXCEL/CSV FILE INTO MYSQL
#FILE Name: Sales
#Convert EXCEL file into CSV file
#On Schema TAB, Under Any Database, Right Click on TABLE & choose "Table Data Import Wizard"
#Browse (Choose) the file (Sales)
#NEXT NEXT NEXT NEXT NEXT
#FINZSH
#Refresh & see the table (CSV File) under the selected Database
create database company;
USE company;
-- Q1: Find all orders shipped via 'Economy' mode with a total amount greater than ₹25,000.
SELECT * FROM sales
WHERE Ship_Mode = 'Economy'
  AND Total_Amount > 25000;

-- Q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.
SELECT *
FROM sales
WHERE Category = 'Technology'
  AND Country = 'Ireland'
  AND Order_Date > '2020-01-01';

-- Q3: List the top 10 most profitable sales transactions in descending order.
USE company;
SELECT *
FROM sales
ORDER BY Total_Amount DESC
LIMIT 10;
# to check next 10 i.e 11-20 
USE company;
SELECT *
FROM sales
ORDER BY Total_Amount DESC
LIMIT 10,20;

-- Q4: Find all customers whose name starts with 'J' and ends with 'n'.
SELECT *
FROM sales
WHERE customer_name LIKE 'J%n'
LIMIT 1000;


-- Q5: Retrieve all product names that contain 'Acco' anywhere in the name.
SELECT *
FROM sales
WHERE Product_name LIKE '%acco%'
LIMIT 1000;


-- Q6: Get the top 5 cities with the highest total sales amount.
SELECT City, SUM(Total_Amount) AS total_sales
FROM sales
GROUP BY City
ORDER BY total_sales DESC
limit 5;

-- Q7: Display the second set of 10 records for Customer Name and Total Amount in decreasing order.
SELECT Customer_Name, Total_Amount
FROM sales
ORDER BY Total_Amount DESC
LIMIT 10 ,10;


-- Q8: Find the total revenue, average unit cost, and total number of orders.

-- Q9:count unique no of regions
SELECT 
count(distinct region )
FROM sales;


-- Q10:FIND the no.of.orders palced by each  customer
SELECT Customer_Name, COUNT(Order_ID) AS Order_Count
FROM Sales
GROUP BY Customer_Name
ORDER BY Order_Count DESC; 


-- Q12: Rank 5 products based on total sales using RANK().
SELECT Product_Name, Sum(Total_Amount) AS Total_Sales,
	RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Sales_Rank
from sales
GROUP BY Product_Name
LIMIT 5;