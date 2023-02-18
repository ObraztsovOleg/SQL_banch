SELECT p.name
FROM (SELECT po.person_id
    FROM person_order po
    INNER JOIN menu m
        ON po.menu_id = m.id
    WHERE m.pizza_name = 'cheese pizza'
INTERSECT
    SELECT po.person_id
    FROM person_order po
    INNER JOIN menu m
        ON po.menu_id = m.id
    WHERE m.pizza_name = 'pepperoni pizza') tmp
INNER JOIN person p
    ON tmp.person_id = p.id
WHERE p.gender = 'female'
ORDER BY p.name;
