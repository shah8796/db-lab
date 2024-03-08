CREATE TABLE Student
(
rollno varchar(10),
Name VARCHAR(255),
Gender char(2),
phone_no int

)
CREATE TABLE attendance
(
rollno varchar(10),
Data DATE,
status char(2),
class_venue int

)
CREATE TABLE class_venue
(
id int,
building VARCHAR(10),
room_no int,
teacher VARCHAR(10)

)

CREATE TABLE teacher
(
Name Varchar(10),
Designation Varchar(10),
Department Varchar(10)
)
select * from class_venue
ALTER TABLE Student
ALTER COLUMN phone_no Varchar(10);
INSERT INTO [Student] (rollno,Name,Gender,phone_no)
Values('21l-1834','Ali','M',03028796131)
go
select * from Student

INSERT INTO [Student] (rollno,Name,Gender,phone_no)
Values('21l-5432','Anas','M',03028796130)
go
INSERT INTO [Student] (rollno,Name,Gender,phone_no)
Values('21l-1806','Hafiz','M',03028796132)
go
select * from Student
INSERT INTO [attendance] (rollno,data,status,class_venue)
Values(1834,'02-09-2023','P',2)
go
INSERT INTO [attendance] (rollno,data,status,class_venue)
Values(5432,'02-09-2023','P',2)
go
INSERT INTO [attendance] (rollno,data,status,class_venue)
Values(1806,'02-09-2023','A',2)
go
INSERT INTO [class_venue] (id,building,room_no,teacher)
Values(1,'CS',3,'Sarim')
go
INSERT INTO [class_venue] (id,building,room_no,teacher)
Values(2,'EE',4,'Ali')
go
INSERT INTO [teacher] (name,designation,department)
Values('sarim','proffessor','CS')
go
INSERT INTO [teacher] (name,designation,department)
Values('Ali','proffessor','EE')
go
select * from class_venue
select * from teacher
select * from attendance
select * from student
Alter Table Student alter column rollno varchar(10) NOT NULL
Alter Table Student add constraint PK_STUDENT primary key (rollno)
Alter Table Attendance alter column rollno int NOT NULL
Alter Table Attendance add constraint PK_ATTENDANCE primary key (rollno)
Alter Table class_venue alter column id int NOT NULL
Alter Table class_venue add constraint PK_CLASS_VENUE primary key (id)
alter table teacher add constraint FK_TEACHER foreign key (name) references class_venue (id) on delete No Action on update Cascade
alter table Attendance add constarint FK_ATTENDANCE foreign key(rollno) references Student(rollno) on delete no action on update cascade
alter table Attendance add constarint FK_ATTENDANCE foreign key(rollno) references Student(rollno) on delete no action on update cascade

ALTER TABLE student
ADD warning varchar(10);
ALTER TABLE student
DROP COLUMN phone_no;
INSERT INTO [Student] (rollno,Name,Gender,warning)
Values('L162334','Faizan','M','3.2')
go
select * from class_venue
INSERT INTO [class_venue] (id,building,room_no,teacher)
Values(3,'CS',5,'Ali')
go
Update teacher
set Name='dr.sarim'
WHERE Name='sarim';
delete from Student
where rollno='l162334'
delete from Student
where rollno='21l-5432'
delete from attendance
where rollno=1806
Alter Table Student add constraint UNIQUE_CONSTRAINT_STUDENT_Name Unique (Name)
alter table Student add Constraint STUDENT_CHECK_Gender check (gender='M' or gender='F')
alter table attendance add Constraint attendance_CHECK_status check (status='A' or status='P')
alter table Attendance add constarint foreignkey foreign key(rollno) references Student(rollno) on delete no action on update cascade
select * from student
select * from attendance
delete from attendance
where rollno=5432
select * from student
SELECT FORMAT (getdate(), 'dd-MM-yy') as date
GO
