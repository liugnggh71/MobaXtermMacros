COLUMN v_block_size NEW_VALUE v_block_size NOPRINT

SELECT VALUE v_block_size
  FROM v$parameter
 WHERE name = 'db_block_size';

COLUMN used_mb FORMAT 999,999,999.99
COLUMN tablespace_mb FORMAT 999,999,999.99
COLUMN used_percent FORMAT 990.99

SELECT tablespace_name,
         (used_space * &v_block_size) / (1024 * 1024)    used_mb,
         (tablespace_size * &v_block_size) / (1024 * 1024) tablespace_mb,
         used_percent
    FROM dba_tablespace_usage_metrics
 ORDER BY used_percent DESC;

SET NUMFORMAT "999,999,999,999.00"

set linesize 132

COMPUTE SUM LABEL 'total_file_gb' OF tbs_file_gb on report
COMPUTE SUM LABEL 'total_max_gb' OF tbs_max_gb on report
COMPUTE SUM LABEL 'total_allocated_gb' OF tbs_allocated_gb on report
BREAK ON REPORT

SELECT a.name,
                 SUM (b.file_size)* &v_block_size/1024/1024/1024 tbs_file_gb,
                 SUM (b.file_maxsize)* &v_block_size/1024/1024/1024 tbs_max_gb,
                 SUM (b.allocated_space)* &v_block_size/1024/1024/1024 tbs_allocated_gb,
                 ROUND (SUM (b.allocated_space) / SUM (b.file_maxsize) * 100)
                    pct_used
            FROM v$tablespace a, v$filespace_usage b
           WHERE     a.ts# = b.tablespace_id
                 AND a.included_in_database_backup = 'YES'
        GROUP BY a.name
        ORDER BY 5 DESC;
SET NUMFORMAT ""
