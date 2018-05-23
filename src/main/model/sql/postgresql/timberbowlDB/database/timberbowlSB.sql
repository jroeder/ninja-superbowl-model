-- Database: "timberbowlDB"

-- DROP DATABASE "timberbowlDB";

CREATE DATABASE "timberbowlDB"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'German_Germany.1252'
       LC_CTYPE = 'German_Germany.1252'
       CONNECTION LIMIT = -1;

COMMENT ON DATABASE "timberbowlDB"
  IS 'Produktdatenbank des Projektes Timberbowl';