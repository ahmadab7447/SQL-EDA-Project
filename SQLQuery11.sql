-- total sales each month and running total of sales
select
order_date,
total_sales,
sum(total_sales) over(partition by order_date order by order_date) running_total,
avg(avg_price) over( order by order_date) moving_avg
from(

select 
datetrunc(month, order_date) as order_date,
sum(sales_amount) as total_sales,
avg(price) avg_price
from gold.fact_sales
where order_date is not null
group by datetrunc(month, order_date) ) t








