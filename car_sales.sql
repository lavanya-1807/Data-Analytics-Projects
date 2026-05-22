CREATE TABLE car_sales (
    car_id VARCHAR(20),
    sale_date DATE,
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    annual_income INT,
    dealer_name VARCHAR(100),
    company VARCHAR(50),
    model VARCHAR(50),
    engine VARCHAR(50),
    transmission VARCHAR(20),
    color VARCHAR(30),
    price INT,
    dealer_no VARCHAR(30),
    body_style VARCHAR(30),
    phone VARCHAR(20),
    dealer_region VARCHAR(50)
);

ALTER TABLE car_sales 
ALTER COLUMN sale_date TYPE TEXT;

select * from car_sales;

# KPI CARDS
// TOTAL REVENUE

SELECT SUM(price) AS Total_revenue
FROM car_sales;

// TOTAL CAR SOLD

SELECT COUNT(car_id) FROM car_sales;

// AVERAGE PRICE

SELECT AVG(price) FROM car_sales;

// TOP SELLING COMPANY

SELECT company , COUNT(*) AS count_cmp
FROM car_sales
GROUP BY company 
ORDER BY count_cmp DESC
LIMIT 1;

//TOP REGION

SELECT dealer_region, SUM(price) AS PR FROM car_sales
GROUP BY dealer_region
ORDER BY PR DESC
LIMIT 1;

// HIGHEST SALE

SELECT MAX(price) FROM car_sales;

// TOTAL CUSTOMER

SELECT COUNT(DISTINCT(customer_name)) AS total_customer 
FROM car_sales;

// CHARTS

// SALES BY COMPANY

SELECT company , SUM(price) AS total_price
FROM car_sales
GROUP BY company
ORDER BY total_price;

// CUSTOMER PRICE COMAPRISON

SELECT 
    a.company,
    a.price AS price_1,
    b.price AS price_2
FROM car_sales a
JOIN car_sales b
ON a.company = b.company
AND a.dealer_region = b.dealer_region
AND a.car_id < b.car_id;

//SALES BY GENDER

SELECT gender, SUM(price) AS total_sales
FROM car_sales
GROUP BY gender;

// COLOR PRFERENCE 

SELECT color, COUNT(car_id) AS total_cars
FROM car_sales
GROUP BY color
ORDER BY total_cars DESC;

// TRANSMISSION ANALYSIS

SELECT transmission, COUNT(car_id) AS total_cars
FROM car_sales
GROUP BY transmission;

// MONTHLY SALES TRENDS

SELECT 
    TO_CHAR(sale_date, 'Mon') AS month,
    SUM(price) AS total_sales
FROM car_sales
GROUP BY month
ORDER BY MIN(sale_date);

// SALES BY BOBY STYLE

SELECT body_style, COUNT(car_id) AS total_cars
FROM car_sales
GROUP BY body_style
ORDER BY total_cars DESC;

// COUNT OF GENDER

SELECT gender , COUNT(car_id) FROM car_sales
GROUP BY gender;