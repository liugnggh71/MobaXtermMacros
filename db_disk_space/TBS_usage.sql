COLUMN value NEW_VALUE dbblocksz NOPRINT

SELECT VALUE
  FROM v$parameter
 WHERE name = 'db_block_size';

COLUMN used_mb FORMAT 999,999,999.99
COLUMN tablespace_mb FORMAT 999,999,999.99
COLUMN used_percent FORMAT 990.99

  SELECT tablespace_name,
         (used_space * &dbblocksz) / (1024 * 1024)    used_mb,
         (tablespace_size * &dbblocksz) / (1024 * 1024) tablespace_mb,
         used_percent
    FROM dba_tablespace_usage_metrics
ORDER BY used_percent DESC;
