# Top 3 makers for fiscal year 2023
select 
	d.fiscal_year,m.maker,m.vehicle_category,sum(electric_vehicles_sold) as Total_Quantity_Sold
from 
	electric_vehicle_sales_by_makers m
join 
	dim_date d on m.date = d.date
where 
	d.fiscal_year = 2023 
and 
	m.vehicle_category = "2-Wheelers"
group by 
	d.fiscal_year,m.maker,m.vehicle_category
order by 
	Total_Quantity_Sold desc
limit 3;

# Top 3 makers for fiscal year 2024
select 
	d.fiscal_year,m.maker,m.vehicle_category,
	sum(electric_vehicles_sold) as Total_Quantity_Sold
from 
	electric_vehicle_sales_by_makers m
join 
	dim_date d on m.date = d.date
where 
	d.fiscal_year = 2024 
and 
	m.vehicle_category = "2-Wheelers"
group by 
	d.fiscal_year,m.maker,m.vehicle_category
order by 
	Total_Quantity_Sold desc
limit 3;

# Bottom 3 makers for fiscal year 2023
select 
	d.fiscal_year,m.maker,m.vehicle_category,
	sum(electric_vehicles_sold) as Total_Quantity_Sold
from 
	electric_vehicle_sales_by_makers m
join 
	dim_date d on m.date = d.date
where 
	d.fiscal_year = 2023 
and 
	m.vehicle_category = "2-Wheelers"
group by 
	d.fiscal_year,m.maker,m.vehicle_category
order by 
	Total_Quantity_Sold asc
limit 3;

# Bottom 3 makers for fiscal year 2024
select 
	d.fiscal_year,m.maker,m.vehicle_category,
	sum(electric_vehicles_sold) as Total_Quantity_Sold
from 
	electric_vehicle_sales_by_makers m
join 
	dim_date d on m.date = d.date
where 
	d.fiscal_year = 2024 
and 
	m.vehicle_category = "2-Wheelers"
group by 
	d.fiscal_year,m.maker,m.vehicle_category
order by 
	Total_Quantity_Sold asc
limit 3;
