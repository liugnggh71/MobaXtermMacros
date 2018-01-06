drop table dbsnmp.refering_tables_to_the_set;

CREATE TABLE dbsnmp.refering_tables_to_the_set
AS
      SELECT DISTINCT owner, table_name
        FROM dba_constraints
       WHERE (r_owner, r_constraint_name) IN
                 (SELECT owner, constraint_name
                    FROM dba_constraints
                   WHERE (owner, table_name) IN (SELECT owner, table_name
                                                   FROM DBSNMP.EXP_IMP_TABLES))
    ORDER BY 1, 2;
    
select * from dbsnmp.refering_tables_to_the_set;

select * from dbsnmp.refering_tables_to_the_set
minus
select * from dbsnmp.exp_imp_tables;
