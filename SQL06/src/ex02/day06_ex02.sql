SELECT p.name,  m.pizza_name, m.price,
        m.price * (1 - pd.discount / 100) AS discount_price,
        piz.name AS pizzeria_name
FROM person_order po
INNER JOIN menu m
    ON m.id = po.menu_id
INNER JOIN person p
    ON p.id = po.person_id
INNER JOIN pizzeria piz
    ON piz.id = m.pizzeria_id
INNER JOIN person_discounts pd
    ON p.id = pd.person_id AND
        piz.id = pd.pizzeria_id
ORDER BY 1, 2;
