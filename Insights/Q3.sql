-- Which day generates highest revenue?
 
SELECT 
    FORMAT(SUM(menu_items.price),'N0') Total_Revenue, 
    COUNT(orders_medium.order_id) No_of_Orders, 
    SUM(order_items.quantity) Total_items,
    DATENAME(weekday,order_time) AS Day_name
FROM orders_medium
JOIN order_items
ON orders_medium.order_id = order_items.order_id
JOIN menu_items
ON order_items.item_id = menu_items.item_id
GROUP BY DATENAME(weekday,order_time)
ORDER BY 
    CASE DATENAME(weekday,order_time)
        WHEN 'Monday' then 1
        WHEN 'Tuesday' then 2
        WHEN 'Wednesday' then 3
        WHEN 'Thursday' then 4
        WHEN 'Friday' then 5
        WHEN 'Saturday' then 6
        WHEN 'Sunday' then 7

    END;