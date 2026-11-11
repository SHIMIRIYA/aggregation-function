create database PRODUTSS;
use PRODUTSS;
dROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(50),
    category      VARCHAR(30),
    brand         VARCHAR(30),
    price         INT,
    stock         INT,
    units_sold    INT,
    rating        DECIMAL(2,1),   -- can be NULL (not rated yet)
    discount      INT,            -- can be NULL (no discount)
    added_date    DATE
);

INSERT INTO products (product_id, product_name, category, brand, price, stock, units_sold, rating, discount, added_date) VALUES
(1,  'Smartphone X1',        'Electronics', 'Samsung',  25000, 40,  320, 4.5, 2000, '2024-01-10'),
(2,  'Smartphone Pro',       'Electronics', 'Apple',    75000, 15,  210, 4.8, NULL, '2024-02-15'),
(3,  'Laptop Air',           'Electronics', 'Dell',     55000, 25,  140, 4.4, 3000, '2023-11-20'),
(4,  'Wireless Earbuds',     'Electronics', 'Sony',     6000,  80,  560, 4.3, 500,  '2024-03-05'),
(5,  'Smart TV 43 inch',     'Electronics', 'LG',       32000, 18,  95,  4.6, NULL, '2023-12-12'),
(6,  'Running Shoes',        'Footwear',    'Nike',     5500,  60,  430, 4.4, 600,  '2024-01-25'),
(7,  'Casual Sneakers',      'Footwear',    'Adidas',   4500,  70,  380, 4.2, NULL, '2024-04-10'),
(8,  'Leather Sandals',      'Footwear',    'Bata',     1800,  90,  250, 3.9, 200,  '2023-10-18'),
(9,  'Cotton T-Shirt',       'Clothing',    'Levis',    1200,  150, 900, 4.1, NULL, '2024-02-02'),
(10, 'Denim Jeans',          'Clothing',    'Levis',    3200,  100, 610, 4.3, 400,  '2024-03-18'),
(11, 'Formal Shirt',         'Clothing',    'Raymond',  2500,  75,  340, NULL,NULL, '2024-06-21'),
(12, 'Winter Jacket',        'Clothing',    'Puma',     4800,  30,  120, 4.0, 500,  '2023-09-09'),
(13, 'Mixer Grinder',        'Appliances',  'Philips',  4200,  45,  275, 4.5, NULL, '2024-01-30'),
(14, 'Air Fryer',            'Appliances',  'Philips',  7500,  20,  180, 4.7, 800,  '2024-05-14'),
(15, 'Microwave Oven',       'Appliances',  'IFB',      12000, 22,  130, 4.3, NULL, '2023-12-28'),
(16, 'Water Purifier',       'Appliances',  'Kent',     14500, 17,  105, NULL,NULL, '2024-07-08'),
(17, 'Notebook Pack',        'Stationery',  'Classmate',350,   300, 1500,4.0, 50,   '2024-04-22'),
(18, 'Gel Pen Set',          'Stationery',  'Reynolds', 180,   400, 2100,3.8, NULL, '2024-05-30'),
(19, 'Backpack',             'Accessories', 'Wildcraft',2800,  55,  420, 4.4, 300,  '2024-02-26'),
(20, 'Smart Watch',          'Accessories', 'Noise',    3500,  65,  480, 4.1, NULL, '2024-06-03');

-- Quick check
SELECT * FROM products;

-- Questions For Aggregation fumction

-- 1 
select count(*) 
from products;
-- 2
select min(price),max(price) 
from products;
-- 3
select sum(stock),avg(price)
 from products;
-- 4
select count(rating) as rating_available,
count(*)-count(rating) as rating_not_available
from products;
select * from products;
-- 5
select avg(rating) from products;
-- 6
select * from products;
select sum(units_sold) from products;
-- 7
select sum(discount) from products;
-- 8 
select  count(*)from products where category = 'Electronics';
-- 9
select avg(price) from products where category='Clothing';
-- 10
select Max(rating) from products where brand in('philips','levis');
-- 11
SELECT SUM(units_sold)
FROM products
WHERE price BETWEEN 2000 AND 10000;
-- 12
select count(*) from products where discount=0;
-- 13
select sum(stock) from products where Product_name Like '%smart%';
-- 14
SELECT MIN(added_date), MAX(added_date)
FROM products
WHERE added_date > '2024-01-01';
-- 15
SELECT SUM(stock)
FROM products
WHERE category NOT IN ('Stationery', 'Accessories');
-- 16
SELECT
COUNT(DISTINCT brand),
COUNT(DISTINCT category)
FROM products;
-- 17
SELECT SUM(price * units_sold)
FROM products;
-- 18
SELECT AVG(price)
FROM products
WHERE rating > 4.3
AND stock < 50;
-- 19
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;
-- 20
SELECT SUM(units_sold)
FROM (
    SELECT units_sold
    FROM products
    ORDER BY price ASC
    LIMIT 3
) AS cheapest_products;