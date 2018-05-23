-- ==================================================
-- DDL Master Script of Derby Database superbowlDB
-- Created by: Jürgen Röder
-- Last Updated: 2017-03-04
-- ==================================================
--SET AUTOCOMMIT OFF;

-- ==================================================
-- GRANT Statement
-- ==================================================
-- The GRANT statement gives privileges to a specific user or role, or to all users, to perform actions on database objects.
--
-- You can also use the GRANT statement to grant a role to a user, to PUBLIC, or to another role.
-- The following types of privileges can be granted:
--
--    Delete data from a specific table.
--    Insert data into a specific table.
--    Create a foreign key reference to the named table or to a subset of columns from a table.
--    Select data from a table, view, or a subset of columns in a table.
--    Create a trigger on a table.
--    Update data in a table or in a subset of columns in a table.
--    Run a specified function or procedure.
--    Use a sequence generator, a user-defined type, or a user-defined aggregate.
--
-- You can grant privileges on an object if you are the owner of the object or the database owner.
-- Database Owner (SuperbowlDB): user=SBAdmin; password=Him@l@y@
-- ==================================================
-- GRANT privilegeType ON [ TABLE ] { tableName | viewName } TO grantees
-- ==================================================

GRANT SELECT ON TABLE ACTOR TO SBAdmin, SBUser;
GRANT SELECT ON TABLE ACTORIDENTITY TO SBAdmin, SBUser;
GRANT SELECT ON TABLE ACTORROLE TO SBAdmin, SBUser;
GRANT SELECT ON TABLE ACTORSESSION TO SBAdmin, SBUser;
GRANT SELECT ON TABLE ARTEFACT TO SBAdmin, SBUser;
GRANT SELECT ON TABLE BOTANICSYSTEM TO SBAdmin, SBUser;
GRANT SELECT ON TABLE GEOREGION TO SBAdmin, SBUser;
GRANT SELECT ON TABLE MODIFICATION TO SBAdmin, SBUser;
GRANT SELECT ON TABLE MODPROCESS TO SBAdmin, SBUser;
GRANT SELECT ON TABLE MODSTEP TO SBAdmin, SBUser;
GRANT SELECT ON TABLE STATUS TO SBAdmin, SBUser;
GRANT SELECT ON TABLE TIMBER TO SBAdmin, SBUser; 

GRANT INSERT ON TABLE ACTOR TO SBAdmin, SBUser;
GRANT INSERT ON TABLE ACTORIDENTITY TO SBAdmin, SBUser;
GRANT INSERT ON TABLE ACTORROLE TO SBAdmin, SBUser;
GRANT INSERT ON TABLE ACTORSESSION TO SBAdmin, SBUser;
GRANT INSERT ON TABLE ARTEFACT TO SBAdmin, SBUser;
GRANT INSERT ON TABLE MODIFICATION TO SBAdmin, SBUser;
GRANT INSERT ON TABLE MODPROCESS TO SBAdmin, SBUser;
GRANT INSERT ON TABLE MODSTEP TO SBAdmin, SBUser;

GRANT UPDATE ON TABLE ACTOR TO SBAdmin, SBUser;
GRANT UPDATE ON TABLE ACTORIDENTITY TO SBAdmin, SBUser;
GRANT UPDATE ON TABLE ACTORROLE TO SBAdmin, SBUser;
GRANT UPDATE ON TABLE ACTORSESSION TO SBAdmin, SBUser;
GRANT UPDATE ON TABLE ARTEFACT TO SBAdmin, SBUser;
GRANT UPDATE ON TABLE MODIFICATION TO SBAdmin, SBUser;
GRANT UPDATE ON TABLE MODPROCESS TO SBAdmin, SBUser;
GRANT UPDATE ON TABLE MODSTEP TO SBAdmin, SBUser;

GRANT DELETE ON TABLE ARTEFACT TO SBAdmin, SBUser;
GRANT DELETE ON TABLE MODIFICATION TO SBAdmin, SBUser;
GRANT DELETE ON TABLE MODPROCESS TO SBAdmin, SBUser;
GRANT DELETE ON TABLE MODSTEP TO SBAdmin, SBUser;

--COMMIT;

