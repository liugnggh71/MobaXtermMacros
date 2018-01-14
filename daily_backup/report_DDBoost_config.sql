CLEAR SCREEN

SELECT DISTINCT start_time, completion_time, media, comments
  FROM v$backup_piece
   WHERE start_time IN (SELECT MAX (start_time)
                           FROM v$backup_piece
                     WHERE SYSDATE - completion_time < 3);

COLUMN BCK_GB FORMAT 999,999,999.00
COLUMN back_piece_count FORMAT 999,999,999
column max_minutes format 999,999.00
  SELECT media,
         comments,
         COUNT (1)                                       back_piece_count,
         MAX (completion_time - start_time) * 24 * 60  max_minutes,
         TO_CHAR (MAX (start_time), 'YYYY-MM-DD HH24:MI:SS')
             lastest_backup_time,
         TO_CHAR (MIN (start_time), 'YYYY-MM-DD HH24:MI:SS')
             earlist_backup_time,
         SUM (BYTES) / 1024 / 1024 / 1024                BCK_GB
    FROM v$backup_piece
   WHERE SYSDATE - start_time < 45
GROUP BY media, comments;
SET NUMFORMAT ""
