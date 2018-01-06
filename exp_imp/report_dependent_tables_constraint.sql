SELECT DISTINCT owner,
                  table_name,
                  CONSTRAINT_NAME,
                  STATUS
    FROM dba_constraints
  WHERE (r_owner, r_constraint_name) IN
             (SELECT owner, constraint_name
                FROM dba_constraints
               WHERE (owner, table_name) IN (SELECT owner, table_name
                                               FROM DBSNMP.EXP_IMP_TABLES))
 ORDER BY 1, 2;
