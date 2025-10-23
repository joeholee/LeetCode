# Write your MySQL query statement below
WITH cte AS (
    SELECT product_id,
    year,
    RANK() OVER (PARTITION BY product_id ORDER BY year) AS rn,
    quantity,
    price
    FROM Sales
)

SELECT product_id, year as first_year, quantity, price
FROM cte
WHERE rn = 1