-- Sequence: con_seq

-- DROP SEQUENCE con_seq;

CREATE SEQUENCE con_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 1000000
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE con_seq
  OWNER TO postgres;
