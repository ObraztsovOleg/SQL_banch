SELECT piz.name AS pizzeria_name
FROM person_visits pv
INNER JOIN person p
    ON p.id = pv.person_id
INNER JOIN pizzeria piz
    ON piz.id = pv.pizzeria_id
LEFT JOIN person_order po
    ON pv.visit_date = po.order_date
WHERE po.order_date IS NULL AND p.name = 'Andrey'
ORDER BY pizzeria_name;
