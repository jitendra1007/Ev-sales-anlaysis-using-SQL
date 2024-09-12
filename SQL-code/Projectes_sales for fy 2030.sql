# Projected number of ev sales for top 10 states by peneteration rates
# Finding top 10 states with the highest peneteration rate and storing it in cte
with top_10_states as
(
	select 
		state,
		round(sum(electric_vehicles_sold)/sum(total_vehicles_sold) * 100,2) as penetration_rate
    from 
		electric_vehicle_sales_by_state
    group by 
		state
    order by
		penetration_rate desc
    limit 10
),
# CTE for Total vehicles sold in fy 2022 for each state
sales_2022 as
(
	select 
		state, 
		sum(electric_vehicles_sold) as Total_sales_2022
    from 
		electric_vehicle_sales_by_state
    where
		date between '2021-04-01' and '2022-03-01'
    and 
		state in (select state from top_10_states)
    group by 
		state
),
# CTE for Total vehicles sold in fy 2024 for each state
sales_2024 as
(
	select 
		state, 
		sum(electric_vehicles_sold) as Total_sales_2024
    from 
		electric_vehicle_sales_by_state
    where
		date between '2023-04-01' and '2024-03-01'
    and 
		state in (select state from top_10_states)
    group by 
		state
),
# Getting the cagr for top 10 states
Cagr_top_10 as
(
	select
		s22.state,
		round((power((Total_sales_2024/Total_sales_2022),1/2) - 1) *100,2) as percent_CAGR 
	from 
		sales_2022 as s22
	join 
		sales_2024 as s24 on s22.state = s24.state
	group by 
		s22.state
)
# Projected ev sales for FY2030 base on cagr for fy 2022 to 2024
select 
	s24.state,
	round(s24.Total_sales_2024 + (6*(Total_sales_2024 * (c10.percent_cagr/100))),2) as Projected_sales_2030
from
	sales_2024 s24
join
	cagr_top_10 c10 on s24.state = c10.state;
