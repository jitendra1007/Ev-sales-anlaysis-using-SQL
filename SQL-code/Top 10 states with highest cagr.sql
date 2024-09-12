# Top 10 states with highest compound annual growth rate for Fy 2022 to 2024
# CTE for Total vehicles sold in fy 2022 for each state
with sales_2022 as
(
	select 
		state, 
		sum(total_vehicles_sold) as Total_sales_2022
    from 
		electric_vehicle_sales_by_state
    where
		date between '2021-04-01' and '2022-03-01'
    group by 
		state
),
# CTE for Total vehicles sold in fy 2024 for each state
sales_2024 as
(
	select 
		state, 
		sum(total_vehicles_sold) as Total_sales_2024
    from 
		electric_vehicle_sales_by_state
    where
		date between '2023-04-01' and '2024-03-01'
    group by 
		state
)
# Top 10 states with highest cagr from 2022 to 2024
select
	s22.state, Total_sales_2022, Total_sales_2024,
	round((power((Total_sales_2024/Total_sales_2022),1/2) - 1) *100,2) as percent_CAGR 
from 
	sales_2022 as s22
join 
	sales_2024 as s24 on s22.state = s24.state
group by 
	s22.state, Total_sales_2022, Total_sales_2024
order by
	percent_cagr desc
limit 10;
