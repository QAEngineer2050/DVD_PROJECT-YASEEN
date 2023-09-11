--1 Retrieve customer information and payment amount using a right join

select c.customer_id,c.first_name, p.amount
from customer c
right join payment p on c.customer_id = p.customer_id;

-- 2 Retrieve  unique customer_id values from the payment table.
SELECT DISTINCT customer_id 
FROM payment
WHERE customer_id IN (SELECT customer_id FROM rental WHERE amount > 10);

--3 Retrieve customer information and payment amount with ordering and limit
select c.customer_id, c.first_name, c.last_name, p.amount 
from customer as c
left join payment as p 
ON c.customer_id = p.customer_id
order by p.amount  desc
limit 10;

--4 Retrieve film titles and their respective actor counts
select film.title, count(actor.actor_id)as actor_count from film
inner join film_actor on film.film_id=film_actor.film_id
inner join actor on actor.actor_id =film_actor.actor_id
group by film.title;

--5 Retrieve customer information and rental counts with ordering
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
group by c.customer_id , c.first_name,c.last_name
order by rental_count desc; 

--6 Retrieve actors with the first name 'Helen
select first_name, last_name from actor where first_name = 'Helen';


