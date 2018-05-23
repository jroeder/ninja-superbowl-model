/*==============================================================
DBMS    :  H2
Version :  1.4.x
Database:  superbowlDB
Created :  07.03.2017 00:00:00
==============================================================*/

/*==============================================================
Create USer/Role Grant/Revoke
==============================================================*/
create user SB_USER password 'SB_USER';
create user SB_ADMIN password 'SB_ADMIN' ADMIN;

commit;

create schema SB_ADMIN AUTHORIZATION SB_ADMIN;
set schema SB_ADMIN;

commit;

create role SB_READ_ROLE;
create role SB_UPDATE_ROLE;

commit;

grant SB_UPDATE_ROLE to SB_ADMIN;
grant SB_UPDATE_ROLE to SB_USER;

commit;

grant SB_READ_ROLE to SB_USER;

commit;

drop role SB_READ_ROLE;
drop role SB_UPDATE_ROLE;

commit;

drop user SB_USER;
drop user SB_ADMIN;

commit;

