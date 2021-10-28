create database watapizza;

use watapizza;

create table PizzaMenu(
serialNo int auto_increment key, 
pizzaName varchar(100), 
regularPrice int, 
mediumPrice int, 
largePrice int
);

insert into PizzaMenu(pizzaName, regularPrice, mediumPrice, largePrice) values
('African Peri Peri Veg', null, 350, 450),
('Barbecue Veg', null, 300, 400),
('Jamaican Jerk Veg', 250, 350, 450),
('wat-a-pizza Exotic', 200, 300, 400),
('English Cheddar and Veggies', 175, 375, 500);

select * from PizzaMenu;

create table crustChoice(
serialNo int auto_increment key, 
crustType varchar(50), 
price int
);

insert into crustChoice(crustType, price) values
('Wheat Thin Crust', 60),
('Fresh Pan Base', 80),
('Hand Tossed', 70);

select * from crustChoice;

create table customer(
customerId int auto_increment key, 
customerName varchar(50), 
mobileNo bigint, 
address varchar(50)
);

insert into customer(customerName, mobileNo, address) values
('chaitali', 9052369741, 'kolkata'),
('moumita', 7412589663, 'Mumbai'),
('shalini', 7925874152, 'chennai'),
('soumita', 9632587412, 'delhi');

select * from customer;

create table toppings(
toppingId int primary key auto_increment, 
toppingName varchar(50), 
price int
);

insert into toppings(toppingName,price) values('Extra Cheese',80),('Veg Toppings',120);

select * from toppings;

create table orders(
orderId int primary key auto_increment, 
orderType varchar(50),
pizzaId int, 
size varchar(5), 
crustId int,
toppingId int, 
bill bigint, 
customerId int, 
foreign key (pizzaId) references PizzaMenu(serialNo),
foreign key (crustId) references crustChoice(serialNo),
foreign key (toppingId) references toppings(toppingId),
foreign key(customerId) references customer(customerId)
); 

insert into orders(orderType, pizzaId, size,crustId,toppingId, bill, customerId) values
('Home Delievery', 1, 'L', 1,1, 590, 3),
('Home Delievery', 2, 'M', 2,1, 460, 1),
('Dine-in',4, 'R',3,2,390, 2),
('Dine-in', 3, 'L', 3,2, 640, 4),
('Home Delievery', 5, 'M',2,1,535, 3);

select * from orders;

insert into PizzaMenu(pizzaName, regularPrice, mediumPrice, largePrice) 
values('Non-veg Veg', 500, 550, 600);

insert into crustChoice(crustType, price) values
('Cheese Burst', 100);

select * from PizzaMenu;

select orderId, customerName, pizzaName, size from orders join PizzaMenu on orders.pizzaId=PizzaMenu.serialNo
 join customer on customer.customerId = orders.customerId where size ='L' ;
 
select customer.customerId, customerName, max(bill)as highestBill from customer 
join orders on customer.customerId = orders.customerId;

select count(orderType) from orders where orderType = 'Home Delievery';

set sql_safe_updates=0;

select * from orders;


