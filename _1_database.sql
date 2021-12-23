# show databases
show databases;

# create new databases
create database hello_world_db;

# dropping databases
drop database hello_world_db;

# use database
create database dog_walking_app;
use dog_walking_app;

# show which database I'm in right now
select database();

# select database() returns <null> when there is no current database
drop database dog_walking_app;
select database();


