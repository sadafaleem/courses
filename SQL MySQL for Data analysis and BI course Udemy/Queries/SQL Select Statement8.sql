USe employees;
SELECT gender FROM employees;
SELECT DISTINCT gender FROM employees;
SELECT DISTINCT hire_date FROM employees;
SELECT COUNT(emp_no) FROM employees;
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(DISTINCT first_name) FROM employees;

/* to count salaries greater than 100,000 */
SELECT * FROM salaries WHERE salary >='100000';
SELECT COUNT(salary) FROM salaries WHERE salary>='100000';
SELECT COUNT(*) FROM salaries WHERE salary>='100000';

/*both queries below returns 24 rows affected*/
/* Number of managers in employees database*/
SELECT DISTINCT * FROM dept_manager;
SELECT COUNT(emp_no) FROM dept_manager;
SELECT COUNT(*) FROM dept_manager;

/* ORDER BY */
SELECT * FROM employees ORDER BY first_name;
SELECT * FROM employees ORDER BY first_name ASC;
SELECT * FROM employees ORDER BY first_name DESC;
SELECT * FROM employees ORDER BY emp_no DESC;
SELECT * FROM employees ORDER BY first_name, last_name ASC;
SELECT * FROM employees ORDER BY first_name ASC, last_name DESC;
SELECT * FROM employees ORDER BY hire_date DESC;

/* GROUP BY */
SELECT first_name FROM employees GROUP BY first_name;
/* similar to select distinct, however group by is slower */
SELECT DISTINCT first_name FROM employees;
SELECT COUNT(first_name) FROM employees;

SELECT COUNT(first_name) FROM employees GROUP BY first_name;
SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name;
SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name ORDER BY first_name DESC;

/* Alias (Aliases) */
SELECT first_name, COUNT(first_name) AS names_count FROM employees GROUP BY first_name;

SELECT salary, COUNT(emp_no) AS emps_with_same_salary FROM salaries WHERE salary > '80000' GROUP BY salary ORDER BY salary ASC;

/* HAVING CLAUSE */
SELECT * FROM employees WHERE hire_date >= '2000-01-01';
SELECT * FROM employees HAVING hire_date >= '2000-01-01';

SELECT first_name, COUNT(first_name) AS names_count FROM employees 
 GROUP BY first_name HAVING COUNT(first_name) > 250 ORDER BY first_name;
 
 /* Wrong Syntax: 
 SELECT first_name, COUNT(first_name) AS names_count FROM employees 
 WHERE COUNT(first_name) > 250 GROUP BY first_name ORDER BY first_name;
 */
 
 SELECT emp_no, AVG(salary) FROM salaries GROUP BY emp_no HAVING AVG(salary) > '120000';
SELECT emp_no, AVG(salary) FROM salaries
GROUP BY emp_no HAVING AVG(salary) > 120000
ORDER BY emp_no;
 
 /* returns employees with salary greater than 120,000 with their average salaries*/
SELECT *, AVG(salary) FROM salaries WHERE salary > 120000
GROUP BY emp_no ORDER BY emp_no;

/* returns employees with average salary greater than 120,000 */
SELECT *, AVG(salary) FROM salaries
GROUP BY emp_no HAVING AVG(salary) > 120000;

/* List of all employees names occuring less than 200 times and hired after Jan 1999   */
SELECT first_name, COUNT(first_name) AS names_count FROM employees 
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY names_count;
 

SELECT * FROM employees HAVING hire_date >= '2000-01-01';

/* Aggregate and non-aggregate conditions cannot be used with HAVING clause */
SELECT first_name, COUNT(first_name) AS names_count FROM employees 
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200 AND hire_date >= '2000-01-01'
ORDER BY names_count;

/* employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000 */
SELECT emp_no, COUNT(emp_no) AS employees_count FROM dept_emp 
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

/* LIMIT Statement */
SELECT * FROM salaries ORDER BY salary DESC
LIMIT 10;

SELECT * FROM dept_emp LIMIT 100;