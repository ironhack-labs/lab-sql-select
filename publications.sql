-- Add you solution queries below:

-- Store ID, ciudad y país de cada tienda.
SELECT 
    s.store_id,
    ci.city,
    co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;


--  Cuánto dinero generó cada tienda
SELECT 
    s.store_id,
    SUM(p.amount) AS total_revenue
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;


-- Categorías con películas más largas
SELECT 
    c.name AS category,
    AVG(f.length) AS avg_length
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY avg_length DESC;


-- Películas más alquiladas (descendente)
SELECT 
    f.title,
    COUNT(r.rental_id) AS times_rented
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY times_rented DESC;


-- Top 5 géneros por ingresos brutos
SELECT 
    c.name AS genre,
    SUM(p.amount) AS gross_revenue
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY gross_revenue DESC
LIMIT 5;


-- ¿"Academy Dinosaur" está disponible en Store 1?
SELECT 
    f.title,
    i.store_id,
    COUNT(i.inventory_id) AS copies
FROM film f
JOIN inventory i ON f.film_id = i.film_id
WHERE f.title = 'Academy Dinosaur'
  AND i.store_id = 1
GROUP BY f.title, i.store_id;


-- Versión correcta (realmente disponible, no alquilada ahora)
SELECT 
    f.title,
    i.store_id,
    COUNT(i.inventory_id) AS copies_available
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r 
       ON i.inventory_id = r.inventory_id 
      AND r.return_date IS NULL
WHERE f.title = 'Academy Dinosaur'
  AND i.store_id = 1
  AND r.rental_id IS NULL
GROUP BY f.title, i.store_id;
