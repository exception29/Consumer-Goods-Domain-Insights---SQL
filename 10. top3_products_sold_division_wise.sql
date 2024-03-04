/*10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
The final output contains these fields, division product_code product total_sold_quantity rank_order */

with sales as 
(
	select division, product_code, product, sum(sold_quantity) as total_quantity
	from fact_sales_monthly s
	join dim_product p
	using (product_code)
	where s.fiscal_year = 2021
	group by product_code
),
ranking as 
(
	select *, dense_rank() over(partition by division order by total_quantity desc) as rank_order from sales
)
select * from ranking where rank_order <4;
