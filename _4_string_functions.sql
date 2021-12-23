use cat_app;

# CREATE TABLE books
# 	(
# 		book_id INT NOT NULL AUTO_INCREMENT,
# 		title VARCHAR(100),
# 		author_fname VARCHAR(100),
# 		author_lname VARCHAR(100),
# 		released_year INT,
# 		stock_quantity INT,
# 		pages INT,
# 		PRIMARY KEY(book_id)
# 	);
#
# INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
# VALUES ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
#        ('Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
#        ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
#        ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
#        ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
#        ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
#        ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
#        ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
#        ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
#        ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
#        ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
#        ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
#        ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
#        ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
#        ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
#        ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

# ----------------------------------------------------------------------------------------------------------------

# concat method
select concat(author_fname, ' ', author_lname) as full_name
from books;

select author_fname as first, author_lname as last, concat(author_fname, ' ', author_lname) as full_name
from books;

# concat ws -> concat with separator
select concat_ws(' by ', title, author_fname) as details
from books;

# ----------------------------------------------------------------------------------------------------------------

# substring
select substring('hello world', 1, 4); # hell
select substring('hello world', 7); # world
select substring('hello world', -3);
# rld
# in mysql `INDEX START WITH 1` unlike other programming languages

select substring(title, 1, 10) as short_title
from books;

# using 2 functions in nested form
select concat(substring(title, 1, 10), '...') as short_title
from books;

# ----------------------------------------------------------------------------------------------------------------

# replace
select replace('hello world', 'hell', '#$%@|');

# replacing multiple parts of sentence
select replace('cheese bread coffee', ' ', ' and ');

select replace(title, 'the', 'REPLACED!!! ')
from books;

# ----------------------------------------------------------------------------------------------------------------

# reverse
select reverse(title) as 'reverse'
from books;

# ----------------------------------------------------------------------------------------------------------------

# char length

select char_length(title) as 'char_length'
from books;

select concat(author_fname, ' is ', char_length(author_fname), ' characters long') as 'sentence'
from books;

# ----------------------------------------------------------------------------------------------------------------

# upper and lower

select upper(author_fname)
from books;
select lower(author_fname)
from books;

# ----------------------------------------------------------------------------------------------------------------

# exercise

select reverse(upper('Why does my dog is NOT eaTing?'));

select replace(title, ' ', '->')
from books;

select author_lname as 'forwards', reverse(author_lname) as 'backwards'
from books;

select upper(concat_ws(' ', author_fname, author_lname)) as 'full_name'
from books;

select concat(title, ' was released in ', released_year) as 'blurb'
from books;

select title, char_length(title) as 'character count'
from books;

select concat(substring(title, 1, 10), '...')   as 'short title',
       concat(author_lname, ', ', author_fname) as 'author',
       concat(stock_quantity, ' in stock')      as 'quantity'
from books;
