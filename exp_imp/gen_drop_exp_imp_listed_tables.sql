SET PAGESIZE 1000

SELECT 'drop table ' || owner || '.' || table_name || ';' exp_imp_table
    FROM DBSNMP.EXP_IMP_TABLES
ORDER BY exp_imp_table;
