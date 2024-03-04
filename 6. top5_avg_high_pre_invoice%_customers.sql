/* 6. Generate a report which contains the top 5 customers 
who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
The final output contains these fields, customer_code customer average_discount_percentage */

with dct as
(
	select customer_code, avg(pre_invoice_discount_pct) as average_discount_percentage
    from fact_pre_invoice_deductions
	where fiscal_year = '2021'
	group by customer_code -- to get avg from all customers
),
cust AS
(	
	select customer_code, customer from dim_customer
	where market = 'India'
)
select customer_code, customer, round(average_discount_percentage, 4) as average_discount_percentage
from dct join cust
using (customer_code)
order by average_discount_percentage desc
limit 5 ;
