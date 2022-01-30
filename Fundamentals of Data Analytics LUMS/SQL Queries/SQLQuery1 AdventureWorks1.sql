/* 12 April 2021 */

/* We can use SQL Server compiler as a calculator itself */
SELECT  1+1;
SELECT 17 *32;

/* You can also select a string */
SELECT 'Hello World';

/* How to write column alias */
SELECT 'Hello World' as Welcome;

/* SELECTING using SELECT statement */
SELECT * FROM person.person;

/* Selecting single column using alias*/
SELECT businessentityid as EmployeeID 
from person.person;

SELECT * FROM sales.Customer;

SELECT customerid, storeid, accountnumber
FROM sales.customer;

/* Selecting columns from production.product table */
SELECT * FROM Production.Product;

SELECT name, productnumber, color
FROM Production.Product;

SELECT * FROM sales.SalesOrderHeader;

SELECT customerid, salesorderid FROM sales.SalesOrderHeader;

/* WHERE Clause */
SELECT customerid, salesorderid, orderdate
FROM sales.SalesOrderHeader
WHERE CustomerID=11000;

/* Notice that the output header matches the way we write in statement */
SELECT CUSTOMERID, salesorderid, orderdate
FROM sales.SalesOrderHeader
WHERE CustomerID=11000;

SELECT businessentityid, loginid, jobtitle
FROM HumanResources.Employee
WHERE jobtitle='Chief Executive Officer';

SELECT *
FROM HumanResources.Employee
WHERE jobtitle='Chief Executive Officer';

/* Filtering based on dates */
SELECT orderdate FROM Sales.SalesOrderHeader;

SELECT customerid, salesorderid, orderdate
FROM sales.SalesOrderHeader
WHERE orderdate>'2011-07-02';

SELECT customerid, salesorderid, orderdate
FROM sales.SalesOrderHeader
WHERE orderdate<='2011-07-02';

/* NOT EQUAL TO CONDITION */

SELECT customerid, salesorderid, orderdate
FROM sales.SalesOrderHeader
WHERE orderdate <>'2011-07-02';


/* all customer ids after 11000 */
SELECT CUSTOMERID, salesorderid, orderdate
FROM sales.SalesOrderHeader
WHERE CustomerID>11000;

/* Other logical operators */
SELECT CUSTOMERID, salesorderid, orderdate
FROM sales.SalesOrderHeader
WHERE CustomerID BETWEEN 11000 AND 12000;

/* Using Between clause for dates */
SELECT customerid, salesorderid, orderdate
FROM sales.SalesOrderHeader
WHERE orderdate BETWEEN'2011-07-01' AND '2012-06-30';

/* Using Between clause for data */
SELECT businessentityid,jobtitle
FROM HumanResources.Employee
WHERE JobTitle BETWEEN 'C' and 'E';

SELECT * FROM HumanResources.Employee;

SELECT businessentityid, loginid, jobtitle
FROM HumanResources.Employee
WHERE JobTitle='Research and Development Engineer';

SELECT * FROM Person.Person;

SELECT FirstName, LastName, MiddleName, BusinessEntityID 
FROM Person.Person
WHERE MiddleName LIKE 'J%';

/* Some middle names contain j and others j. */
/* this is classic example of data not being cleaned */

SELECT FirstName, LastName, MiddleName, BusinessEntityID 
FROM Person.Person
WHERE MiddleName = 'J.';

SELECT FirstName, LastName, MiddleName, BusinessEntityID 
FROM Person.Person
WHERE MiddleName = 'J';

SELECT * FROM Person.Person;

SELECT BusinessEntityID, FirstName, MiddleName, LastName, ModifiedDate
FROM Person.Person
WHERE ModifiedDate <'2011-12-29';



