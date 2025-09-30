# Write your MySQL query statement below
WITH cte AS (
    SELECT d.name AS dept, e.name AS emp, e.salary AS sal,
    DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT dept AS Department, emp AS Employee, sal AS Salary
FROM cte
WHERE rnk <= 3