create database company;

use company;

create table customers
(
    id                int          not null auto_increment,
    first_name        varchar(100) not null,
    last_name         varchar(100) not null,
    email             varchar(100) not null unique,
    created_timestamp timestamp default now(),
    primary key (id)
);

create table orders
(
    id          int not null auto_increment,
    order_date  date,
    amount      decimal(8, 2),
    placed_time timestamp default now(),
    customer_id int,
    primary key (id),
    foreign key (customer_id) references customers (id)
);
# foreign key links both tables together

# ----------------------------------------------------------------------------------------------------------------

# INSERT INTO customers (first_name, last_name, email)
# VALUES ('Boy', 'George', 'george@gmail.com'),
#        ('George', 'Michael', 'gm@gmail.com'),
#        ('David', 'Bowie', 'david@gmail.com'),
#        ('Blue', 'Steele', 'blue@gmail.com'),
#        ('Bette', 'Davis', 'bette@aol.com');
#
# INSERT INTO orders (order_date, amount, customer_id)
# VALUES ('2016/02/10', 99.99, 1),
#        ('2017/11/11', 35.50, 1),
#        ('2014/12/12', 800.67, 2),
#        ('2015/01/03', 12.50, 2),
#        ('1999/04/11', 450.25, 5);

# ----------------------------------------------------------------------------------------------------------------

# this is a long step to find orders belong to customer with specific last name
select *
from orders
where customer_id = (select id from customers where last_name = 'george');

# cross join -> takes every customer and joins with every order
# most basic type of join -> useless
select *
from customers,
     orders;

# ----------------------------------------------------------------------------------------------------------------

# implicit inner join -> too long to write
select first_name, last_name, email, order_date, amount
from customers,
     orders
where customers.id = orders.customer_id;

# inner join
select first_name, last_name, email, order_date, amount
from customers
         inner join orders on customers.id = orders.customer_id;
# typically we match foreign key with primary key

# ----------------------------------------------------------------------------------------------------------------

# left join
select first_name, last_name, email, order_date, amount
from customers
         left join orders on customers.id = orders.customer_id;
# now we have 2 user who never placed orders
# this is because left join prioritizes left table

select first_name,
       last_name,
       ifnull(sum(amount), 0) as 'total_spent'
from customers
         left join orders on customers.id = orders.customer_id
group by customers.id
order by total_spent;
# to replace nulls -> we could case statements
# or use IFNULL

# ----------------------------------------------------------------------------------------------------------------

# right join

select first_name, last_name, email, order_date, amount
from customers
         right join orders on customers.id = orders.customer_id;
# because `orders` is 1-Many with `customers`, there are no null orders, i.e., there should be customers to place orders in the first place
# where this produces nulls would be in a many-many situation

# ----------------------------------------------------------------------------------------------------------------

# on delete cascade
create table orders
(
    id          int not null auto_increment,
    order_date  date,
    amount      decimal(8, 2),
    placed_time timestamp default now(),
    customer_id int,
    primary key (id),
    foreign key (customer_id)
        references customers (id)
        on delete cascade
);

# ----------------------------------------------------------------------------------------------------------------

# exercise

create table students
(
    id         int not null auto_increment,
    first_name varchar(100),
    primary key (id)
);

create table papers
(
    id         int not null auto_increment,
    title      varchar(100),
    grade      int,
    student_id int not null,
    primary key (id),
    foreign key (student_id) references students (id) on delete cascade
);

INSERT INTO students (first_name)
VALUES ('Caleb'),
       ('Samantha'),
       ('Raj'),
       ('Carlos'),
       ('Lisa');

INSERT INTO papers (student_id, title, grade)
VALUES (1, 'My First Book Report', 60),
       (1, 'My Second Book Report', 75),
       (2, 'Russian Lit Through The Ages', 94),
       (2, 'De Montaigne and The Art of The Essay', 98),
       (4, 'Borges and Magical Realism', 89);

select first_name, title, grade
from students
         inner join papers on students.id = papers.student_id
order by grade desc;

select first_name,
       ifnull(title, 'MISSING') as 'title',
       ifnull(grade, 0)         as 'grade'
from students
         left join papers on students.id = papers.student_id;

select first_name,
       ifnull(avg(grade), 0) as 'avg'
from students
         left join papers on students.id = papers.student_id
group by first_name
order by avg(grade) desc;

select first_name,
       ifnull(avg(grade), 0) as 'avg',
       case
           when avg(grade) >= 75 then 'PASSING'
           else 'FAILING' end  as 'passing_status'
from students
         left join papers on students.id = papers.student_id
group by first_name
order by avg(grade) desc;
