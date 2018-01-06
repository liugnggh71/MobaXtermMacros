prompt ==========================================
prompt Scott user schema checking ===============
prompt ==========================================

clear screen

prompt Scott table count 4

select count(1) table_count from dba_tables where owner='SCOTT';

prompt Scott table column count 18

select count(1) column_count from dba_tab_columns where owner='SCOTT';

prompt Scott object count 6

select count(1) object_count from dba_objects where owner='SCOTT';

prompt Scott constraint count 3

select count(1) constraint_count from dba_constraints where owner='SCOTT';

prompt Scott constraint column count 3

select count(1) cons_column_count from dba_cons_columns where owner='SCOTT';
