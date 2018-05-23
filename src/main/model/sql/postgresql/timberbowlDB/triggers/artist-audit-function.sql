-- Function: artist_audit_function()

-- DROP FUNCTION artist_audit_function();

CREATE OR REPLACE FUNCTION artist_audit_function()
  RETURNS trigger AS
$BODY$
    BEGIN
        --
        -- Create a row in emp_audit to reflect the operation performed on emp,
        -- make use of the special variable TG_OP to work out the operation.
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'D', 'ARTIST', user, OLD.ART_ID, OLD.ART_VERSION, OLD.ART_GNAME, OLD.ART_FNAME, OLD.ART_GENDER, '', '', '', '', '', '';
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'U', 'ARTIST', user, NEW.ART_ID, NEW.ART_VERSION, NEW.ART_GNAME, NEW.ART_FNAME, NEW.ART_GENDER, '', '', '', '', '', '';
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO "AUDIT" SELECT now(), 'I', 'ARTIST', user, NEW.ART_ID, NEW.ART_VERSION, NEW.ART_GNAME, NEW.ART_FNAME, NEW.ART_GENDER, '', '', '', '', '', '';
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION artist_audit_function()
  OWNER TO techusergroup;

