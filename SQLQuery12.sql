-- Analyase the yearly performance of products by comparing their sales
-- to both the average sales perfromance of product and pervious year sales



with yearly_product_sales as(
select
year(f.order_date) order_date,
p.product_name,
sum(f.sales_amount) sales
from
gold.fact_sales f
left join gold.dim_products p
on f.product_key = p.product_key
where order_date is not null
group by year(f.order_date), p.product_name
)

select 
order_date,
product_name,
sales,
avg(sales) over(partition by product_name) avgsales,
sales - avg(sales) over(partition by product_name) diffSales,
case when sales - avg(sales) over(partition by product_name) < 0 then 'below avg'
     when sales - avg(sales) over(partition by product_name)  > 0 then 'above avg'
	 else 'avg'


end avgChange,
lag(sales) over(partition by product_name order by order_date) pySales,
sales - lag(sales) over(partition by product_name order by order_date) diff_py
from yearly_product_sales
order by product_name , order_date