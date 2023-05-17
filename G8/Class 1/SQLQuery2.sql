CREATE database MyAppDatabase

CREATE table Student(
[Name] nvarchar(10),
School nvarchar(20),
Age int,
Gender bit
)

drop table Student
drop database SEDC2023

select * from Student

INSERT INTO Student([Name],School,Age,Gender)
VALUES
('Marko','SEDC',27,1),
('Afrodita','SEDC',30,0),
('Mila','SEDC',20,0),
('Nina','SEDC',22,0),
('Ana','SEDC',20,0),
('Marko','SEDC',27,1)

SELECT * FROM Student

DELETE FROM Student

use MyAppDatabase
select * from Student

alter table Student
add City nvarchar(50)

alter table Student
drop column City
alter table Student
add City nvarchar(50)

alter table Student 
add City varchar(10) Not null
constraint defval default  'Ohrid'


select * from Student

select Name,City,Age from Student

select * from Student
WHERE Age < 25