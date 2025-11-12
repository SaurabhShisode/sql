-- Problem 4: Median per Group (Median order amount per customer)
-- Schema: orders(order_id INT, customer_id INT, amount NUMERIC)

SELECT customer_id, percentile_cont(0.5) WITHIN GROUP (ORDER BY amount) AS median_amount
FROM orders
GROUP BY customer_id;

-- Alternative (ANSI-compatible using window functions)
SELECT customer_id,
       AVG(amount) AS median_amount
FROM (
  SELECT customer_id, amount,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY amount) AS rn_asc,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rn_desc
  FROM orders
) t
WHERE rn_asc = rn_desc OR rn_asc + 1 = rn_desc
GROUP BY customer_id;
