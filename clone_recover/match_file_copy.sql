set linesize 132
column DATAFILE_NAME format A50
column file_copy_name format A50

SELECT d.file#, d.name datafile_name, c.name file_copy_name
  FROM v$datafile_copy c, v$datafile d
 WHERE d.file# = c.file#(+);
