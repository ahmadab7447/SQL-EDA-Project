-- avg costs in each category

select
category,
avg(cost) avgprice
from gold.dim_products
group by category
order by avgprice

-- total revenue generated per category

select 
p.category,
sum(f.sales_amount) total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.category
order by total_revenue desc


--total revenue generated from each customer
select
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) total_revenue
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key = f.customer_key
group by 
c.customer_key,
c.first_name,
c.last_name
order by total_revenue desc
