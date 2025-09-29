# Write your MySQL query statement below
WITH cte AS (
    SELECT customer_number, COUNT(customer_number) AS cnt
    FROM Orders
    GROUP BY customer_number
)

SELECT customer_number
FROM cte
WHERE cnt = (SELECT MAX(cnt)
             FROM cte)