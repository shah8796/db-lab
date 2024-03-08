

--create table [User](
--[userId] int primary key,
--[name] varchar(20) not null,
--[phoneNum] varchar(15) not null,
--[city] varchar(20) not null
--)
--go

--create table CardType(
--[cardTypeID] int primary key,
--[name] varchar(15),
--[description] varchar(40) null
--)
--go
--create Table [Card](
--cardNum Varchar(20) primary key,
--cardTypeID int foreign key references  CardType([cardTypeID]),
--PIN varchar(4) not null,
--[expireDate] date not null,
--balance float not null
--)
--go


--Create table UserCard(
--userID int foreign key references [User]([userId]),
--cardNum varchar(20) foreign key references [Card](cardNum),
--primary key(cardNum)
--)
--go
--create table [Transaction](
--transId int primary key,
--transDate date not null,
--cardNum varchar(20) foreign key references [Card](cardNum),
--amount int not null
--)


--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (1, N'Ali', N'03036067000', N'Narowal')
--GO
--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (2, N'Ahmed', N'03036047000', N'Lahore')
--GO
--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (3, N'Aqeel', N'03036063000', N'Karachi')
--GO
--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (4, N'Usman', N'03036062000', N'Sialkot')
--GO
--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (5, N'Hafeez', N'03036061000', N'Lahore')
--GO


--INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now')
--GO
--INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later')
--GO

--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1234', 1, N'1770', CAST(N'2022-07-01' AS Date), 43025.31)
--GO
--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1235', 1, N'9234', CAST(N'2020-03-02' AS Date), 14425.62)
--GO
--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1236', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52)
--GO
--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1237', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3)
--GO
--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1238', 2, N'9004', CAST(N'2020-09-02' AS Date), 34025.12)
--GO

--INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1234')
--GO
--INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1235')
--GO
--INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'1236')
--GO
--INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (3, N'1238')
--GO
--Insert  [dbo].[UserCard] ([userID], [cardNum]) VALUES (4, N'1237')

--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (1, CAST(N'2017-02-02' AS Date), N'1234', 500)
--GO
--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (2, CAST(N'2018-02-03' AS Date), N'1235', 3000)
--GO
--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (3, CAST(N'2020-01-06' AS Date), N'1236', 2500)
--GO
--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (4, CAST(N'2016-09-09' AS Date), N'1238', 2000)
--GO
--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (5, CAST(N'2020-02-10' AS Date), N'1234', 6000)
--GO


--Select * from [User]
--Select * from UserCard
--Select * from [Card]
--Select * from CardType
--Select * from [Transaction]
----question1
--create function pehnyakko
--(
--@cn varchar(20)
--)
--returns float
--as
--begin 
--declare @minbal float
--select @minbal=([Card].balance)from [Card] where [Card].cardNum=@cn
--return @minbal
--end
--select dbo.pehnyakko(N'1234')
----question 2
--create function dalla
--(
--@id int
--)
--returns table
--as
--return
--select *from [User] u where u.userId=@id
--select * from dbo.dalla(1)
----question 3
--create procedure bhrve
--@nam varchar(20)
--as
--begin 
--select * from [User] u where u.name=@nam
--end
--execute bhrve 'Ali'
----question 4
--create procedure pehnchodo1
--@id int
--as
--begin 
--select uc.cardnum,dbo.pehnyakko(uc.cardNum) as balance 
--from [UserCard] uc 
--where uc.userID=@id
--end
--execute pehnchodo1 1
----question 5
--create function bhosrchod
--(
--@id int
--)
--returns table
--as
--return
--select [Card].cardNum,[Card].balance from [Card] 
--join [UserCard] uc on uc.cardNum=[Card].cardNum
--where uc.userID=@id
--select * from bhosrchod(1)
----question 6
--create procedure hello
--@id int,
--@ht int output
--as
--begin
--select count(uc.userid) as countofcard from [UserCard] uc
--where uc.userID=@id
--end
--declare @counter int
--execute hello 
--@id=1,
--@ht=@counter
----Question 7
--create function login
--(
--@cn varchar(20),
--@p varchar(4)
--)
--returns int
--as
--begin
--declare @status int
--if exists(select c.cardnum,c.pin from [Card] c
--where c.cardNum=@cn and c.pin=@p)
--begin
--set @status=1
--end
--else
--begin
--set @status=0
--end
--return @status
--end
--select dbo.login(N'1234',N'1770')