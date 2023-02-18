SELECT t.action_date,
       (SELECT name
        FROM person
        WHERE t.person_id = id) AS person_name
FROM (SELECT order_date AS action_date, person_id AS person_id
FROM person_order
INTERSECT
SELECT visit_date AS action_date, person_id AS person_id
FROM person_visits) t
ORDER BY t.action_date ASC, person_name DESC;