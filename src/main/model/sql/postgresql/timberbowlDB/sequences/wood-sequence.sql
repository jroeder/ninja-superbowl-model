-- Sequence: wod_seq

-- DROP SEQUENCE wod_seq;

CREATE SEQUENCE wod_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 1000000
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE wod_seq
  OWNER TO postgres;
