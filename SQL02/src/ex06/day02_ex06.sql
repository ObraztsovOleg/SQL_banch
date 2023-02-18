SELECT pizza_name, piz.name AS pizzeria_name
FROM person_order po
INNER JOIN menu m
    ON po.menu_id = m.id
INNER JOIN person p
    ON p.id = po.person_id
INNER JOIN pizzeria piz
    ON piz.id = m.pizzeria_id
WHERE p.name = 'Denis' OR p.name = 'Anna'
ORDER BY pizza_name, pizzeria_name;
