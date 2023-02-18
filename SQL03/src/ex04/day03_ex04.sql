WITH piz_f AS (
    SELECT piz.name
    FROM person_order pv
    INNER JOIN person p ON pv.person_id = p.id
    INNER JOIN menu m ON m.id = pv.menu_id
    INNER JOIN pizzeria piz ON m.pizzeria_id = piz.id
    WHERE p.gender = 'female'
), piz_m AS (
    SELECT piz.name
    FROM person_order pv
    INNER JOIN person p ON pv.person_id = p.id
    INNER JOIN menu m ON m.id = pv.menu_id
    INNER JOIN pizzeria piz ON m.pizzeria_id = piz.id
    WHERE p.gender = 'male'
)

SELECT d.name AS pizzeria_name
FROM ((SELECT * FROM piz_f
    EXCEPT
    SELECT * FROM piz_m)
        UNION
    (SELECT * FROM piz_m
    EXCEPT
    SELECT * FROM piz_f)) d
ORDER BY pizzeria_name;
