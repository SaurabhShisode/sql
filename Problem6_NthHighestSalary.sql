-- Problem 6: N-th Highest Salary (3rd highest salary overall)
-- Schema: employees(emp_id INT, salary INT)

SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- Alternative (using window functions)
SELECT salary FROM (
  SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM employees
) t
WHERE rnk = 3;
