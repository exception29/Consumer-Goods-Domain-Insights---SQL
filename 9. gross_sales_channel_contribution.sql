/* 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
The final output contains these fields, channel gross_sales_mln percentage*/

with sales as
(
	select channel, round(sum(gross_price*sold_quantity/1000000), 2) as gross_sales_mln
	from fact_sales_monthly s
	join dim_customer c
	on s.customer_code = c.customer_code
	join fact_gross_price gp
	on gp.product_code = s.product_code 
	and gp.fiscal_year = s.fiscal_year
	where s.fiscal_year = 2021
	group by channel
)
select *, (gross_sales_mln)*100/sum(gross_sales_mln) over()  as percentage
from sales
order by percentage desc;

