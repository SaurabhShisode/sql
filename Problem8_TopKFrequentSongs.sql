-- Problem 8: Top K Frequent Elements (Most-played songs)
-- Schema: plays(song_id INT, play_ts TIMESTAMP)

SELECT song_id, COUNT(*) AS plays
FROM plays
WHERE play_ts >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY song_id
ORDER BY plays DESC
LIMIT 5;
