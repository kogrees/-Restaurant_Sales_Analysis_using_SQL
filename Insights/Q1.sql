-- What are the top-selling dishes

SELECT item_id, COUNT(order_id) Number_of_Unique_Orders, SUM(quantity) Number_of_total_orders
FROM order_items
GROUP BY item_id
ORDER BY Number_of_Unique_Orders DESC

-- Most uniquely ordered dish was M0016 - 33

-- Most ordered was M0175 - 85

