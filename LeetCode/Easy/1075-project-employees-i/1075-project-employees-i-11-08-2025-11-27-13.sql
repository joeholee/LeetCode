# Write your MySQL query statement below
SELECT DISTINCT(p.project_id), ROUND(AVG(e.experience_years) OVER (PARTITION BY p.project_id),2) AS average_years
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id