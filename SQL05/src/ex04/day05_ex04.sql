CREATE INDEX IF NOT EXISTS idx_menu_unique
    ON menu USING btree (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE SELECT
    pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id = 8 AND pizza_name = 'sausage pizza';
