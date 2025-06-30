----SQL QUERY ON FOOTBALL PLAYER DATABASE---


--QUEST 1 -- Write a query to find all the players in the "Arizona" team.

	select *
	from [dbo].['Football Players Data$']
	where team = 'Arizona';

-- QUEST 2 -- Write a query to find all the players who play as a "WR" (Wide Receiver).

	select *
	from [dbo].['Football Players Data$']
	where Pos = 'WR';

-- QUEST 3 -- Write a query to list all players taller than 6 feet 2 inches.

select *
	from [dbo].['Football Players Data$']
	where "FT" >= 6 and "In" >= 2;

-- QUEST 4 -- Write a query to find all players who attended the "Washington" college.

select *
	from [dbo].['Football Players Data$']
	where College = 'Washington';

-- QUEST 5 -- Write a query to list players who are 25 years old or younger.

select *
	from [dbo].['Football Players Data$']
	where Age <= '25'
	order by Age desc

-- QUEST 6 -- Write a query to find all players with missing Age data.

select *
	from [dbo].['Football Players Data$']
	where Age = 'N/A';

-- QUEST 7 -- Write a query to find players who are rookies (Exp = 'R').

select *
	from [dbo].['Football Players Data$']
	Where "Exp" = 'R'

--QUEST 8 -- Write a query to find the tallest player on the "New Orleans" team.

select 
Name,
Team,
Inches
	from [dbo].['Football Players Data$']
	where Team = 'New Orleans'
	order by Inches desc

	select 
max (Inches) [Tallest Player]
	from [dbo].['Football Players Data$']
	where Team = 'New Orleans'

select 
Name,
Team,
Inches
	from [dbo].['Football Players Data$']
where Inches = (
select max (inches)
from [dbo].['Football Players Data$']
	where Team = 'New Orleans' and Inches = ("Inches"))
	order by Team;

-- QUEST 9 -- Write a query to find players weighing more than 250 pounds.

select *
	from [dbo].['Football Players Data$']
	Where "Wt" > 250;

--QUEST 10 -- Write a query to calculate the average height of players at each position.

select*
from [dbo].['Football Players Data$']

select "Pos", 
Avg(Inches) as Avg_Height_Inches
from [dbo].['Football Players Data$']
group by "Pos"
order by "Pos"

--QUEST 11 -- Write a query to find the heaviest player for each position.

select Pos,
max ("Wt") as [Heaviest Player]
from [dbo].['Football Players Data$'] 
group by Pos;


select
"Pos", 
"Name", 
"Wt", 
"Team"
from [dbo].['Football Players Data$']
Where "Wt" = 

(select max("Wt")
from [dbo].['Football Players Data$']
Where "Pos" = "Pos")
Order by  "Pos";

select
"Pos", 
"Name", 
"Team",
max("Wt") as Heaviest_Weight
from [dbo].['Football Players Data$']
group by "Pos", "Name", "Team"
order by Heaviest_Weight desc;

--QUEST 12 -- Write a query to rank players by age within their team. If two players have the same age, rank them by their weight.

select
"Team", 
"Name", 
"Age",
"Wt" ,
rank() over (partition by "Team" order by "Age" desc, "Wt" desc) as Rank
from [dbo].['Football Players Data$']
order by "Team", Rank;

select
"Team", 
"Name", 
"Age",
"Wt" ,
row_number() over (partition by "Team" order by "Age" desc, "Wt" desc) as Rank
from [dbo].['Football Players Data$']
order by "Team", Rank;

--QUEST 13 -- Write a query to calculate the average height (in inches) for all players older than 25 years.


select*
from [dbo].['Football Players Data$']

select
Avg("Inches") as Avg_Height_Inches
from [dbo].['Football Players Data$']
where  "Age" > '25';

select
"Team", 
"Name", 
"Age",
Avg("FT" * 12 + "In") as Avg_Height_Inches
from [dbo].['Football Players Data$']
group by "Team", "Name", "Age"
having "Age" > '25'


-- QUEST 14 -- Write a query to find all players whose height is greater than the average height of their respective team.

select
"Team", 
"Name", 
"Pos", 
"Ft", 
"In", 
("Ft" * 12 + "In") as Player_Height_Inches
from [dbo].['Football Players Data$']
where "Ft" * 12 + "In" > (
select avg ("Ft" * 12 + "In")
from [dbo].['Football Players Data$']
where "Team" = "Team")
order by "Team", ("Ft" * 12 + "In") desc;


select
"Team", 
"Name", 
"Pos", 
("Inches") as Player_Height_Inches
from [dbo].['Football Players Data$']
where "Inches" > (
select avg ("Inches")
from [dbo].['Football Players Data$']
where "Team" = "Team")
order by "Team", ("Inches") desc;


--QUEST 15 -- Write a query to find all players who share the same last name.

select 
"Name", 
"LastName",
"Team",
"Pos"
from [dbo].['Football Players Data$']
where "LastName" in (
select "LastName"
from [dbo].['Football Players Data$']
group by "LastName"
having count ("LastName") > 1)
order by "LastName";

--QUEST 16 -- Write a query to find the players with the minimum height for each position.

select
"Team", 
"Name", 
"Pos", 
"Ft", 
"In", 
("Ft" * 12 + "In") as Player_Height_Inches
from [dbo].['Football Players Data$']
where "Ft" * 12 + "In" = (
select min ("Ft" * 12 + "In")
from [dbo].['Football Players Data$']
where "Pos" = "Pos")
order by "Pos", ("Ft" * 12 + "In");

select
"Team", 
"Name", 
Pos as Position,
min ("Inches") as [Minimum Height]
from [dbo].['Football Players Data$']
group by Pos, "Team", "Name"
order by min ("Inches") asc;

--QUEST 17 -- Write a query to get the number of players for each team grouped by their experience level.

select
*
from [dbo].['Football Players Data$']

select
"Team", 
"Name",
"Exp" as [Experience Level], 
count (*) as [No of Player]
from [dbo].['Football Players Data$']
group by "Team", "Name", "Exp"
order by Team;

--QUEST 18 -- Write a query to find the tallest and shortest players from each college.

select
College,
Max ("Ft" * 12 + "In") as [Tallest Players],
min ("Ft" * 12 + "In") as [Shortest Players]
from [dbo].['Football Players Data$']
group by College
order by College asc;

--QUEST 19 -- Write a query to find all players whose weight is above the average weight for their respective position.

select *
from [dbo].['Football Players Data$']

select
"Team", 
"Name", 
"Pos", 
("Wt") as [Players Weight]
from [dbo].['Football Players Data$']
where "Wt" > (
select avg ("Wt")
from [dbo].['Football Players Data$']
where "Pos" = "Pos")
order by "Team", Wt desc;

select avg ("Wt")
from [dbo].['Football Players Data$']

--QUEST 20 -- Write a query to calculate the percentage of players in each position for every team.

Select 
Team,
Pos,
COUNT(*) AS Number_Of_Players,
COUNT(*) *100 / SUM(COUNT(*)) OVER (PARTITION BY Team) as [%Players]
FROM [dbo].['Football Players Data$']
GROUP BY Team, Pos
