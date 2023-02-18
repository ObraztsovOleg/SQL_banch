SELECT name, count, action_type
FROM ((SELECT piz.name, COUNT(*) AS count, 'visit' AS action_type
    FROM person_visits pv
    INNER JOIN pizzeria piz on piz.id = pv.pizzeria_id
    GROUP BY piz.name
    ORDER BY count DESC
    LIMIT 3)
        UNION ALL
    (SELECT piz.name, COUNT(*) AS count, 'order' AS action_type
    FROM person_order pv
    INNER JOIN menu m on m.id = pv.menu_id
    INNER JOIN pizzeria piz on piz.id = m.pizzeria_id
    GROUP BY piz.name
    ORDER BY count DESC
    LIMIT 3)) data
ORDER BY action_type ASC, count DESC;