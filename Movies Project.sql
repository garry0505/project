use moviesdb;
select * from movies;

select * from movies where release_year in (2022,2017);

select * from movies where imdb_rating>7;

select * from movies where studio like "%movie%";

select release_year , count(*) as cnt from movies group by release_year order by cnt desc;


select * from actors;

select * from actors where birth_year between 1976 and 1989 order by birth_year desc;

select *, year(curdate())-birth_year as age from actors;

select min(birth_year) from actors;
select max(birth_year) from actors;
select * from actors where birth_year between 1905 and 1997;

select m.title, a.name
from movies m 
join movie_actor ma on m.movie_id=ma.movie_id
join actors a on ma.actor_id=a.actor_id;

select m.movie_id,m.title,f.budget,f.revenue
from movies m join financials f on m.movie_id=f.movie_id;

select *,(revenue-budget) as profit from financials;

#convert usd into inr
select*,if(currency="usd",revenue*82,revenue) as revenue_inr from financials;

select m.movie_id, m.title ,f.budget,f.revenue from movies m join financials f on m.movie_id=f.movie_id where revenue>budget;

select * from ACTORS;
select * from movies where imdb_rating=(select max(imdb_rating) from movies);

#subquery
select actor_id , name from actors where actor_id=(select actor_id from movie_actor group by actor_id order by count(movie_id) desc limit 1);

SELECT * FROM ACTORS;
select actor_id , name 
from actors 
where birth_year=(
select birth_year from actors where actor_id=(
select actor_id from movie_actor group by actor_id order by count(movie_id) desc limit 1));
