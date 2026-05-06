-- Is revenue concentrated among a few restaurants/items?

SELECT restaurants.restaurant_id,
       sum(price) as Revenue
FROM order_items
JOIN orders_medium
ON order_items.order_id = orders_medium.order_id
JOIN menu_items
ON menu_items.restaurant_id = orders_medium.restaurant_id
JOIN customers_medium
ON customers_medium.customer_id = orders_medium.customer_id
JOIN restaurants
ON restaurants.restaurant_id = menu_items.restaurant_id
GROUP BY restaurants.restaurant_id
ORDER BY Revenue DESC