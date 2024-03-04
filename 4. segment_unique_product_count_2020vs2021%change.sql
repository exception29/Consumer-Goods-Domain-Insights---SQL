/*Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
The final output contains these fields, segment product_count_2020 product_count_2021 difference*/

with seg_prod_20 as
(
	select segment, count(distinct product_code) as product_count
    from fact_sales_monthly
    join dim_product
    using (product_code)
    where fiscal_year = 2020
    group by segment
    order by product_count desc
),
	seg_prod_21 as
(
	select segment, count(distinct product_code) as product_count
    from fact_sales_monthly
    join dim_product
    using (product_code)
    where fiscal_year = 2021
    group by segment
    order by product_count desc

)
select 
	segment as segment, 
    p0.product_count as product_count_2020, 
    p1.product_count as product_count_2021,
    (p1.product_count - p0.product_count) as difference
    from seg_prod_20 p0
    join seg_prod_21 p1 
    using (segment)
    order by difference desc;
    