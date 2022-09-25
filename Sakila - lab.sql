use sakila;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT
    f.film_id,
    f.title,
    f.rental_duration,
    f.rental_rate,
    f.length,
    f.rating,
    f.special_features,
    c.name AS category,
    r.rental_date,
    MONTH(r.rental_date) AS month
FROM
    film f
        LEFT JOIN
    inventory i ON f.film_id = i.film_id
        LEFT JOIN
    language l ON f.language_id = l.language_id
        LEFT JOIN
    film_category f_c ON f_c.film_id = f.film_id
        LEFT JOIN
    category c ON f_c.category_id = c.category_id
        LEFT JOIN
    rental r ON r.inventory_id = i.inventory_id
    GROUP BY f.title
	ORDER BY f.title;