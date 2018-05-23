-- Catalog: information_schema

-- DROP SCHEMA information_schema;

CREATE SCHEMA information_schema
  AUTHORIZATION postgres;

GRANT ALL ON SCHEMA information_schema TO postgres;
GRANT USAGE ON SCHEMA information_schema TO public;