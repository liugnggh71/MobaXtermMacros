sqlplus /nolog << EOS
connect / as sysdba
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';
set sqlprompt "_user '@' _connect_identifier > "
SELECT DISTINCT start_time, completion_time, media, comments
  FROM v\$backup_piece
 WHERE start_time IN (SELECT MAX (start_time)
                        FROM v\$backup_piece
                       WHERE SYSDATE - completion_time < 3);
EXIT
EOS
