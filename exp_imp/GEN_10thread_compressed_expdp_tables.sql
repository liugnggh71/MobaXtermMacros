clear screen

set long 4000
var exp_sysdba_var clob;
var exp_sys_cc_var clob;
DECLARE
    v_tab_list   VARCHAR2 (4000);
    v_loop_count NUMBER := 1;
    v_exp   VARCHAR2 (4000)
                := q'#compressed_table_list.par
USERID='SYSdbaUSRpwd as sysdba'
DUMPFILE="compressed_table_list_%U.dmp"
LOGFILE="compressed_table_list.log"
DIRECTORY=MY_DATA_PUMP_DIR
JOB_NAME='compressed_table_list'
COMPRESSION=ALL
PARALLEL=10
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
    :exp_sysdba_var :=  replace(replace(v_exp, 'SYSdbaUSRpwd', '&SYSDBA'), 'TaBlE_LiSt', v_tab_list);
    :exp_sys_cc_var :=  replace(v_exp, 'SYSdbaUSRpwd', '&SYSCC');
END;
/

print exp_sysdba_var
print exp_sys_cc_var

select * from dba_directories where directory_name='MY_DATA_PUMP_DIR';
