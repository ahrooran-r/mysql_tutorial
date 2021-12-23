create database cat_app;
use cat_app;

# -----------------------------------------------------------------

# create table
# table names -> pluralized e.g.: payments instead of payment
create table pastries
(
    name     varchar(50),
    quantity int
);

# how to know it worked -> 3 ways
show tables;

show columns from pastries;

# preferable
desc pastries;

# delete tables
drop table pastries;

# -----------------------------------------------------------------

# exercise
create table cats
(
    name varchar(100),
    age  int
);

desc cats;

# -----------------------------------------------------------------

# insert data
insert into cats(name, age)
    value ('victoria', 12);

insert into cats(age, name)
    value (11, 'blue');

# multiple insert
insert into cats(name, age)
values ('charlie', 10)
     , ('poodle', 1)
     , ('baggins', 3);

# exercise
create table people
(
    first_name varchar(20),
    last_name  varchar(20),
    age        int
);
insert into people(first_name, last_name, age)
    value ('tina', 'belcher', 13);

# -----------------------------------------------------------------

# shows warnings
show warnings;

# -----------------------------------------------------------------

# NULL
insert into cats(name)
    value ('coco');
# the `age` will be <null>

# require field to be NOT NULL
create table cats2
(
    name varchar(200) not null,
    age  int          not null
);
insert into cats2(name)
    value ('coco');
# will throw error saying age does not have a default value

# -----------------------------------------------------------------

# default values
create table cats3
(
    name varchar(100) not null default 'some_name',
    age  int          not null default 7
);
insert into cats3(name)
    value ('coco');
select *
from cats3;
# automatically fills age = 7

# it seems redundant to set both `not null` and `default`
# but even if we set defaults, we can manually force mysql to set null
# the `not null` keyword prevents explicit NULL assignment

# -----------------------------------------------------------------

# primary key
create table unique_cats
(
    cat_id int          not null,
    name   varchar(100) not null default 'some name',
    age    int          not null default 2,
    primary key (cat_id)
);

# auto increment
create table unique_cats2
(
    cat_id int          not null auto_increment,
    name   varchar(100) not null default 'some name',
    age    int          not null default 2,
    primary key (cat_id)
);

# -----------------------------------------------------------------

# exercise
create table employees
(
    id             int          not null auto_increment,
    last_name      varchar(100) not null,
    first_name     varchar(100) not null,
    middle_name    varchar(100),
    age            int          not null,
    current_status varchar(100) not null default 'employed',
    primary key (id)
);
desc employees;