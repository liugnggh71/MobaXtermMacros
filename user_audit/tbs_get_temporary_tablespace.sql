COLUMN DEFAULT_TEMP_TABLESPACE NEW_VALUE DEFAULT_TEMP_TABLESPACE

SELECT PROPERTY_VALUE DEFAULT_TEMP_TABLESPACE
  FROM database_properties
 WHERE property_name = 'DEFAULT_TEMP_TABLESPACE';

COLUMN mostused_temporary_tablespace NEW_VALUE mostused_temporary_tablespace

SELECT temporary_tablespace mostused_temporary_tablespace
  FROM (  SELECT temporary_tablespace, COUNT (1) user_count
            FROM dba_users
        GROUP BY temporary_tablespace
        ORDER BY user_count DESC)
 WHERE ROWNUM < 2;

UNDEFINE temporary_tablespace
COLUMN temporary_tablespace NEW_VALUE temporary_tablespace

SELECT DEFAULT_TEMP_TABLESPACE temporary_tablespace
  FROM (SELECT PROPERTY_VALUE DEFAULT_TEMP_TABLESPACE
          FROM database_properties
         WHERE property_name = 'DEFAULT_TEMP_TABLESPACE') a,
       (SELECT temporary_tablespace mostused_temp_tablespace
          FROM (  SELECT temporary_tablespace, COUNT (1) user_count
                    FROM dba_users
                GROUP BY temporary_tablespace
                ORDER BY user_count DESC)
         WHERE ROWNUM < 2) b
 WHERE DEFAULT_TEMP_TABLESPACE = mostused_temp_tablespace;

DEFINE temporary_tablespace
DEFINE mostused_temporary_tablespace
DEFINE DEFAULT_TEMP_TABLESPACE
