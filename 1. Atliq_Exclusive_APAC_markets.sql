-- 1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

select distinct market
from dim_customer
where region = "APAC" and customer = "Atliq Exclusive"
order by market;
    
      -- OR 
      
select market
from dim_customer
where region = "APAC" and customer = "Atliq Exclusive"
group by market  	-- since many Atliq Exclusive stores can be in same market but we want the market name once only
order by market;

