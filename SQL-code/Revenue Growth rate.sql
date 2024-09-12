#  revenue growth rate of 4-wheeler and 2-wheelers EVs in India for 2022 vs 2024 and 2023 vs 2024
# cte for computing total revenue for 2022
with rev_2022 as
(
	select
		vehicle_category,
		case 
		when vehicle_category = '2-wheelers' then sum(electric_vehicles_sold) * 85000 
        else sum(electric_vehicles_sold) * 1500000
        end as Total_revenue_2022
    from
		electric_vehicle_sales_by_makers
    where
		date between '2021-04-01' and '2022-03-01'
    group by 
		vehicle_category
),
# cte for computing total revenue for 2023
rev_2023 as
(
	select
		vehicle_category,
    case 
		when vehicle_category = '2-wheelers' then sum(electric_vehicles_sold) * 85000 
        else sum(electric_vehicles_sold) * 1500000
        end as Total_revenue_2023
    from
		electric_vehicle_sales_by_makers
    where
		date between '2022-04-01' and '2023-03-01'
    group by 
		vehicle_category
),
# cte for computing total revenue for 2024
rev_2024 as
(
	select
		vehicle_category,
    case 
		when vehicle_category = '2-wheelers' then sum(electric_vehicles_sold) * 85000 
        else sum(electric_vehicles_sold) * 1500000
        end as Total_revenue_2024
    from
		electric_vehicle_sales_by_makers
    where
		date between '2023-04-01' and '2024-03-01'
    group by 
		vehicle_category
)
# Revenue growth rate for 2022 vs 2024 and 2023 vs 2024 grouped by vehicle category
select
	r22.vehicle_category,
	round(((r24.Total_revenue_2024 - r22.Total_revenue_2022)/r22.Total_revenue_2022) * 100,2) as revene_growth_rate_2022vs2024,
	round(((r24.Total_revenue_2024 - r23.Total_revenue_2023)/r23.Total_revenue_2023) * 100,2) as revene_growth_rate_2023vs2024
from
	rev_2022 r22
join
	rev_2024 r24 on r22.vehicle_category = r24.vehicle_category
join
	rev_2023 r23 on r23.vehicle_category = r24.vehicle_category
group by 
	r22.vehicle_category;
