use carssalesdata;

select * from salesperson;
select * from customer;
select * from orders;

select FirstName, OrderId from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId;

select Name, FirstName, s.SalesId from salesperson s join customer c on s.SalesId=c.SalesId;

select s.SalesId, FirstName, count(c.SalesId) from salesperson s join customer c on s.SalesId=c.SalesId group by c.SalesId having count(*)>1;

select * from salesperson;
select * from customer;
select * from orders;

select FirstName, s.SalesId, count(*) as ordercount from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId group by s.SalesId;

select FirstName, OrderId, Amount, OrderDate from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId where s.FirstName like upper('judith');

select FirstName, OrderId, Amount, OrderDate from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId where s.FirstName like upper('serres');

select s.SalesId, FirstName, s.City from salesperson s where s.City != All (select City from customer c);

select s.SalesId, FirstName, c.CustomerId, name from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId where s.City=c.City;

select s.SalesId, FirstName, s.City, Name, c.City, OrderId from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId where not s.City=c.City;

select distinct FirstName, CommisionRate from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId where c.City ='London';

create view salespersonview as select * from salesperson where CommisionRate > 12;

select * from salespersonview;

select s.SalesId, FirstName, s.City, c.City from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId where not s.City=c.City;

select FirstName, OrderDate from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId where OrderDate not between '2020-03-10' and '2020-05-10';

select FirstName, max(Amount), OrderDate from salesperson s join customer c on s.SalesId=c.SalesId join orders o on c.CustomerId=o.CustomerId group by FirstName;

create view reportofcustomer as select upper(concat(Name,'  ',LastName)) as FullName from customer;

select * from reportofcustomer;