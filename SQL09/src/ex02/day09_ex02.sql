CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $person_deletes$
    BEGIN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', OLD.id,
               OLD.name, OLD.age, OLD.gender, OLD.address;

        RETURN OLD;
    END;
$person_deletes$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_delete_audit AFTER DELETE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;