-- segment product into cast ranges and
-- count how many products fall into each segemnt 
with prodcut_segemnt as(
select
product_key ,
product_name 
cost ,
case when cost < 100 then 'Below 100'
     when cost between 100 and 500 then '100-500'
	 when cost between 500 and 1000 then '500-1000'
	 else 'above 1000'
end cost_range
from gold.dim_products
)

select
cost_range,
count(product_key) as total_products
from prodcut_segemnt
group by cost_range
order by total_products desc 