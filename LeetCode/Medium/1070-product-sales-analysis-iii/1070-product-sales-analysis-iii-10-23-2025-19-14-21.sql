# Write your MySQL query statement below
WITH cte AS (
    SELECT *,
    MIN(year) OVER (PARTITION BY product_id) AS mn
    FROM Sales
)

SELECT product_id, year AS first_year, quantity, price
FROM cte
WHERE year = mn;