--1 Get Actor Names
select first_name , last_name from actor
--2 Get Actor Last Names with IDs
select last_name , actor_id from actor
--3 Get Actor First Names and Last Update
select first_name, last_update from actor 
--4 Get Film Details
select title , description , rental_rate , length from film
--5 Get Films with Specific Rental Duration
select  title , rental_duration from film where rental_duration =4

--6 Get Films with Specific Rental Rate
select title , film_id , rental_rate from film where rental_rate=2.99

--7 Get Films with Replacement Cost Criteria
select title , replacement_cost , fulltext from film where replacement_cost >=17.99
--8 Check Keywords in Film Descriptions

SELECT*, (SELECT EXISTS (select 1 from film where description ILIKE '%squirrel%')) FROM film
WHERE description ILIKE '%woman%'
OR description ILIKE '%hampster%'
OR description ILIKE '%panorama%'

--9 Get Films with Rental Rate Comparison
Select film_id, title from film
where rental_rate > some ( select rental_rate from film
where replacement_cost> 20);

--10 Get Customer Payments with Names
SELECT c.customer_id, c.first_name, c.last_name, p.amount
FROM customer c
left JOIN payment p ON c.customer_id = p.customer_id;


