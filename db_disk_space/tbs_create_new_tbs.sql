column tablespace_name new_value tablespace_name

select 'USERS' tablespace_name from dual;

COLUMN  file_suffix NEW_VALUE file_suffix

SELECT SUBSTR (name, NULLIF (INSTR (name, '.', -1) + 1, 1)) file_suffix
  FROM v$datafile
 WHERE file# = 1;

PROMPT CREATE TABLESPACE &&tablespace_name DATAFILE '&NEW_FILE_DIR.&&tablespace_name._001.&file_suffix' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED EXTENT MANAGEMENT LOCAL AUTOALLOCATE SEGMENT SPACE MANAGEMENT AUTO;;

PROMPT create tablespace &&tablespace_name;;
