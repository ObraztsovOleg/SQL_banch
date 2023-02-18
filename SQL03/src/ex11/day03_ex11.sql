UPDATE menu
SET price = (SELECT price * (1 - 0.1) FROM menu WHERE pizza_name = 'greek pizza')
WHERE pizza_name = 'greek pizza';

