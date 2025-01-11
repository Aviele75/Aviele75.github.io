----SQL QUERY ON ORDER, SALESMAN & CUSTOMER---

select *
from [dbo].[Customer$]

DELETE FROM [dbo].[Customer$]
where customer_ID is null
and Customer_Name is null
and City is null
and Grade is null
and Salesman_ID is null;

select *
from [dbo].[Order$]

DELETE FROM [dbo].[Order$]
where [Order Number] is null
and Purchase_Amount is null
and [Order Date] is null
and [Customer ID] is null
and Salesman_id is null;

select *
from [dbo].[Salesman$]

DELETE FROM [dbo].[Salesman$]
where Salesman_id is null
and Name is null
and city is null
and commission is null;

---QUEST 1---write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
select *
from [dbo].[Customer$]

select *
from [dbo].[Salesman$]

Select 
[dbo].[Salesman$].Salesman_ID,
Name as Salesman_Name,
Customer_Name,
[dbo].[Salesman$].City
from [dbo].[Salesman$]
join [dbo].[Customer$]
on [dbo].[Salesman$].Salesman_ID = [dbo].[Customer$].Salesman_ID; 

---QUEST 2---write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

select *
from [dbo].[Order$]

select *
from [dbo].[Customer$]


select 
[dbo].[Order$].[Customer ID],
[Order Number],
Customer_Name,
City,
Purchase_Amount
from [dbo].[Order$]
join [dbo].[Customer$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
where Purchase_Amount between 500 and 2000

---QUEST 3---write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.

select *
from [dbo].[Customer$]

select *
from [dbo].[Salesman$]


Select 
[dbo].[Customer$].Salesman_ID,
Customer_Name,
Name as Salesman_Name,
[dbo].[Salesman$].City,
Commission
from [dbo].[Customer$]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID;

---QUEST 4--write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  

select *
from [dbo].[Customer$]

select *,
Commission * 100 as [% Commission]
from [dbo].[Salesman$]
where commission > 0.12

Select 
[dbo].[Customer$].Salesman_ID,
Customer_Name,
Name as Salesman_Name,
[dbo].[Salesman$].City,
Commission
from [dbo].[Customer$]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID
where commission > 0.12;

---QUEST 5--write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.  

Select 
[dbo].[Customer$].Salesman_ID,
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Name as Salesman_Name,
[dbo].[Salesman$].City,
Commission
from [dbo].[Customer$]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID
where commission > 0.12
and [dbo].[Salesman$].City != [dbo].[Customer$].City;

---QUEST 6--write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission

select 
[dbo].[Order$].[Customer ID],
[Order Number],
[Order Date],
Customer_Name,
Grade,
Purchase_Amount,
Name as Salesman_Name,
Commission
from [dbo].[Order$]
join [dbo].[Customer$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID;

---QUEST 7--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 

select *
from [dbo].[Customer$]

select *
from [dbo].[Order$]

select *
from [dbo].[Salesman$]

select 
[dbo].[Order$].[Customer ID],
[Order Number],
[Order Date],
Customer_Name,
Grade,
Purchase_Amount,
Name as Salesman_Name,
Commission
from [dbo].[Order$]
join [dbo].[Customer$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID;


select [dbo].[Order$].*
from [dbo].[Order$]
join [dbo].[Customer$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID;  ----NOTE

---QUEST 8--write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.

Select 
[dbo].[Customer$].Salesman_ID,
Customer_ID,
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Grade,
Name as Salesman_Name,
[dbo].[Salesman$].City
from [dbo].[Customer$]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID
order by Customer_ID asc;

---QUEST 9--write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.

Select 
[dbo].[Customer$].Salesman_ID,
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Grade,
Name as Salesman_Name,
[dbo].[Salesman$].City
from [dbo].[Customer$]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID
where Grade < 300 
order by Customer_ID asc;

---QUEST 10--Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.

select 
[dbo].[Order$].[Customer ID],
Customer_Name,
[dbo].[Customer$].City as [Customer City],
[Order Number],
[Order Date],
Purchase_Amount
from [dbo].[Order$]
join [dbo].[Customer$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
order by [Order Date] asc,  Purchase_Amount asc;

---QUEST 11--SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

select 
[dbo].[Order$].[Customer ID],
Customer_Name,
[dbo].[Customer$].City as [Customer City],
[Order Number],
[Order Date],
Purchase_Amount,
Name as Salesman_Name,
Commission
from [dbo].[Customer$]
join [dbo].[Order$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
join [dbo].[Salesman$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID
Order by Customer_Name, Salesman_Name;

---QUEST 12--Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.

Select 
[dbo].[Customer$].Salesman_ID,
Name as Salesman_Name,
[dbo].[Salesman$].City,
Customer_Name,
[dbo].[Customer$].City as [Customer City]
from [dbo].[Salesman$]
join [dbo].[Customer$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID
order by Salesman_Name asc

---QUEST 13--write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.

Select 
[dbo].[Salesman$].Salesman_ID,
Name as Salesman_Name,
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Grade,
[Order Number],
[Order Date],
Purchase_Amount as Amount
from [dbo].[Salesman$]
join [dbo].[Customer$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID
join [dbo].[Order$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
order by  Salesman_Name, [Order Date];


---QUEST 14--Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.

Select  DISTINCT
[dbo].[Salesman$].Salesman_ID,
Name as Salesman_Name
From [dbo].[Salesman$]
left join [dbo].[Customer$]
on [dbo].[Customer$].Salesman_ID =[dbo].[Salesman$].Salesman_ID
left join [dbo].[Order$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
where  Grade is not null and Purchase_Amount >= 2000
or [dbo].[Order$].[Customer ID] is null
order by Salesman_Name;

---QUEST 15--For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount

select 
[dbo].[Customer$].[Customer_ID],
Customer_Name,
[dbo].[Customer$].City as [Customer City],
[Order Number],
[Order Date],
Purchase_Amount
from [dbo].[Customer$]
join [dbo].[Order$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
order by Customer_Name, [Order Date];

---QUEST 16--Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.

select 
[dbo].[Customer$].[Customer_ID],
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Grade,
[Order Number],
[Order Date],
Purchase_Amount
from [dbo].[Customer$]
join [dbo].[Order$]
on [dbo].[Customer$].[Customer_ID] = [dbo].[Order$].[Customer ID]
where Grade is not null and [Order Number] is not null
or [dbo].[Customer$].[Customer_ID] is not null and [dbo].[Order$].[Customer ID] is not null;

---QUEST 17--Write a SQL query to combine each row of the salesman table with each row of the customer table.

Select 
[dbo].[Customer$].Salesman_ID,
Name as Salesman_Name,
[dbo].[Salesman$].City,
commission,
Customer_ID,
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Grade
from [dbo].[Salesman$]
cross join [dbo].[Customer$];

---QUEST 18--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.

Select 
[dbo].[Customer$].Salesman_ID,
Name as Salesman_Name,
[dbo].[Salesman$].City,
commission,
Customer_ID,
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Grade
from [dbo].[Salesman$]
join [dbo].[Customer$]
on [dbo].[Salesman$].City = [dbo].[Customer$].City;

---QUEST 19--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.

Select 
[dbo].[Customer$].Salesman_ID,
Name as Salesman_Name,
[dbo].[Salesman$].City,
commission,
Customer_ID,
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Grade
from [dbo].[Salesman$]
join [dbo].[Customer$]
on [dbo].[Salesman$].City = [dbo].[Customer$].City
where Grade is not null;

---QUEST 20--Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.

Select 
[dbo].[Customer$].Salesman_ID,
Name as Salesman_Name,
[dbo].[Salesman$].City,
commission,
Customer_ID,
Customer_Name,
[dbo].[Customer$].City as [Customer City],
Grade
from [dbo].[Salesman$]
join [dbo].[Customer$]
on [dbo].[Salesman$].City != [dbo].[Customer$].City
where Grade is not null;
