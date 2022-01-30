/* 31 March 2021 */

SELECT * FROM employees WHERE first_name LIKE 'a%';

SELECT * FROM employees WHERE first_name LIKE 'A%';

/* Note that above statements are case sensitive */

/* Using underscore to represent characters */
SELECT * FROM employees WHERE first_name LIKE 'S______';

/* Employees hired in Feb 1997 */

SELECT * FROM employees WHERE hire_date LIKE '%FEB-97'
ORDER BY first_name;

SELECT * FROM employees WHERE hire_date LIKE '___FEB-97'
ORDER BY first_name;

/* Using between clause is faster than LIKE Clause */
SELECT * FROM employees WHERE hire_date BETWEEN '01-FEB-97' AND '28-FEB-97'
ORDER BY first_name;

/* Select employees whose last name ends with letter a */
SELECT * FROM employees WHERE last_name LIKE '%a';

/* Verify all employees who work for department 100 through 150 */
SELECT * FROM employees WHERE department_id BETWEEN 100 AND 150;

/* Verify employees who are programmers, clerks or HR representatives */
SELECT DISTINCT job_id FROM employees;
SELECT * FROM employees WHERE JOB_ID IN ('IT_PROG','ST_CLERK', 'HR_REP');

/* Solution */
SELECT DISTINCT job_id FROM employees;
SELECT * FROM employees WHERE JOB_ID IN ('HR_REP', 'IT_PROG', 'PU_CLERK', 'ST_CLERK' , 'SH_CLERK');

/* Select information about countries except for Germany, Kuwait and Italy */
SELECT DISTINCT country_name FROM countries;

SELECT * FROM countries WHERE NOT country_name IN ('Germany', 'Italy', 'Kuwait');

/* Employees whose third letter of last name is letter u */
SELECT * FROM employees WHERE last_name LIKE '__u%';

/* Character Functions */
SELECT first_name, upper(first_name), lower(first_name)
FROM employees;

SELECT *
FROM employees WHERE first_name ='Alina';

SELECT *
FROM employees WHERE lower(first_name)='Alina';

SELECT sum(salary) from employees;

SELECT sum(salary), min(salary), avg(salary), max(salary)  from employees;

SELECT count(employee_id) FROM employees;

SELECT count(employee_id), round(avg(salary)) FROM employees;

SELECT count(employee_id), round(avg(salary), 2) FROM employees;

SELECT count(employee_id) Total_Employees ,
round(avg(salary), 2) Average_Salary FROM employees;

/*Task */
SELECT COUNT(employee_id) FROM employees WHERE commission_pct IS NULL;

SELECT upper(last_name), lower(first_name), initcap(email) FROM employees;

SELECT COUNT(employee_id) FROM employees WHERE job_id='IT_PROG';

SELECT COUNT(employee_id) FROM employees WHERE first_name LIKE 'A%';


