set pagesize 1000
SELECT owner || '.' || table_name exp_imp_table
    FROM DBSNMP.EXP_IMP_TABLES
 ORDER BY exp_imp_table;
 