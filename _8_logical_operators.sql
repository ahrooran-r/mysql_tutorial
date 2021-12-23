# equal
select title
from books
where released_year = 2017;

# not equal
select title
from books
where released_year != 2017;

# greater than
select title
from books
where released_year > 2000;

# greater than or equal
select title
from books
where released_year >= 2000;

# less than
select title
from books
where released_year < 2000;

# less than or equal
select title
from books
where released_year <= 2000;

# note
select 99 > 1;
# returns 1 instead of usual 'true' or 'false'
select 'A' = 'a';
# you can see both 'A' and 'a' are same. Strings are case insensitive in mysql

# ----------------------------------------------------------------------------------------------------------------

# cast
select cast('2020.05.12' as datetime);

# after casting we can compare
select cast('2020.05.12' as datetime) <= now();

# ----------------------------------------------------------------------------------------------------------------

# like

select title
from books
where title like 'W%';

# not like
select title
from books
where title not like 'W%';

# ----------------------------------------------------------------------------------------------------------------

# logical and &&
select title
from books
where author_fname = 'dave' && author_lname = 'eggers';

# logical or ||
select title, released_year
from books
where released_year = 2000 || released_year = 2010;

# combined
select title, concat(author_fname, ' ', author_lname) as 'author_name', released_year, stock_quantity, pages
from books
where author_lname = 'eggers'
  and released_year > 2010
  and title like '%novel%'
group by title, author_fname, author_lname, released_year, stock_quantity, pages
order by title
limit 1;

# ----------------------------------------------------------------------------------------------------------------

# between
select title, released_year
from books
where released_year between 2004 and 2015;

# this is equivalent to..
select title, released_year
from books
where released_year >= 2004
  and released_year <= 2015;

# ----------------------------------------------------------------------------------------------------------------

# in
select title, author_lname
from books
where author_lname in ('carver', 'lahiri', 'smith');

# this is equivalent to..
select title, author_lname
from books
where author_lname = 'carver' || author_lname = 'lahiri' || author_lname = 'smith';

# ----------------------------------------------------------------------------------------------------------------

# modulo %
select title, released_year
from books
where released_year % 2 != 0;

# ----------------------------------------------------------------------------------------------------------------

# case statements

select title,
       released_year,
       case
           when released_year >= 2000 then 'Modern Lit'
           else '20th Century lit'
           end as 'genre'
from books;

select title,
       stock_quantity,
       case
           when stock_quantity <= 50 then '*'
           when stock_quantity <= 100 then '**'
           else '***'
           end as 'stock'
from books;

# ----------------------------------------------------------------------------------------------------------------

# exercise

select *
from books
where released_year < 1980;

select *
from books
where author_lname in ('eggers', 'chabon');

select *
from books
where author_lname = 'lahiri'
  and released_year > 2000;

select *
from books
where pages between 100 and 200;

select *
from books
where author_lname like 'C%'
   or author_lname like 'S%';

select title,
       author_lname,
       case
           when title like '%stories%' then 'Short stories'
           when title like '%Just Kids%' or title like '%A heartbreaking work%' then 'Memoir'
           else 'Novel'
           end as 'Type'
from books;