COLUMN v_block_size NEW_VALUE v_block_size

SELECT VALUE v_block_size
  FROM v$parameter
 WHERE name = 'db_block_size';

  SELECT TO_CHAR (TO_DATE (rtime, 'MM/DD/YYYY HH24:MI:SS'),
                  'YYYY/MM/DD HH24:MI')
             rtime,
         ROUND (
             SUM (tablespace_usedsize) / 1024 / 1024 * &&v_block_size / 1024,
             2)
             used_gb,
         ROUND (SUM (tablespace_size) / 1024 / 1024 * &&v_block_size / 1024, 2)
             allocated_gb
    FROM DBA_HIST_TBSPC_SPACE_USAGE
GROUP BY rtime
ORDER BY 1 DESC;

  SELECT TO_CHAR (TO_DATE (rtime, 'MM/DD/YYYY HH24:MI:SS'),
                  'YYYY/MM/DD HH24:MI')
             rtime,
         ROUND (
             SUM (tablespace_usedsize) / 1024 / 1024 * &&v_block_size / 1024,
             2)
             used_gb,
         ROUND (SUM (tablespace_size) / 1024 / 1024 * &&v_block_size / 1024, 2)
             allocated_gb
    FROM DBA_HIST_TBSPC_SPACE_USAGE
   WHERE   TO_DATE (rtime, 'MM/DD/YYYY HH24:MI:SS')
         - TRUNC (TO_DATE (rtime, 'MM/DD/YYYY HH24:MI:SS')) < 1 / 48
GROUP BY rtime
ORDER BY 1 DESC;
