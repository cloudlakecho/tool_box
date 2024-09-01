/* 
   interview.sql - Learn SQL
      Reading long query at Software Defined Network related project
          SDP Controller software by Waverlay Lab 

   Cloud Cho from 12:39 AM October 23, 2022
   Reference:
       https://www.complexsql.com/complex-sql-queries-examples-with-answers/
*/

-- 1.Query to find Second Highest Salary of Employee?


-- 2.Query to find duplicate rows in table?

-- 3.How to fetch  monthly Salary of Employee if annual salary is given?

-- 4.What is the Query to fetch first record from Employee table? 

SELECT 
    Id, Location 
FROM
    Users
WHERE
    REPUTATION > 1000000
ORDER BY
    Location ASC


-- inner and outer join

SELECT 
    Id, Location
FROM
    Users
INNER JOIN
    Category
ON 
    Id, Location
WHERE
    Location="US"

Below is a selection from the "Customers" table:

CustomerID 	CustomerName 	ContactName 	Address 	City 	PostalCode 	Country
1

	Alfreds Futterkiste 	Maria Anders 	Obere Str. 57 	Berlin 	12209 	Germany
2 	Ana Trujillo Emparedados y helados 	Ana Trujillo 	Avda. de la Constitución 2222 	México D.F. 	05021 	Mexico
3 	Antonio Moreno Taquería 	Antonio Moreno 	Mataderos 2312 	México D.F. 	05023 	Mexico

And a selection from the "Orders" table:

OrderID 	CustomerID 	EmployeeID 	OrderDate 	ShipperID
10308 	2 	7 	1996-09-18 	3
10309 	37 	3 	1996-09-19 	1
10310 	77 	8 	1996-09-20 	2

SELECT 
    Customers.CustomerName, Orders.OrderID
FROM 
    Customers
FULL OUTER JOIN 
    Orders 
    ON 
        Customers.CustomerID=Orders.CustomerID
ORDER BY 
    Customers.CustomerName
    
