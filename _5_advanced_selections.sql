INSERT INTO books
(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
       ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
       ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

# ----------------------------------------------------------------------------------------------------------------

# distinct
select distinct author_lname
from books;

select distinct released_year
from books;
# distinct works for both numbers and letters

select distinct concat(author_fname, ' ', author_lname) as 'authors'
from books;

# similar to above statement:
select distinct author_fname, author_lname
from books;
# distinct is applied to entire row, not just first column

# ----------------------------------------------------------------------------------------------------------------

# order by
select author_lname
from books
order by author_lname;
# sorted by default in ascending order

select author_lname
from books
order by author_lname desc;
# now sorted in descending order

select title, released_year
from books
order by released_year desc;
# order by works for numbers too

select author_fname, author_lname
from books
order by author_lname, author_fname;
# first sorts by last name, then sorts inner-order by first name

# ----------------------------------------------------------------------------------------------------------------

# limit
select *
from books
limit 10;

# this is used in pagination websites
select title, released_year
from books
order by released_year desc
limit 2, 10;
# start from 3rd row and go until there are 10 rows
# when it comes to rows -> first row has id 0
# BUT when it comes to characters like in concat -> first character has id 1

# if I want to have 3rd book to all the way down, there is no easy way of writing it
SELECT *
FROM books
LIMIT 2, 18446744073709551615;
# is is the only way to do this

# ----------------------------------------------------------------------------------------------------------------

# like
select *
from books
where author_fname like '%da%';
# this is called wild card

select *
from books
where author_fname like 'da%';
# select all authors starts with da

select *
from books
where author_fname like '____';
# underscore is a wild card to specify a single character
# so here we select all authors who have 4 character first name

# use escape characters
select *
from books
where title like '%\%%';

select *
from books
where title like '%\_%';

# ----------------------------------------------------------------------------------------------------------------

# exercises

select book_id, title
from books
where title like '%stories%';

# select longest book
select title, pages
from books
order by pages desc
limit 1;

select concat(title, ' - ', released_year) as 'summary'
from books
order by released_year desc
limit 3;

select title, author_lname
from books
where author_lname like '% %';

select title, released_year, stock_quantity
from books
order by stock_quantity
limit 3;

select title, author_lname
from books
order by author_lname, title;

select concat('My favourite author is ', author_fname, ' !!!') as 'yell'
from books
order by author_lname;

