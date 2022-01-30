SELECT employee_id 
FROM employees;

SELECT employee_id, first_name, last_name 
FROM employees;

/* TO select all columns, use * */
SELECT *
FROM employees;

SELECT phone_number FROM employees;

SELECT department_id FROM employees;

SELECT first_name, last_name, hire_date FROM employees;

SELECT * FROM JOBS;

SELECT department_id, department_name FROM departments;

SELECT job_id, max_salary, min_salary FROM jobs;

SELECT distinct job_id FROM employees;

SELECT * FROM employees where salary < 5000;

SELECT salary FROM employees WHERE employee_id=120;

SELECT DISTINCT job_id FROM employees;

SELECT first_name, salary, job_id FROM employees WHERE salary<=10000;

SELECT * FROM employees WHERE job_id='ST_CLERK';

SELECT DISTINCT manager_id from departments;




