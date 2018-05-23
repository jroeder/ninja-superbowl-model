-- Table: "METADATA"

-- DROP TABLE "METADATA";

CREATE TABLE "METADATA"
(
  met_id integer NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  wod_id integer NOT NULL, -- Eindeutiger Technischer Primaerschluessel
  met_version integer NOT NULL,
  met_origin_location character varying(128) NOT NULL, -- Gibt Auskunft ueber den lokalen Wachstumsstandort des verarbeiteten Materials
  CONSTRAINT pk_metadata PRIMARY KEY (met_id),
  CONSTRAINT fk_metadata_metadaten_wood FOREIGN KEY (wod_id)
      REFERENCES "WOOD" (wod_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "METADATA"
  OWNER TO postgres;
COMMENT ON TABLE "METADATA"
  IS 'Repraesentiert Daten im Zusammenhang von Material, Produkt, Produzent und Herstellungsprozess';
COMMENT ON COLUMN "METADATA".met_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "METADATA".wod_id IS 'Eindeutiger Technischer Primaerschluessel';
COMMENT ON COLUMN "METADATA".met_origin_location IS 'Gibt Auskunft ueber den lokalen Wachstumsstandort des verarbeiteten Materials';


-- Index: metadata_pk

-- DROP INDEX metadata_pk;

CREATE UNIQUE INDEX metadata_pk
  ON "METADATA"
  USING btree
  (met_id);

-- Index: metadaten_fk

-- DROP INDEX metadaten_fk;

CREATE INDEX metadaten_fk
  ON "METADATA"
  USING btree
  (wod_id);
