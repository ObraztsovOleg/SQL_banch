SELECT m.pizza_name, m.price, piz.name AS pizzeria_name, pv.visit_date
FROM person_visits pv
INNER JOIN pizzeria piz
    ON piz.id = pv.pizzeria_id
INNER JOIN menu m
    ON piz.id = m.pizzeria_id
INNER JOIN person p
    ON p.id = pv.person_id
WHERE p.name = 'Kate' AND (m.price >= 800 AND m.price <= 1000)
ORDER BY m.pizza_name, m.price, pizzeria_name;