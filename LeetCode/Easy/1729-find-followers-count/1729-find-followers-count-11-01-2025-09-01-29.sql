# Write your MySQL query statement below
SELECT user_id, SUM(COUNT(DISTINCT follower_id)) OVER (PARTITION BY user_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY 1