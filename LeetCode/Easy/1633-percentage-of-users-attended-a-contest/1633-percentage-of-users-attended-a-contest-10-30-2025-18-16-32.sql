# Write your MySQL query statement below
SELECT contest_id
, ROUND(100 * COUNT(user_id) / (SELECT COUNT(user_id) FROM Users), 2)
AS percentage
FROM Register
GROUP BY contest_id
ORDER BY 2 DESC, 1