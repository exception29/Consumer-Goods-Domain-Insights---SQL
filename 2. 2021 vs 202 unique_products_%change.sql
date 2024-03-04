/* 2. What is the percentage of unique product increase in 2021 vs. 2020? 
The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg **/

with unique_prod_2021 as
(
		select count(distinct product_code) as cnt_21
		from fact_sales_monthly 
		where fiscal_year = 2021
),
	unique_prod_2020 as
(
		select count(distinct product_code) as cnt_20
		from fact_sales_monthly 
		where fiscal_year = 2020
)
    select 
		cnt_20 as unique_products_2020,
        cnt_21 as unique_products_2021,
        round((cnt_21-cnt_20)*100/cnt_20, 2) as percentage_chg
	from unique_prod_2020, unique_prod_2021;

        
    


