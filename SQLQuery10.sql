-- total sales each month

select 
datetrunc(month, order_date) as order_date,
sum(sales_amount) as total_sales
from gold.fact_sales
where order_date is not null
group by datetrunc(month, order_date)