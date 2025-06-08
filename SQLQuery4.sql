-- avg costs in each category

select
category,
avg(cost) avgprice
from gold.dim_products
group by category
order by avgprice
