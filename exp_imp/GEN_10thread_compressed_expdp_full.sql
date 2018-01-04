clear screen

set long 4000
var exp_sysdba_var clob;
var exp_sys_cc_var clob;
DECLARE
    v_exp   VARCHAR2 (4000)
                := q'#compressed_expdp_full.par
USERID='SYSdbaUSRpwd as sysdba'
DUMPFILE="compressed_full_db_%U.dmp"
LOGFILE="compressed_expdp_full.log"
DIRECTORY=MY_DATA_PUMP_DIR
JOB_NAME='compressed_expdp_full'
COMPRESSION=ALL
PARALLEL=10
CONTENT=ALL
FULL=Y#';
BEGIN
    :exp_sysdba_var :=  replace(v_exp, 'SYSdbaUSRpwd', '&SYSDBA');
    :exp_sys_cc_var :=  replace(v_exp, 'SYSdbaUSRpwd', '&SYSCC');
END;
/

print exp_sysdba_var
print exp_sys_cc_var
