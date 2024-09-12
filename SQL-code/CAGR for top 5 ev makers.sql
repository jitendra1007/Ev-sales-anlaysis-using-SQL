# CAGR (Compound annual growth rate) for top 5 ev makers in 4 wheelers category from FY2022 - FY2024
# Cte to extract top 5 ev makers 
with top_5_makers as
(
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
		limit 5) as sub_query
),
# Total sales for top 5 ev makers in 2022
ev_sales_2022 as
(
	select 
		t.maker, sum(m.electric_vehicles_sold) as Total_sales_2022
    from
		top_5_makers t
    join
		electric_vehicle_sales_by_makers m on t.maker = m.maker 
    where 
		date between '2021-04-01' and '2022-03-01'
    group by 
		t.maker
),
# Total sales for top 5 ev makers in 2024
ev_sales_2024 as
(
	select 
		t.maker, sum(m.electric_vehicles_sold) as Total_sales_2024
    from
		top_5_makers t
    join
		electric_vehicle_sales_by_makers m on t.maker = m.maker 
    where 
		date between '2023-04-01' and '2024-03-01'
    group by 
		t.maker
)
# Cagr for top 5 ev makers for FY 2022 to FY 2024
select 
	s22.maker, Total_sales_2022, Total_sales_2024,
	round((power((Total_sales_2024/Total_sales_2022),1/2) - 1) *100,2) as percent_CAGR 
from 
	ev_sales_2022 s22
join
	ev_sales_2024 s24 on s22.maker = s24.maker
group by 
	s22.maker, Total_sales_2022, Total_sales_2024;