# Comparing Delhi and karnataka ev_sales and penetration rates on monthly basis
select 
	s.date,d.fiscal_year,s.state,
	sum(electric_vehicles_sold) as ev_sales,
	round(sum(s.electric_vehicles_sold)/sum(s.total_vehicles_sold) * 100,2) as penetration_rate
from 
	electric_vehicle_sales_by_state s
join 
	dim_date d on s.date = d.date
where
	s.state in ("Delhi","Karnataka")
and
	d.fiscal_year = 2024
group by
	s.date,d.fiscal_year,s.state;

# Delhi and karnataka ev_sales and penetration rates for full year
select 
	state, 
    sum(electric_vehicles_sold) as Total_ev_sales,
    round(sum(electric_vehicles_sold)/sum(total_vehicles_sold) * 100,2) as penetration_rate
from 
	electric_vehicle_sales_by_state
where
	date between '2023-04-01' and '2024-03-01'
and 
	state in ('Delhi','Karnataka')
group by
	state;