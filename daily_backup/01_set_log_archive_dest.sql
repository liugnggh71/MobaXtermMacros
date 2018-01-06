clear screen

archive log list;

SELECT name, VALUE description
  FROM v$parameter
 WHERE name IN ('log_archive_dest', 'log_archive_dest_1');
 
prompt alter database archivelog;
prompt alter system set log_archive_dest='/archivelog/oradata/fast_recovery_area/apxdev/' scope=both;
prompt alter system set log_archive_dest_1='LOCATION=/archivelog/oradata/fast_recovery_area/apxdev/' scope=both;
prompt alter system set log_archive_dest_1='LOCATION=USE_DB_RECOVERY_FILE_DEST' scope=both;

set numwidth 18
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

select name, first_time, first_change# from 
(select * from v$archived_log order by first_time desc)
where rownum<2;
