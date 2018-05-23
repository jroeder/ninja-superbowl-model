-- Sequence: art_seq

-- DROP SEQUENCE art_seq;

CREATE SEQUENCE art_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 1000000
  START 1
  CACHE 1
  CYCLE;
ALTER TABLE art_seq
  OWNER TO postgres;
