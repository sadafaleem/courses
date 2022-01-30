USE employees;
DROP PROCEDURE IF EXISTS select_employees;
DELIMITER $$ 
CREATE PROCEDURE select_employees()
BEGIN
SELECT *FROM employees LIMIT 1000;
END$$
DELIMITER ;

/* Calling a procedure */
CALL employees.select_employees();
CALL select_employees;

DELIMITER $$
CREATE PROCEDURE average_salary()
BEGIN
SELECT AVG(salary) FROM salaries;
END$$
DELIMITER ;

CALL average_salary();
DROP procedure select_employees;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INT)
BEGIN
SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM employees e
JOIN salaries s ON e.emp_no=s.emp_no
WHERE e.emp_no=p_emp_no;
END$$
DELIMITER ;
CALL emp_salary(10010);

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INT)
BEGIN
SELECT e.first_name, e.last_name, AVG(salary)
FROM employees e
JOIN salaries s ON e.emp_no=s.emp_no
WHERE e.emp_no=p_emp_no;
END$$
DELIMITER ;
CALL emp_avg_salary(10010);

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary_out(IN p_emp_no INT, OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT AVG(salary) INTO p_avg_salary
FROM employees e
JOIN salaries s ON e.emp_no=s.emp_no
WHERE e.emp_no=p_emp_no;
END$$
DELIMITER ;
CALL emp_avg_salary_out(10010,@avg_salary);
SELECT @avg_salary;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_info(IN p_emp_first_name VARCHAR(16), IN p_emp_last_name VARCHAR(16), OUT p_emp_no INT)
BEGIN
SELECT e.emp_no INTO p_emp_no
FROM employees e 
WHERE e.first_name=p_emp_first_name
AND e.last_name= p_emp_last_name;
END$$
DELIMITER ;

/* Creating variables */
SET @v_avg_salary = 0;

/*Calling a procedurea and storing value in a variable */
CALL emp_avg_salary_out(10010,@v_avg_salary);
SELECT @v_avg_salary;

SET @v_emp_no=0;
CALL emp_info('Aruna','Journel',@v_emp_no);
SELECT @v_emp_no;

DROP FUNCTION IF EXISTS f_emp_avg_salary;
DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
SELECT AVG(s.salary) INTO v_avg_salary 
FROM employees e
JOIN salaries s ON e.emp_no=s.emp_no
WHERE e.emp_no=p_emp_no;
RETURN v_avg_salary;
END$$
DELIMITER ;

SELECT f_emp_avg_salary(10010);

DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
                DECLARE v_max_from_date date;
    DECLARE v_salary decimal(10,2);

SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
        
SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;

                RETURN v_salary;

END$$

DELIMITER ;

SELECT EMP_INFO('Aruna', 'Journel');

SET @v_emp_no = 11300;
SELECT emp_no, first_name, last_name, f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM employees
WHERE emp_no = @v_emp_no;