-- Problem 3: Gaps and Islands (Consecutive dates per user)
-- Schema: user_activity(user_id INT, activity_date DATE)

WITH numbered AS (
  SELECT user_id, activity_date,
         ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY activity_date) AS rn
  FROM user_activity
),
grp AS (
  SELECT user_id, activity_date, rn,
         DATE(activity_date) - (rn || ' days')::interval AS grp_key
  FROM numbered
)
SELECT user_id,
       MIN(activity_date) AS start_date,
       MAX(activity_date) AS end_date
FROM grp
GROUP BY user_id, grp_key
ORDER BY user_id, start_date;
