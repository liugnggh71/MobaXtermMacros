set numwidth 18

ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD HH24:MI:SS';

SELECT name,
       SEQUENCE#,
       FIRST_CHANGE#,
       first_time
  FROM v$archived_log
 WHERE SYSDATE - first_time < 10 order by FIRST_CHANGE#;