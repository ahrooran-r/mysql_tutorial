# char
# char -> has fixed length
# if text is more than length -> it gets truncated
# if text is less -> empty space is added to back
# char is faster for fixed length text
# e.g.: abbreviations, yes/no flag, etc.

create table dogs
(
    name  char(5),
    breed varchar(10)
);
insert into dogs(name, breed) value ('pup', 'local');
insert into dogs(name, breed) value ('puppy', 'foreign');

# this either gets truncated or error is thrown
insert into dogs(name, breed) value ('someLargerName', 'GermanShepard');

# ----------------------------------------------------------------------------------------------------------------

# decimal
# decimal (5, 2) => (total # of digits, digits after decimal) => e.g.: 123.45
# high precision than float or double

create table items
(
    price decimal(5, 2)
);
insert into items(price) value (123.45);

# here because upper limit is 5 digits, mysql rounds the 6th digit => 123.46
insert into items(price) value (123.457);

# when number is > upper bound, mysql either puts upper bound or throws error
insert into items(price) value (9999.99);

# ----------------------------------------------------------------------------------------------------------------

# float, double
# store larger number using less space
# it comes with the cost of precision -> float will have precision issues after 7 digits and double will have issues after 15 digits

create table thingies
(
    price float
);
insert into thingies(price) value (8877.45);

# you can see precision problem here => mysql stores 88776697000000 instead of actual value
insert into thingies(price) value (88776655443322.1123);

# ----------------------------------------------------------------------------------------------------------------

# date, time and datetime

# date
# values with date -> no time
# "YYYY-MM-DD" format -> 1999-08-20

# time
# values with time -> no date
# "HH:MM:SS"

# datetime
# values with date and time
# "YYYY-MM-DD HH:MM:SS"

create table people
(
    name       varchar(100) primary key,
    birth_date date,
    birth_time time,
    birth_dt   datetime
);

insert into people(name, birth_date, birth_time, birth_dt)
values ('padma', '1990-03-23', '10:03:24', '1990-03-23 10:03:24'),
       ('larry', '1945-11-30', '00:00:00', '1945-11-30 00:00:00'),
       ('NOW', curdate(), curtime(), now());

# curdate -> return current date
# curtime -> return current time
# now -> return current date-time
select curdate(), curtime(), now();

# find day of week, month and year
select dayofweek(current_date());
select dayofmonth(current_date());
select dayofyear(current_date());

# find day of week etc. in string format
# https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format
select date_format(now(), '%W');

# datediff -> returns difference between dates, datetime etc in DAYS
select *, datediff(now(), birth_dt)
from people;

# date_add, date_sub -> note the syntax
# https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-add
select birth_date, date_add(birth_date, interval 1 month)
from people;

# another way to do this -> use + / -
select birth_date, birth_date + interval 1 month + interval 1 hour
from people;

# timestamp
# very similar to datetime -> but has limited range
# timestamp only works within 1970.. to 2038..
# it is here because it uses less space

create table comments
(
    content    varchar(100),
    created_at timestamp default now()
);
# key part is keeping default to now

insert into comments(content) value ('Hi');
insert into comments(content) value ('Hello');
insert into comments(content) value ('Little');

# sort using timestamp
select *
from comments
order by created_at desc;

# what if we want to store current timestamp when a field is changes
create table comments2
(
    content    varchar(100),
    created_at timestamp default now(),
    changed_at timestamp default now() on update current_timestamp
);
insert into comments2(content) value ('Hi');
insert into comments2(content) value ('Hello');
insert into comments2(content) value ('Little');

# update content -> changes timestamp on 'changed_at'
update comments2
set content='Baby'
where content = 'Little';

# ----------------------------------------------------------------------------------------------------------------

# exercises

create table inventory
(
    item_name varchar(100) primary key,
    price     decimal(8, 2),
    quantity  float
);
# remember -> decimal(total # digits, digits after decimal point)

select current_date();

select dayofweek(current_date());