-- ==================================================
-- DDL Master Script of Derby Database superbowlDB
-- Created by: Jürgen Röder
-- Last Updated: 2017-03-03
-- ==================================================
--SET AUTOCOMMIT OFF;

-- ==================================================
-- DROP TABLE
-- ==================================================
DROP TABLE SUB.AUDIT;
DROP TABLE SUB.MODPROCESS;
DROP TABLE SUB.MODIFICATION;
DROP TABLE SUB.MODSTEP;
DROP TABLE SUB.ARTEFACT;
DROP TABLE SUB.ACTORIDENTITY;
DROP TABLE SUB.ACTORROLE;
DROP TABLE SUB.ACTORSESSION;
DROP TABLE SUB.ACTOR;
DROP TABLE SUB.STATUS;
DROP TABLE SUB.TIMBER;
DROP TABLE SUB.BOTANICSYSTEM;
DROP TABLE SUB.GEOREGION;

-- ==================================================
-- DROP SCHEMA
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- The RESTRICT keyword enforces the rule that no objects can be defined in
-- the specified schema for the schema to be deleted from the database.
-- The RESTRICT keyword is required.
-- ==================================================
DROP SCHEMA SUB RESTRICT;

--COMMIT;

