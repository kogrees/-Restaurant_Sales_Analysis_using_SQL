
-- what are the top 5 restaurants from each cuisine?
SELECT * FROM
    (
    SELECT 
        restaurant_id,
        cuisine,
        city,
        ROUND(rating,3) rating,
        ROW_NUMBER() OVER(PARTITION BY cuisine ORDER BY rating) AS Popularity
    FROM restaurants
    ) t
WHERE Popularity <= 5 ; 