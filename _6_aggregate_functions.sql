# count
select count(*)
from books;

select count(author_fname)
from books;

# use distinct to count distinct rows
select count(distinct author_fname)
from books;

# use like with count
select count(*) as 'books with "the"'
from books
where title like '%the%';

# ----------------------------------------------------------------------------------------------------------------

# round function
select round(26.1375, 2);

# ----------------------------------------------------------------------------------------------------------------

#group by

select author_lname, count(*)
from books
group by author_lname;
# because all rows are grouped under their respective last names, we can do aggregate functions on them

select author_lname, count(*)
from books
group by author_lname, author_fname;

# this has all -> select, string functions, group by, order by, and limit
select concat(count(*), ' books released in ', released_year)
from books
group by released_year
order by released_year desc
limit 10;

# ----------------------------------------------------------------------------------------------------------------

# min and max
select min(released_year)
from books;

select max(pages)
from books;

# min and max with sub queries
select title, pages
from books
where pages = (select max(pages) from books);

# min and max with sub queries with group, order, limit
select title, pages
from books
where pages = (select max(pages) from books)
group by pages, title
order by pages desc
limit 1;

select author_fname, author_lname, min(released_year)
from books
group by author_fname, author_lname;

select author_fname, max(pages)
from books
group by author_lname, author_fname;

# ----------------------------------------------------------------------------------------------------------------

# sum

select sum(pages)
from books;

select author_fname, sum(pages) as 'total pages written'
from books
group by author_fname, author_lname
order by sum(pages) desc;

# ----------------------------------------------------------------------------------------------------------------

# average

select author_fname, avg(pages)
from books
group by author_lname, author_fname
order by avg(pages) desc;

# ----------------------------------------------------------------------------------------------------------------

# exercise

select count(distinct title)
from books;

select count(title), released_year
from books
group by released_year
order by count(title) desc;

select sum(stock_quantity)
from books;

select author_fname, avg(released_year)
from books
group by author_lname, author_fname
order by avg(released_year) desc;

# nested query
select concat(author_fname, ' ', author_lname)
from books
where pages = (select max(pages) from books)
limit 1;

# aggregate functions with group by and order by
select released_year, count(title) as '# books', avg(pages) as 'avg pages'
from books
group by released_year
order by released_year;