SELECT p.name, COUNT(*) AS count_of_orders,
       ROUND(AVG(m.price::numeric), 2) AS average_price,
       MAX(m.price::numeric) AS max_price,
       MIN(m.price::numeric) AS min_price
FROM person_order po
INNER JOIN menu m
    ON m.id = po.menu_id
INNER JOIN pizzeria p
    ON p.id = m.pizzeria_id
GROUP BY p.name
ORDER BY p.name;
