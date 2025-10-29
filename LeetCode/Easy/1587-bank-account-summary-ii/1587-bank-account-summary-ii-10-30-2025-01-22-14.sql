# Write your MySQL query statement below
SELECT u.name AS NAME, SUM(t.amount) AS BALANCE
FROM Users u
JOIN Transactions t
ON u.account = t.account
GROUP BY t.account
HAVING SUM(t.amount)>10000