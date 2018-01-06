COLUMN  next_file_sequence NEW_VALUE next_file_sequence

SELECT TRIM (TO_CHAR (COUNT (1) + 1, '009')) next_file_sequence
  FROM DBA_DATA_FILES
 WHERE TABLESPACE_NAME = 'USERS';

COLUMN  file_suffix NEW_VALUE file_suffix

SELECT SUBSTR (name, NULLIF (INSTR (name, '.', -1) + 1, 1)) file_suffix
  FROM v$datafile
 WHERE file# = 1;

PROMPT alter tablespace &&tablespace_name add datafile '&NEW_FILE_DIR.&&tablespace_name._&next_file_sequence..&file_suffix' SIZE 100M AUTOEXTEND ON NEXT 1M MAXSIZE UNLIMITED;;

PROMPT alter tablespace &&tablespace_name add datafile;;
