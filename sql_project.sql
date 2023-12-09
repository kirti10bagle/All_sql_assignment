create database pizza_sales;
use pizza_sales;
drop database pizza_sales;
create table pizza_sale(
pizza_id int,
order_id int,
pizza_name_id varchar(100),
quantity int,
order_date date,
order_time time,
unit_price int,
pizza_size char(1),
pizza_category varchar(30),
pizza_ingredients varchar(100),
pizza_name varchar(100)
);
select * from pizza_sale;
drop table pizza_sale;
SELECT * FROM pizza_sales.pizza_sales_excel_filecsv;

-- 1. Total Revenue: The sum of the total price of all pizza orders
select round(sum(total_price),2) from  pizza_sales.pizza_sales_excel_filecsv;

-- 2. Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
select round(sum(total_price)/count(distinct(order_id)),2) from  pizza_sales.pizza_sales_excel_filecsv;

-- 3. Total Pizzas Sold: The sum of the quantities of all pizza sold.
select sum(quantity)  from  pizza_sales.pizza_sales_excel_filecsv;

-- 4. Total Orders: The total number of orders placed.
select count(distinct(order_id))as total_orders from  pizza_sales.pizza_sales_excel_filecsv;

-- 5. Average Pizza Per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total
-- number of orders
select round(sum(quantity)/count(distinct(order_id)),2) from  pizza_sales.pizza_sales_excel_filecsv;

