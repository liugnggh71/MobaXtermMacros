SELECT name, 'DATAFILE' TYPE,
         TO_CHAR (creation_time, 'YYYY-MM-DD HH24:MI:SS') creation_time,
         bytes / 1024 / 1024                            mb
    FROM v$datafile
   WHERE SYSDATE - creation_time < 7
 UNION ALL
SELECT name, 'TEMPFILE' TYPE,
         TO_CHAR (creation_time, 'YYYY-MM-DD HH24:MI:SS') creation_time,
         bytes / 1024 / 1024                            mb
    FROM v$tempfile
   WHERE SYSDATE - creation_time < 7
 ;
