/* 5 April 2021 */

/* Sub Query */

/* Breaking problem into two queries */
select max(salary) 


/*Employee who is earning maximum salary */

SELECT * from employees 
where salary = (select max(salary) from employees);


/* Employee who earns minmum salary */

SELECT * from employees 
where salary = (select min(salary) from employees);

/* Number of employees who earn more than average salary */

SELECT COUNT(employee_id) from employees 
where salary > (select avg(salary) from employees);

/* Employees who were hired after Steven King - employee_id = 100 */ 
SELECT * 
from employees 
where hire_date >
(select hire_date from employees 
 where employee_id=100);
 
select hire_date from employees 
 where employee_id=100;
 /* Answer: 17-JUN-87 */
 
 SELECT count(employee_id) 
from employees 
where hire_date > '17-JUN-87';
/* Count = 106 */
 
/* Find third highest salary - interview question accenture big firms etc */

select max(salary) from employees 
where salary < 
(select max(salary) from employees
where salary <
(select max(salary) from employees));

/* to find the third highest salary from list of all salaries */
select salary from employees 
order by salary desc;
 
/* - -- - -- - - -   - -  */
/* find other solutions from the internet to the above problem
frequently asked interview question
*/
/* - -- - -- - - -   - -  */
           
/* Joins */
select first_name, last_name, department_name
from employees inner join departments
on (employees.department_id = 
    departments.department_id)

/* Table Alias */
select first_name, last_name, department_name
from employees e inner join departments d
on (e.department_id = 
    d.department_id)

select employee_id, last_name, 
job_id, salary, department_id,
department_name
from employees join departments
(on employees.department_id = 
    departments.department_id)
where job_id="MK_REP";
 
/* Solve lalter this appraoch using multiple joins it should work */
select employees.employee_id, last_name, 
jobs.job_id, salary, employees.department_id, department_name, jobs.job_title
from employees join departments
on employees.department_id = departments.department_id    
join jobs on employees.job_id= jobs.job_id;
 
select employees.employee_id, last_name, 
jobs.job_id, salary, employees.department_id, department_name, jobs.job_title
from employees join departments
on employees.department_id = departments.department_id    
join jobs on employees.job_id= jobs.job_id
/* where jobs.job_title="Marketing Representative"*/
/*error coming in above line */

select employees.employee_id, last_name, 
jobs.job_id, salary, employees.department_id, department_name, jobs.job_title
from departments join employees
on departments.department_id = employees.department_id    
join jobs on jobs.job_id= employees.job_id
where jobs.job_title="Marketing Representative";
 
 