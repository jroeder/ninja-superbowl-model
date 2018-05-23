-- Table: "SOURCE"

-- DROP TABLE "SOURCE";

CREATE TABLE "SOURCE"
(
  con_id integer NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  wod_id integer NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  CONSTRAINT pk_vorkommen PRIMARY KEY (con_id, wod_id),
  CONSTRAINT fk_vorkomme_vorkommen_continen FOREIGN KEY (con_id)
      REFERENCES "CONTINENT" (con_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT,
  CONSTRAINT fk_vorkomme_vorkommen_wood FOREIGN KEY (wod_id)
      REFERENCES "WOOD" (wod_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "SOURCE"
  OWNER TO postgres;
COMMENT ON TABLE "SOURCE"
  IS 'Repraesentiert die geographischen Wachstumsregionen einer Holzart';
COMMENT ON COLUMN "SOURCE".con_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "SOURCE".wod_id IS 'Eindeutiger Technischer Primaerschluessel';


-- Index: vorkommen2_fk

-- DROP INDEX vorkommen2_fk;

CREATE INDEX vorkommen2_fk
  ON "SOURCE"
  USING btree
  (wod_id);

-- Index: vorkommen_fk

-- DROP INDEX vorkommen_fk;

CREATE INDEX vorkommen_fk
  ON "SOURCE"
  USING btree
  (con_id);

-- Index: vorkommen_pk

-- DROP INDEX vorkommen_pk;

CREATE UNIQUE INDEX vorkommen_pk
  ON "SOURCE"
  USING btree
  (con_id, wod_id);
