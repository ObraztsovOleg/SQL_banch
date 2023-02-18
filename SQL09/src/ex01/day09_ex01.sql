CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $person_updates$
    BEGIN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'U', OLD.id,
               OLD.name, OLD.age, OLD.gender, OLD.address;

        RETURN OLD;
    END;
$person_updates$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_update_audit AFTER UPDATE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;