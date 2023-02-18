WITH piz_f AS (
    SELECT piz.name
    FROM person_visits pv
    INNER JOIN person p ON pv.person_id = p.id
    INNER JOIN pizzeria piz ON pv.pizzeria_id = piz.id
    WHERE p.gender = 'female'
), piz_m AS (
    SELECT piz.name
    FROM person_visits pv
    INNER JOIN person p ON pv.person_id = p.id
    INNER JOIN pizzeria piz ON pv.pizzeria_id = piz.id
    WHERE p.gender = 'male'
)

SELECT d.name AS pizzeria_name
FROM ((SELECT * FROM piz_f
    EXCEPT ALL
    SELECT * FROM piz_m)
        UNION ALL
    (SELECT * FROM piz_m
    EXCEPT ALL
    SELECT * FROM piz_f)) d
ORDER BY pizzeria_name;
