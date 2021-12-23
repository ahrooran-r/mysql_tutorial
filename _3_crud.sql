use cat_app;

# drop multiple tables
drop table if exists cats, cats2, cats3, unique_cats, unique_cats2;

create table cats
(
    cat_id int not null auto_increment,
    name   varchar(100),
    breed  varchar(100),
    age    int,
    primary key (cat_id)
);

INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

# -----------------------------------------------------------------------

# select all columns, rows of cats table
select *
from cats;

# select specific columns
select name, breed
from cats;

# select specific rows
select *
from cats
where breed = 'Maine Coon';

# select specific columns and rows
select name, breed
from cats
where breed = 'maine coon';
# not that queries are case insensitive

# -----------------------------------------------------------------------

# exercises
select cat_id
from cats;

select name, breed
from cats;

select name, age
from cats
where breed = 'tabby';

select cat_id, age
from cats
where cat_id = age;

# -----------------------------------------------------------------------

# aliases
select cat_id as 'id', name as 'cat name'
from cats;

# -----------------------------------------------------------------------

# update table
update cats
set breed = 'ShortHair'
where breed = 'tabby';

update cats
set age = 20
where name = 'misty';

# -----------------------------------------------------------------------

# exercise
update cats
set name='jack'
where name = 'jackson';

update cats
set breed='british short hair'
where name = 'ringo';

update cats
set age=12
where breed = 'maine coon';

# -----------------------------------------------------------------------

# delete specific parts of table
delete
from cats
where name = 'egg';

# delete all rows from table -> empty the table
delete
from cats;

# -----------------------------------------------------------------------

# exercise - complete CRUD

create database shirts_db;
use shirts_db;
select database();

create table shirts
(
    shirt_id   int not null auto_increment,
    article    varchar(50),
    colour     varchar(50),
    shirt_size varchar(50),
    last_worn  int,
    primary key (shirt_id)
);

insert into shirts(article, colour, shirt_size, last_worn)
values ('t-shirt', 'white', 'S', 10),
       ('t-shirt', 'green', 'S', 200),
       ('polo shirt', 'black', 'M', 10),
       ('tank top', 'blue', 'S', 50),
       ('t-shirt', 'pink', 'S', 0),
       ('polo shirt', 'red', 'M', 5),
       ('tank top', 'white', 'S', 200),
       ('tank top', 'blue', 'M', 15);

insert into shirts(article, colour, shirt_size, last_worn)
    value ('polo shirt', 'purple', 'M', 50);

select *
from shirts;

select article, colour
from shirts;

select article, colour, shirt_size, last_worn
from shirts
where shirt_size = 'M';

update shirts
set shirt_size = 'L'
where article = 'polo shirt';

update shirts
set last_worn = 0
where last_worn = 15;

# use comma to update multiple columns
update shirts
set shirt_size = 'XS',
    colour     = 'off white'
where colour = 'white';

delete
from shirts
where last_worn = 200;

delete
from shirts
where article = 'tank top';

delete
from shirts;

drop table shirts;