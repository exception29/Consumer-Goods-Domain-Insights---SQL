/* 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month.
 This analysis helps to get an idea of low and high-performing months and take strategic decisions.
 The final report contains these columns: Month Year Gross sales Amount
*/

select monthname(date) as month, year(date) as year, fiscal_year, sum(sold_quantity*gross_price) as gross_sales
from fact_sales_monthly 
join fact_gross_price
using (product_code, fiscal_year)
where customer_code in (select customer_code from dim_customer where customer = "Atliq Exclusive")
group by date; -- multiple customer_codes are there for Atiq exclusive so summing up for all of them in that month
