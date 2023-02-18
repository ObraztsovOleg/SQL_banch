SET ENABLE_SEQSCAN TO OFF;

SELECT m.pizza_name, p.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria p
    ON p.id = m.pizzeria_id;

EXPLAIN ANALYSE SELECT m.pizza_name, p.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria p
    ON p.id = m.pizzeria_id;