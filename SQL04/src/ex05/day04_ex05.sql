CREATE VIEW v_price_with_discount AS (
    SELECT p.name, m.pizza_name, m.price,
           (m.price * (1 - 0.1))::integer AS discount_price
    FROM person_order
    INNER JOIN person p
        ON p.id = person_order.person_id
    INNER JOIN menu m
        ON m.id = person_order.menu_id
    ORDER BY 1, 2
);
