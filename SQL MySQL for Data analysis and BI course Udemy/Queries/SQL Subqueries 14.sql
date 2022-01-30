USE employees;
SELECT *
FROM dept_manager
WHERE emp_no IN (SELECT emp_no
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01');

SELECT * FROM employees e
WHERE EXISTS( SELECT * FROM titles t
WHERE t.emp_no = e.emp_no AND title = 'Assistant Engineer');

SELECT A.*
FROM (SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM  dept_manager
WHERE emp_no = 110022) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A 
UNION SELECT B.*
FROM(SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM dept_manager
WHERE emp_no = 110039) AS manager_ID
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no  
WHERE e.emp_no > 10020
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 20) AS B;

DROP TABLE IF EXISTS emp_manager;
CREATE TABLE IF NOT EXISTS emp_manager
(emp_no INT(11) NOT NULL,
dept_no CHAR(4) Null, 
manager_no INT(11) NOT NULL);

SELECT * FROM emp_manager;

INSERT INTO emp_manager SELECT U.*
FROM (SELECT A.* FROM( SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM  dept_manager
WHERE emp_no = 110022) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A 
UNION SELECT B.* FROM(SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM dept_manager
WHERE emp_no = 110039) AS manager_ID
FROM employees e 
JOIN dept_emp de ON e.emp_no = de.emp_no  
WHERE e.emp_no > 10020
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 20) AS B
UNION SELECT C.*
FROM(SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM  dept_manager
WHERE emp_no = 110039) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no = 110022
GROUP BY e.emp_no
ORDER BY e.emp_no) AS C
UNION SELECT D.* FROM (SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM  dept_manager
WHERE emp_no = 110022) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE e.emp_no = 110039
GROUP BY e.emp_no
ORDER BY e.emp_no) AS D) AS U;

SELECT * FROM emp_manager;



