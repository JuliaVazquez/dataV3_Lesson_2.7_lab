-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM sakila.film;
SELECT * FROM sakila.category;

SELECT  c.name, COUNT(f.film_id) AS 'total_films'
FROM sakila.film_category f
JOIN sakila.category c
ON f.category_id = c.category_id
GROUP BY f.category_id;


-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT p.staff_id, first_name, last_name, SUM(amount) AS 'total_amount_August_2005' 
FROM sakila.payment p
JOIN sakila.staff s
ON p.staff_id = s.staff_id
WHERE payment_date LIKE '2005-08%'
GROUP BY staff_id
ORDER BY SUM(amount) DESC;


-- 3. Which actor has appeared in the most films?
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.actor;

SELECT first_name, last_name, COUNT(a.actor_id) AS 'films_they_are_in'
FROM sakila.actor a
JOIN sakila.film_actor f
ON a.actor_id = f.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(f.actor_id) DESC
LIMIT 1;



-- 4. Most active customer (the customer that has rented the most number of films)
SELECT * FROM sakila.rental;
SELECT *FROM sakila.customer;

SELECT first_name, last_name, COUNT(rental_id) AS 'how_many_times_rented_a_film'
FROM sakila.rental r
JOIN sakila.customer c
ON r.customer_id = c.customer_id
GROUP BY r.customer_id
ORDER BY COUNT(rental_id) DESC
LIMIT 1;



-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;



-- 6. List each film and the number of actors who are listed for that film.
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;

SELECT title, COUNT(actor_id) AS 'number_of_actors'
FROM sakila.film f
JOIN sakila.film_actor a
ON f.film_id = a.film_id
GROUP BY title
ORDER BY COUNT(actor_id) DESC;



-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * FROM sakila.payment;
SELECT * FROM sakila.customer;


SELECT last_name, first_name, SUM(amount) AS 'total_paid'
FROM sakila.customer c
JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY last_name ASC;



