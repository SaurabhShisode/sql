-- Problem 2: Running Total per Partition (Daily cumulative revenue per store)
-- Schema: sales(store_id INT, sale_date DATE, amount NUMERIC)

SELECT store_id, sale_date, amount,
       SUM(amount) OVER (PARTITION BY store_id ORDER BY sale_date
                         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM sales
ORDER BY store_id, sale_date;
