SELECT p.name
FROM person_order po
INNER JOIN person p
    ON p.id = po.person_id
INNER JOIN menu m
    ON po.menu_id = m.id
WHERE (p.address = 'Moscow' OR p.address = 'Samara')
    AND p.gender = 'male'
    AND (m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza')
ORDER BY p.name DESC;