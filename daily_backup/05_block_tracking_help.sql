set linesize 132

COLUMN block_change_file NEW_VALUE block_change_file

SELECT    SUBSTR (
              VALUE,
              1,
              LENGTH (VALUE) - REGEXP_INSTR (reverse (VALUE), '/|\\') + 1)
       || instance_name
       || '_bct.chg'
           block_change_file
  FROM v$parameter, v$instance
 WHERE name = 'dg_broker_config_file1';
 
column FILENAME format A70
SELECT b.STATUS, b.FILENAME, b.BYTES FROM V$BLOCK_CHANGE_TRACKING b;
prompt alter database enable block change tracking;;
prompt alter database enable block change tracking using file '/u01/app/oracvle/mysid/data/block_change_tracking.chg';;
prompt alter database enable block change tracking using file '&block_change_file';;
prompt alter database disable block change tracking;;
show parameter DB_CREATE_FILE_DEST
prompt ALTER SYSTEM SET DB_CREATE_FILE_DEST = '/u02/oradata' scope=both;;
