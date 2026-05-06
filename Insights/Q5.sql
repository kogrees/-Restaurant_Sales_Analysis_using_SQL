-- How many repeat vs new customers?
 
SELECT    
    (
        SELECT COUNT(*)
        FROM 
        (
            SELECT 
                orders_medium.customer_id, 
                COUNT(*) order_count
            FROM orders_medium
            JOIN order_items
            ON orders_medium.order_id = order_items.order_id
            JOIN menu_items
            ON order_items.item_id = menu_items.item_id
            GROUP BY orders_medium.customer_id
            HAVING COUNT(*) = 1
        )   AS new_customers_table 

    ) AS new_customers  ,

    (
        SELECT COUNT(*)
        FROM 
        (
            SELECT 
            orders_medium.customer_id, 
            COUNT(*) order_count
            FROM orders_medium
            JOIN order_items
            ON orders_medium.order_id = order_items.order_id
            JOIN menu_items
            ON order_items.item_id = menu_items.item_id
            GROUP BY orders_medium.customer_id
            HAVING COUNT(*) != 1
        ) AS repeat_customers_table) AS repeat_customers;