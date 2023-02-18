CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
    SELECT piz.name AS pizzeria_name
    FROM person_visits pv
    INNER JOIN person p
        ON p.id = pv.person_id
    INNER JOIN pizzeria piz
        ON piz.id = pv.pizzeria_id
    INNER JOIN menu m
        ON piz.id = m.pizzeria_id
    WHERE p.name = 'Dmitriy' AND m.price < 800
        AND CAST(pv.visit_date AS DATE) = '2022-01-08'
);
