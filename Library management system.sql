##Library Management System

create database library;
show databases;
use library;

-- Create a database named library and following TABLES in the database:
-- 1. Branch
-- 2. Employee
-- 3. Books
-- 4. Customer
-- 5. IssueStatus
-- 5. ReturnStatus

create table braanch(branch_no int primary key,
manager_id int,
branch_address varchar(25),
contact_no int);

select * from braanch;

insert into braanch(branch_no,manager_id,branch_address,contact_no)
values(1,111,'ckm',987654),
	  (2,222,'abbc',765432),
      (3,333,"ekm",543210),
      (4,444,'bccd',123456),
      (5,555,'trvnrm',235467),
      (6,666,'kmmk',345678);
      
select * from braanch;
      
create table employee(emp_id int primary key,
emp_name varchar(25),
position varchar(25),
salary int,
branch_no int,
foreign key(branch_no) references braanch(branch_no)on delete cascade);

select * from employee;

insert into employee(emp_id,emp_name,position,salary,branch_no)
values(1211,'Michael','clerk',80000,1),
	  ('1212','Thasleema','manager',80000,2),
      ('1213','Riyas','secretary',50000,3),
      ('1214','Faheem','Engineer',60000,1),
      ('1215','Farhan','analyst',70000,4),
      ('1216','Sagar','accountant',40000,1);
      
select * from employee;

create table books(ISBN varchar(30) primary key,
book_title varchar(45),
category varchar(25),
rental_price int,
status enum("yes","no"),
author varchar(25),
publisher varchar(30));

select * from books;

insert into books(ISBN,book_title,category,rental_price,status,author,publisher)
values('8975412092','into the wild','travelogue',20,'yes','john krakauer','Anchor'),
	  ('7896045678','kappirikaluse nattil','travelogue',14,'yes','s.k.pottakkad','dc books'),
      ('345678986','girl in room 105','novel',23,'no','chethan bagat','westland books'),
      ('812643936X','Arachaar','fiction',19,'yes','k.r.meera','dc books'),
      ('8171301266','khasakkinte ithihasam','fiction',18,'yes','o.v.vijayan','dc books'),
      ('4678432113','Adujeevitham','fiction',17,'yes','Benyamin','green books');

select * from books;

create table customer(customer_id int primary key,
customer_name varchar(25),
customer_address varchar(100),
reg_date date);

select * from customer;

insert into customer(customer_id,customer_name,customer_address,reg_date)
values(1,'Emmi','ckm','2020-02-09'),
	  (2,'jacson','abbc','2021-01-02'),
      (3,'Fheem',"ekm",'2023-05-04'),
      (4,'Ayham','bccd','2020-11-11'),
      (5,'muhammed','trvnrm','2021-06-04'),
      (6,'Riyaz','kmmk','2023-12-02');
      
select * from customer;

create table issuestatus(issue_id int primary key,
issued_cust int,
foreign key (issued_cust) references customer(customer_id) on delete cascade,
issued_book_name varchar(30),
issued_date date,
ISBN_book varchar(30),
foreign key(ISBN_book) references books(ISBN) on delete cascade);

select * from issuestatus;

insert into issuestatus(issue_id,issued_cust,issued_book_name,issued_date,isbn_book)
values(100,1,'kappirikaluse nattil','2021-09-08','7896045678'),
	  (101,2,'Adujeevitham','2021-11-12','4678432113'),
      (102,3,'khasakkinte ithihasam','2022-03-07','8171301266'),
      (103,4,'Arachaar','2021-06-05','812643936X'),
      (104,5,'girl in room 105','2023-04-01','345678986');
      
select * from issuestatus;

create table returstatus(return_id int primary key,
return_cust varchar(30),
return_book_name varchar(45),
return_date date,
isbn_book2 varchar(20),
foreign key(isbn_book2) references books(isbn) on delete cascade);

insert into returstatus 
values(1000,'Fawaz','khasakkinte ithihasam','2023-08-11','8171301266'),
      (1001,'Ayham','girl in room 105','2023-01-01','345678986'),
      (1002,'Aswin','Adujeevitham','2023-02-02','4678432113'),
      (1003,'John','into the wild','2022-12-12','8975412092');

select * from returstatus;

-- 1. Retrieve the book title, category, and rental price of all available books.
select book_title,category,rental_price from books where status='yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
select emp_name,salary from employee order by salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
select i.issued_book_name,c.customer_name from issuestatus i join customer c
on i.issued_cust=c.customer_id;

-- 4. Display the total count of books in each category.
select category,count(category) as count from books 
group by category; 

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select emp_name,position from employee where salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

select c.customer_name,c.reg_date from customer c left join issuestatus
i on c.customer_id=i.issued_cust where c.reg_date<'2022-01-01' and
i.issued_cust is null;

-- 7. Display the branch numbers and the total count of employees in each branch.

select branch_no,count(emp_id) as total_employees from employee group by
branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
select c.customer_name,i.issued_date from customer c left join issuestatus i on
c.customer_id=i.issued_cust where year(i.issued_date)=2023 AND month(i.issued_date)=6;

-- 9.Retrieve book_title from book table containing history.

select book_title from books where category='fiction';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

select b.branch_no,count(e.emp_id) as total_employees from
braanch b left join  employee e on b.branch_no=e.branch_no group by
b.branch_no having count(e.emp_id)>2;




























      






































      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      