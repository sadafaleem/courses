/* 29 March 2021 */

/* information about employees who report to manager 114 */
SELECT * FROM employees WHERE manager_id=114;

/* Employees who did not get commission, sorted in alphabatical order*/
SELECT first_name, last_name, department_id 
FROM employees
WHERE commission_pct IS NULL
ORDER BY last_name;

/* Employees who dont have a manager */
SELECT * FROM employees WHERE manager_id IS NULL;

/* IT Programmers with highest paid employee on top */
SELECT * FROM employees WHERE job_id='IT_PROG' ORDER BY salary desc;

/* Employees hired on Jun 17, 1987 */
SELECT * FROM employees WHERE hire_date='17-JUN-1987';

/* Logical Operators */
/* Applying Multiple Conditions */
SELECT * FROM employees WHERE salary < 3000 and job_id='ST_CLERK';

SELECT * FROM employees WHERE salary < 3000 or job_id='ST_CLERK';

/* NOT Keyword */
SELECT * FROM employees WHERE NOT job_id = 'IT_PROG' ORDER BY salary desc;

SELECT * FROM employees WHERE NOT salary < 3000 ;

SELECT * FROM employees WHERE salary < 3000 and NOT job_id='IT_PROG';

/* Employees with salary greater than or equal to 4000 or who are IT programmers */
SELECT first_name, salary, job_id FROM employees WHERE salary >=4000 OR job_id='IT_PROG';

SELECT first_name, salary, job_id FROM employees WHERE salary >3000 AND job_id='ST_CLERK' 
ORDER BY first_name;

SELECT * FROM employees WHERE NOT department_id=50 AND NOT job_id='ST_CLERK';

SELECT * FROM employees WHERE department_id!=50 AND NOT job_id='ST_CLERK';

SELECT * FROM employees WHERE commission_pct IS NULL AND salary>4500 
ORDER BY salary DESC;

SELECT * FROM employees WHERE department_id=50 OR department_id=60 OR department_id=80;

SELECT * FROM employees WHERE department_id IN (50,60, 80);

SELECT * FROM employees WHERE department_id BETWEEN 50 and 100;

/* after between keyword, write the lower boundry and the boundries are inclusive meaning they will
show in the result set*/


SELECT * FROM employees WHERE first_name LIKE 'A%';
/* denotes any number of characters */

SELECT * FROM employees WHERE first_name LIKE 'S____n';
