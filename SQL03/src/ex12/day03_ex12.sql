WITH newperson AS (
    SELECT (SELECT COUNT(*) + 1
            FROM person p_1
            WHERE p_2.id > p_1.id) AS row_number, p_2.id
    FROM person p_2
)

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (SELECT MAX(id) FROM person_order) + row_number, id, (
        SELECT id FROM menu WHERE pizza_name = 'greek pizza'
    ), '2022-02-25'::DATE
FROM newperson;