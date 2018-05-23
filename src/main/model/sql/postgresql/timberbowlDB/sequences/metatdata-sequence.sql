-- Sequence: met_seq

-- DROP SEQUENCE met_seq;

CREATE SEQUENCE met_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 1000000
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE met_seq
  OWNER TO postgres;
