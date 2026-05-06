-- CITY and Ordered status 

SELECT 
	orders_medium.status,restaurants.city,COUNT(*),
    row_number() OVER(PARTITION BY orders_medium.status ORDER BY COUNT(*) DESC) AS Rank 
FROM restaurants
JOIN menu_items
ON restaurants.restaurant_id = menu_items.restaurant_id
JOIN order_items
ON menu_items.item_id = order_items.item_id
JOIN orders_medium
ON order_items.order_id = orders_medium.order_id
JOIN customers_medium
ON orders_medium.customer_id = customers_medium.customer_id
GROUP BY orders_medium.status,restaurants.city