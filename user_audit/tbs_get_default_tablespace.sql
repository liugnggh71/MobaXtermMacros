COLUMN DEFAULT_PERMANENT_TABLESPACE NEW_VALUE DEFAULT_PERMANENT_TABLESPACE

SELECT PROPERTY_VALUE DEFAULT_PERMANENT_TABLESPACE
  FROM database_properties
 WHERE property_name = 'DEFAULT_PERMANENT_TABLESPACE';

COLUMN mostused_default_tablespace NEW_VALUE mostused_default_tablespace

SELECT default_tablespace mostused_default_tablespace
  FROM (  SELECT default_tablespace, COUNT (1) user_count
            FROM dba_users
        GROUP BY default_tablespace
        ORDER BY user_count DESC)
 WHERE ROWNUM < 2;

undefine default_tablespace
COLUMN default_tablespace NEW_VALUE default_tablespace

SELECT DEFAULT_PERMANENT_TABLESPACE default_tablespace
  FROM (SELECT PROPERTY_VALUE DEFAULT_PERMANENT_TABLESPACE
          FROM database_properties
         WHERE property_name = 'DEFAULT_PERMANENT_TABLESPACE') a,
       (SELECT default_tablespace mostused_default_tablespace
          FROM (  SELECT default_tablespace, COUNT (1) user_count
                    FROM dba_users
                GROUP BY default_tablespace
                ORDER BY user_count DESC)
         WHERE ROWNUM < 2) b
 WHERE DEFAULT_PERMANENT_TABLESPACE = mostused_default_tablespace;
 
define default_tablespace
define mostused_default_tablespace
define DEFAULT_PERMANENT_TABLESPACE
