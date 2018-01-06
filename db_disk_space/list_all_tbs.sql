clear screen

SET LINESIZE 132
COMPUTE SUM LABEL 'TOTAL' OF free_mb ON REPORT
COMPUTE SUM LABEL 'TOTAL' OF file_mb ON REPORT
COMPUTE SUM LABEL 'TOTAL' OF used_mb ON REPORT
BREAK ON REPORT

COLUMN free_mb FORMAT 999,999,999,999.99
COLUMN file_mb FORMAT 999,999,999,999.99
COLUMN used_mb FORMAT 999,999,999,999.99

SELECT tablespace_name,
       NVL (free_mb, 0)                            free_mb,
       file_mb,
       NVL (used_mb, file_mb)                      used_mb,
       ROUND (NVL (free_mb, 0) / file_mb * 100, 2) free_pct
  FROM (SELECT b.tablespace_name,
               ROUND (free_mb)           free_mb,
               ROUND (file_mb)           file_mb,
               ROUND (file_mb - free_mb) used_mb
          FROM (  SELECT tablespace_name, SUM (bytes) / 1024 / 1024 free_mb
                    FROM dba_free_space
                GROUP BY tablespace_name) a,
               (  SELECT tablespace_name, SUM (bytes) / 1024 / 1024 file_mb
                    FROM dba_data_files
                GROUP BY tablespace_name) b
         WHERE a.tablespace_name(+) = b.tablespace_name);
         