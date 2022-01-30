USE employees;
SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;

/* Number of salary contracts in employees database */
SELECT COUNT(salary) FROM salaries;

/* Number of start dates in employees database */
SELECT COUNT(from_date) FROM salaries;

/* Number of distinct/different start dates in employees database */
SELECT COUNT(DISTINCT from_date) FROM salaries;

/* COUNT(*) returns all rows in a table, including null values */
SELECT COUNT(*) FROM salaries;

/* Number of departments in employees database */
SELECT * FROM dept_emp;
SELECT COUNT(DISTINCT dept_no) FROM dept_emp;

/* Amount spent on salaries */
SELECT SUM(salary) FROM salaries;

/* total amount of money spent on salaries for all contracts starting after the 1st of January 1997 */
SELECT SUM(salary) FROM salaries WHERE from_date > '1997-01-01';

/* Highest salary offered by the company */
SELECT MAX(salary) FROM salaries;

/* Lowest contract value offered by the company */
SELECT MIN(salary) FROM salaries;
SELECT emp_no, MIN(salary) FROM salaries;
SELECT * FROM employees WHERE emp_no = 10001;

/* Highest and lowest employee number in database */
SELECT MAX(emp_no) FROM employees;
SELECT MIN(emp_no) FROM employees;

/* Average annual price of a contract in employees database */
/* Average annual salary of company's employee */
SELECT AVG(salary) FROM salaries;

/* average annual salary paid to employees who started after the 1st of January 1997 */
SELECT AVG(salary) FROM salaries WHERE from_date > '1997-01-01';

/* Rounding off the figure */
SELECT ROUND(AVG(salary)) FROM salaries;
SELECT ROUND(AVG(salary)) AS Average_Salary FROM salaries;

/* Rounding off the figure upto 2 decimal places */
SELECT ROUND(AVG(salary),2) FROM salaries;

/* average amount of money spent on salaries for all contracts that started after the 1st of January 1997 */
SELECT ROUND(AVG(salary),2) FROM salaries WHERE from_date > '1997-01-01';

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR( 40 ) NULL;

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECT * FROM departments_dup ORDER BY dept_no ASC;

/* Adding new column to departments_dup table */
ALTER TABLE
employees.departments_dup
ADD COLUMN
dept_manager VARCHAR( 255 ) NULL AFTER dept_name;

SELECT * FROM departments_dup ORDER BY dept_no ASC;
COMMIT;

/* Filling null values in table with specified entries */
SELECT dept_no, IFNULL(dept_name,"Department name not provided") as dept_name FROM departments_dup;
SELECT * FROM departments_dup ORDER BY dept_no ASC;

SELECT dept_no, COALESCE(dept_name,"Department name not provided") as dept_name FROM departments_dup;

SELECT dept_no, dept_name,
COALESCE(dept_manager,dept_name,'N/A') AS dept_manager
FROM departments_dup
ORDER BY dept_no ASC;

SELECT dept_no, dept_name, COALESCE('department manager name') AS fake_col
FROM departments_dup;

SELECT dept_no, dept_name, COALESCE(dept_no,dept_name) AS dept_info FROM departments_dup;

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;