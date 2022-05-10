# yet to add answers

use school;

drop table if exists grade_point;

create table grade_point
(
    grade varchar(5) primary key not null,
    value numeric(2, 1)          not null unique
);

desc grade_point;

insert into grade_point(grade, value)
values ('A+', 4.2),
       ('A', 4),
       ('A-', 3.7),
       ('B+', 3.5),
       ('B', 3),
       ('B-', 2.7),
       ('C+', 2.3),
       ('C', 2.0),
       ('C-', 1.5),
       ('D', 1);

select *
from grade_point
order by value desc;

#3 -> This solution ignores null values
select name, sum(value)
from student
         natural join takes
         left join grade_point gp on takes.grade = gp.grade
group by name;