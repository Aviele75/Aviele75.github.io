---ADVENTURE WORK 2024 PROJECT ON MS SQL COMPANY DATABASE----


---QUESTION 1----Retrieve information about the products with colour values except null, red, silver/black, white and list price between
--£75 and £750. Rename the column StandardCost to Price. Also, sort the results in descending order by list price.

select *
from Production.Product

select
color,
ListPrice,
StandardCost as Price
from Production.Product
where ListPrice between '75' and '750'
and color is not null
and color in ('White','Red','Silver/black')
order by ListPrice desc;

select
Color,
ListPrice,
StandardCost as Price
from Production.Product
where color is not null 
and (color = 'Red' or color = 'Silver/Black' or color = 'White')
and ListPrice between 75 and 750
order by ListPrice desc


---QUESTION 2 ---Find all the male employees born between 1962 to 1970 and with hire date greater than 2001 and female employees
--born between 1972 and 1975 and hire date between 2001 and 2002.

select *
from humanresources.employee

select *
from Person.Person

select
BusinessEntityID,
NationalIDNumber,
Gender,
Year (BirthDate) As [Date of Birth],
Year (HireDate) As [Date of Employment]
from humanresources.employee
where ((Gender = 'M'
and Year (Birthdate) between '1962' and '1970'
and Year (HireDate) > '2001' )) or
((Gender='F'
and Year (BirthDate) between '1972' and '1975'
and Year (HireDate) between '2001' and '2002'))

select 
BusinessEntityID,
NationalIDNumber,
Gender,
MaritalStatus,
Year (BirthDate) as Date_Of_Birth,
Year (HireDate) as Date_Of_Employment
from humanresources.employee
where ((Gender = 'M') and (Year(BirthDate) between 1962 and 1970) and (Year(HireDate) > 2001))
or ((Gender = 'f') and (Year(BirthDate) between 1972 and 1975) and (Year(HireDate) between 2001 and 2002));


-----JOIN TO INCLUDE EMPLOYEE NAMES----

select 
humanresources.employee.BusinessEntityID,
NationalIDNumber,
CONCAT(FirstName,', ',LastName) as Fullname,
JobTitle,
Gender,
MaritalStatus,
Year (BirthDate) as [Date Of Birth],
Year (HireDate) as [Date Of Employment]
from humanresources.employee
inner join person.Person
on humanresources.employee.BusinessEntityID = person.person.BusinessEntityID
where ((Gender = 'M' 
and Year(BirthDate) between '1962' and '1970' 
and Year(HireDate) > '2001')) or 
((Gender = 'f' 
and Year(BirthDate) between '1972' and '1975' 
and Year(HireDate) between '2001' and '2002'))

---QUESTION 3---Create a list of 10 most expensive products that have a product number beginning with ‘BK’. Include only the product
--ID, Name and colour.

select *
from Production.Product

select top 10
ProductID,
ProductNumber,
Name as [Product Name],
Color as [Product Colour],
ListPrice as [Product Price]
from  Production.Product
where ProductNumber like  'BK%'
order by ListPrice desc;


---QUESTION 4---Create a list of all contact persons, where the first 4 characters of the last name are the same as the first four characters of the email address. Also, for all contacts whose first name and the last name begin with the same characters, create
a new column called full name combining first name and the last name only. Also provide the length of the new column full name.

select *
from person.person

select *
from person.EmailAddress


select
person.person.BusinessEntityID,
CONCAT (FirstName,', ',LastName) as FullName,
len (CONCAT (FirstName,', ',LastName)) as [Length of Name],
EmailAddress
from person.person
inner join person.EmailAddress
on person.person.BusinessEntityID = person.EmailAddress.BusinessEntityID


---QUESTION 5---Return all product subcategories that take an average of 3 days or longer to manufacture. 

select *
from Production.ProductCategory

select *
from Production.ProductSubcategory

select 
Name as Product_Name,
avg (ProductSubcategoryID) as AverageReturns
from Production.ProductSubcategory
where ProductSubcategoryID >= 3
group by Name;

select
Name as Product_Name,
avg (ProductSubcategoryID) as AverageReturn
from Production.ProductSubcategory
group by Name
having avg (ProductSubcategoryID) >=3;

---QUESTION 6----Create a list of product segmentation by defining criteria that places each item in a predefined segment as follows. If
price gets less than £200 then low value. If price is between £201 and £750 then mid value. If between £750 and £1250
then mid to high value else higher value. Filter the results only for black, silver and red color products.

select *
from [Production].[Product]

select 
ProductID,
Name as [Product Name],
ProductNumber,
color as [Product Color],
ListPrice as Price,
 CASE
           WHEN ListPrice <=200 THEN 'Low Value'
           WHEN ListPrice between 201 and 750 THEN 'Mid Value'
		   WHEN ListPrice between 750 and 1250 THEN 'High Value'
           ELSE 'Higher Value'
           END as [Product Range]
from production.Product
where (color = 'Black'or color = 'Red'or color = 'Silver')
order by [Product Range];

---QUESTION 7--- How many Distinct Job title is present in the Employee table?...

select *
from HumanResources.Employee

select
count (distinct JobTitle) as Job_Title
from HumanResources.Employee

select
JobTitle,
COUNT(distinct JobTitle) as No_of_JobTitle
from HumanResources.Employee
group by JobTitle

---QUESTION 8---Use employee table and calculate the ages of each employee at the time of hiring.

select *,
datediff(year, BirthDate,HireDate) as Age@Hiring
from HumanResources.Employee

---OR---

Select 
BusinessEntityID, 
NationalIDNumber,
JobTitle,
BirthDate,
MaritalStatus,
Gender,
HireDate,
datediff(year, BirthDate,HireDate) as Age@Hiring
from HumanResources.Employee

----IF ADDING NAMES TO THE INFOR USING THE JOIN
select
HumanResources.Employee.BusinessEntityID,
CONCAT (FirstName, ', ',LastName) as [Full Name],
JobTitle,
BirthDate,
MaritalStatus,
Gender,
DATEDIFF(Year,Birthdate,HireDate) as [Age @ Hiring]
from HumanResources.Employee
inner join Person.Person
on HumanResources.Employee.BusinessEntityID = person.Person.BusinessEntityID;


---QUESTION 9---How many employees will be due a long service award in the next 5 years, if long service is 20 years?
select *
from HumanResources.Employee

Select 
BusinessEntityID, 
NationalIDNumber,
JobTitle,
BirthDate,
MaritalStatus,
Gender,
HireDate,
ModifiedDate,
DATEDIFF (year, HireDate, ModifiedDate) AS [Years Of Service],
5 + DATEDIFF (year, HireDate, ModifiedDate) AS Due_Long_Award
from HumanResources.Employee

---QUESTION 10---How many more years does each employee have to work before reaching sentiment, if sentiment age is 65?

select *
from HumanResources.Employee

Select 
BusinessEntityID, 
JobTitle,
BirthDate,
HireDate,
ModifiedDate,
DATEDIFF (year, BirthDate, ModifiedDate) AS Age, 
65 - DATEDIFF (year, BirthDate, ModifiedDate) AS [Years to Sentient] 
from HumanResources.Employee

---QUESTION 11--Implement new price policy on the product table base on the colour of the item. If white increase price by 8%, If yellow reduce price by 7.5%, If black increase price by 17.2%. If multi, silver,
--silver/black or blue take the square root of the price and double the value. Column should be called Newprice. For each item, also calculate commission as 37.5% of newly computed list price.


select *
from Production.Product

---Question 12---Print the information about all the Sales.Person and their sales quota. For every Sales person you should provide their
FirstName, LastName, HireDate, SickLeaveHours and Region where they work.


select *
from Person.Person           ---- BusinessEntityID, FirstName, LastName

select *
from sales.SalesPerson            ----BusinessEntityID, SaleQuota, TerritoryID     

select *
from HumanResources.Employee       ----BusinessEntityID, HireDate, SickLeaveHours

select *
from Sales.SalesTerritory      ---- TerritoryID, CountryRegionCode, Name



Select 
PP.BusinessEntityID, 
PP.Firstname,
PP.Lastname,
HRE.JobTitle,
HRE.HireDate,
HRE.SickleaveHours,
SSP.SalesQuota,
SST.CountryRegionCode,
SST.Name as Region
from Person.Person as PP
Inner join HumanResources.Employee as HRE
on PP.BusinessEntityID = HRE.BusinessEntityID
Inner join sales.SalesPerson as SSP
on PP.BusinessEntityID = SSP.BusinessEntityID
Inner join Sales.SalesTerritory as SST
on SST.TerritoryID = SSP.TerritoryID;

---Question 13---Using adventure works, write a query to extract the following information

create table Sales_Product (
ProductName varchar (100),
Product_Category_Name varchar (100),
Product_Subcategory_Name varchar (100),
SalesPerson varchar (100),
Revenue varchar (20),
Month_Of_Transaction varchar (20),
Quarter_Of_Transaction varchar (20),
Region varchar (40) );

select *
from Sales_Product


---Question 14 ---Display the information about the details of an order i.e. order number, order date, amount of order, which customer
--gives the order and which salesman works for that customer and how much commission he gets for an order.

select *
from Sales.SalesOrderDetail  --- SalesOrderID, SalesOrderDetailID, ModitfiedDate as Order_Date, OrderQty, AmountOfOrder as Price

select *
from Sales.SalesPerson ----TerritoryID, CommissionPct

select *
from Sales.SalesOrderHeader ---salesorderID, SalesOrderNumber, CustomerID, SalesPersonID, TerritoryID, OrderDate

select 
SSOH.SalesOrderID,
SSOH.SalesOrderNumber,
SSOH.OrderDate,
SSOD.OrderQty,
SSOD.LineTotal as [Order Price],
SSOH.CustomerID,
SSOH.SalesPersonID,
SSP.CommissionPct as [Commisson Paid]
from Sales.SalesOrderHeader as SSOH
Inner join Sales.SalesOrderDetail as SSOD
on SSOH.SalesOrderID = SSOD.SalesOrderID
Inner join Sales.SalesPerson as SSP
on SSP.TerritoryID = SSOH.TerritoryID;


select
Sales.SalesOrderHeader.SalesOrderID as OrderNumber,
OrderDate,
OrderQty,
LineTotal as Order_Price,
CustomerID,
SalesPersonID,
CommissionPct as Commission_Paid
from Sales.SalesOrderHeader 
inner join Sales.SalesOrderDetail
on Sales.SalesOrderHeader.SalesOrderID  = Sales.SalesOrderDetail.SalesOrderID
inner join Sales.SalesPerson
on Sales.SalesOrderHeader.TerritoryID = Sales.SalesPerson.TerritoryID;

---Question 16---Create a view to find out the top 5 most expensive products for each colour.

select *
from production.product;

select DISTINCT
Color 
from Production.Product
where color is not null

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'Black'
order by ListPrice desc

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'Blue'
order by ListPrice desc

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'Gray'
order by ListPrice desc

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'Multi'
order by ListPrice desc

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'Red'
order by ListPrice desc

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'Silver'
order by ListPrice desc

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'Silver/Black'
order by ListPrice desc

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'White'
order by ListPrice desc

select
Top 5 Name as Product_Name,
color,
ListPrice
from Production.Product
where color = 'Yellow'
order by ListPrice desc


