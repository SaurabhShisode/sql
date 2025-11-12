-- Problem 5: Find Duplicate Groups (Employees with same name & DOB)
-- Schema: employees(emp_id INT, name TEXT, dob DATE)

SELECT name, dob, STRING_AGG(emp_id::text, ',') AS emp_ids, COUNT(*) AS cnt
FROM employees
GROUP BY name, dob
HAVING COUNT(*) > 1;
