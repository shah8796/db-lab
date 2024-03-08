use master
go
drop  database ATM
go 
Create database ATM
go 
use ATM
go

create table [User](
[userId] int primary key,
[name] varchar(20) not null,
[phoneNum] varchar(15) not null,
[city] varchar(20) not null
)
go

create table CardType(
[cardTypeID] int primary key,
[name] varchar(15),
[description] varchar(40) null
)
go
create Table [Card](
cardNum Varchar(20) primary key,
cardTypeID int foreign key references  CardType([cardTypeID]),
PIN varchar(4) not null,
[expireDate] date not null,
balance float not null
)
go


Create table UserCard(
userID int foreign key references [User]([userId]),
cardNum varchar(20) foreign key references [Card](cardNum),
primary key(cardNum)
)
go
create table [Transaction](
transId int primary key,
transDate date not null,
cardNum varchar(20) foreign key references [Card](cardNum),
amount int not null
)


INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (1, N'Ali', N'03036067000', N'Narowal')
GO
INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (2, N'Ahmed', N'03036047000', N'Lahore')
GO
INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (3, N'Aqeel', N'03036063000', N'Karachi')
GO
INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (4, N'Usman', N'03036062000', N'Sialkot')
GO
INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (5, N'Hafeez', N'03036061000', N'Lahore')
GO


INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later')
GO

INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1234', 1, N'1770', CAST(N'2022-07-01' AS Date), 43025.31)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1235', 1, N'9234', CAST(N'2020-03-02' AS Date), 14425.62)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1236', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1237', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1238', 2, N'9004', CAST(N'2020-09-02' AS Date), 34025.12)
GO

INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1234')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1235')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'1236')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (3, N'1238')
GO
Insert  [dbo].[UserCard] ([userID], [cardNum]) VALUES (4, N'1237')

INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (1, CAST(N'2017-02-02' AS Date), N'1234', 500)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (2, CAST(N'2018-02-03' AS Date), N'1235', 3000)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (3, CAST(N'2020-01-06' AS Date), N'1236', 2500)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (4, CAST(N'2016-09-09' AS Date), N'1238', 2000)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (5, CAST(N'2020-02-10' AS Date), N'1234', 6000)
GO


Select * from [User]
Select * from UserCard
Select * from [Card]
Select * from CardType
Select * from [Transaction]
--QUESTION1
select CardTypeid,count(*) as [unique]
from Card
join UserCard on UserCard.cardNum=card.cardNum
group by cardTypeID
--select count(distinct cardNum)
--from card
--where (cardtypeid=2);
--QUESTION2
select name,c.cardNum
from [User]  
inner join usercard
on [User].userID=UserCard.userid
inner join card c
on usercard.cardNum=c.cardNum
where (c.balance>=2000 and c.balance<=4000);
--	Question3
select name
from [User]
left join UserCard
on [User].userId=UserCard.userID
where [User].userid=(select userid
from [User]
except
select userid
from UserCard
)
--QUESTION4
select [user].name,[user].userid,[CardType].name
from [User]
left join [UserCard] on [User].userId=UserCard.userID
left join [Card] on [UserCard].cardNum=[Card].cardNum
left join [cardtype] on [card].cardtypeid=[cardtype].cardtypeid
left join [Transaction] on [card].cardNum=[Transaction].cardNum
where ([Transaction].transDate > getdate())
--question5
select CardTypeid,count(*) as [cards]
from [Card]
--join UserCard on UserCard.cardNum=card.cardNum
join [transaction] on [Card].cardNum=[transaction].cardnum
where ([transaction].amount>6000 and (year([transaction].transdate)>2014 and year([transaction].transdate)<2018))
group by cardTypeID
--question 6
select [User].userId,name,city,phonenum
from [User]
inner join [UserCard] on [User].userid=[UserCard].userid
inner join [Card] on [UserCard].cardNum=[card].cardNum
where DATEDIFF(month,[Card].expireDate,GETDATE())<=3
--question 7
select [user].userId,name
from [User]
inner join [UserCard] on [User].userid=[UserCard].userid
inner join [Card] on [card].cardNum=[UserCard].cardNum
group by [user].userId,[user].name
having (SUM([card].balance)>=5000)
--question 8
select a.cardNum
from [Card] a
where year(a.expireDate)=(
select distinct year(b.expireDate)
from Card b
group by year(b.expireDate)
having (count(year(b.expiredate))>1))
--question 9
select a.name
from [User] a
where SUBSTRING(a.name,1,1)=(
select SUBSTRING(b.name,1,1)
from [User] b
group by SUBSTRING(b.name,1,1)
having count(SUBSTRING(b.name,1,1))>1);
--question 10
select a.name,b.userid
from [User] a
inner join UserCard b on a.userId=b.userID
inner join [Card] c on b.cardNum=c.cardNum
where (c.cardTypeID=1 and  c.cardTypeID=2)
group by a.name,b.userID
having count(c.cardTypeID)>1
--question 11
select  distinct count(a.userid) as users,sum(c.balance) as balance,a.city 
from [user] a
join [UserCard] b on a.userId=b.userID
join [Card] c on c.cardNum=b.cardNum
group by a.city
having(count(a.city)>1)


--select b.name 
--from [User] b
--where SUBSTRING(b.name,1,1)=(
--select SUBSTRING(a.name,1,1)
--from [User] a
--)
--select distinct b.name
--from [User] b
--group by b.name)
--having (count(b.name=''))>1))