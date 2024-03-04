select distinct region from dim_customer;	-- regions - APAC, NA, EU, LATAM
select distinct sub_zone from dim_customer; -- sub-regions - RA, NA, SA, LATAM
select distinct market from dim_customer;  -- countries - India, Spain, Japan, etc
select distinct customer from dim_customer; -- Croma , Flipkart, Amazon, Vijay Sales, etc

select distinct division from dim_product; -- PA(Peripheral & Acessories), PC(Personal Computers), NS(Network & Storage)
select distinct segment from dim_product; -- sub-section of division -- Peripheral, Acessories, LAptop, Desktop, Storage, Network
select distinct category from dim_product; -- keyboard, monitor, cases, cooling, laptop, desktop, SSD, hardisk, modem, switch
select distinct product from dim_product; -- product names
select distinct variant from dim_product; -- product variants - standard, premium, plus, etc