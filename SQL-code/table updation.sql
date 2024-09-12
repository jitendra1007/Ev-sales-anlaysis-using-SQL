# Modifying the date column of the dim_date table
#Creating the new date column
alter table dim_date
add column new_date Date;

# adding values to the new_date column
update dim_date
set new_date = str_to_date(date,'%d-%b-%y');

# Modifying the date column of the electric_vehicle_sales_by_makers table
#Creating the new date column
alter table electric_vehicle_sales_by_makers
add column new_date Date;

# adding values to the new_date column
update electric_vehicle_sales_by_makers
set new_date = str_to_date(date,'%d-%b-%y');

# Modifying the date column of the electric_vehicle_sales_by_states table
#Creating the new date column
alter table electric_vehicle_sales_by_state
add column new_date Date;

# adding values to the new_date column
update electric_vehicle_sales_by_state
set new_date = str_to_date(date,'%d-%b-%y');

# updating the 'Andaman and Nicobar' value as 'Andaman and Nicobar Island' for data consistency
update electric_vehicle_sales_by_state
set state = 'Andaman & Nicobar Island'
where state = 'Andaman & Nicobar';