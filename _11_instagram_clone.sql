drop database instagram;
create database instagram;
use instagram;

create table users
(
    id         integer      not null auto_increment,
    username   varchar(255) not null unique,
    created_at timestamp default now(),
    primary key (id)
);

create table photos
(
    id         integer not null auto_increment,
    image_url  varchar(255),
    user_id    int     not null,
    created_at timestamp default now(),
    primary key (id),
    foreign key (user_id) references users (id)
);

create table comments
(
    id           integer not null auto_increment,
    comment_text varchar(255),
    user_id      int     not null,
    photo_id     int     not null,
    created_at   timestamp default now(),
    primary key (id),
    foreign key (user_id) references users (id),
    foreign key (photo_id) references photos (id)
);

create table likes
(
    user_id    int not null,
    photo_id   int not null,
    created_at timestamp default now(),
    foreign key (user_id) references users (id),
    foreign key (photo_id) references photos (id),
    primary key (user_id, photo_id)
);

# followee is the content creator and follower is the normal user who follows the creator
create table follows
(
    follower_id int not null,
    followee_id int not null,
    created_at  timestamp default now(),
    foreign key (followee_id) references users (id),
    foreign key (follower_id) references users (id),
    primary key (follower_id, followee_id)
);

create table tags
(
    id         int          not null auto_increment primary key,
    tag_name   varchar(255) not null unique,
    created_at timestamp default now()
);

create table photo_tags
(
    photo_id int not null,
    tag_id   int not null,
    primary key (photo_id, tag_id),
    foreign key (photo_id) references photos (id),
    foreign key (tag_id) references tags (id)
);

# exercises

# find 5 oldest users
select *
from users
order by created_at asc
limit 5;

# what day of the week do most users register on
select dayofweek(max(created_at))
from users;

# find users who have never posted a photo
select distinct username
from users
         left join photos p on users.id = p.user_id
where p.id is null;

# find who got most likes on single photo
select username, count(likes.photo_id) as 'people_liked'
from users
         inner join photos on users.id = photos.user_id
         inner join likes on photos.id = likes.photo_id
group by photo_id
order by people_liked desc
limit 1;

# how many times does the average user post?
# count(*) from photos / count(*) from users
select (select count(*) from photos) / (select count(*) from users);

# what are top 5 most commonly used hashtags?
select tag_name, count(photo_id) as 'count'
from tags
         inner join photo_tags on tags.id = photo_tags.tag_id
group by tag_id
order by count(photo_id) desc
limit 5;

# find users who liked every single photo in the site
select username, count(*) as 'like_count'
from users
         inner join likes on users.id = likes.user_id
group by username
having like_count = (select count(*) from photos);
# new keyword 'having'