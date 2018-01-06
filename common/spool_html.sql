prompt @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
prompt Spool to HTML
prompt @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
column spool_html_file new_value spool_html_file noprint
SELECT    SUBSTR (host_name,
                  1,
                  INSTR (host_name || '.',
                         '.',
                         1,
                         1))
       || '_'
       || instance_name
       || '_'
       || '&_user'
       || '_'
       || TO_CHAR (SYSDATE, 'yyyymmddhh24miss')
       || '.html'
           spool_html_file
  FROM v$instance;
define spool_html_file
set markup HTML ON
set termout off
set echo on
host mkdir html
spool html/&spool_html_file
