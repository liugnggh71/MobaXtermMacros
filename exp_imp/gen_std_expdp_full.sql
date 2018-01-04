clear screen

set long 4000
var exp_sysdba_var clob;
var exp_sys_cc_var clob;
DECLARE
    v_exp   VARCHAR2 (4000)
                := q'#expdp_full.par
USERID='SYSdbaUSRpwd as sysdba'
DUMPFILE="full_db_%U.dmp"
LOGFILE="expdp_full.log"
DIRECTORY=MY_DATA_PUMP_DIR
JOB_NAME='expdp_full'
CONTENT=ALL
FULL=Y#';
BEGIN
    :exp_sysdba_var :=  replace(v_exp, 'SYSdbaUSRpwd', '&SYSDBA');
    :exp_sys_cc_var :=  replace(v_exp, 'SYSdbaUSRpwd', '&SYSCC');
END;
/

print exp_sysdba_var
print exp_sys_cc_var
