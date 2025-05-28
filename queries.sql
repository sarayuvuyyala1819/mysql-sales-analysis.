-- Create Database and Use it
CREATE DATABASE company;
USE company;

-- View all records
SELECT * FROM sales;

-- Q1: Orders shipped via 'Economy' mode with amount > ₹25,000
SELECT * FROM sales
WHERE Ship_Mode = 'Economy' AND Total_Amount > 25000;

-- Q2: Technology sales in Ireland after 2020-01-01
SELECT * FROM sales
WHERE Category = 'Technology' AND Country = 'Ireland' AND Order_Date > '2020-01-01';

-- Q3: Top 10 profitable sales transactions
SELECT * FROM sales ORDER BY Total_Amount DESC LIMIT 10;

-- Q3.1: Next 10
SELECT * FROM sales ORDER BY Total_Amount DESC LIMIT 10, 20;

-- Q4: Customers whose name starts with 'J' and ends with 'n'
SELECT * FROM sales WHERE Customer_Name LIKE 'J%n' LIMIT 1000;

-- Q5: Products containing 'Acco'
SELECT * FROM sales WHERE Product_Name LIKE '%acco%' LIMIT 1000;

-- Q6: Top 5 cities with highest total sales
SELECT City, SUM(Total_Amount) AS total_sales
FROM sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;
