prompt reporting new exp imp tables ==========================
clear screen
prompt missing tables:

SELECT owner missing_owner, table_name missing_table_name
  FROM dbsnmp.exp_imp_tables
MINUS
SELECT owner, table_name FROM dba_tables;

COMPUTE SUM LABEL 'TOTAL' OF table_count on report
BREAK ON REPORT
SELECT t.owner, COUNT (1) table_count
    FROM DBSNMP.EXP_IMP_TABLES e, dba_tables t
   WHERE e.owner = t.OWNER AND e.TABLE_NAME = t.TABLE_NAME
  GROUP BY t.owner
 ORDER BY t.owner;

COMPUTE SUM LABEL 'TOTAL' OF index_count on report
BREAK ON REPORT
SELECT tablespace_name, COUNT (1) index_count
    FROM dba_indexes
   WHERE (table_owner, table_name) IN (SELECT *
                                         FROM DBSNMP.EXP_IMP_TABLES)
  GROUP BY tablespace_name
  ORDER BY tablespace_name;

COMPUTE SUM LABEL 'TOTAL' OF mb on report
BREAK ON REPORT
WITH s
     AS (SELECT *
           FROM dba_segments
          WHERE (owner, segment_name) IN (SELECT *
                                            FROM DBSNMP.EXP_IMP_TABLES))
  SELECT tablespace_name, ROUND (SUM (bytes) / 1024 / 1024) mb
    FROM s
GROUP BY tablespace_name
ORDER BY tablespace_name;
