use master
go
drop  database ATM
go 
Create database ATM
go 
use ATM
go
create Table UserType(
userTypeID int primary key,
[name] varchar(20) not null
)
go
create table [User](
[userId] int primary key,
[name] varchar(20) not null,
[userType] int foreign key references UserType(UserTypeID),
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
create table TransactionType(
transTypeID int primary key,
typeName varchar(20) not null,
[description] varchar (40) null
)
go
create table [Transaction](
transId int primary key,
transDate date not null,
cardNum varchar(20) foreign key references [Card](cardNum),
amount int not null,
transType int foreign key references TransactionType(transTypeID)
)




GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (1, N'Silver')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (2, N'Gold')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (3, N'Bronze')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (4, N'Common')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (1, N'Ali', 2, N'03036067000', N'Narowal')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (2, N'Ahmed', 1, N'03036047000', N'Lahore')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (3, N'Aqeel', 3, N'03036063000', N'Karachi')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (4, N'Usman', 4, N'03036062000', N'Sialkot')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (5, N'Hafeez', 2, N'03036061000', N'Lahore')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (3, N'Gift', N'Enjoy')
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1324327436569', 3, N'1770', CAST(N'2022-07-01' AS Date), 43025.31)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325423336', 3, N'0234', CAST(N'2020-03-02' AS Date), 14425.62)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325436566', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325666456', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2343243253436', 2, N'0034', CAST(N'2020-09-02' AS Date), 34025.12)
GO

INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1324327436569')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'2343243253436')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'2324325423336')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (3, N'2324325436566')
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (1, N'Withdraw', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (2, N'Deposit', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (3, N'ScheduledDeposit', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (4, N'Failed', NULL)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (1, CAST(N'2017-02-02' AS Date), N'1324327436569', 500, 1)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (2, CAST(N'2018-02-03' AS Date), N'2343243253436', 3000, 3)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (3, CAST(N'2017-05-06' AS Date), N'2324325436566', 2500, 2)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (4, CAST(N'2016-09-09' AS Date), N'2324325436566', 2000, 1)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (5, CAST(N'2015-02-10' AS Date), N'2324325423336', 6000, 4)
GO


Select * from UserType
Select * from [User]
Select * from UserCard
Select * from [Card]
Select * from CardType
Select * from [Transaction]
Select * from TransactionType
--QUESTION1
CREATE PROCEDURE Selectallusers
AS
SELECT * FROM [User]
GO;
exec Selectallusers
--Question2
create procedure userdetail 
@uname varchar(20)
as
select * from [User]
where [user].name=@uname
go
EXECUTE userdetail @uname = 'Ali'
--Question3
create procedure carddetail 
@cardn varchar(20)

as
select [User].name,phoneNum,city  
from [User]
join [UserCard] on [User].userId=[UserCard].userID
where [UserCard].cardNum=@cardn
go
EXECUTE carddetail @cardn = '1324327436569';
--Question4
create procedure minbalance 
@Bankbalance float output
as
select @Bankbalance=min([Card].balance)  
from [Card]
go
DECLARE @min_balance float
EXECUTE minbalance @Bankbalance = @min_balance OUTPUT
SELECT @min_balance
--Question5
CREATE PROCEDURE q5
  @uID int,
  @uName varchar(20),
  @totalCards int output
AS
BEGIN
  SELECT @totalCards = COUNT(UserCard.cardNum)
  FROM [User]
  INNER JOIN UserCard ON UserCard.userID = [User].userId
  WHERE [User].userId = @uID AND [User].[name] = @uName
  GROUP BY [User].userId, [User].[name]
END
GO

DECLARE @uID int = 1, @uName varchar(20) = 'Ali', @total int
EXECUTE q5 @uID, @uName, @totalCards = @total OUTPUT
SELECT @total
--question6
create procedure q6
@cNum varchar(20),@cPin varchar(4),
@status int output
as
begin
	if exists (select [Card].cardNum from [Card] where [card].cardNum=@cNum)
	begin
		if exists (select [Card].PIN from [Card] where [Card].PIN=@cPin)
		begin
			set @status=1
		end
		else
		begin
			set @status=0
		end
	end
end
go

declare @out int
execute q6
@cNum='1324327436569',@cPin='1770',
@status=@out output
select @out
go
--question7
CREATE PROCEDURE q7
    @cNum varchar(20),
    @cPin varchar(4),
    @nPin varchar(4),
    @status int OUTPUT
AS
BEGIN
    IF EXISTS (SELECT cardNum FROM Card WHERE cardNum=@cNum)
    BEGIN
        IF EXISTS (SELECT PIN FROM Card WHERE PIN=@cPin AND cardNum=@cNum)
        BEGIN
            UPDATE Card SET PIN=@nPin WHERE cardNum=@cNum
            SET @status=1
        END
        ELSE
        BEGIN
            SET @status=0
        END
    END
END

declare @out int
execute q7
@cNum='1324327436569',@cPin='0234',
@nPin='6780',
@status=@out output
select @out
--Question8

