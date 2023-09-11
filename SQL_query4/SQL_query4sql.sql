
--1 Count the number of films in each category
SELECT category_id , count (*) AS category_count
FROM film_category
GROUP BY category_id

--2 Count films in each category with category names
SELECT C.category_id, c.name, count(*) AS category_count
From film_category fc
JOIN category C ON fc.category_id =C.category_id
GROUP BY c.category_id
ORDER BY COUNT(*)

--3 Count films in each category with full outer join
SELECT fC.category_id, c.name, count(1) AS category_count
From film_category fc
full JOIN category C ON fc.category_id =C.category_id
GROUP BY fc.category_id, c.name
ORDER BY category_count;

--4 Count films in each category with full outer join and filter
SELECT fC.category_id, c.name, count(*) AS category_count
From film_category fc
full JOIN category C ON fc.category_id =C.category_id
GROUP BY fc.category_id, c.name
HAVING COUNT (1) <60
ORDER BY category_count;

--5 Retrieve customer_id with rental_count where rental date BETWEEN '2005-07-01' AND '2005-08-31'
SELECT customer_id , count(*) AS Rental_Count
FROM rental
WHERE rental_date BETWEEN '2005-07-01' AND '2005-08-31' 
GROUP BY customer_id 
ORDER BY Rental_Count DESC;

--6 Calculate total revenue and film count for each category 

SELECT c.category_id, c.name AS category_name, COUNT(1) AS film_count, SUM(p.amount) AS total_amount
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id
ORDER BY total_amount DESC;

-- 7  Calculate total revenue by film rating by using group by , order by 
SELECT f.rating, SUM(p.amount) AS total_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.rating
ORDER BY total_revenue DESC;

--8 Count rentals made by each customer with more than 40 rentals
SELECT c.customer_id, c.first_name, c.last_name, COUNT(1) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(1) > 30;

--9 Calculate average revenue by film rating for films with total revenue over $13,000
SELECT f.rating, avg(p.amount) AS total_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.rating
HAVING SUM(p.amount) > 13000
ORDER BY total_revenue DESC;

--10 Count the number of distinct rental IDs in the payment table
SELECT count(distinct rental_id) FROM payment;
select count ( distinct rental_id) from payment 

--11 Count the number of payments per rental ID and order by count in descending order
select count (rental_id) , rental_id from payment 
group by rental_id
order by count(rental_id) desc

--12 Retrieve payment information for a specific rental ID (e.g., rental_id = 4591)
select * from payment 
where rental_id = 4591

--13 Retrieve rental information for a specific rental ID (e.g., rental_id = 4591)
 select * from rental 
 where rental_id = 4591
 
 -- 14 Calculate the minimum and maximum rental dates

 select min( rental_date),max( rental_date) from rental
 
 
 
