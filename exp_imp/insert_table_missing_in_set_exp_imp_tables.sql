insert into dbsnmp.exp_imp_tables 
select owner, table_name from 
(
select owner, table_name from dbsnmp.refering_tables_to_the_set
minus
select owner, table_name from dbsnmp.exp_imp_tables
);
commit;
