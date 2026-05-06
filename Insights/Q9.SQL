-- Combine Revenue of Top 35 restaurant is equal to the rest 82 (117-35) Restaurant 
-- Top 30% of the restaurant generate revenue equal to the rest 70% of the restaurant 
WITH Ranked as (

  SELECT SUM(price) Revenue,COUNT(restaurants.restaurant_id) No_of_orders,restaurants.restaurant_id,

  SUM(SUM(price)) OVER(ORDER BY SUM(price) DESC ) AS Cumilative_distribution,
  SUM(SUM(price)) OVER() AS Total_revenue

  FROM restaurants
  JOIN menu_items
  ON restaurants.restaurant_id = menu_items.restaurant_id
  JOIN order_items
  ON menu_items.item_id = order_items.item_id
  JOIN orders_medium
  ON order_items.order_id = orders_medium.order_id
  JOIN customers_medium
  ON orders_medium.customer_id = customers_medium.customer_id
  GROUP BY restaurants.restaurant_id
  ) 
  
SELECT * from  ranked
WHERE Cumilative_distribution <=  Total_revenue/ 2


