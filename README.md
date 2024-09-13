# 🚗 Electric Vehicle (EV) Sales Analysis in India

### 📄 **Project Overview**
This project analyzes the sales data of electric vehicles (EVs) in India for the fiscal years 2022 to 2024. The goal is to derive key insights that will help **AtliQ Motors**, an automotive company, make data-driven decisions to expand its market share in India.

---

## 🔍 **Problem Statement**
AtliQ Motors, a leading EV manufacturer in North America, plans to expand into the Indian market where its market share is less than 2%. Before proceeding, AtliQ Motors requires a detailed analysis of the current EV market in India to understand the existing trends, top manufacturers, and state-wise EV penetration rates. This project aims to uncover those insights through data analysis.

---

## 🛠️ **Tools Used**
- **MySQL Workbench**: For querying and analyzing the EV sales data.
- **Microsoft Word**: For documenting the project report and SQL code.
- **PowerPoint**: For creating the project presentation to showcase key findings and recommendations.

---

## ⚙️ **Process**
1. **Database Creation**: A database named `ev_sales_data` was created to store three tables:  
   - `dim_date` (Date information)
   - `electric_vehicle_sales_by_makers` (Sales by manufacturer)
   - `electric_vehicle_sales_by_state` (State-wise sales)
   
2. **Data Cleaning**:  
   - Transformed the date column format for compatibility with MySQL.
   - Modified the fiscal year data type to ensure consistency.

3. **SQL Queries**:  
   The analysis was divided into 10 key questions, each answered by dedicated SQL queries, stored in the `SQL-code` folder:
   - Top and bottom EV makers by sales.
   - State-wise EV penetration rates.
   - Quarterly sales trends.
   - Forecasting EV sales for 2030 based on CAGR.
   
4. **Data Insights**:  
   - The results of the queries provide insights into market leaders, emerging trends, and areas of growth for AtliQ Motors to target in their expansion.

---

## 📊 **Key Insights**
- **Top 2-Wheeler Makers**: Ola Electric, Okinawa, and Hero Electric dominated the FY 2023 market, while Ola Electric, TVS, and Ather led FY 2024.
- **High Penetration States**: Goa, Kerala, and Karnataka were the leading states in EV penetration.
- **Projected Growth**: Maharashtra, Karnataka, and Gujarat are forecasted to lead in EV sales by 2030, driven by increasing consumer demand and favorable policies.

---

## ✅ **Conclusion**
This project provides valuable insights into the Indian EV market, highlighting key states and manufacturers with the highest potential for growth. **AtliQ Motors** can leverage these findings to make informed decisions about its expansion strategy in India. The analysis indicates that while 2-wheelers dominate the market, 4-wheelers show promising growth, making both segments vital for future success.

---

**P.S.**:  
Don't forget to check out the SQL queries in the [**SQL-code**](https://github.com/jitendra1007/Ev-sales-anlaysis-using-SQL/tree/main/SQL-code) folder to see how the analysis was performed. Also, you can view the full presentation with key insights and recommendations in the [**Presentation**](https://github.com/jitendra1007/Ev-sales-anlaysis-using-SQL/blob/main/project%20ppt.pdf) folder. These resources will give you a deeper understanding of the data analysis and strategic insights derived from this project.

---


