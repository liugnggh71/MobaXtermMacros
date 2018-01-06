SET LINESIZE 132

COLUMN PROPERTY_VALUE FORMAT A40
COLUMN DESCRIPTION FORMAT A60

SELECT *
  FROM database_properties
 WHERE property_name LIKE '%TABLESPACE';

COLUMN default_tablespace NEW_VALUE default_tablespace

SELECT default_tablespace, user_count
  FROM (  SELECT default_tablespace, COUNT (1) user_count
            FROM dba_users
        GROUP BY default_tablespace
        ORDER BY user_count DESC)
 WHERE ROWNUM < 2;

COLUMN TEMPORARY_TABLESPACE NEW_VALUE TEMPORARY_TABLESPACE

SELECT TEMPORARY_TABLESPACE, user_count
  FROM (  SELECT TEMPORARY_TABLESPACE, COUNT (1) user_count
            FROM dba_users
        GROUP BY TEMPORARY_TABLESPACE
        ORDER BY user_count DESC)
 WHERE ROWNUM < 2;

DEFINE default_tablespace
define TEMPORARY_TABLESPACE

PROMPT ALTER DATABASE DEFAULT TABLESPACE users;

PROMPT ALTER DATABASE DEFAULT temporary TABLESPACE TEMP;
