/* 7 April 2021 */

/* Join */
select e.employee_id, last_name, salary, department_name
from employees e join departments d
on e.department_id=d.department_id
order by salary desc;

/* Join Syntax */
/* Select columns
from TableA join TableB
(on define the join)
join tableC 
(on define tableB and tableC) */

/* Multiple Joins */
/* select employee id, first name, last name , department name and city */
select e.employee_id, first_name, last_name, department_name, city
from employees e join departments d
on e.department_id=d.department_id
join locations l
on l.location_id=d.location_id;

/* OR */
select e.employee_id, first_name, last_name, department_name, city
from employees e join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id;

/* left join right join and full join */
/* left and right joins are mirror  image of one another */
/* Select columns
from TableA left join TableB
(on define the join)
*/

/* Select columns
from TableA right join TableB
(on define the join)
*/

/* Select columns
from TableA full outer join/ full join TableB
(on define the join)
*/

/* We want employee id, first name, last name , department name and city 
even if they dont have any department or cities */
select e.employee_id, first_name, last_name, department_name, city
from employees e left join departments d
on e.department_id=d.department_id
left join locations l
on l.location_id=d.location_id;

/* Find Number of employees in each city */
/* left join returns 8 records including null city */
select count(e.employee_id), city
from employees e left join departments d
on e.department_id=d.department_id
left join locations l
on l.location_id=d.location_id
group by city;

/* inner join returns 7 records */
select count(e.employee_id), city
from employees e join departments d
on e.department_id=d.department_id
join locations l
on l.location_id=d.location_id
group by city;

/* my solution */
/* issue with full outer join is that we get an employee who is not assigned in any city */
select count(e.employee_id), city
from employees e full join departments d
on e.department_id=d.department_id
full join locations l
on l.location_id=d.location_id
group by city;

/* ordering by city */
select count(e.employee_id), city
from employees e full join departments d
on e.department_id=d.department_id
full join locations l
on l.location_id=d.location_id
group by city;

/* SQL Commands */
/* As data analyst you dont get access to DDL commands normally */

/* Data types in Oracle */
/* char type is useful when we have standardized data length */

/* CREATE COMMAND */
Create table LA_Lakers(
PlayerNumber Int Primary Key Not Null,
PlayerName VarChar(100) Not Null,
PlayerPosition Char(2)
);

Select * from la_lakers;

drop table Client_Sadaf;

Create table Client_Sadaf(
Client_ID Int Primary Key Not Null,
First_Name VarChar(100) Not Null,
Last_Name VarChar(100) Not Null,
Postal_Address VarChar(15),
State_Address Char(20)
);

Select * From Client_Sadaf;

/* Insert Statement */
/* Insert into table name (column1, column2)
values (value1, value 2)
*/

Insert into LA_lakers (PlayerNumber, PlayerName, PlayerPosition)
values (23, 'Lebron James', 'SP');

Select * from la_lakers;

Insert into LA_lakers (PlayerNumber, PlayerName, PlayerPosition)
values (3, 'Anthony Davis', 'PF');

Insert into LA_lakers (PlayerNumber, PlayerName, PlayerPosition)
values (14, 'Marc Gasol', 'CN');

Select * from la_lakers;

/* Update Statement */
/* used to update any given value */
/* update table_name set column1=value1,
column2=value2
where any_column=some_value; */

Update la_lakers set PlayerName='Mark'
where PlayerNumber=14;

Select * from la_lakers;

/* Delete Statement */
/* Delete from table_name 
where some_column=some_value */

Delete from la_lakers 
where playername='Mark';

Select * from la_lakers;

/* ALter table command */
alter table la_lakers 
add Salary int;

Select * from la_lakers;

Update la_lakers set Salary=42000000
where PlayerName='Lebron James';

Select * from la_lakers;

/* Alter Statement -  Rename Column */

alter table la_lakers 
rename column Salary to Compensation;

Select * from la_lakers;

/* Deleting or dropping a column */
/* Alter table table_name drop column column_name */

Alter table la_lakers drop column compensation;
Select * from la_lakers;

/*Modify Column*/
alter table la_lakers
modify playerposition varchar(2);
Select * from la_lakers;

/*Truncate Table*/
truncate table la_lakers

/*Drop Table*/
drop table la_lakers;

/* Assingmnet 1 */

INSERT INTO client_Sadaf(client_id, first_name, last_name, Postal_Address,State_Address)
VALUES(1, 'Ali','Ahmad', 54000, 'Punjab');

INSERT INTO client_Sadaf(client_id, first_name, last_name, State_Address)
VALUES(2, 'Usman','Shareef', 'Punjab');

INSERT INTO client_Sadaf(client_id, first_name, last_name, Postal_Address)
VALUES(3, 'Ayesha','Umer', 54000);

SELECT * FROM client_sadaf;

UPDATE client_sadaf SET client_id=15 WHERE client_id=1;
UPDATE client_sadaf SET last_name='Luqman' WHERE client_id=2;
UPDATE client_sadaf SET state_address='Punjab' WHERE client_id=3;

SELECT * FROM client_sadaf;

DELETE FROM client_sadaf WHERE client_id=2;
SELECT * FROM client_sadaf;

TRUNCATE TABLE client_sadaf;
SELECT * FROM client_sadaf;

DROP table client_sadaf;




























