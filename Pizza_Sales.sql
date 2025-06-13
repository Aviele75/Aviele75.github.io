----SQL QUERY ON PIZZA SALES DATASET---

select *
from [dbo].[pizza_sales$]

--QUESTION 1 --Total Revenue

select
sum(Total_Price) as [Total Revenue]
from [dbo].[pizza_sales$]

--QUESTION 2 --Total Pizzas Sold

select
sum(Quantity) as [Total Pizza Sold]
from [dbo].[pizza_sales$]

--QUESTION 3 --Total number of Orders

select
count(Quantity) as [Total No of Orders]
from [dbo].[pizza_sales$]

--QUESTION 4 --How many order Veggie pizza category was sold

select *
from [dbo].[pizza_sales$]

select
sum (quantity) as [Quanity Sold]
from [dbo].[pizza_sales$]
where pizza_category = 'veggie'

--QUESTION 5 --How many The Hawaiian Pizza and  The Greek Pizza  was sold

select
sum (quantity) as [Quanity Sold]
from [dbo].[pizza_sales$]
where pizza_name in ('The Hawaiian Pizza','The Greek Pizza');

--QUESTION 6 -- List of pizza ordered in January 2015

select*
from [dbo].[pizza_sales$]
where order_date between '2015-01-01' and '2015-01-31'


select pizza_category,
count (pizza_id) as [Ordered Amount]
from [dbo].[pizza_sales$]
where order_date between '2015-01-01' and '2015-01-31'
group by pizza_category

----QUESTION 7 -- List of pizza ordered between 1st of November till 31st December 2015

select*
from [dbo].[pizza_sales$]
where order_date between '2015-11-01' and '2015-12-31'

select pizza_category,
count (pizza_id) as [Ordered Amount]
from [dbo].[pizza_sales$]
where order_date between '2015-11-01' and '2015-12-31'
group by pizza_category

----QUESTION 8 --What is the quantity of The Spinach Supreme Pizza sold in March 2015

select
sum (quantity) as [Quanity Sold]
from [dbo].[pizza_sales$]
where pizza_name = 'The Spinach Supreme Pizza'
and order_date between '2015-03-01' and '2015-03-31';

----QUESTION 9 --List of Medium pizza sold


select *
from [dbo].[pizza_sales$]
where pizza_size = 'M';


----QUESTION 10 --List of pizza that sold for more than 12.5

select *
from [dbo].[pizza_sales$]
where total_price > '12.5';
