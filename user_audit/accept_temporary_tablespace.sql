set pagesize 100

SELECT TABLESPACE_NAME TEMPORARY_TABLESPACE
  FROM dba_tablespaces
 WHERE contents = 'TEMPORARY' ORDER BY 1;

UNDEFINE temporary_tablespace
accept temporary_tablespace char prompt 'Enter Temporary Tablespace: '
