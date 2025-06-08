-- find total sales

select sum(sales_amount) as totalsales from gold.fact_sales

-- total quantity

select sum(quantity) as totalquantity from gold.fact_sales

-- avg price

select avg(price) as avgprice from  gold.fact_sales

-- TOTAL NUMBER OF ORDERS

SELECT count(order_number) as total_orders from gold.fact_sales

SELECT count(distinct order_number) as total_orders2 from gold.fact_sales

-- no of products


SELECT count(product_name) as total_prodcuts from gold.dim_products

SELECT count(distinct product_name) as total_products2 from gold.dim_products


-- total numbers of customers that placed an order

select count(distinct customer_key) as totalcustomers from gold.dim_customers