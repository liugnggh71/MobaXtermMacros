clear screen

set long 4000
var impdp_schemas_sysdba_var CLOB;
var impdp_schemas_sys_cc_var CLOB;
DECLARE
    v_imp   VARCHAR2 (4000)
                := q'#schemas_impdp.par
USERID='SYSdbaUSRpwd as sysdba'
DUMPFILE="compressed_table_list_%U.dmp"
LOGFILE="schemas_list_imp.log"
DIRECTORY=MY_DATA_PUMP_DIR
JOB_NAME='schemas_list_imp'
TABLE_EXISTS_ACTION=SKIP
SKIP_UNUSABLE_INDEXES=Y
PARALLEL=10
CONTENT=ALL
SCHEMAS=&SCHEMAS
PARTITION_OPTIONS=NONE#';
BEGIN
    :impdp_schemas_sysdba_var :=  replace(v_imp, 'SYSdbaUSRpwd', '&SYSDBA');
    :impdp_schemas_sys_cc_var :=  replace(v_imp, 'SYSdbaUSRpwd', '&SYSCC');
END;
/

print impdp_schemas_sysdba_var
print impdp_schemas_sys_cc_var
