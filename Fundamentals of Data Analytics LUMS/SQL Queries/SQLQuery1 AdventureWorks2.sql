/* SEE COURSE VIDEO */
/* Date 14 April 2021 */

/* Task */
SELECT productid, name FROM Production.Product
WHERE name LIKE 'Chain%';

/* Task Select products containing word paint */
SELECT productid, name FROM Production.Product
WHERE name LIKE '%Paint%';

/* Task select colummns with middle name containing E or B */
SELECT * FROM Person.Person;

SELECT businessentityid, firstname, middlename, lastname
FROM Person.Person
WHERE MiddleName LIKE '%E%' OR MiddleName LIKE '%B%';

/* WHERE Clause with more than one conditions */
/* We can use the logical operators such as AND or OR */

/* Examples */
SELECT businessentityid, firstname, middlename, lastname
FROM Person.Person
WHERE FirstName='Ken' AND LastName ='Myer' OR LastName='Meyer';

/* Operator Precedence */
/* AND operator is applied first - this query results in 3 records only */
/* Returns rows with first name Ken and last name of either Myer or Meyer */
SELECT businessentityid, firstname, middlename, lastname
FROM Person.Person
WHERE FirstName='Ken' AND (LastName ='Myer' OR LastName='Meyer');

/* NOT Operator */
SELECT businessentityid, firstname, middlename, lastname
FROM Person.Person
WHERE FirstName<>'Ken' AND LastName <>'Myer';

SELECT businessentityid, firstname, middlename, lastname
FROM Person.Person
WHERE NOT FirstName ='Ken' AND NOT LastName <>'Myer';

/* To search from multiple values */
SELECT businessentityid, firstname, middlename, lastname
FROM Person.Person
WHERE NOT FirstName ='Ken' AND LastName IN('Myer','Meyer');

/* Ex */
SELECT territoryid, name
FROM sales.SalesTerritory
WHERE TerritoryID NOT IN (1,2,4,5);

/* Task */
SELECT * FROM Sales.SalesOrderHeader;

/* The LIKE operator does not work with date parts like month or date but the DATEPART operator does. */
/* ----- wrong query below ----- */ 
SELECT salesorderid, orderdate, totaldue
FROM  Sales.SalesOrderHeader
WHERE OrderDate LIKE '2011-01%';
/* ---------- */ 


/* Condition 1 */
SELECT salesorderid, orderdate, totaldue
FROM  Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-09-01' AND '2011-09-30';

/*Condition 2 */
SELECT salesorderid, orderdate, totaldue
FROM  Sales.SalesOrderHeader
WHERE  TotalDue>1000.00;

/* Combining conditions 1 and 2 */
SELECT salesorderid, orderdate, totaldue
FROM  Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-09-01' AND '2011-09-30' AND totaldue>1000;

SELECT salesorderid, orderdate, totaldue
FROM  Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2011-09-01' AND '2011-09-03' AND totaldue>3500;

SELECT *
FROM  Sales.SalesOrderHeader
WHERE Totaldue > 1000 AND (SalesPersonID=279 OR TerritoryID=6);

/* Different output with this without using paranthesis */
SELECT *
FROM  Sales.SalesOrderHeader
WHERE Totaldue > 1000 AND SalesPersonID=279 OR TerritoryID=6;

SELECT *
FROM  Sales.SalesOrderHeader
WHERE Totaldue > 3500 AND (SalesPersonID=279 OR TerritoryID IN(4,6));

SELECT *
FROM  Sales.SalesOrderHeader
WHERE Totaldue > 3500 AND (SalesPersonID=279 OR TerritoryID=4 OR TerritoryID=6);

SELECT *
FROM  Sales.SalesOrderHeader
WHERE Totaldue > 3500 AND SalesPersonID=279 OR TerritoryID IN(4,6);


/* ORDER BY Statement */

SELECT *
FROM Production.ProductInventory;

SELECT productid, LocationID
FROM Production.ProductInventory
ORDER BY locationid;

/* Sorting based on multiple columns */
/* By defualt sorting is in ascending order */

SELECT productid, LocationID
FROM Production.ProductInventory
ORDER BY locationid, ProductID;

SELECT productid, LocationID
FROM Production.ProductInventory
ORDER BY locationid DESC, ProductID;

/* Task */
SELECT businessentityid, firstname, middlename, lastname
FROM Person.Person
ORDER BY LastName, FirstName, MiddleName;



SELECT businessentityid, firstname, middlename, lastname
FROM Person.Person
ORDER BY LastName DESC, FirstName DESC, MiddleName DESC;

/* Mathematical operation in SQL Server */
SELECT 1+5 AS 'Result of 1+5';

SELECT 10/3 AS Division;
/* result is shown as 3 */
/* Modulo operator returns remainder */
SELECT 10%3 AS Modulo;

/* Applying mathematical operations on columns */
SELECT orderqty, unitprice
FROM sales.SalesOrderDetail;

SELECT orderqty, unitprice, orderqty*unitprice*(1.0-UnitPriceDiscount) AS CalculatedLineTotal
FROM sales.SalesOrderDetail;

SELECT orderqty, unitprice, round(orderqty*unitprice*(1.0-UnitPriceDiscount),0) AS CalculatedLineTotal
FROM sales.SalesOrderDetail;

SELECT *
FROM Sales.SpecialOffer;

SELECT specialofferid, Description, maxqty-minqty AS Difference
FROM Sales.SpecialOffer;

SELECT specialofferid, Description, minqty*DiscountPct AS Discount
FROM Sales.SpecialOffer;
