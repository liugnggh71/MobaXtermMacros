SET LINESIZE 2000

WITH missing_file_list
     AS (SELECT file# FROM v$datafile
         MINUS
         SELECT DISTINCT file#
           FROM v$backup_datafile
          WHERE     (incremental_level = 0 OR incremental_level IS NULL)
                AND SYSDATE - completion_time < 7
         ORDER BY file#)
SELECT    'CONFIGURE CONTROLFILE AUTOBACKUP ON;'
       || CHR (10)
       || 'backup incremental level 0 filesperset 1 datafile '
       || LISTAGG (file#, ',') WITHIN GROUP (ORDER BY file#)
       || ' plus archivelog NOT BACKED UP;'
           backup_cmd
  FROM missing_file_list;

SET LINESIZE 132

