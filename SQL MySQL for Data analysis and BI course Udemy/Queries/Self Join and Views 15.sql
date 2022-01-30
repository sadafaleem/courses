/* Self JOIN */
SELECT * FROM emp_manager
ORDER BY emp_manager.emp_no;

SELECT e1.* FROM emp_manager e1
JOIN emp_manager e2 ON e1.emp_no = e2.manager_no;

SELECT * FROM dept_emp;
SELECT emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM dept_emp
GROUP BY emp_no
HAVING Num > 1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT emp_no,
MAX(from_date) AS from_date,
MAX(to_date) AS to_date
FROM dept_emp
GROUP BY emp_no;

SELECT emp_no,
MAX(from_date) AS from_date,
MAX(to_date) AS to_date, COUNT(emp_no) AS Num
FROM dept_emp
GROUP BY emp_no;


CREATE OR REPLACE VIEW v_managers_average_salary AS
SELECT dm.emp_no, ROUND(AVG(s.salary),2) AS average_salary 
FROM dept_manager dm
JOIN salaries s ON dm.emp_no=s.emp_no;


