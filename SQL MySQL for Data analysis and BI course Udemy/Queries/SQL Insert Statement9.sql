USE employees;
SELECT * FROM employees LIMIT 10;
INSERT INTO employees
(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date)
VALUES
( 	 999901,
	'1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
    );
    
    SELECT * FROM employees ORDER BY emp_no DESC LIMIT 10;
    
INSERT INTO employees
(
    birth_date,
	emp_no,
	first_name,
    last_name,
    gender,
    hire_date)
VALUES
(
	'1973-3-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'
);

SELECT * FROM employees ORDER BY emp_no DESC LIMIT 10;

INSERT INTO employees
VALUES 
( 
	999903,
    '1977-09-14',
    'Jonathan',
    'Creek',
    'M',
    '1999-01-01'
    );
SELECT * FROM employees ORDER BY emp_no DESC LIMIT 10;

SELECT * FROM titles LIMIT 10;
INSERT INTO titles
(
	emp_no,
    title,
    from_date
    )
VALUES
(
	999903,
    'Senior Engineer',
    '1997-10-01'
    );
    
SELECT * FROM titles ORDER BY emp_no DESC LIMIT 10;

SELECT * FROM dept_emp LIMIT 10;
INSERT INTO dept_emp
VALUES
(
	999903,
	'd005',
    '1997-10-01',
    '9999-01-01'
    );
    
SELECT * FROM dept_emp ORDER BY emp_no DESC LIMIT 10;

SELECT * FROM departments LIMIT 10;
CREATE TABLE departments_dup
( 
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
    );
    
SELECT * FROM departments_dup;

INSERT INTO departments_dup
(
	dept_no,
    dept_name)
SELECT *
FROM departments;

SELECT * FROM departments_dup ORDER BY dept_no;

INSERT INTO departments
(
	dept_no,
    dept_name
    )
VALUES
(
	'd010',
    'Business Analyst');
    
SELECT *FROM departments ORDER BY dept_no DESC;