-- Table: "WOOD"

-- DROP TABLE "WOOD";

CREATE TABLE "WOOD"
(
  wod_id integer NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  bof_id integer NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  wod_version integer NOT NULL, -- Versionsnummer fuer pessimistisches Sperren
  wod_name character varying(25) NOT NULL,
  wod_aliases character varying(256) NOT NULL, -- Liste von anderen Namen fuer eine Holzart
  wod_botname character varying(35) NOT NULL,
  wod_botfamily character varying(25) NOT NULL,
  wod_system character varying(25) NOT NULL,
  wod_imagename character varying(35) NOT NULL, -- Name des Bilddatei zur Holzart
  CONSTRAINT pk_wood PRIMARY KEY (wod_id),
  CONSTRAINT fk_wood_botanisch_botanica FOREIGN KEY (bof_id)
      REFERENCES "BOTANICALFAMILY" (bof_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "WOOD"
  OWNER TO postgres;
COMMENT ON TABLE "WOOD"
  IS 'Repräsentiert die Holzart aus dem ein Produkt (hier: Schale) besteht und hergestellt wird.';
COMMENT ON COLUMN "WOOD".wod_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "WOOD".bof_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "WOOD".wod_version IS 'Versionsnummer fuer pessimistisches Sperren';
COMMENT ON COLUMN "WOOD".wod_aliases IS 'Liste von anderen Namen fuer eine Holzart';
COMMENT ON COLUMN "WOOD".wod_imagename IS 'Name des Bilddatei zur Holzart';


-- Index: botanische_klassifikation_fk

-- DROP INDEX botanische_klassifikation_fk;

CREATE INDEX botanische_klassifikation_fk
  ON "WOOD"
  USING btree
  (bof_id);

-- Index: wood_pk

-- DROP INDEX wood_pk;

CREATE UNIQUE INDEX wood_pk
  ON "WOOD"
  USING btree
  (wod_id);


-- Trigger: wood_audit on "WOOD"

-- DROP TRIGGER wood_audit ON "WOOD";

CREATE TRIGGER wood_audit
  BEFORE INSERT OR UPDATE OR DELETE
  ON "WOOD"
  FOR EACH ROW
  EXECUTE PROCEDURE wood_audit_function();

