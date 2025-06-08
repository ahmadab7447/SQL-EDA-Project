
-- revenue of each product
select 
p.product_name,
sum(f.sales_amount) total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name
order by total_revenue desc

-- top 5 product revenue
select top 5
p.product_name,
sum(f.sales_amount) total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name
order by total_revenue desc

-- top 5 worts product revenue

select top 5
p.product_name,
sum(f.sales_amount) total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name
order by total_revenue 


-- rank each product by revenue
select 
p.product_name,
sum(f.sales_amount) total_revenue,
ROW_NUMBER() over(order by sum(f.sales_amount)desc) as ranking
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name

-- another method for top 5 products
select *
from(
select 
p.product_name,
sum(f.sales_amount) total_revenue,
ROW_NUMBER() over(order by sum(f.sales_amount)desc) as ranking
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name)t
where ranking<=5