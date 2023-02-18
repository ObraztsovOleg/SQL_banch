DELETE FROM person_order WHERE CAST(order_date AS DATE) = '2022-02-25';
DELETE FROM menu WHERE pizza_name = 'greek pizza';