SELECT pizza_name
FROM menu
UNION
SELECT (SELECT pizza_name
        FROM menu
        WHERE id = person_order.menu_id)
FROM person_order
ORDER BY pizza_name DESC;