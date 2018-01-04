clear screen

set long 4000
var imp_tbl_full_sysdba_var clob;
var imp_tbl_full_sys_cc_var clob;
DECLARE
    v_imp   VARCHAR2 (4000)
                := q'#table_list_compressed_impdp_full.par
USERID='SYSdbaUSRpwd as sysdba'
DUMPFILE="compressed_table_list_%U.dmp"
LOGFILE="import_full_compressed_table_list.log"
DIRECTORY=MY_DATA_PUMP_DIR
JOB_NAME='full_imp_table_list'
TABLE_EXISTS_ACTION=SKIP
SKIP_UNUSABLE_INDEXES=Y
PARALLEL=10
CONTENT=ALL
PARTITION_OPTIONS=NONE
FULL=Y#';
BEGIN
    :imp_tbl_full_sysdba_var :=  replace(v_imp, 'SYSdbaUSRpwd', '&SYSDBA');
    :imp_tbl_full_sys_cc_var :=  replace(v_imp, 'SYSdbaUSRpwd', '&SYSCC');
END;
/

print imp_tbl_full_sysdba_var
print imp_tbl_full_sys_cc_var
