USE employees;
SELECT * FROM dept_manager_dup ORDER BY dept_no;
SELECT * FROM departments_dup ORDER BY dept_no;
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
INNER JOIn departments_dup d ON m.dept_no=d.dept_no
ORDER BY m.dept_no;


/* list containing information about all managers’ employee number, first and last name, 
department number, and hire date.  */
SELECT a.emp_no, a.first_name, a.last_name,a.hire_date, b.dept_no
FROM employees a
INNER JOIN dept_manager b ON a.emp_no = b.emp_no
ORDER BY a.emp_no; 

SELECT m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM dept_manager_dup m
INNER JOIN departments_dup d ON m.dept_no=d.dept_no
ORDER BY m.dept_no;

INSERT INTO dept_manager_dup
VALUES ('110228','d003','1992-03-21','9999-01-01');

INSERT INTO departments_dup
VALUES ('d009','Customer Service');
SELECT * FROM dept_manager_dup ORDER BY dept_no;
SELECT * FROM departments_dup ORDER BY dept_no;

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
INNER JOIN departments_dup d ON m.dept_no=d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

/* Deleting Duplicate Records */
DELETE FROM dept_manager_dup
WHERE emp_no = '110228';

DELETE FROM departments_dup
WHERE dept_no = 'd009';

INSERT INTO dept_manager_dup
VALUES ('110228','d003','1992-03-21','9999-01-01');

INSERT INTO departments_dup
VALUES ('d009', 'Cucstomer Service');

/* LEFT JOIN */
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d ON m.dept_no=d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;

/* LEFT OUTER JOIN */
SELECT d.dept_no, m.emp_no, d.dept_name
FROM  departments_dup d
LEFT OUTER JOIN dept_manager_dup m ON d.dept_no=m.dept_no
ORDER BY d.dept_no;

SELECT * FROM departments_dup ORDER BY dept_no;
SELECT * FROM dept_manager_dup m ORDER BY dept_no;

/* Retrieving rows from left table only using Where Clause */
SELECT m.dept_no, m.emp_no, d.dept_name
FROM  dept_manager_dup m
LEFT JOIN departments_dup d  ON m.dept_no=d.dept_no
WHERE dept_name IS NULL
ORDER BY m.dept_no;

/* subset of all the employees whose last name is Markovitch */
SELECT e.emp_no, e.first_name, e.last_name, m. dept_no, m.from_date
FROM employees e
LEFT JOIN dept_manager m ON e.emp_no = m.emp_no
WHERE e.last_name = 'Markovitch'
ORDER BY e.emp_no, m.dept_no DESC;

/* Manager with last name Markovitch */
SELECT e.emp_no, e.first_name, e.last_name, m. dept_no, m.from_date
FROM employees e
INNER JOIN dept_manager m ON e.emp_no = m.emp_no
WHERE e.last_name = 'Markovitch'
ORDER BY e.emp_no, m.dept_no DESC;

/* RIGHT JOIN */
SELECT d.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
RIGHT JOIN departments_dup d ON m.dept_no=d.dept_no
ORDER BY dept_no;

/* Using where clause to get connection point data from two different tables */
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m,
	 departments_dup d
WHERE m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT e.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM employees e, dept_manager m
WHERE e.emp_no = m.emp_no
ORDER BY e.emp_no; 

SELECT * FROM dept_manager;

SELECT e.emp_no, e.first_name, e.last_name,s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary > 145000;

select @@global.sql_mode;
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

SELECT e.first_name, e.last_name, e.hire_date, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
WHERE e.first_name = 'Margareta' AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;

SELECT dm.*, d.*
FROM dept_manager dm
CROSS JOIN departments d
ORDER BY dm.emp_no, d.dept_no;

SELECT dm.*, d.*
FROM dept_manager dm, departments d
ORDER BY dm.emp_no, d.dept_no;

SELECT dm.*, d.*  
FROM departments d  
CROSS JOIN dept_manager dm  
WHERE d.dept_no = 'd009'  
ORDER BY d.dept_no;

SELECT e.*, d.*
FROM employees e
CROSS JOIN departments d
WHERE e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;

/* Average salaries of men and women in the company while separting employees by gender using Group BY */
SELECT e.gender, AVG(s.salary) AS average_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY gender;

SELECT gender FROM employees e;
SELECT * FROM salaries;



/* Joining Multiple Tables */
SELECT e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
FROM employees e 
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d. dept_no ;

SELECT e.first_name, e.last_name, e.hire_date, t.title, t.from_date, dt.dept_name
FROM employees e 
JOIN dept_manager dm ON e.emp_no=dm.emp_no
JOIN  titles t ON dm.emp_no = t.emp_no
JOIN departments dt ON dm.dept_no = dt.dept_no AND dm.from_date = t.from_date;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

/* Average salary paid to managers of each department */
SELECT d.dept_name, AVG(s.salary)
FROM departments d
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name;

SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM departments d
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000;

SELECT e.gender, COUNT(e.gender)
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
GROUP BY e.gender;

SELECT e.gender, COUNT(dm.emp_no)
FROM employees e
JOIN  dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup
(emp_no int(11), 
birth_date date, 
first_name varchar(14), 
last_name varchar(16), 
gender enum('M','F'), 
hire_date date
);

INSERT INTO employees_dup
SELECT e.*
FROM employees e
LIMIT 20;

SELECT * FROM employees_dup;

INSERT INTO employees_dup VALUES ('10001','1953-09-02','Georgi','Facello','M','1986-06-26');
SELECT * FROM employees_dup;

SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
FROM employees_dup e
WHERE emp_no = 10001
UNION ALL SELECT 
NULL AS emp_no, NULL AS first_name, NULL AS last_name, m.dept_no, m.from_date
FROM dept_manager m;

SELECT * FROM (SELECT e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM employees e
    WHERE last_name = 'Denis' 
    UNION SELECT 
        NULL AS emp_no,
		NULL AS first_name,
		NULL AS last_name,
		dm.dept_no,
		dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;