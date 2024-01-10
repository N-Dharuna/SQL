drop database if exists movies;
create database movies;
use movies;
select * from actor;
select * from cast;
select * from director;
select * from genres;
select * from movie;
select * from movie_direction;
select * from movie_genres;
select * from ratings;
select * from reviewer;

# i. Write a SQL query to find when the movie 'American Beauty' released. Return movie release year. 
select mov_year, mov_title  from movie where mov_title = 'American beauty';

# ii. Write a SQL query to find those movies, which were released before 1998. Return movie title.
select mov_title, mov_year from movie where mov_year < '1998' ;

# iii. Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120.
select * from movie where mov_year > '1995' and mov_time > '120';
 
# iv. Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
select * from movie where mov_rel_country = 'uk' order by mov_year asc limit 7;

# v. Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
update movie set mov_lang = 'chinese' where mov_lang = 'japanese' and mov_year = '2001';

# vi. Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
select * from reviewer;
select m.mov_title,re.rev_name from movie as m inner join ratings as rt using (mov_id) inner join reviewer as re using (rev_id) where mov_title = 'slumdog millionaire';

# vii. Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors. 
select * from actor;
select * from movie, director, genres,cast ;
select a.act_fname,a.act_lname,a.act_gender,c.role from actor as a inner join cast as c on c.act_id = a.act_id where act_gender <> 'm';

# viii. Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Fetch all the fields of actor table. (Hint: Use the IN operator). 
select a.*,m.mov_title from actor as a inner join cast as c using (act_id) inner join movie as m on m.mov_id = c.mov_id where mov_title = 'Annie Hall';

# ix. Write a SQL query to find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
select mov_title,mov_year,mov_time,mov_dt_rel,mov_rel_country from movie where mov_rel_country != 'UK';

# x. Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
select max(mov_time) as max_mov_dur from movie;select count(mov_id) from movie;

# xi. Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
create view dup as (select a.act_fname,a.act_lname,m.mov_title,c.role from actor as a inner join cast as c using(act_id) inner join movie as m using(mov_id));
select * from dup;

# xii. Write a SQL query to find the movies with the lowest ratings
select * from ratings; (select m.*,r.num_o_ratings from movie as m inner join ratings as r on r.mov_id = m.mov_id order by num_o_ratings limit 1);

# xiii. Finally Mail the script to jeevan.raj@imarticus.com