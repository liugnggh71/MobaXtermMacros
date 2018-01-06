clear screen

set linesize 252
column name format a30
column value format a40
column display_value format a40
column description format a50

SELECT name,
       VALUE,
       display_value,
       description
  FROM v$parameter
 WHERE name IN ('db_recovery_file_dest', 'db_recovery_file_dest_size');
 
prompt alter system set db_recovery_file_dest='/archivelog/oradata/fast_recovery_area/' scope=both;
prompt alter system set db_recovery_file_dest_size=500G scope=both;

select flashback_on from v$database;

prompt alter database flashback on;

SELECT * FROM GV$FLASHBACK_DATABASE_LOG;

SELECT *
  FROM (  SELECT *
            FROM GV$FLASHBACK_DATABASE_LOGFILE
        ORDER BY first_time DESC)
 WHERE ROWNUM < 2;
