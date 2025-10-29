# Write your MySQL query statement below
WITH cte AS (
    SELECT delivery_id, customer_id, order_date, customer_pref_delivery_date,
    MIN(order_date) OVER (PARTITION BY customer_id) AS first_order,
    CASE
        WHEN customer_pref_delivery_date = MIN(order_date) OVER (PARTITION BY customer_id) THEN "YES"
        ELSE "NO"
    END AS immediate
    FROM Delivery
)
SELECT
    ROUND(
        SUM(CASE WHEN immediate = "YES" THEN 1 ELSE 0 END)
        / COUNT(DISTINCT customer_id), 5
    ) * 100 AS immediate_percentage
FROM cte