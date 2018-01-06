clear screen

COLUMN db_name NEW_VALUE db_name

SELECT LOWER (VALUE) db_name
  FROM v$parameter
 WHERE name = 'db_name';

CREATE OR REPLACE DIRECTORY MY_DATA_PUMP_DIR
    AS '&MY_DATA_PUMP_DIR';

select * from dba_directories where directory_name='MY_DATA_PUMP_DIR';
