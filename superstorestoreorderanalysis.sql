use luffy;
/*Analyizing the data*/
select * from superstoreordersdataset
limit 5;

/* Overall view of superstore sales dataset 
Find all unique values for country, product_name, category, sub_category and year) 
Find the total sales, and total quantity sold 
Find the average profit, and discount */

select 
count(ï»¿order_id) as total_orders,
count(distinct country ) as total_countries,
count(distinct product_name) as total_products,
count(distinct category) as total_categories,
count(distinct sub_category) as total_subcategories,
count(distinct year) as total_years,
sum(sales) as total_sales,
sum(quantity) as quantity_sold,
round(avg(profit),2) as avgerage_of_profit,
round(avg(discount),2) as average_of_discount
from superstoreordersdataset;
-- sales performance analysis 
-- identify the top-selling products and categories
select 
product_name,
category,
sum(sales) as total_sales,
sum(quantity) as total_products_sold
from superstoreordersdataset
group by product_name , category
order by sum(sales) desc
limit 10;
-- sales over year
select 
year,
sum(sales) as total_sales
from superstoreordersdataset
group by year
order by sum(sales) desc;
-- customer segmentation 
select
segment,
customer_name,
sum(sales) as total_sales
from superstoreordersdataset
group by segment, customer_name
order by sum(sales) desc;
-- Shipping and order management 
select
ship_mode,
order_priority,
round(avg(shipping_cost),2) as average_cost,
round(avg(profit),2) as avegrage_profit
from superstoreordersdataset
group by ship_mode, order_priority
order by avg(profit) desc;
-- Time analysis
select ship_mode,
round(avg(ship_date)-avg(order_date),2) as Avg_time_gap
FROM superstoreordersdataset
group by ship_mode;
-- Profibility and cost analysis 
select 
product_name,
category,
sub_category,
round(avg(profit),2) as avg_profit,
round(avg(discount),2) as avg_discount
from superstoreordersdataset
group by product_name,category,sub_category
order by avg(profit) desc;
-- Global sales and quantity product overview 
-- The distribution of sales across different countries
-- The most sold products in each country
select
country,
sum(sales) as total_sales,
sum(quantity) as total_quantity
from superstoreordersdataset
group by country
order by sum(sales) desc;
-- State level categoty exploration 
select 
state,
product_name,
category,
sum(quantity) as quantity_sold
from superstoreordersdataset
group by state, product_name,category
order by sum(quantity) desc;
-- Regional Sub-Category Analysis
select 
region,
product_name,
category,
sub_category,
sum(quantity) as quantity_sold
from superstoreordersdataset
group by region,product_name,category,sub_category
order by sum(quantity) desc;