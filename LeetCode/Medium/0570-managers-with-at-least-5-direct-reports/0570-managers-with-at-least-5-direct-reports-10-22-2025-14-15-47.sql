# Write your MySQL query statement below
SELECT E2.name AS name
FROM Employee E1
JOIN Employee E2
ON E1.managerId = E2.id
GROUP BY E2.id
HAVING COUNT(E2.id) >= 5