USE orders;

SELECT * FROM dominos_pizza_sales;

--describes the table schema
EXEC sp_columns dominos_pizza_sales;

--change data types
ALTER TABLE dominos_pizza_sales
ALTER COLUMN order_date DATE;

ALTER TABLE dominos_pizza_sales
ALTER COLUMN order_time TIME;

--checking for outliers
SELECT
	MAX(pizza_id) as max_pizza_id,
	MIN(pizza_id) as min_pizza_id,
	MAX(order_id) as max_order_id,
	MIN(order_id) as min_order_id,
	MAX(quantity) as max_quantity,
	MIN(quantity) as min_quantity,
	MAX(order_date) as max_order_date,
	MIN(order_date) as min_order_date,
	MAX(order_time) as max_time,
	MIN(order_time) as min_time,
	MAX(unit_price) as max_price,
	MIN(unit_price) as min_price
FROM 
	dominos_pizza_sales;

--Checking for nulls
SELECT *
FROM dominos_pizza_sales
WHERE pizza_id is null or order_id is null or pizza_name_id is null or quantity is null or order_date is null or order_time is null or unit_price is null
or total_price is null or pizza_size is null or pizza_category is null or pizza_ingredients is null or pizza_name is null;

--Checking for duplicates
SELECT pizza_id
FROM dominos_pizza_sales
GROUP BY
	pizza_id
HAVING COUNT(*)>1;

SELECT
	pizza_id,
	order_id,
	pizza_name_id,
	quantity,
	order_date,
	order_time,
	unit_price,
	pizza_size,
	pizza_category,
	pizza_ingredients,
	pizza_name
FROM 
	dominos_pizza_sales;

SELECT SUM(quantity * unit_price) as total_sales
FROM dominos_pizza_sales;