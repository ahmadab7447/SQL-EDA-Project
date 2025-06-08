-- which categories contribute to most of overall sales
with category_sales as (
select
category,
sum(sales_amount) totalsales
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by category
)
select 
category,
totalsales,
sum(totalsales) over() sumofSales,
concat(round((cast(totalsales as float) / sum(totalsales) over()) * 100,2),'%') percentofSales
from 
category_sales
