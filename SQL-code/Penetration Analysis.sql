# Top 5 states with highest penetration rate for FY 2024 in 2 wheeler category
select 
	d.fiscal_year, s.state, s.vehicle_category,
	round(sum(s.electric_vehicles_sold)/sum(s.total_vehicles_sold) * 100,2) as penetration_rate
from 
	electric_vehicle_sales_by_state s
join 
	dim_date d on s.date = d.date
where 
	d.fiscal_year = 2024 
and 
	s.vehicle_category = "2-wheelers"
group by 
	d.fiscal_year,s.state,s.vehicle_category
order by 	
	penetration_rate desc
limit 5;

# Top 5 states with highest penetration rate for FY 2024 in 4 wheeler category
select 
	d.fiscal_year, s.state, s.vehicle_category,
	round(sum(s.electric_vehicles_sold)/sum(s.total_vehicles_sold) * 100,2) as penetration_rate
from 
	electric_vehicle_sales_by_state s
join 
	dim_date d on s.date = d.date
where 
	d.fiscal_year = 2024 
and 
	s.vehicle_category = "4-wheelers"
group by 
	d.fiscal_year,s.state,s.vehicle_category
order by 
	penetration_rate desc
limit 5;

# States with negative peneteration in ev sales from 2022 to 2024
# Cte creation for FY 2022 and FY 2024
with penetration_2022 as
(
	select 
		d.fiscal_year,s.state,s.vehicle_category,
		round(sum(s.electric_vehicles_sold)/sum(s.total_vehicles_sold) * 100,2) as penetration_rate_2022
	from 
		electric_vehicle_sales_by_state s
    join 
		dim_date d on s.date = d.date
	where 
		d.fiscal_year = 2022
	group by 
		s.state, s.vehicle_category
	order by
		s.state
),
penetration_2024 as
(	
	select 
		d.fiscal_year,s.state, s.vehicle_category,
		round(sum(s.electric_vehicles_sold)/sum(s.total_vehicles_sold) * 100,2) as penetration_rate_2024
	from 
		electric_vehicle_sales_by_state s
    join 
		dim_date d on s.date = d.date
	where 
		d.fiscal_year = 2024
	group by 
		d.fiscal_year,s.state,s.vehicle_category
	order by 
		s.state
)

# States with negative penetration
select 
	distinct(p22.state), p22.vehicle_category,
	(p24.penetration_rate_2024 - p22.penetration_rate_2022) as Change_in_peneteration
from 
	penetration_2022 p22
join 
	penetration_2024 p24 on p22.state = p24.state
    and 
    p22.vehicle_category = p24.vehicle_category
where 
	(p24.penetration_rate_2024 - p22.penetration_rate_2022) < 0;

	
