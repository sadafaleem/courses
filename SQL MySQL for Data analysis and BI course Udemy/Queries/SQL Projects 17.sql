USE employees_mod;
SELECT * FROM t_dept_emp;

/* Poject Task 1 */
SELECT YEAR(de.from_date) AS calendar_year, e.gender, COUNT(e.emp_no) AS no_of_employees
FROM t_employees e
JOIN t_dept_emp de ON de.emp_no=e.emp_no
GROUP BY calendar_year, e.gender
HAVING calendar_year >= 1990
ORDER BY calendar_year;

SELECT YEAR(hire_date) AS calendar_year
FROM t_employees 
GROUP BY calendar_year;

/*Project Task2  Subquery */
SELECT * FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no , calendar_year;

/*Project Task2 */
SELECT d.dept_name, ee.gender, dm.emp_no, dm.from_date, dm.to_date, e.calendar_year,
CASE WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year
THEN 1 
ELSE 0
END AS active
FROM (SELECT YEAR(hire_date) AS calendar_year
FROM t_employees GROUP BY calendar_year) e
CROSS JOIN t_dept_manager dm
JOIN t_departments d ON dm.dept_no = d.dept_no
JOIN  t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no , calendar_year;

/* Project Task 3 */
SELECT e.gender, dt.dept_name, ROUND(AVG(s.salary)) AS salary, YEAR(s.from_date) AS calendar_year
FROM t_salaries s
JOIN t_employees e ON e.emp_no = s.emp_no
JOIN t_dept_emp de ON de.emp_no = e.emp_no
JOIN t_departments dt ON dt.dept_no = de.dept_no
GROUP BY dt.dept_name, e.gender, calendar_year
HAVING calendar_year <=2002
ORDER BY de.dept_no;

/* Project Task 4 */
DROP PROCEDURE IF EXISTS filter_salary;
DELIMITER $$
CREATE PROCEDURE filter_salary(IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN 
SELECT e.gender, AVG(s.salary) AS avg_salary, dt.dept_name
FROM t_employees e
JOIN t_salaries s ON s.emp_no = e.emp_no
JOIN t_dept_emp de ON de.emp_no = e.emp_no
JOIN t_departments dt ON dt.dept_no = de.dept_no
WHERE s.salary BETWEEN p_min_salary AND p_max_salary       
GROUP BY dt.dept_name, e.gender;
END$$
DELIMITER ;
CALL filter_salary(50000,90000);

/* Project Task 4 Provided SOlution */
DROP PROCEDURE IF EXISTS filter_avg_salary;
DELIMITER $$
CREATE PROCEDURE filter_avg_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender;
END$$

DELIMITER ;

CALL filter_avg_salary(50000, 90000);