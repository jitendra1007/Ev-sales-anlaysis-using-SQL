# quaterly trends for top 5 ev makers in 4 wheelers category
# Cte to represent top 5 makers
create temporary table top_5_evmakers
	select 
		maker
    from 
    (select 
		maker, sum(electric_vehicles_sold) as Total_sales
	from 
		electric_vehicle_sales_by_makers
    where 
		vehicle_category = '4-Wheelers'
    group by 
		maker
    order by 
		Total_sales Desc
    limit 5) as sub_query;

# Top 5 makers quaterly trends from 2022 to 2024
select 
	m.maker,m.vehicle_category,d.quarter, 
	sum(m.electric_vehicles_sold) as quantity_sold
from 
	electric_vehicle_sales_by_makers m
join 
	dim_date d on m.date = d.date
where 
	m.maker in (select * from top_5_evmakers) 
and 
	m.vehicle_category = '4-Wheelers'
group by 
	m.maker,m.vehicle_category,d.quarter
order by 
	m.maker,d.quarter;

# overall quaterly sales for top 5 ev makers from 2022 to 2024
select 
	m.vehicle_category,d.quarter, 
	sum(m.electric_vehicles_sold) as quantity_sold,
    (sum(m.electric_vehicles_sold) / (select sum(electric_vehicles_sold) 
    from 
    electric_vehicle_sales_by_makers
	where 
    vehicle_category = '4-wheelers' )) * 100 as percent_share 
from 
	electric_vehicle_sales_by_makers m
join 
	dim_date d on m.date = d.date
where 
	m.maker in (select * from top_5_evmakers) 
and 
	m.vehicle_category = '4-Wheelers'
group by 
	m.vehicle_category,d.quarter
order by 
	d.quarter;