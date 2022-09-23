USE Sakila;

select * from film;
select * from rental;
select * from inventory;

-- select f.title, f.rental_rate, f.length, r.rental_date
-- from film f
-- inner join inventory i on f.film_id = i.film_id
-- inner join rental r on i.inventory_id = r.inventory_id
-- where rental_date between '2005-05-01' and '2005-05-31';

SELECT 
    f.title,
    l.name AS 'language',
    f.rental_duration,
    f.rental_rate,
    f.length,
    f.rating,
    f.special_features,
    c.name AS 'category',
    r.rental_date
FROM
    film f
        INNER JOIN
    inventory i ON f.film_id = i.film_id
        INNER JOIN
    language l ON f.language_id = l.language_id
        INNER JOIN
    film_category f_c ON f_c.film_id = f.film_id
        INNER JOIN
    category c ON f_c.category_id = c.category_id
        RIGHT JOIN
    rental r ON r.inventory_id = i.inventory_id
    where rental_date between '2005-05-01' and '2005-05-31';