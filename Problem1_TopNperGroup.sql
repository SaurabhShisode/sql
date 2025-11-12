-- Problem 1: Top N per Group (Top 3 highest salaries per department)
-- Schema: employees(emp_id INT, name TEXT, dept TEXT, salary INT)

SELECT emp_id, name, dept, salary
FROM (
  SELECT emp_id, name, dept, salary,
         ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC, emp_id) AS rn
  FROM employees
) t
WHERE rn <= 3
ORDER BY dept, salary DESC;
