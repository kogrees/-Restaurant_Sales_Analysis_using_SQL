-- Which restaurant Generate most revenue

WITH revenue_table AS (
  SELECT 
      menu_items.restaurant_id AS restaurant_name, 
      COUNT(order_items.item_id) AS Number_of_Unique_Order,
      SUM(order_items.quantity) AS Number_of_Total_Order,
      Sum(menu_items.price) AS Price
      FROM restaurants
  JOIN menu_items
  ON restaurants.restaurant_id = menu_items.restaurant_id
  JOIN order_items
  ON order_items.item_id= menu_items.item_id
  GROUP BY menu_items.restaurant_id
)

SELECT restaurant_name, ROUND(Number_of_Total_Order*Price,2) AS  Total_revenue  FROM revenue_table
ORDER BY Total_revenue DESC ;


