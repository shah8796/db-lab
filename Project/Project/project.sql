--ONLINE TICKETING SYSTEM
--21L-1834
--21L-5432
--21L-5275
--21L-7553








create table user_name
(
F_Name varchar(10) NOT NULL,
L_Name varchar(10) NOT NULL,
phone_no varchar(10) NOT NULL,
City varchar(10) NOT NULL,
Gender varchar(3) NOT NULL check(Gender='M' or Gender='F' or Gender='O'),
Age int NOT NULL,
Email varchar(15) NOT NULL,
Password varchar(15) NOT NULL,
primary key(F_Name,L_Name,phone_no)
)
create table BOOKING
(
firstName varchar(10) NOT NULL,
lastname varchar(10) NOT NULL,
Phone_no varchar(12) NOT NULL,
city varchar(10) NOT NULL,
Route varchar(25) NOT NULL,
booking_id varchar(5) NOT NULL,
medium_id varchar(5) NOT NULL,
seat_no int NOT NULL check(seat_no>=0 and seat_no<=30),
class varchar(10) NOT NULL,
gender varchar(3) NOT NULL,
No_Of_Seats int NOT NULL check(No_of_Seats>=1 and No_of_Seats<=30),
Transaction_id int NOT NULL,
primary key(booking_id,medium_id,route),
--foreign key(firstName) references user_name(F_Name),
--foreign key(lastname) references user_name(L_Name),
);
create table TRAINS
(
train_id int NOT NULL,
train_name varchar(10) NOT NULL,
route varchar(25) NOT NULL,
primary key(train_id),
--foreign key(route) references BOOKING(route)

);
create table BUSES
(
bus_id int NOT NULL,
bus_name varchar(10) NOT NULL,
route varchar(10) NOT NULL,
primary key(bus_id)
);
create table payment
(
discount int NOT NULL,
transaction_id int NOT NULL,
Payment_method varchar(10) NOT NULL,
price int NOT NULL,
username varchar(10) NOT NULL,
Phone_num int NOT NULL,
Rating int NOT NULL check(Rating>=0 and Rating<=5),
voucher_code int NOT NULL
primary key(phone_num),
foreign key(voucher_code) references premium_user(voucher_code)
);
create table premium_user
(
Name varchar(15) NOT NULL,
city varchar(10) NOT NULL,
contact_no int NOT NULL,
voucher_code int NOT NULL,
primary key(voucher_code)

);
insert into [user_name]
values
('Ali','Shah',03028796131,'Lahore','M',21,'ali@gmail.com','akjsdflkjs'),
('Hafiz','Pehalwan',03018796131,'Lahore','O',21,'h0302@gmail.com','akjsdflkj'),
('anas','aqeel',03058796131,'Faislabad','M',21,'aq030@gmail.com','akjsdflkjsh'),
('Butt','Li',03118796131,'gujranwala','M',29,'butt@gmail.com','akjsdflkjs')
go
insert into [BOOKING]
values
('Ali','Shah','03028796131','Lahore','lhr-multan','abcde','train',1,'buisness','M',2,223344),
('hafiz','pehalwan','03018796131','Lahore','lhr-multan','bcdef','train',3,'buisness','O',1,223345),
('anas','aqeel','03058796131','Faislabad','fsbd-lhr','cdefg','bus',1,'economy','M',1,223346),
('Butt','li','03118796131','gujranwala','gjrwl-multan','defgh','train',1,'buisness','M',2,223347)
go
select* from user_name
insert into [TRAINS]
values
(3678,'buttexpres','lhr-multan'),
(3679,'daewoo','lhr-isbd'),
(3680,'F-movers','fsbd-multan'),
(3681,'sky','fsbd-isbd'),
(3980,'rajput','fsbd-lhr')
go
insert into [BUSES]
values
(1234,'biltravel','lhr-multan'),
(1235,'datravel','lhr-isbd'),
(1236,'ratravel','fsbd-mul'),
(1237,'skytravel','fsbd-isbd'),
(1238,'bttravel','fsbd-lhr')
go
insert into [payment]
values
(5,223344,'sadapay',1800,'Ali',03028796131,5,23),
(5,223345,'sadapay',1800,'Anas',03058796131,5,24)
go
insert into [premium_user]
values
('Ali','Lahore',03028796131,23),
('Anas','Lahore',03058796131,24)
go
alter table  premium_user alter column contact_no varchar(100) NOT NULL
alter table  payment drop constraint PK__payment__7DC10DF122A840D4;
alter table  payment alter column Phone_num varchar(100) NOT NULL 
alter table  BOOKING alter column Phone_no varchar(100) NOT NULL