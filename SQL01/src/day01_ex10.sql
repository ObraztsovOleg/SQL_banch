SELECT p.name AS person_name, m.pizza_name,
       piz.name AS pizzeria_name
FROM person_order po
INNER JOIN person p
    ON p.id = po.person_id
INNER JOIN menu m
    ON m.id = po.menu_id
INNER JOIN pizzeria piz
    ON piz.id = m.pizzeria_id
ORDER BY person_name ASC, m.pizza_name ASC, pizzeria_name ASC;
