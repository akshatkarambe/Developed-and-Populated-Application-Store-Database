/*
Created: 01/03/2018
Modified: 05/04/2018
Project: App Store Model
Model: App_Store_Version2
Company: Northeastern University
Author: Akshat Karambe
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Apps

CREATE TABLE [Apps]
(
 [App_Id] Int NOT NULL,
 [Developer_Id] Int NOT NULL,
 [App_Name] Varchar(100) NOT NULL,
 [App_Description] Varchar(1000) NOT NULL,
 [App_Size] Float NOT NULL,
 [App_Amount] Float NOT NULL,
 [App_Legals] Varchar(1000) NOT NULL,
 [App_AgeFlag] Bit NOT NULL,
 [InApp_Adv] Bit NOT NULL,
 [InApp_Purchase] Bit NOT NULL,
 [Contact] Varchar(25) NULL,
 [Website] Varchar(50) NULL
)
go

-- Create indexes for table Apps

CREATE INDEX [IX_Relationship24] ON [Apps] ([Developer_Id])
go

-- Add keys for table Apps

ALTER TABLE [Apps] ADD CONSTRAINT [Key1] PRIMARY KEY ([App_Id])
go

ALTER TABLE [Apps] ADD CONSTRAINT [App_Name] UNIQUE ([App_Name])
go

-- Table Version

CREATE TABLE [Version]
(
 [Version_Id] Int NOT NULL,
 [App_Id] Int NOT NULL,
 [Version_Number] Float NOT NULL,
 [VersionUpload_DateTime] Datetime NOT NULL
)
go

-- Create indexes for table Version

CREATE INDEX [IX_Relationship28] ON [Version] ([App_Id])
go

-- Add keys for table Version

ALTER TABLE [Version] ADD CONSTRAINT [Key2] PRIMARY KEY ([Version_Id])
go

-- Table Review

CREATE TABLE [Review]
(
 [Review_Id] Int NOT NULL,
 [User_Id] Int NOT NULL,
 [Version_Id] Int NULL,
 [App_Id] Int NOT NULL,
 [Review_Description] Varchar(1000) NULL,
 [Review_DateTime] Datetime NOT NULL,
 [Review_Rating] Int NOT NULL
)
go

-- Create indexes for table Review

CREATE INDEX [IX_Relationship14] ON [Review] ([Version_Id])
go

CREATE INDEX [IX_Relationship33] ON [Review] ([App_Id])
go

CREATE INDEX [IX_Relationship37] ON [Review] ([User_Id])
go

-- Add keys for table Review

ALTER TABLE [Review] ADD CONSTRAINT [Key3] PRIMARY KEY ([Review_Id])
go

-- Table AppCategory

CREATE TABLE [AppCategory]
(
 [AppCategory_Id] Int NOT NULL,
 [App_Id] Int NULL,
 [AppCategory_Name] Varchar(100) NOT NULL
)
go

-- Add keys for table AppCategory

ALTER TABLE [AppCategory] ADD CONSTRAINT [Key4] PRIMARY KEY ([AppCategory_Id])
go

-- Table Users

CREATE TABLE [Users]
(
 [User_Id] Int NOT NULL,
 [User_FirstName] Varchar(50) NOT NULL,
 [User_LastName] Varchar(50) NULL,
 [User_Gender] Varchar(10) NOT NULL,
 [User_DateOfBirth] Date NOT NULL,
 [User_Address] Varchar(150) NOT NULL,
 [User_Country] Varchar(15) NULL,
 [User_ZipCode] Int NOT NULL,
 [User_Phone] Bigint NULL
)
go

-- Add keys for table Users

ALTER TABLE [Users] ADD CONSTRAINT [Key5] PRIMARY KEY ([User_Id])
go

-- Table Device

CREATE TABLE [Device]
(
 [UserDevice_Id] Int NOT NULL,
 [User_Id] Int NOT NULL,
 [Device_Name] Varchar(100) NOT NULL,
 [Device_Zip] Int NOT NULL,
 [Device_CompanyName] Varchar(20) NOT NULL,
 [Device_Ram] Float NOT NULL,
 [Device_OS] Varchar(25) NOT NULL
)
go

-- Create indexes for table Device

CREATE INDEX [IX_Relationship39] ON [Device] ([User_Id])
go

-- Add keys for table Device

ALTER TABLE [Device] ADD CONSTRAINT [Key6] PRIMARY KEY ([UserDevice_Id])
go

-- Table UserCardDetails

CREATE TABLE [UserCardDetails]
(
 [User_Id] Int NOT NULL,
 [First_Name] Varchar(50) NOT NULL,
 [Last_Name] Varchar(50) NOT NULL,
 [Address] Varchar(150) NOT NULL,
 [ZipCode] Int NOT NULL,
 [CardNumber] Bigint NOT NULL,
 [CardType] Varchar(50) NOT NULL,
 [CardExpiry] Date NOT NULL
)
go

-- Add keys for table UserCardDetails

ALTER TABLE [UserCardDetails] ADD CONSTRAINT [Key7] PRIMARY KEY ([User_Id])
go

ALTER TABLE [UserCardDetails] ADD CONSTRAINT [CreditCardNumber] UNIQUE ([CardNumber])
go

-- Table UserArchives

CREATE TABLE [UserArchives]
(
 [UserArchives_Id] Int NOT NULL,
 [UserArchives_timestamp] Datetime NOT NULL,
 [User_Id] Int NOT NULL
)
go

-- Create indexes for table UserArchives

CREATE INDEX [IX_Relationship11] ON [UserArchives] ([User_Id])
go

-- Add keys for table UserArchives

ALTER TABLE [UserArchives] ADD CONSTRAINT [UserArchives_Id] UNIQUE CLUSTERED ([UserArchives_Id])
go

-- Table Developer

CREATE TABLE [Developer]
(
 [Developer_Id] Int NOT NULL,
 [Developer_FirstName] Varchar(50) NOT NULL,
 [Developer_LastName] Varchar(50) NULL,
 [Developer_Phone] Bigint NULL,
 [Developer_Address] Varchar(150) NULL,
 [Developer_WebAddress] Varchar(100) NOT NULL
)
go

-- Add keys for table Developer

ALTER TABLE [Developer] ADD CONSTRAINT [Key9] PRIMARY KEY ([Developer_Id])
go

ALTER TABLE [Developer] ADD CONSTRAINT [Developer_id] UNIQUE ([Developer_Id])
go

-- Table DeveloperCardDetails

CREATE TABLE [DeveloperCardDetails]
(
 [Developer_Id] Int NOT NULL,
 [First_Name] Varchar(50) NOT NULL,
 [Last_Name] Varchar(50) NULL,
 [Address] Varchar(150) NOT NULL,
 [ZipCode] Int NOT NULL,
 [CardNumber] Bigint NOT NULL,
 [CardType] Varchar(50) NOT NULL,
 [CardExpiry] Date NOT NULL
)
go

-- Add keys for table DeveloperCardDetails

ALTER TABLE [DeveloperCardDetails] ADD CONSTRAINT [Key10] PRIMARY KEY ([Developer_Id])
go

ALTER TABLE [DeveloperCardDetails] ADD CONSTRAINT [CardNumber] UNIQUE ([CardNumber])
go

-- Table UserPayment

CREATE TABLE [UserPayment]
(
 [UserPayment_Id] Int NOT NULL,
 [User_Id] Int NOT NULL,
 [UserPayment_Datetime] Datetime NOT NULL,
 [UserPayment_Type] Varchar(50) NOT NULL,
 [UserPayment_Amount] Float NOT NULL
)
go

-- Create indexes for table UserPayment

CREATE INDEX [IX_Relationship38] ON [UserPayment] ([User_Id])
go

-- Add keys for table UserPayment

ALTER TABLE [UserPayment] ADD CONSTRAINT [Key11] PRIMARY KEY ([UserPayment_Id])
go

-- Table DeveloperPayment

CREATE TABLE [DeveloperPayment]
(
 [DeveloperPayement_Id] Int NOT NULL,
 [Developer_Id] Int NOT NULL,
 [DeveloperPayment_Datetime] Datetime NOT NULL,
 [DeveloperPayment_Type] Varchar(50) NULL,
 [DeveloperPayment_Amount] Float NULL
)
go

-- Create indexes for table DeveloperPayment

CREATE INDEX [IX_Relationship26] ON [DeveloperPayment] ([Developer_Id])
go

-- Add keys for table DeveloperPayment

ALTER TABLE [DeveloperPayment] ADD CONSTRAINT [Key12] PRIMARY KEY ([DeveloperPayement_Id])
go

-- Table Downloads

CREATE TABLE [Downloads]
(
 [Downloads_Id] Int NOT NULL,
 [User_Id] Int NOT NULL,
 [App_Id] Int NOT NULL,
 [Version_Id] Int NOT NULL,
 [UserDevice_Id] Int NOT NULL,
 [Downloads_Datetime] Datetime NOT NULL
)
go

-- Create indexes for table Downloads

CREATE INDEX [IX_Relationship29] ON [Downloads] ([User_Id])
go

CREATE INDEX [IX_Relationship30] ON [Downloads] ([App_Id])
go

CREATE INDEX [IX_Relationship31] ON [Downloads] ([Version_Id])
go

CREATE INDEX [IX_Relationship34] ON [Downloads] ([UserDevice_Id])
go

-- Add keys for table Downloads

ALTER TABLE [Downloads] ADD CONSTRAINT [Key13] PRIMARY KEY ([Downloads_Id])
go

-- Table Entity1

CREATE TABLE [Entity1]
(
 [App_Id] Int NOT NULL,
 [User_Id] Int NOT NULL
)
go

-- Add keys for table Entity1

ALTER TABLE [Entity1] ADD CONSTRAINT [Key14] PRIMARY KEY ([App_Id],[User_Id])
go

-- Table App_Location

CREATE TABLE [App_Location]
(
 [Country_Id] Int NOT NULL,
 [Country_Name] Varchar(50) NULL,
 [Language] Varchar(20) NULL
)
go

-- Add keys for table App_Location

ALTER TABLE [App_Location] ADD CONSTRAINT [Key15] PRIMARY KEY NONCLUSTERED ([Country_Id])
go

-- Table Review_Archive

CREATE TABLE [Review_Archive]
(
 [Review_Id] Int NOT NULL,
 [Review_Description] Varchar(1000) NULL,
 [Review_DateTime] Datetime NOT NULL,
 [Review_Rating] Int NOT NULL,
 [LastArchived] Datetime NOT NULL
)
go

-- Add keys for table Review_Archive

ALTER TABLE [Review_Archive] ADD CONSTRAINT [Key16] PRIMARY KEY NONCLUSTERED ([Review_Id])
go

-- Table App_DeviceSpecs

CREATE TABLE [App_DeviceSpecs]
(
 [AppDevice_Id] Int NOT NULL,
 [Device_Company] Varchar(50) NOT NULL,
 [Device_Ram] Float NOT NULL,
 [Device_OS] Varchar(25) NOT NULL
)
go

-- Add keys for table App_DeviceSpecs

ALTER TABLE [App_DeviceSpecs] ADD CONSTRAINT [Key17] PRIMARY KEY NONCLUSTERED ([AppDevice_Id])
go

-- Table User_Account

CREATE TABLE [User_Account]
(
 [User_Id] Int NOT NULL,
 [User_Email] Varchar(50) NOT NULL,
 [User_Password] Varchar(100) NOT NULL
)
go

-- Add keys for table User_Account

ALTER TABLE [User_Account] ADD CONSTRAINT [Key19] PRIMARY KEY NONCLUSTERED ([User_Id])
go

-- Table Entity8

CREATE TABLE [Entity8]
(
 [App_Id] Int NOT NULL,
 [Country_Id] Int NOT NULL
)
go

-- Add keys for table Entity8

ALTER TABLE [Entity8] ADD CONSTRAINT [Key20] PRIMARY KEY NONCLUSTERED ([App_Id],[Country_Id])
go

-- Table Entity9

CREATE TABLE [Entity9]
(
 [AppDevice_Id] Int NOT NULL,
 [App_Id] Int NOT NULL
)
go

-- Add keys for table Entity9

ALTER TABLE [Entity9] ADD CONSTRAINT [Key21] PRIMARY KEY NONCLUSTERED ([AppDevice_Id],[App_Id])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


--ALTER TABLE [Entity1] ADD CONSTRAINT [Relationship4] FOREIGN KEY ([App_Id]) REFERENCES [Apps] ([App_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
--go--


ALTER TABLE [Entity1] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([User_Id]) REFERENCES [Users] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [UserArchives] ADD CONSTRAINT [Relationship11] FOREIGN KEY ([User_Id]) REFERENCES [Users] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Review_Archive] ADD CONSTRAINT [Identifying and PFK = Review_Id] FOREIGN KEY ([Review_Id]) REFERENCES [Review] ([Review_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Review] ADD CONSTRAINT [Non-Identifying and FK = Version_Id] FOREIGN KEY ([Version_Id]) REFERENCES [Version] ([Version_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [AppCategory] ADD CONSTRAINT [Non-Identifying and FK = App_Id] FOREIGN KEY ([App_Id]) REFERENCES [Apps] ([App_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity8] ADD CONSTRAINT [Many to Many Identifying] FOREIGN KEY ([App_Id]) REFERENCES [Apps] ([App_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity8] ADD CONSTRAINT [Many to Many Identifying and PFK = Country_Id] FOREIGN KEY ([Country_Id]) REFERENCES [App_Location] ([Country_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Apps] ADD CONSTRAINT [Non-Identifying and FK = Developer_Id] FOREIGN KEY ([Developer_Id]) REFERENCES [Developer] ([Developer_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DeveloperCardDetails] ADD CONSTRAINT [Identifying, Mandatory and PFK = Developer_Id] FOREIGN KEY ([Developer_Id]) REFERENCES [Developer] ([Developer_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [DeveloperPayment] ADD CONSTRAINT [Non-Identifying and FK= Developer_Id] FOREIGN KEY ([Developer_Id]) REFERENCES [Developer] ([Developer_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Version] ADD CONSTRAINT [Non-Identifying and FK= App_Id] FOREIGN KEY ([App_Id]) REFERENCES [Apps] ([App_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Downloads] ADD CONSTRAINT [Non-Identifying and FK= User_Id] FOREIGN KEY ([User_Id]) REFERENCES [Users] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Downloads] ADD CONSTRAINT [Non-Identifying and FK=App_Id] FOREIGN KEY ([App_Id]) REFERENCES [Apps] ([App_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Downloads] ADD CONSTRAINT [Non-Identifying and FK= Version_Id] FOREIGN KEY ([Version_Id]) REFERENCES [Version] ([Version_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [User_Account] ADD CONSTRAINT [Identifying and PFK = User_Id] FOREIGN KEY ([User_Id]) REFERENCES [Users] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [UserPayment] ADD CONSTRAINT [Non-Identifying and FK = User_Id] FOREIGN KEY ([User_Id]) REFERENCES [Users] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Device] ADD CONSTRAINT [Non-Identifying and FK=User_Id] FOREIGN KEY ([User_Id]) REFERENCES [Users] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [UserCardDetails] ADD CONSTRAINT [Identifying,Mandatory and PFK = User_Id] FOREIGN KEY ([User_Id]) REFERENCES [Users] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Review] ADD CONSTRAINT [Non-Identifying and  FK = App_Id] FOREIGN KEY ([App_Id]) REFERENCES [Apps] ([App_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Downloads] ADD CONSTRAINT [Non-Identifying and FK = UserDevice_Id] FOREIGN KEY ([UserDevice_Id]) REFERENCES [Device] ([UserDevice_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity9] ADD CONSTRAINT [Many to Many Relationship] FOREIGN KEY ([AppDevice_Id]) REFERENCES [App_DeviceSpecs] ([AppDevice_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Entity9] ADD CONSTRAINT [Many to Many Relationship and FK = App_Id] FOREIGN KEY ([App_Id]) REFERENCES [Apps] ([App_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Review] ADD CONSTRAINT [Non-Identifying and  Fk = User_Id] FOREIGN KEY ([User_Id]) REFERENCES [Users] ([User_Id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go





/* DML SCRIPTS TO INSERT DATA */

INSERT INTO Developer
VALUES (3001,'Aeshna','Kapoor',58725252525,'Boston','http://www.aeshkapoor.com')

select * from Developer

INSERT INTO DeveloperCardDetails 
VALUES (3001,'Aeshna','Kapoor','Boston',22151,1111222233334440,'CreditCard','2020-01-01')

INSERT INTO DeveloperCardDetails 
VALUES (3002,'Robert','Thomas','California',4585255,2222333344445550,'DebitCard','2018-04-04'),
(3003,	'Sachin', 	'Jadhav',	'New Delhi',500414,	3333444455556660,	'DebitCard',	'2022-04-04'),
(3004,	'Chun-An-Chou',	'Deiago',	'Beijing',	5244566,	3333444422226660,	'CreditCard','2020-01-09'),
(3005,	'Nilesh', 	'Nerkar',	'Mumbai',	400014,	3333222255556660,	'CreditCard',	'2020-01-08'),
(3006	,'Sthita',	'Joseph',	'Rochester',	78785	,1111555533334440	,'DebitCard',	'2022-02-05')

select * from DeveloperCardDetails

INSERT INTO DeveloperPayment 
VALUES (3101,3002,'2011-06-06 00:00:00' ,'Received',8)


select * from DeveloperPayment

insert into Users 
values (2001,'Kevin','Kerr','Male','1991-04-04','123 Tetlow Boston','USA',22151,6172525252)

Select * from Users

insert into UserCardDetails 
values (2001,'Kevin',	'Kerr','123 Tetlow Boston', 22151,4444555566667770,'CreditCard',	'2017-04-04')

Select * from UserCardDetails


INSERT INTO UserPayment 
VALUES (2201,2001,'2011-06-06 00:00:00','Paid',10)

Select * From Users

INSERT INTO User_Account 
VALUES
(2006,	'm.ariz@hotmail.com',	12575),
(2007,	'Rall@gmail.com',	878787),
(2008,	'nam.nar@yahoo.com',	998899)


select * from User_Account

INSERT INTO Device
VALUES (2101,	2001,'Samsung Note 5',	22151,	'Samsung',	3,	'Android Marshmallow')

select * from Device

INSERT INTO App_DeviceSpecs
VALUES (1401,'Samsung',1.5	,'Android Kitkat')

Select * from App_DeviceSpecs

INSERT INTO App_Location
VALUES (1501,	'USA'	,'English')

select * from App_Location

INSERT INTO Apps 
VALUES (1001,3001,'Facebook','Free social networking website',34.4,0,'Term & Conditions',0,1,0,NULL,'https://www.facebook.com/')

SELECT * FROM Apps

insert into AppCategory 
values (1101,1001, 'Socials')

select * from AppCategory

insert into Version 
values (1201,1001,1.01,'2010-05-05 00:00:00')

SELECT * FROM Version

insert into Review 
values (1301,2002,1202,1001,'Best Social App','2011-02-06 00:00:00',4)

select * from Review

insert into Review_Archive 
values (1301,'Best Social App','2011-02-06 00:00:00' ,4,'2013-12-31 00:00:00' )

Select * from Review_Archive

insert into Downloads 
values (4001,2001,1002,1204,2101,'2011-06-06 00:00:00')

Select * from Downloads