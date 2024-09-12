# Peak and low season months for ev sales
# cte to calculate total sales for each month
with monthly_total_sales as
(
	select 
		DATE_FORMAT(date, '%M') AS month_name,
		sum(electric_vehicles_sold) as total_sales
    from
		electric_vehicle_sales_by_makers
    group by 
		month_name,
		MONTH(date)
	order by 
		MONTH(date)
)
# categorizing the months as peak and low month based on the average monthly sales

select
	month_name,total_sales,
	case when total_sales > (select avg(total_sales) from monthly_total_sales) then 'peak month'
	else 'low month' 
    end as season
from 
	monthly_total_sales
group by
	month_name,total_sales;

