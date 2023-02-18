SELECT m.pizza_name, m.price, piz.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria piz
    ON piz.id = m.pizzeria_id
WHERE m.id NOT IN (SELECT menu_id
                FROM person_order)
ORDER BY m.pizza_name, m.price;