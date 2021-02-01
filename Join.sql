CREATE TABLE GroupTypes(
	Id int primary key identity,
	Name varchar(100) not null unique
)


CREATE TABLE Groups(
	Id int primary key identity,
	Name varchar(10) not null unique,
	MaxCount int check(MaxCount<12),
	GroupTypeId int references GroupTypes(Id)
)

--INNER JOIN

SELECT gr.Id,gr.Name 'Group',MaxCount,gt.Name 'Type' FROM Groups gr
inner join GroupTypes gt
ON
gr.GroupTypeId=gt.Id

--Left Outer Join

SELECT * FROM Groups gr
left outer join GroupTypes gt
ON
gr.GroupTypeId=gt.Id

--Right Outer Join

SELECT * FROM Groups gr
right join GroupTypes gt
ON
gr.GroupTypeId=gt.Id

--Full Outer Join

SELECT * FROM Groups gr
full join GroupTypes gt
ON
gr.GroupTypeId=gt.Id


--Self Join

CREATE TABLE Positions(
	Id int primary key identity,
	Occupation nvarchar(150),
	PositionId int
)

SELECT p1.Occupation,p2.Occupation 'Depends' FROM Positions p1
left join Positions p2
ON
p1.PositionId=p2.Id

--Non equal join
ALTER TABLE Students
ADD Grade int check(Grade<=100 AND Grade>=0)

CREATE TABLE Grades(
	Id int primary key identity,
	Letter char not null,
	MaxGrade int,
	MinGrade int
)


SELECT Name,Lastname,Email,Grade,Letter FROM Students st
join Grades gr
ON
st.Grade BETWEEN gr.MinGrade AND gr.MaxGrade

--Cross Join
CREATE TABLE Sizes(
	Id int primary key identity,
	Size varchar(6)
)

CREATE TABLE Products(
	Id int primary key identity,
	Name varchar(50)
)

SELECT Name,Size FROM Products
cross join Sizes