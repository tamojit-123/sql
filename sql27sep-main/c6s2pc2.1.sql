create database carsSalesData;
use carsSalesData;
create table salesperson (SalesId int not null, FirstName varchar(255) not null, City varchar(255), CommisionRate int, primary key(SalesId));
insert into salesperson values(1001, 'PEEI', 'London', 12), (1002, 'SeRRes', 'San Jose', 13), (1004, 'JudiTH', 'London', 11), (1007, 'rifkiN', 'Bercelona', 15), (1003, 'axelRod', 'New York', 10), (1005, 'FrAN', 'London', 26), (1008, 'John', 'London', 0), (1009, 'CharleS', 'Florida', null);

create table customer (CustomerId int primary key not null, Name varchar(255) not null, LastName varchar(255) not null, City varchar(255) not null, Rating int not null, SalesId int, foreign key (SalesId) references salesperson(SalesId));
insert into customer values(2001, 'hoffmaN', 'Anny', 'London', 100, 1001), (2002, 'GolovanNI', 'jenny', 'Rome', 200, 1003), (2003, 'liu', 'williams', 'San Jose', 100, 1002), (2004, 'Grass', 'Harry', 'Berlin', 300, 1002), (2005, 'Clemens', 'John', 'London', 200, 1001), (2006, 'Cisneros', 'Fanny', 'San Jose', 200, 1007), (2007, 'Pereria', 'Jonathan', 'Rome', 300, 1004);

create table orders (OrderId int primary key not null, Amount int not null, OrderDate date not null, CustomerId int not null, foreign key (CustomerId) references customer(CustomerId));
insert into orders values(3001, 123, '2020-02-01', 2005), (3003, 187, '2020-10-02', 2001), (3002, 100, '2000-07-30', 2007), (3005, 201, '2011-10-09', 2003), (3009, 145, '2012-10-10', 2005), (3008, 189, '2020-03-06', 2002), (3010, 200, '2012-02-23', 2006), (3011, 100, '2000-09-18', 2004);

delete from orders where OrderId = 3011;

set sql_safe_updates=0;
delete from salesperson where CommisionRate = 0;

update orders set Amount = (Amount*1.2) where Amount<=100;

create index inx_rating on customer(Rating);

update salesperson set CommisionRate = 28 where CommisionRate = 26;

update customer set Rating = 150 where Rating = 100; 

desc salesperson;
desc customer;
desc orders;

select * from salesperson;
select * from customer;
select * from orders;