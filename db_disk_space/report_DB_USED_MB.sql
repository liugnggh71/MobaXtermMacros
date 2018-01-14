COLUMN v_block_size NEW_VALUE v_block_size

SELECT VALUE v_block_size
  FROM v$parameter
 WHERE name = 'db_block_size';

COLUMN used_mb FORMAT 999,999,999.99
COLUMN tablespace_mb FORMAT 999,999,999.99
COLUMN used_percent FORMAT 990.99

SELECT sum  (used_space * &&v_block_size) / (1024 * 1024)    used_mb, 
       sum  (TABLESPACE_SIZE * &&v_block_size) / (1024 * 1024)    tablespace_mb
   FROM dba_tablespace_usage_metrics
  ORDER BY used_percent DESC;

SELECT TO_CHAR (RTIME, 'YYYY/MM/DD HH24:MI:SS') RTIME, used_gb, allocated_gb
  FROM (  SELECT TO_DATE (rtime, 'MM/DD/YYYY HH24:MI:SS') rtime,
                 ROUND (
                       SUM (tablespace_usedsize)
                     / 1024
                     / 1024
                     * &&v_block_size
                     / 1024,
                     2)
                     used_gb,
                 ROUND (
                       SUM (tablespace_size)
                     / 1024
                     / 1024
                     * &&v_block_size
                     / 1024,
                     2)
                     allocated_gb
            FROM DBA_HIST_TBSPC_SPACE_USAGE
        GROUP BY rtime
        ORDER BY 1 DESC)
 WHERE ROWNUM < 2;
