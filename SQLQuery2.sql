-- generate a report that show key metrics of bussiness


select 'Totalsales' as measure_name , sum(sales_amount) as totalsales from gold.fact_sales
union all 

select  'Totalquantity' as measure_name  ,sum(quantity) as totalquantity from gold.fact_sales
union all
select   'AvgPrice' as measure_name,avg(price) as avgprice from  gold.fact_sales
union all
SELECT  'TotalOrders' as measure_name,count(order_number) as total_orders from gold.fact_sales
