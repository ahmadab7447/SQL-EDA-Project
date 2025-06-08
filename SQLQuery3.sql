-- total customers per country

select
country,
count(customer_key) as total_customers
from gold.dim_customers
group by country
order by total_customers desc