
/*
Total hour spent
   10.0                + 2.0
   before 11/22/2022  11/22/22
   

To do
   Find way to show row number in table
   
      
SQL WORLD
    https://www.complexsql.com/complex-sql-queries-examples-with-answers/
    https://www.complexsql.com/complex-sql-queries-examples-with-answers/complex-sql-for-interviews/

To test query, please visit 
    https://data.stackexchange.com/stackoverflow/query/edit/1659820#resultSets 
    https://data.stackexchange.com/stackoverflow/query/new

Detailed expression by Oracle
    https://docs.oracle.com/cd/B13789_01/server.101/b10759/sql_elements006.htm 

 

Complex SQL Queries

Following are some very important Complex SQL Queries Examples with answers. I have tried to explain each and every query in detail so that everyone will get idea of how it is executed step-by-step. In SQL and PL SQL interviews we require to know the key and important complex sql queries in detail level. These are important Complex SQL Queries :

If you need to recover data from a damaged SQL Server database, it is recommended to repair SQL Server with the help of a special tool. The software is able to scan the MDF file, find and recover data from the corrupted SQL DB.

Complex SQL Queries Examples (90% ASKED IN Interviews) 
*/


-- # ----- ----- ----- ----- ----- ----- ----- ----- -----

-- 1.Query to find Second Highest Salary of Employee? (click for explaination) - syntax error

    Select distinct Salary 
      from Employee e1 
        where 2=Select count(distinct Salary) from Employee e2 where e1.salary<=e2.salary;

--    Alternative Solution : Suggested by Ankit Srivastava

    select min(salary)
      from(
        select distinct salary 
          from emp 
            order by salary desc
      )
        where rownum<=2;
	
    SELECT 
	  DISTINCT Reputation
	FROM 
	  Users u1
	WHERE
	  2 = SELECT COUNT(DISTINCT Reputation) FROM Users u2 
	    WHERE u1.Reputation <= u2.Reputation

-- 2.Query to find duplicate rows in table? (click here for explaination) - looks like working but StackExchange no have duplicated Id

    Select * 
      from Employee a 
        where rowid <>( 
          select max(rowid) 
            from Employee b 
              where a.Employee_num=b.Employee_num
        );

    SELECT 
      *
    FROM 
      Users u1
    WHERE
      AccountId <> (
        SELECT 
          MAX(AccountId) 
        FROM
          Users u2
        WHERE
          u1.Id = u2.Id)


    SELECT 
      *
    FROM 
      Users u1
    WHERE
      AccountId <> (
        SELECT 
          MAX(AccountId) 
        FROM
          Users u2
        WHERE
          u1.Reputation = u2.Reputation) 
                
-- 3.How to fetch monthly Salary of Employee if annual salary is given? (click here for Explaination) 

   Select Employee_name, Salary/12 as ‘Monthly Salary’ 
     from employee;

   SELECT 
     DisplayName,
     Reputation/12
     AS
       'Monthly'
   FROM 
     Users 
   WHERE
     Reputation > 1000000
   ORDER BY
     Location ASC

   Click here to get information on ROW_ID

-- 4.What is the Query to fetch first record from Employee table? 
-- - There is no ROWNUM in StackExchange and syntax error

    Select * 
      from Employee 
        where Rownum = 1;

    Select * 
      from Employee 
        where Rowid = select min(Rowid) from Employee;

    SELECT 
      Id, DisplayName
    FROM 
      Users 
    WHERE
      CreationDate = SELECT MIN(CreationDate) FROM Users
  
-- 5.What is the Query to fetch last record from the table?

    Select * 
      from Employee 
        where Rowid = select max(Rowid) from Employee;

-- # ----- ----- ----- ----- ----- ----- ----- ----- -----

-- 6.What is Query to display first 5 Records from Employee table?

    Select * 
      from Employee 
        where Rownum <= 5;

-- 6.What is Query to display last 5 Records from Employee table?

    Select * 
      from Employee e 
        where rownum <=5

    union

    select * 
      from (
        Select * 
          from Employee e 
            order by rowid desc
      ) 
        where rownum <=5;

-- 7.What is Query to display Nth Record from Employee table?

    select * 
      from ( 
        select a.*, 
          rownum rnum
            from ( YOUR_QUERY_GOES_HERE — including the order by ) a 
              where rownum <= N_ROWS 
      ) 
        where rnum >= N_ROWS

 
-- 8.How to get 3 Highest salaries records from Employee table?

    select distinct salary 
      from employee a 
        where 3 >= (
          select count(distinct salary) from employee b where a.salary <= b.salary
        ) 
          order by a.salary desc;

    -- Alternative Solution: Suggested by Ankit Srivastava

    select min(salary)
      from(
        select distinct salary from emp order by salary desc
      )
        where rownum<=3;
    
    SELECT 
      DISTINCT Reputation
    FROM 
      Users u1
    WHERE
      3 >= (
        SELECT 
          COUNT(DISTINCT Reputation) 
        FROM
          Users u2
        WHERE
          u1.Reputation <= u2.Reputation)
             ORDER BY
               u1.Reputation DESC

-- 9.How to Display Odd rows in Employee table?

    Select * 
      from (
        Select rownum as rno, E.* 
          from Employee E
      ) 
        where Mod(rno,2)=1;

-- 10.How to Display Even rows in Employee table?

    Select * 
      from (
        Select rownum as rno, E.* 
          from Employee
      ) 
        where Mod(rno,2)=0;

-- # ----- ----- ----- ----- ----- ----- ----- ----- -----

-- 11.How to fetch 3rd highest salary using Rank Function?

    select * 
      from (
        Select Dense_Rank() over (order by salary desc) as Rnk, E.* 
          from Employee E
      ) 
        where Rnk=3;

-- Click Here to Get Information on Rank and Dense_Rank

-- 12.How Can i create table with same structure of Employee table?

    Create table Employee_1 as 
      Select * 
        from Employee 
          where 1=2;

-- 13.Display first 50% records from Employee table?

    select rownum, e.* 
      from emp e 
        where rownum<=(select count(*)/2 from emp);

-- 14.Display last 50% records from Employee table?

    Select rownum,E.* 
      from Employee E

    minus

    Select rownum,E.* 
      from Employee E 
        where rownum<=(Select count(*)/2) from Employee);

-- 15.How Can i create table with same structure with data of Employee table?

    Create table Employee1 as 
      select * 
        from Employee;

-- # ----- ----- ----- ----- ----- ----- ----- ----- -----

-- 16.How do i fetch only common records between 2 tables.

    Select * 
      from Employee;

    Intersect

    Select * 
      from Employee1;

CLICK HERE TO GET INFORMATION ABOUT INTERSECT OPERATOR

17.Find Query to get information of Employee where Employee is not assigned to the department

Answer:

Select * from Employee where Dept_no Not in(Select Department_no from Department);

18.How to get distinct records from the table without using distinct keyword.

Answer:

select * from Employee a where  rowid = (select max(rowid) from Employee b where  a.Employee_no=b.Employee_no);

19.Select all records from Employee table whose name is ‘Amit’ and ‘Pradnya’

Answer:

Select * from Employee where Name in(‘Amit’,’Pradnya’);

20.Select all records from Employee table where name not in ‘Amit’ and ‘Pradnya’

Answer:

select * from Employee where name Not  in (‘Amit’,’Pradnya’);

# ----- ----- ----- ----- ----- ----- ----- ----- -----

Click Here to get  20 Interview Questions for Tech Mahindra….

21.how to write sql query for the below scenario
I/p:ORACLE

O/p:
O
R
A
C
L
E
i.e, splitting into multiple columns a string using sql.

Answer:

Select Substr(‘ORACLE’,Level,1) From Dual
Connect By Level<= Length(‘ORACLE’);

22.How to fetch all the records from Employee whose joining year is  2017?

Answer:

Oracle:

select * from Employee where To_char(Joining_date,’YYYY’)=’2017′;

MS SQL:

select * from Employee where substr(convert(varchar,Joining_date,103),7,4)=’2017′;

23.What is SQL Query to find maximum salary of each department?

Answer:

Select Dept_id,max(salary) from Employee group by Dept_id;

24.How Do you find all Employees with its managers?(Consider there is manager id also in Employee table)

Answer:

Select e.employee_name,m.employee name from Employee e,Employee m where e.Employee_id=m.Manager_id;

25.Display the name of employees who have joined in 2016 and salary is greater than 10000?

Answer:

Select name from Employee where Hire_Date like ‘2016%’ and salary>10000;

# ----- ----- ----- ----- ----- ----- ----- ----- -----

26.How to display following using query?

*

**

***

Answer:

We cannot use dual table to display output given above. To display output use any table. I am using Student table.

SELECT lpad (‘*’, ROWNUM,’*’) FROM Student WHERE ROWNUM <4;

27.How to add the email validation using only one query?

Answer :

User needs to use REGEXP_LIKE function for email validation.

 SELECT
Email
FROM
Employee
where NOT REGEXP_LIKE(Email, ‘[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}’, ‘i’);

28.How to display 1 to 100 Numbers with query?

Answer:

Select level from dual connect by level <=100;

Tip: User needs to know the concept of Hierarchical queries. Click here to get concept of hierarchical queries

29.How to remove duplicate rows from table?(100% asked in Complex SQL Queries for Interviews)

Answer:

First Step: Selecting Duplicate rows from table

Tip: Use concept of max (rowid) of table. Click here to get concept of rowid.

Select rollno FROM Student WHERE ROWID <>

(Select max (rowid) from Student b where rollno=b.rollno);

Step 2:  Delete duplicate rows

Delete FROM Student WHERE ROWID <>

(Select max (rowid) from Student b where rollno=b.rollno);

30.How to find count of duplicate rows? (95% asked in SQL queries for Interviews )

Answer:

Select rollno, count (rollno) from Student

Group by rollno

Having count (rollno)>1

Order by count (rollno) desc;

# ----- ----- ----- ----- ----- ----- ----- ----- -----

31.How to Find the Joining date of Employee in YYYY-DAY-Date format.

Select FIRST_NAME, to_char(joining_date,’YYYY’) JoinYear , to_char(joining_date,’Mon’), to_char(joining_date,’dd’) from EMPLOYEES;

Hope This article named Complex SQL queries examples is useful to all the programmers. This article gives you the idea about Complex SQL Queries examples and will be useful to all the programmers.

Question 32 : How to convert the System time in to seconds in Oracle?

    To_char function is used to convert time to character and ssss will used to convert the time in to seconds.

    Following query is useful.

    SQL> select
      2    to_char(sysdate,'hh24:mi:ss') As "SystemTime",
      3    to_char(sysdate,'sssss') "Seconds"
      4  from dual;

    SystemTime     Seconds
    --------       -----
    11:34:50       41750


Example:
   Display user ID and location above certain reputation
       SELECT 
        Id, Location 
       FROM
        Users
       WHERE
        REPUTATION > 1000000
       ORDER BY
        Location ASC
        
        
