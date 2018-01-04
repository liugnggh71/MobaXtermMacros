clear screen

set long 4000
var exp_system_var clob;
DECLARE
    v_tab_list   VARCHAR2 (4000);
    v_loop_count NUMBER := 1;
    v_exp   VARCHAR2 (4000)
                := q'#remote_table_list.par
USERID='SYStemUSRpwd'
DUMPFILE="remote_table_list_%U.dmp"
LOGFILE="remote_table_list.log"
DIRECTORY=MY_DATA_PUMP_DIR
JOB_NAME='remote_table_list'
network_link=R_SYSTEM
CONTENT=ALL
TABLES=(TaBlE_LiSt)
REUSE_DUMPFILES=N#';
BEGIN
    FOR rec_exp_imp_table in (select * from DBSNMP.EXP_IMP_TABLES)
    LOOP
       IF v_loop_count > 1 THEN
          v_tab_list := v_tab_list || ',' || chr(10);
       END IF;    
       v_tab_list := v_tab_list || rec_exp_imp_table.OWNER || '.' ||  rec_exp_imp_table.TABLE_NAME; 
       v_loop_count := v_loop_count + 1;
    END LOOP;    
    :exp_system_var :=  replace(replace(v_exp, 'SYStemUSRpwd', '&SYSTEM'), 'TaBlE_LiSt', v_tab_list);
END;
/

print exp_system_var

select * from dba_directories where directory_name='MY_DATA_PUMP_DIR';
