CONNECT / as sysdba

SET FEEDBACK OFF
SET HEADING OFF
SET LINESIZE 32000
SET LONG 32000
SET LONGCHUNKSIZE 32000
SET PAGESIZE 0
SET SPACE 0
SET TERMOUT OFF
SET TRIMSPOOL ON
SET VERIFY OFF

DEFINE part_count=&1
-- ACCEPT part_count NUMBER PROMPT 'Enter backup part counts: '

spool multi_day_db_bck.rman
prompt SET ECHO ON
WITH backup_file_list
     AS (SELECT file#
           FROM v$datafile
          WHERE MOD (file#, &part_count) =
                    MOD (
                        FLOOR (
                            SYSDATE - TO_DATE ('2000-01-01', 'YYYY-MM-DD')),
                        &part_count))
SELECT    'backup filesperset 1 datafile '
       || LISTAGG (file#, ',') WITHIN GROUP (ORDER BY file#)
       || ' plus archivelog delete input;'
           partial_backup_command
  FROM backup_file_list;
prompt backup spfile;;
prompt crosscheck archivelog all;;
prompt delete force noprompt expired archivelog all;;
prompt delete noprompt obsolete;;
prompt delete force noprompt backup completed before "sysdate-45";;

spool off
exit
