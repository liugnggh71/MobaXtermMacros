set linesize 132
column DIRECTORY_PATH format A80
column OWNER format A10
SELECT *
  FROM dba_directories
 WHERE directory_name = 'DATA_PUMP_DIR';
 
 