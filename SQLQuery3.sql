create table salesman
(
salesman_id int,
name varchar(15),
city varchar(10),
commission float(3)
)
select* from salesman
create table orders
(
order_no int,
purch_amnt float(6),
order_date date,
customer_id int,
salemen_id int
)
create table customers
(
customer_id int,
customer_name varchar(15),
city varchar(10),
grade int,
salesmen_id int
)
insert into [salesman]
values
(5001,'James Hoog','new york',0.15),
(5002,'Nail knight','paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','paris',0.14),
(5007,'Paul Adam','San jos',0.13),
(5003,'Lauson Hen','San jos',0.12)
go
select* from salesman
insert into [orders]
values
(70001,150.5,'2012-10-05',3005,5006),
(70009,270.65,'2011-09-10',3001,5005),
(70002,65.26,'2014-10-05',3002,5001),
(70004,150.5,'2012-10-05',3005,5006),
(70004,110.5,'2011-08-17 ',3009,5003),
(70007,948.5,'2012-09-10',3005,5006),
(70005,2400.6,'2010-07-27',3007,5001),
(70008,5760,'2013-09-10',3002,5001),
(70010,1983.43,'2010-10-10',3004,5005),
(70003,2480.4,'2013-10-10',3009,5003),
(70012,250.45,'2010-06-27',3008,5002),
(70011,75.29,'2014-08-17',3003,NULL),
(70013,3045.6,'2010-04-25',3002,NULL)
select* from orders
insert into [customers]
values
(3002,'Nick Rimando','New York',100,5001),
(3007,'John Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'John Brad Guzan','London',Null,5005)
select* from customers
alter table [salesman] alter column salesman_id int not null;
alter table [salesman] add constraint pk_salesman primary key(salesman_id);
select* from salesman
alter table[orders] alter column order_no int not null;
alter table[orders] alter column order_date date not null;
alter table[orders] add primary key(order_no,order_date);
alter table[orders] add foreign key(salemen_id) references salesman(salesman_id);
alter table[customers] alter column customer_id int not null;
alter table[customers] add primary key(customer_id);
alter table[customers] add foreign key(salesmen_id) references salesman(salesman_id);
alter table[orders] add foreign key(customer_id) references customers(customer_id);
select* from salesman
select salesman_id,city from salesman;
select* from customers
--question1
select* from customers
where city='New York'
order by customer_name asc;
--alter table salesman RENAME column name TO full_name;
--question2
select * from customers
where (customer_name like 'john%'and (city like 'London%'or city like 'Paris%' or city like 'New York%'));
--question3
select * from customers
where (city like 'New York' or city like 'London')
--question4
select* from orders
where (purch_amnt>500)
--question5
select name from salesman
where name like '_a%';
--question6
select commission+0.5 from salesman where(city like 'san jos%');
select* from salesman
--question7
select * from orders
order by order_date desc;
--question8
SELECT *,
SUBSTRING(name,0,charindex(' ',name)) as firstname from salesman;
--question9
select* from orders
where month(order_date)=1;
--question10
select DATENAME(YEAR,order_date)as [year],
       DATENAME(WEEK,order_date)as [week],
       DATENAME(DAYOFYEAR,order_date)as [dayoftheyear],
	   DATENAME(MONTH,order_date)as [month],
	   DATENAME(DAY,order_date)as [day],
	   DATENAME(WEEKDAY,order_date)as [weekday]
from orders
where month(order_date)=10;
--question11
select purch_amnt*3 from orders where(MONTH(order_date)=10);

--select customer_name from customers
--where check( select customer_id
--from orders
--intersect 
--select customer_id
--from orders 
--where ((YEAR(order_date)=2012 or YEAR(order_date)=2014)))
--question12
select customer_name
from customers
where customer_id IN(
select customer_id
from orders
intersect 
select customer_id
from orders 
where ((YEAR(order_date)=2012 or YEAR(order_date)=2014)))

--question13
select customer_name
from orders a 
join customers b on ((a.customer_id=b.customer_id) and (a.customer_id=a.customer_id))
where ( (YEAR(order_date)=2011 or YEAR(order_date)=2013));
--question14
select customer_name
from customers
where customer_id IN(
select customer_id
from orders
intersect 
select customer_id
from orders 
where ((YEAR(order_date)=2012 and YEAR(order_date)!=2014)))
--select customer_name
--from orders a 
--inner join customers b on ((a.customer_id=b.customer_id) and (a.customer_id=a.customer_id))
--where ( (YEAR(order_date)=2014 or YEAR(order_date)=2010));

select* from orders 
select* from customers

