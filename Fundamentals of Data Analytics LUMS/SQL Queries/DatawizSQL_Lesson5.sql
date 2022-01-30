/* Group By */

/* Total salary by job_id */
SELECT job_id, sum(salary) from employees 
group by job_id;

SELECT job_id, sum(salary) from employees 
group by job_id
order by sum(salary);

SELECT job_id, sum(salary), round(avg(salary)), min(salary), max(salary) from employees 
group by job_id
order by sum(salary);

SELECT department_id, sum(salary), round(avg(salary)), min(salary), max(salary) from employees 
group by department_id
order by department_id;

/* Having Clause */
SELECT department_id, sum(salary), round(avg(salary)), min(salary), max(salary) from employees 
group by department_id
having SUM(salary) >25000
order by department_id;

/* Max salary from each job id */
SELECT max(salary), job_id from employees group by job_id;

/* select all information about department id, number of people in each department, max and average salary */
SELECT department_id, count(employee_id), avg(salary), max(salary) 
from employees
group by department_id;

/* notice that one person has not been assigned to any department */
SELECT department_id, count(employee_id), round(avg(salary)), max(salary) 
from employees
group by department_id
order by department_id;

/* always apply count on primary column */
/* notice that department id count is 0 in null value */
SELECT department_id, count(department_id), round(avg(salary)), max(salary) 
from employees
group by department_id
order by department_id;

/* give average salary in each department */
SElECT department_id, round(avg(salary))
from employees
group by department_id
order by avg(salary) ASC;

/* Avg salary for employees per department where avg salary is greater than 6500  */
SElECT department_id, round(avg(salary))
from employees
group by department_id
having avg(salary) > 6500
order by avg(salary) ASC;

/* count of employees in department having more than or 5 employees */
Select department_id, count(employee_id)
from employees
group by department_id
having count(employee_id) >=5;


Select department_id, count(employee_id)
from employees
group by department_id
having count(employee_id) >=5
order by count(employee_id);

/* select avg salary of people working in departments from 80 to 120 and having avg salary between 8000 and 10000  */
Select department_id, round(avg(salary))
from employees
where department_id between 80 and 120
group by department_id
having avg(salary) between 8000 and 10000;

/* Note: for basic filteration, we use where clause */

/* SET OPERATORS */
/* used to join results from two or more SQL queries */
/* UNION ALL , UNION, INTERSECT, MINUS */

select department_id
from employees 
union
select department_id
from departments;

/*  */
select department_id
from employees 
union all
select department_id
from departments;

select department_id
from employees 
intersect
select department_id
from departments;

/* all departments where no one is working */
select department_id
from departments
minus
select department_id
from employees ;

/* select common department ids from employees and departments tables */
select department_id from employees
intersect
select department_id from departments;

/* select department id and manager id from both employees and departments table.
Remove duplicates and sort them in ascending order */
select department_id, manager_id from employees
union
select department_id, manager_id from departments;






