 --1 Retrieve rentals with missing payments and calculate rental period
SELECT*, (return_date - rental_date) as rental_period FROM rental r
WHERE r.rental_id NOT IN (SELECT p.rental_id FROM payment p)

-- 2 Retrieve all payment records and order them by rental ID in ascending order
SELECT*FROM payment
ORDER BY rental_id asc

--3 Count the distinct rental IDs in the payment table
SELECT distinct count(rental_id) FROM paymenT

 --4 Retrieve distinct payment amounts and order them
 SELECT DISTINCT amount from payment 
 order by amount 
 
 --5 Count the number of payments for each payment amount and order them by amount
 select count (1) ,amount 
 from payment 
 group by amount
 order by amount

--6 Retrieve Minimum and Maximum Film Lengths Among Titles Starting with 'B'"
SELECT MIN(length) as min_length, MAX(length) as max_length 
FROM film 
WHERE title LIKE 'B%';

--7 Retrieve "Films Not Currently in Rental Inventory"
SELECT film_id, title
FROM film
EXCEPT
SELECT f.film_id, f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id;

--8 Retrieve "Average Film Length and Categorization by Rating"
SELECT rating, 
       AVG(length) AS avg_length, 
       CASE 
         WHEN AVG(length) > 100 THEN 'Long'
         ELSE 'Short'
       END AS film_length_category
FROM film 
GROUP BY rating;

