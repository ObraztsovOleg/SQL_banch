DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();

TRUNCATE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $person$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', OLD.id,
                   OLD.name, OLD.age, OLD.gender, OLD.address;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'U', OLD.id,
               OLD.name, OLD.age, OLD.gender, OLD.address;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
            SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'I', NEW.id,
               NEW.name, NEW.age, NEW.gender, NEW.address;
        END IF;

        RETURN NULL;
    END;
$person$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)
    VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;