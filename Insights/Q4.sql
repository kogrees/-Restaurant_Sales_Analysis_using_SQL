
/*
Who are the most valuable customers (LTV)? */

SELECT customers_medium.customer_id,COUNT(order_items.order_id) AS Total_Order FROM customers_medium
JOIN orders_medium
ON customers_medium.customer_id = orders_medium.customer_id
JOIN order_items 
ON order_items.order_id = orders_medium.order_id
GROUP BY customers_medium.customer_id
ORDER BY Total_Order DESC