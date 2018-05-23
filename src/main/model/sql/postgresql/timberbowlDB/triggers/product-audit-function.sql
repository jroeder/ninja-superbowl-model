-- Function: product_audit_function()

-- DROP FUNCTION product_audit_function();

CREATE OR REPLACE FUNCTION product_audit_function()
  RETURNS trigger AS
$BODY$
    BEGIN
        --
        -- Create a row in emp_audit to reflect the operation performed on emp,
        -- make use of the special variable TG_OP to work out the operation.
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'D', 'PRODUCT', user, OLD.PRD_ID, OLD.WOD_ID, OLD.ART_ID, OLD.PRD_VERSION, OLD.PRD_NUMBER, OLD.PRD_NAME, OLD.PRD_YEAR, OLD.PRD_DIAMETER, OLD.PRD_HEIGHT, OLD.PRD_PRICE, OLD.PRD_IMAGENAME;
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO "AUDIT" SELECT now(), 'U', 'PRODUCT', user, NEW.PRD_ID, NEW.WOD_ID, NEW.ART_ID, NEW.PRD_VERSION, NEW.PRD_NUMBER, NEW.PRD_NAME, NEW.PRD_YEAR, NEW.PRD_DIAMETER, NEW.PRD_HEIGHT, NEW.PRD_PRICE, NEW.PRD_IMAGENAME;
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO "AUDIT" SELECT now(), 'I', 'PRODUCT', user, NEW.PRD_ID, NEW.WOD_ID, NEW.ART_ID, NEW.PRD_VERSION, NEW.PRD_NUMBER, NEW.PRD_NAME, NEW.PRD_YEAR, NEW.PRD_DIAMETER, NEW.PRD_HEIGHT, NEW.PRD_PRICE, NEW.PRD_IMAGENAME;
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 30;
ALTER FUNCTION product_audit_function()
  OWNER TO techusergroup;
