-- ==================================================
-- DDL Master Script of Derby Database superbowlDB
-- Created by: Jürgen Röder
-- Last Updated: 2017-03-03
-- ==================================================
--SET AUTOCOMMIT OFF;

-- ==================================================
-- DROP/CREATE SCHEMA
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- The RESTRICT keyword enforces the rule that no objects can be defined in
-- the specified schema for the schema to be deleted from the database.
-- The RESTRICT keyword is required.
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- The CREATE SCHEMA statement creates a schema, which is a way to logically
-- group objects in a single collection and to provide a unique namespace for objects.
-- The CREATE SCHEMA statement is subject to access control when the derby.database.sqlAuthorization
-- property is set to true for the database or system. Only the database owner can create a schema
-- with a name different from the current user name, and only the the database owner can specify
-- AUTHORIZATION userName
-- with a user name other than the current user name.
-- ==================================================
--DROP SCHEMA SUB RESTRICT;
--CREATE SCHEMA SUB; -- AUTHORIZATION userName;
--CREATE SCHEMA AUTHORIZATION SUB;

-- ==================================================
-- DROP TABLE
-- ==================================================
DROP TABLE AUDIT;
DROP TABLE MODPROCESS;
DROP TABLE MODIFICATION;
DROP TABLE MODSTEP;
DROP TABLE ARTEFACT;
DROP TABLE ACTORIDENTITY;
DROP TABLE ACTORROLE;
DROP TABLE ACTORSESSION;
DROP TABLE ACTOR;
DROP TABLE STATUS;
DROP TABLE TIMBER;
DROP TABLE BOTANICSYSTEM;
DROP TABLE GEOREGION;

--COMMIT;

