WITH newmenu AS (
    SELECT piz.name AS pizzeria_name, m.pizza_name, m.price,
           piz.id AS pizzeria_id, m.id AS menu_id
    FROM menu m
    INNER JOIN pizzeria piz ON m.pizzeria_id = piz.id
)

SELECT m_1.pizza_name, m_1.pizzeria_name AS pizzeria_name_1,
       m_2.pizzeria_name AS pizzeria_name_2, m_1.price
FROM newmenu m_1
INNER JOIN newmenu m_2
ON m_1.price = m_2.price AND m_1.pizza_name = m_2.pizza_name
       AND m_1.pizzeria_name != m_2.pizzeria_name
WHERE m_1.menu_id > m_2.menu_id
ORDER BY 1;
