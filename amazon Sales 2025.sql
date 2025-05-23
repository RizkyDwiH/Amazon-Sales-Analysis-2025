-- View basic structure of the dataset

SELECT * FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ];


-- Check for missing values in key columns

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Price IS NULL THEN 1 ELSE 0 END) AS null_prices,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS null_quantities,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS null_dates
FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ];


--Check unique categories and status types

SELECT DISTINCT Category FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ];
SELECT DISTINCT Status FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ];


-- Calculate total sales (if not already included)

SELECT 
    *, 
    (Price * Quantity) AS Total_Sales 
FROM  [Amazon Sales 2025].[dbo].[amazon_sales_data ];


-- Filter only 'Completed' orders

SELECT * 
FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ]
WHERE Status = 'Completed';


-- Total sales by product category

SELECT 
    Category, 
    SUM(Price * Quantity) AS Total_Sales
FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ]
WHERE Status = 'Completed'
GROUP BY Category
ORDER BY Total_Sales DESC;


-- Total monthly sales

SELECT 
    FORMAT(Date, 'yyyy-MM') AS Month,
    SUM(Price * Quantity) AS Monthly_Sales
FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ]
WHERE Status = 'Completed'
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY Month;


-- Top 10 best-selling products (by quantity sold)

SELECT 
    Product,
    SUM(Quantity) AS Total_Quantity
FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ]
WHERE Status = 'Completed'
GROUP BY Product
ORDER BY Total_Quantity DESC


-- Sales by payment method

SELECT 
    Payment_Method,
    COUNT(*) AS Order_Count,
    SUM(Price * Quantity) AS Total_Sales
FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ]
WHERE Status = 'Completed'
GROUP BY Payment_Method
ORDER BY Total_Sales DESC;


-- Sales by Customer_Location 

SELECT 
    Customer_Location,
    SUM(Price * Quantity) AS Total_Sales
FROM [Amazon Sales 2025].[dbo].[amazon_sales_data ]
WHERE Status = 'Completed'
GROUP BY Customer_Location
ORDER BY Total_Sales DESC;


