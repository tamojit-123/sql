create database idbcbank;
use idbcbank;

create table customerTable(
CustomerId int auto_increment primary key not null,
Name char(25) not null,
Age int not null,
Address varchar(255) not null,
MobileNumber bigint not null,
EmailId varchar(255) not null
) auto_increment 1;


create table accountTable(
AccountNumber bigint auto_increment primary key not null,
Balance float not null,
AccountType char(30) not null,
InterestRate float,
CustomerId int not null,
foreign key (CustomerId) references customerTable(CustomerId)
) auto_increment 123000000000;


create table transactionLog(
TransactionId int not null primary key auto_increment,
TransactionType char (30) not null,
TransactionDate datetime not null,
Amount float not null,
AccountNumber bigint not null, 
CONSTRAINT idbc_fk foreign key (AccountNumber) references accountTable(AccountNumber)
);

/*insert into customerTable values(
('Shubham', 'Locknow', 789456123, 'shubham@niit.com', 23),
('Tamojit', 'Kolkata', 654789123, 'tamojit@niit.com', 24),
('Gaurav', 'Bihar', 321456987, 'gaurav@niit.com', 21),
('Subrata', 'Purulia', 523641789, 'subrata@niit.com', 20),
('Ramavat', 'Hydrabad', 457812963, 'ramavat@niit.com', 25),
('Ramu', 'Mumbai', 256314789, 'ramu@niit.com', 19)
);*/

-- insert into transactionLog(TransactionType, TransactionDate, Amount, AccountNumber) values('deposit', '2021-09-30', 4000, 123000000000);

desc accountTable;
desc customerTable;
desc transactionLog;

select * from accountTable;
select * from customerTable;
select * from transactionLog;

drop database idbcbank;
drop table customerTable;
drop table accountTable;
drop table transactionLog;