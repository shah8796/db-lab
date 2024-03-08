CREATE TABLE Department (
  dept_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (dept_id)
);
CREATE TABLE Student1 (
  roll_no INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  dept_id INT NOT NULL,
  batch INT NOT NULL,
  PRIMARY KEY (roll_no),
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Course (
  course_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  credit_hrs INT NOT NULL,
  dept_id INT NOT NULL,
  PRIMARY KEY (course_id),
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Section (
  section_id INT NOT NULL,
  course_id INT NOT NULL,
  capacity INT NOT NULL,
  PRIMARY KEY (section_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Enrolled (
  student_roll_no INT NOT NULL,
  section_id INT NOT NULL,
)

CREATE TABLE Faculty (
  faculty_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  dept_id INT NOT NULL,
  PRIMARY KEY (faculty_id),
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
-- Insert 3 rows in the Student table
INSERT INTO Department (dept_id, name)
VALUES
  (1, 'Computer Science'),
  (2, 'Mathematics'),
  (3, 'Physics');
INSERT INTO Student1(roll_no, name, dept_id, batch)
VALUES
  (1, 'John Doe', 1, 2022),
  (2, 'Jane Smith', 2, 2023),
  (3, 'Bob Johnson', 1, 2022);

-- Insert 3 rows in the Course table
INSERT INTO Course (course_id, name, credit_hrs, dept_id)
VALUES
  (101, 'Introduction to Computer Science', 3, 1),
  (102, 'Introduction to Mathematics', 3, 2),
  (103, 'Introduction to Physics', 3, 3);

-- Insert 3 rows in the Section table
INSERT INTO Section (section_id, course_id, capacity)
VALUES
  (1, 101, 50),
  (2, 102, 40),
  (3, 103, 30);

-- Insert 3 rows in the Enrolled table
INSERT INTO Enrolled (student_roll_no, section_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);

-- Insert 3 rows in the Faculty table
INSERT INTO Faculty (faculty_id, name, dept_id)
VALUES
  (1, 'Dr. John Smith', 1),
  (2, 'Dr. Sarah Lee', 2),
  (3, 'Dr. Robert Chen', 3);

select * from Department
select * from Student1
select* from Faculty
select * from Enrolled
select * from Course
select * from Section
CREATE TABLE Auditing_sequence (
  sequence_value INT NOT NULL
);
INSERT INTO Auditing_sequence (sequence_value) VALUES (0);

CREATE TABLE Auditing1 (
  audit_id INT NOT Null ,
  Last_change_on time
  PRIMARY KEY (audit_id)
);
CREATE TRIGGER auditing_trigger1
ON auditing1
AFTER INSERT
AS
BEGIN 
  UPDATE Auditing_sequence SET sequence_value = sequence_value + 1;
  --UPDATE Auditing1 SET audit_id = (SELECT sequence_value FROM Auditing_sequence) WHERE audit_id IS NULL;
END;

CREATE TRIGGER faculty_audit
ON Faculty
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @currtime DATETIME = GETDATE();
    INSERT INTO Auditing1(audit_id, Last_change_on)
    VALUES ((SELECT sequence_value FROM Auditing_sequence), @currtime);
    --UPDATE Auditing_sequence SET sequence_value = sequence_value + 1;
    
    -- Perform the actual insert, update, or delete operation
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Perform the insert or update operation
        UPDATE Faculty SET name = inserted.name, dept_id = inserted.dept_id
        FROM Faculty INNER JOIN inserted ON Faculty.faculty_id = inserted.faculty_id;
        
        INSERT INTO Faculty (faculty_id, name, dept_id)
        SELECT faculty_id, name, dept_id FROM inserted
        WHERE NOT EXISTS (SELECT * FROM Faculty WHERE Faculty.faculty_id = inserted.faculty_id);
        
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Perform the delete operation
        DELETE FROM Faculty WHERE Faculty.faculty_id IN (SELECT faculty_id FROM deleted);
    END
END;
CREATE TRIGGER student1_audit
ON student1
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @currtime DATETIME = GETDATE();
    INSERT INTO Auditing1(audit_id, Last_change_on)
    VALUES ((SELECT sequence_value FROM Auditing_sequence), @currtime);
    --UPDATE Auditing_sequence SET sequence_value = sequence_value + 1;
    
    -- Perform the actual insert, update, or delete operation
    
END;
CREATE TRIGGER dept_audit
ON department
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @currtime DATETIME = GETDATE();
    INSERT INTO Auditing1(audit_id, Last_change_on)
    VALUES ((SELECT sequence_value FROM Auditing_sequence), @currtime);
    --UPDATE Auditing_sequence SET sequence_value = sequence_value + 1;
    
    -- Perform the actual insert, update, or delete operation
    
END;
--	QUESTION2
ALTER TABLE auditing1
ADD table_name varchar(10);
alter TRIGGER student1_audit
ON student1
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @currtime DATETIME = GETDATE();
    INSERT INTO Auditing1(audit_id,Last_change_on,table_name)
    VALUES ((SELECT sequence_value FROM Auditing_sequence), @currtime,'student');
    --UPDATE Auditing_sequence SET sequence_value = sequence_value + 1;
    
    -- Perform the actual insert, update, or delete operation
    
END;
select* from Auditing1
alter TRIGGER dept_audit
ON department
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @currtime DATETIME = GETDATE();
    INSERT INTO Auditing1(audit_id,Last_change_on,table_name)
    VALUES ((SELECT sequence_value FROM Auditing_sequence), @currtime,'department');
    --UPDATE Auditing_sequence SET sequence_value = sequence_value + 1;
    
    -- Perform the actual insert, update, or delete operation
    
END;
alter TRIGGER faculty_audit
ON faculty
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @currtime DATETIME = GETDATE();
    INSERT INTO Auditing1(audit_id,Last_change_on,table_name)
    VALUES ((SELECT sequence_value FROM Auditing_sequence), @currtime,'faculty');
    --UPDATE Auditing_sequence SET sequence_value = sequence_value + 1;
    
    -- Perform the actual insert, update, or delete operation
    
END;
--question3
select * from Course
select * from Section
create view register
as
select name,section_id from [Course],[Section]
select * from register
create trigger enroller
on enrolled
for insert
as
begin
select * from register
end
--question4
create procedure procedure1
as
begin
select name,section_id from [Course],[Section]
end
--question5
--already done in 1st question
--question6
create trigger lovi
on database
for alter_table
as
print 'can not be altered'

