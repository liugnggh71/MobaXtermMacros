clear screen

alter system set control_file_record_keep_time=62 scope=both;

set linesize 252
column name format a30
column value format a40
column description format a50

SELECT name, VALUE, description
  FROM v$parameter
 WHERE name = 'control_file_record_keep_time';
