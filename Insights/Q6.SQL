
-- Which type of cusine generates the highest total revenue?


SELECT 
    cuisine,
    COUNT(*) Total_Orders, 
    FORMAT(SUM(price),'N0') Revenue,
    ROW_NUMBER() OVER(ORDER BY FORMAT(SUM(price),'N0') ) AS Ranking_of_Popularity
FROM restaurants
INNER JOIN orders_medium
ON restaurants.restaurant_id = orders_medium.restaurant_id
INNER JOIN order_items
ON orders_medium.order_id = order_items.order_id
JOIN menu_items
ON menu_items.item_id = order_items.item_id
GROUP BY cuisine
ORDER BY Revenue
