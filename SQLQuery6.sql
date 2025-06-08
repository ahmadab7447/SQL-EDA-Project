-- distribution of sold items across countries

select
c.country,
sum(f.quantity) as total_items
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_id = f.customer_key
group by c.country
order by total_items










