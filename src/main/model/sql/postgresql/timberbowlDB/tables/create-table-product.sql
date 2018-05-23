-- Table: "PRODUCT"

-- DROP TABLE "PRODUCT";

CREATE TABLE "PRODUCT"
(
  prd_id bigint NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  wod_id bigint NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  art_id bigint NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  prd_version bigint NOT NULL, -- Versionsnummer fuer pessimistisches Sperren
  prd_number integer NOT NULL, -- Logische Produktionsnummer des Produkts
  prd_name character varying(25) NOT NULL, -- Name der Schale
  prd_year character(4) NOT NULL, -- Herstellungsjahr des Produkts
  prd_diameter numeric NOT NULL, -- Durchmessser des Produkts in Millimeter
  prd_height numeric NOT NULL, -- Hoehe des Produkts in Millimeter
  prd_price numeric NOT NULL, -- Verkaufspreis des Produkts
  prd_imagename character varying(35) NOT NULL, -- Name der Bilddatei zu dem Produkt
  CONSTRAINT pk_product PRIMARY KEY (prd_id),
  CONSTRAINT fk_product_konsisten_wood FOREIGN KEY (wod_id)
      REFERENCES "WOOD" (wod_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_product_manufakti_artist FOREIGN KEY (art_id)
      REFERENCES "ARTIST" (art_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "PRODUCT"
  OWNER TO postgres;
COMMENT ON TABLE "PRODUCT"
  IS 'Repraesentiert das finale Produkt; hier eine Schale aus Naturholz aus manueller Produktion.';
COMMENT ON COLUMN "PRODUCT".prd_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "PRODUCT".wod_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "PRODUCT".art_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "PRODUCT".prd_version IS 'Versionsnummer fuer pessimistisches Sperren';
COMMENT ON COLUMN "PRODUCT".prd_number IS 'Logische Produktionsnummer des Produkts';
COMMENT ON COLUMN "PRODUCT".prd_name IS 'Name der Schale';
COMMENT ON COLUMN "PRODUCT".prd_year IS 'Herstellungsjahr des Produkts';
COMMENT ON COLUMN "PRODUCT".prd_diameter IS 'Durchmessser des Produkts in Millimeter';
COMMENT ON COLUMN "PRODUCT".prd_height IS 'Hoehe des Produkts in Millimeter';
COMMENT ON COLUMN "PRODUCT".prd_price IS 'Verkaufspreis des Produkts';
COMMENT ON COLUMN "PRODUCT".prd_imagename IS 'Name der Bilddatei zu dem Produkt';


-- Index: konsistenz_fk

-- DROP INDEX konsistenz_fk;

CREATE INDEX konsistenz_fk
  ON "PRODUCT"
  USING btree
  (wod_id);

-- Index: manufaktion_fk

-- DROP INDEX manufaktion_fk;

CREATE INDEX manufaktion_fk
  ON "PRODUCT"
  USING btree
  (art_id);

-- Index: product_pk

-- DROP INDEX product_pk;

CREATE UNIQUE INDEX product_pk
  ON "PRODUCT"
  USING btree
  (prd_id);


-- Trigger: product_audit on "PRODUCT"

-- DROP TRIGGER product_audit ON "PRODUCT";

CREATE TRIGGER product_audit
  BEFORE INSERT OR UPDATE OR DELETE
  ON "PRODUCT"
  FOR EACH ROW
  EXECUTE PROCEDURE product_audit_function();

