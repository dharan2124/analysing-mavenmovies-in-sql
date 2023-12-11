use mavenmovies;

-- 1.Write a SQL query to count the number of characters except the spaces for each actor.
-- Return first 10 actors name length along with their name;


select concat(first_name,' ',last_name) name ,length(trim(concat(first_name,last_name)))
 length from actor limit 10;


 -----------------------------------------------------------------------------------------------
-- 2.List all Oscar awardees(Actors who received Oscar award) 
-- 	 with their full names and length of their names;
  

select concat(first_name,' ',last_name) full_name,length(concat(first_name,last_name))
length,awards from actor_award where awards like '%oscar%';


----------------------------------------------------------------------------------------------------- 
 -- 3.Find the actors who have acted in the film ‘Frost Head’;


select concat(C.first_name,' ',C.last_name) actors,A.title
from film A inner join film_actor B on A.film_id=B.film_id
inner join actor C on B.actor_id=C.actor_id
where A.title='frost head';


-------------------------------------------------------------------------------------------
-- 4.Pull all the films acted by the actor ‘Will Wilson’;


select a.title,concat(c.first_name,' ',c.last_name) actor
from film  a inner join film_actor  b on a.film_id=b.film_id
inner join actor  c
on b.actor_id=c.actor_id
where c.first_name='will' and c.last_name='wilson';


--------------------------------------------------------------------------------------------
-- 5.Pull all the films which were rented and return in the month of May;
 
 
select a.title,c.rental_date,c.return_date
from film  a inner join inventory  b on a.film_id=b.film_id
inner join rental c
on b.inventory_id=c.inventory_id
where month(rental_date)=5 and month(return_date)=5;


--------------------------------------------------------------------------------------------------
-- 6.Pull all the films with ‘Comedy’ category;


select a.title,c.name
from film  a inner join film_category  b on a.film_id=b.film_id
inner join category  c
on b.category_id=c.category_id
where c.name='comedy';

--------------------------------------------------------------------------------------------------
-- 7.Find the films with similar titles using regular expressions.

SELECT
    f1.title AS film1,
    f2.title AS film2
FROM
    film f1
JOIN
    film f2 ON f1.title <> f2.title AND f1.title REGEXP f2.title;


-- 8.List the customers who have rented the most number of films.

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM
    customer c
JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id
ORDER BY
    total_rentals DESC;


-- 9.Identify the films with the longest and shortest duration.

SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 1;

SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 1;

-- 10.Find the average rental rate for each category of films.

SELECT c.name AS category,AVG(f.rental_rate) AS avg_rental_rate
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- 11.Calculate the average length of films for each rating category.

SELECT rating,AVG(length) AS avg_film_length
FROM film
GROUP BY rating;

-- 12. Identify the films that have not been rented yet.

SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

-- 13.List the top 5 customers who have paid the highest total amount.

SELECT *
FROM (
    SELECT  c.customer_id,CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
            SUM(p.amount) AS total_amount_paid, DENSE_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS rnk
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
) ranked_customers
WHERE rnk <= 6;

-- 14.Find the total number of films in each category. Include categories

SELECT c.name AS category,COUNT(fc.film_id) AS film_count
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;
