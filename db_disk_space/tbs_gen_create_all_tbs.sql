set linesize 200
set pagesize 1000

SELECT    'CREATE TABLESPACE '
       || tablespace_name
       || ' DATAFILE '''
       || '&NEW_FILE_DIR'
       || tablespace_name
       || '_001.dbf'' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL AUTOALLOCATE SEGMENT SPACE MANAGEMENT AUTO;'
  FROM dba_tablespaces;  

set linesize 100
set pagesize 1000
SELECT    'CREATE TABLESPACE '
       || tablespace_name
       || ';'
  FROM dba_tablespaces;
