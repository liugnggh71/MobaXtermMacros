prompt ######################################################################
prompt Define username
prompt ######################################################################

SELECT username
  FROM dba_users
 order by username;

COLUMN username NEW_VALUE username
COLUMN profile NEW_VALUE profile

UNDEFINE username
UNDEFINE profile
accept username char prompt 'Enter USERNAME: '
set linesize 280

SELECT u.USERNAME,
       u.ACCOUNT_STATUS,
       u.LOCK_DATE,
       u.EXPIRY_DATE,
       u.CREATED,
       u.profile,
	   extract(xmltype(dbms_metadata.get_xml('USER',username)),'//USER_T/PASSWORD/text()').getStringVal() PASSWORD_HASH
  FROM dba_users u
 WHERE username = upper('&username');

DEFINE username
DEFINE profile
