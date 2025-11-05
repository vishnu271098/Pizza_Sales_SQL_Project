# 🍕 Pizza Sales SQL Analysis Project

## 📌 Overview
This project explores a Pizza Sales dataset using **SQL queries** and **Power BI dashboards**.
The goal is to demonstrate analytical SQL skills — from basic aggregations to advanced window functions, ranking, and revenue analysis — and to visualize insights using **Power BI** for business decision-making.

The queries are divided into chapters (like tasks), and each one highlights different SQL concepts commonly used in real business analysis.

---

## 📂 Repository Structure
```
queries/                   # SQL scripts for each chapter
   chapter1_basic_queries.sql
   chapter2_advanced_queries.sql
   chapter3_revenue_analysis.sql
   chapter4_category_analysis.sql

dataset/
orders.csv                 # Orders table
order_details.csv          # Order details table
pizzas.csv                 # Pizzas table
pizza_types.csv            # Pizza types table

dashboard/                 # Power BI dashboard and visuals
   Pizza_Sales_Dashboard.pbix
   dashboard_preview.png
```

---

## 📝 Chapters & Tasks

### Chapter 1 — Basic Queries
- Total number of orders placed
- Total revenue from pizza sales
- Highest priced pizza
- Most common pizza size ordered

### Chapter 2 — Advanced Queries
- Top 5 most ordered pizza types by quantity
- Distribution of orders by hour
- Top 3 pizza types by revenue

### Chapter 3 — Revenue Analysis
- Percentage contribution of each pizza type to total revenue
- Cumulative revenue over time
- Top 3 pizza types by revenue for each category

### Chapter 4 — Category Analysis
- Total quantity ordered by pizza category
- Category-wise distribution of pizzas
- Average number of pizzas ordered per day

---

## 🚀 How to Run
1. Load the dataset into your SQL environment (e.g., MySQL, PostgreSQL, SQL Server, or SQLite).  
2. Open the `.sql` files in the `queries/` folder.  
3. Run the queries sequentially to reproduce the results.  
4. Optionally, save results into `results/` folder as `.csv` or view them directly in your SQL client.

---

## 📊 Skills Demonstrated
- Joins (INNER, LEFT)
- Aggregations (SUM, AVG, COUNT)
- Ranking with `RANK()` and `OVER()`
- Window functions
- CTEs (Common Table Expressions)
- Revenue & business KPIs

---

## 📊 Power BI Dashboard
The Power BI dashboard visualizes key sales insights derived from SQL queries.

**Highlights:**
- Total Revenue: ₹801.9K  
- Total Orders: 21.35K  
- Top Categories: Classic (30%), Chicken (24%), Supreme (23%)  
- KPIs: Average Pizza per Day, Highest Priced Pizza

---

<img width="959" height="538" alt="dashboard_preview" src="https://github.com/user-attachments/assets/c4274314-6895-4ac9-b2c0-d665b43a028a" />

---

## 🙋 About
Created by **Vishnu Elangovan** as a portfolio project to showcase SQL for data analysis.  
Feel free to explore, fork, or suggest improvements!
