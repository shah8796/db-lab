--go
--create table Students
--(RollNo varchar(7) primary key
--,Name varchar(30)
--,WarningCount int
--,Department varchar(15)
--)
--GO
--INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'1', N'Ali', 0, N'CS')
--INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'2', N'Bilal', 0, N'CS')
--INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'3', N'Ayesha', 0, N'CS')
--INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'4', N'Ahmed', 0, N'CS')
--INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'5', N'Sara', 0, N'EE')
--INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'6', N'Salman', 1, N'EE')
--INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'7', N'Zainab', 2, N'CS')
--INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'8', N'Danial', 1, N'CS')

--go
--create table Courses
--(
--CourseID int primary key,
--CourseName varchar(40),
--PrerequiteCourseID int,
--CreditHours int
--) 
--GO
--INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (10, N'Database Systems', 20, 3)
--INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (20, N'Data Structures', 30,3)
--INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (30, N'Programing', NULL,3)
--INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (40, N'Basic Electronics', NULL,3)
--go

--go
--Create table Instructors 
--(
--InstructorID int Primary key,
--Name varchar(30),
--Department varchar(7) ,
--)
--GO
--INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (100, N'Ishaq Raza', N'CS')
--INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (200, N'Zareen Alamgir', N'CS')
--INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (300, N'Saima Zafar', N'EE')
--go
--Create table Semester
--(
--Semester varchar(15) Primary key,
--[Status] varchar(10),
--)
--GO
--INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Fall2016', N'Complete')
--INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2016', N'Complete')
--INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2017', N'InProgress')
--INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Summer2016', N'Cancelled')
--go
--Create table Courses_Semester
--(
--InstructorID int Foreign key References Instructors(InstructorID),
--CourseID int Foreign key References Courses(CourseID),
--Semester varchar(15) Foreign key References Semester(Semester), 
--Section varchar(1) ,
--AvailableSeats int,
--Department varchar(2)
--)
--GO
--INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'D', 45, N'CS')
--INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'C', 0, N'CS')
--INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (100, 10, N'Spring2017', N'A', 6, N'CS')
--INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2017', N'A', 6, N'CS')
--INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2016', N'A', 6, N'CS')
--INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2016', N'A', 0, N'CS')

--go



--create table Registration
--(
--Semester varchar(15) Foreign key References Semester(Semester),
--RollNumber  varchar(7) Foreign key References Students(RollNo),
--CourseID int Foreign key References Courses(CourseID), 
--Section varchar(1),
--GPA float
--)
--INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'1', 20, N'A', 3.3)
--INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'2', 20, N'B', 4)
--INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2016', N'1', 30, N'A', 1.0)
--INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'6', 40, N'D',0.0)
--INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2017', N'6', 40, N'D',1)


--go

--Create table ChallanForm
--(Semester varchar(15) Foreign key References Semester(Semester),
--RollNumber  varchar(7) Foreign key References Students(RollNo),
--TotalDues int,
--[Status] varchar(10)
--)
--GO
--INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'1', 100000, N'Paid')
--INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'2', 13333, N'Paid')
--INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'3', 5000, N'Paid')
--INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'4', 20000, N'Pending')


--select * from Students
--select * from Courses
--select * from Instructors
--select * from Registration
--select * from Semester
--select * from Courses_Semester
--select * from ChallanForm
----question 1
--create trigger bhrva
--on students
--instead of insert
--as begin
--print 'Cannot be inserted u motherfuck bitch'
--end
--insert into Students
--values
--('py','ali',0,'CS')
--select * from Students
----Question 2
--create trigger pehnyakk on courses
--instead of delete
--as begin 
--print 'Cannot be deleted'
--end
--delete from Courses where CourseID=10
--select * from Courses
----Question3
--create table notify
--(
--notification_id int primary key,
--student_id int,
--notifictaion_string varchar(20)
--);
--create procedure gashtor
--@Sem varchar(15),
--@RN  varchar(7),
--@CID int , 
--@SEC varchar(1),
--@Gppa float
--as begin
--if exists (select c.CourseID from Courses c join Registration R on 
--R.CourseID=c.CourseID 
--where ((c.PrerequiteCourseID=Null or (R.CourseID=c.PrerequiteCourseID)) and 
--(r.RollNumber=@RN and c.CourseID=@CID) ))
--begin
--insert into Registration
--values
--(@Sem, 
--@RN, 
--@CID,  
--@SEC,
--@Gppa);
--end
--else
--begin
--print'Registration couldnot be done because of not completing the pre requisit courses'
--end
--end
--exec gashtor 'fall2017',1,10,'A',4
----create trigger maddarchod on registration
----for insert,update,delete
----as begin 
----if exists(select 
----Question 4
--create trigger on registration 
--for insert
--as begin
--if exists( select r.RollNumber from Registration r
--join ChallanForm cf on r.RollNumber=cf.RollNumber
--where cf.rollnumber=inserted.RollNumber
--group by cf.RollNumber
--having sum(cf.TotalDues)>20000
--)
--begin
--insert into Registration