COMPUTE SUM LABEL 'TOTAL' OF mb on report
BREAK ON REPORT

SELECT FILE_NAME, BYTES / 1024 / 1024 MB
  FROM DBA_DATA_FILES
 WHERE TABLESPACE_NAME = '&tablespace_name';

column next_file_sequence new_value next_file_sequence

SELECT COUNT (1) + 1 next_file_sequence
  FROM DBA_DATA_FILES
 WHERE TABLESPACE_NAME = '&tablespace_name';
 
show parameter db_create_file_dest
