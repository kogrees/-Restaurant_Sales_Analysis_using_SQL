# 🍽️ Restaurant Sales Analysis Using SQL

An SQL-based data analytics project focused on analyzing restaurant sales, customer behavior, revenue trends, and menu performance using real-world restaurant order data.

The analysis was performed using SQL Server Management Studio (SSMS) connected with Visual Studio Code. Query outputs and insights were later visualized with the help of ChatGPT-generated graphs and charts.

---

# ✨ Technologies Used

* SQL
* SQL Server Management Studio (SSMS)
* Visual Studio Code
* Git & GitHub
* CSV Dataset

---

# 🚀 Features

* SQL-driven business analysis
* Revenue and sales trend exploration
* Restaurant performance comparison
* Customer ordering behavior analysis
* Menu item popularity tracking
* Query-based business problem solving
* Data aggregation and JOIN operations
* ChatGPT-generated visualizations from SQL outputs

---

# 📍 The Process

I wanted to create a project that focused more on solving real business questions using SQL rather than only building dashboards. The goal was to understand restaurant sales data and extract meaningful insights from raw datasets.

I imported multiple restaurant-related datasets into SQL Server and connected SSMS with VS Code to write and execute queries. Each SQL file from Q1 to Q10 explores different business problems related to revenue, customer behavior, restaurants, and menu items.

After generating insights from SQL queries, I used ChatGPT to help visualize the outputs into graphs and charts for better presentation and storytelling.

This project helped me improve my SQL skills, analytical thinking, and understanding of how businesses use data to make decisions.

---

# 🎯 Questions Solved Through SQL Analysis

* Which restaurants generate the highest revenue?
* What are the top-selling menu items?
* Which days and times receive the most orders?
* Which customers place the most orders?
* Is revenue concentrated among a few restaurants/items?
* What are the busiest ordering periods?
* Which menu categories perform the best?
* What trends can be identified from customer orders?

---

# 📊 Key Insights

* Certain restaurants contributed a major portion of total revenue
* A small number of menu items generated most sales
* Peak ordering times were concentrated during specific hours
* Customer ordering behavior showed repeat purchase patterns
* Revenue distribution highlighted business concentration trends

---

# 🧠 What I Learned

* Writing complex SQL queries using CTEs and JOINs
* Using aggregate functions for business analysis
* Structuring analytical SQL projects properly
* Solving real-world business problems with SQL
* Translating raw data into meaningful insights
* Improving analytical and problem-solving skills

---

# 📂 Dataset Tables

* customers_medium
* orders_medium
* order_items
* restaurants
* restaurants_name
* menu_items
* menu_items_name

---

# 📁 Project Structure

* Q1.sql → Revenue analysis
* Q2.sql → Restaurant performance insights
* Q3.sql → Customer behavior analysis
* Q4.sql → Menu item analysis
* Q5.sql → Sales trend exploration
* Q6–Q10.sql → Additional business insights and analysis

---

# 🚦 Running the Project

1. Import the CSV datasets into SQL Server
2. Open the SQL files in VS Code or SSMS
3. Run each query individually
4. Analyze the outputs and generated insights
5. Use the query results for visualization or reporting

---

# 💡 Skills Demonstrated

* SQL Querying
* JOIN Operations
* Common Table Expressions (CTEs)
* Data Aggregation
* Business Analysis
* Data Exploration
* Problem Solving
* Analytical Thinking
* Data Storytelling

---

# 🎞️ Analysis

Each query for this project focused on solving real-world restaurant business problems using SQL. The goal was to analyze restaurant sales, customer behavior, ordering patterns, and revenue trends to uncover actionable insights.

---

### 1. Top Performing Restaurants by Revenue

To identify the restaurants generating the highest revenue, I joined order data with restaurant datasets and calculated total revenue using menu item prices and quantities sold.

```sql
SELECT 
    restaurants.restaurant_id,
    SUM(menu_items.price * order_items.quantity) AS total_revenue
FROM order_items
JOIN orders_medium
    ON order_items.order_id = orders_medium.order_id
JOIN menu_items
    ON order_items.menu_item_id = menu_items.menu_item_id
JOIN restaurants
    ON orders_medium.restaurant_id = restaurants.restaurant_id
GROUP BY restaurants.restaurant_id
ORDER BY total_revenue DESC;
```

Here's the breakdown of the top-performing restaurants:

* **Street Spice Corner** generated the highest revenue among all restaurants, making it the strongest overall performer.
* **The Tasty Table** and **Sizzling Bites** also contributed significantly to total revenue, showing strong customer demand.
* Revenue distribution was concentrated among a few restaurants, indicating that certain outlets dominated sales performance.
* Lower-performing restaurants still maintained steady revenue, suggesting stable customer traffic across the platform.

<img width="1200" height="800" alt="top20_restaurants" src="https://github.com/user-attachments/assets/a5197ec0-4c79-4c84-94a0-bb4485e2354c" />


*Bar graph visualizing the top 20 restaurants by revenue; ChatGPT generated this graph using SQL query outputs.*

---

### 2. Most Popular Menu Items

This query analyzed which menu items were ordered the most across all restaurants.

```sql
SELECT 
    menu_items_name.item_name,
    SUM(order_items.quantity) AS total_orders
FROM order_items
JOIN menu_items_name
    ON order_items.menu_item_id = menu_items_name.menu_item_id
GROUP BY menu_items_name.item_name
ORDER BY total_orders DESC;
```

Here's the breakdown of the most popular menu items:

* Certain menu items consistently dominated customer orders, showing strong customer preference patterns.
* High-performing dishes contributed heavily to restaurant revenue and repeat purchases.
* Popularity trends suggested that affordable and frequently ordered items drove overall sales volume.

<img width="1000" height="600" alt="popular_menu_items" src="https://github.com/user-attachments/assets/ce01462e-8482-46d6-9d7e-d5c662b0f6c0" />


*Bar graph visualizing the most ordered menu items; ChatGPT generated this graph from SQL outputs.*

---

### 3. Revenue Concentration Analysis

This query explored whether restaurant revenue was concentrated among a few restaurants or distributed evenly.

```sql
SELECT 
    restaurants.restaurant_id,
    SUM(menu_items.price * order_items.quantity) AS revenue
FROM order_items
JOIN orders_medium
    ON order_items.order_id = orders_medium.order_id
JOIN menu_items
    ON order_items.menu_item_id = menu_items.menu_item_id
JOIN restaurants
    ON orders_medium.restaurant_id = restaurants.restaurant_id
GROUP BY restaurants.restaurant_id
ORDER BY revenue DESC;
```

Here's the breakdown of the revenue distribution:

* A small group of restaurants contributed a major portion of total sales.
* Revenue gaps between restaurants highlighted differences in customer demand and order volume.
* Top-performing restaurants likely benefited from stronger menu offerings, customer retention, or pricing strategies.

<img width="1000" height="600" alt="revenue_distribution" src="https://github.com/user-attachments/assets/efc8c973-a501-43c7-aa62-6c60b0e1eba3" />


*Revenue distribution graph generated using SQL query results.*

---

### 4. Customer Ordering Behavior

This query identified customers who placed the highest number of orders.

```sql
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders_medium
GROUP BY customer_id
ORDER BY total_orders DESC;
```

Here's the breakdown of customer behavior insights:

* Certain customers placed significantly more orders than others, showing repeat purchase behavior.
* Repeat customers likely contributed strongly to consistent restaurant revenue.
* Order frequency patterns indicated opportunities for loyalty or retention programs.

<img width="1000" height="600" alt="customer_order_behavior" src="https://github.com/user-attachments/assets/31ade456-849a-4dff-835b-88118ecc87bc" />


*Graph visualizing customer ordering patterns generated from SQL outputs.*

---

### 5. Peak Ordering Day Analysis

This query analyzed which days generated the highest order activity across restaurants.

```sql
SELECT 
    DATENAME(WEEKDAY, order_time) AS order_day,
    COUNT(order_id) AS total_orders
FROM orders_medium
GROUP BY DATENAME(WEEKDAY, order_time)
ORDER BY total_orders DESC;
```

Here's the breakdown of ordering trends:

* **Sunday** recorded the highest number of orders with **766 total orders**, making it the busiest day overall.
* **Tuesday** and **Saturday** also showed strong customer activity, with **743** and **739 orders** respectively.
* Order activity remained relatively consistent throughout the week, indicating stable customer demand across different days.
* Higher weekend order volumes suggest increased customer engagement during leisure periods.
* Understanding peak ordering days can help restaurants optimize staffing, inventory management, and delivery operations.

| Order Day | Total Orders |
| --------- | ------------ |
| Sunday    | 766          |
| Tuesday   | 743          |
| Saturday  | 739          |
| Thursday  | 700          |
| Wednesday | 697          |

*Bar graph visualizing busiest ordering days generated using SQL query outputs.*


### 6. Sales Trends & Business Insights

Additional queries from Q6–Q10 explored broader business trends across restaurants, orders, and menu performance.

Key findings included:

* Revenue concentration among top restaurants
* Strong demand for specific menu categories
* Customer repeat-order behavior
* Sales fluctuations across time periods
* Menu items contributing disproportionately to revenue

These analyses helped simulate how businesses use SQL to answer operational and strategic questions using raw transactional data.
