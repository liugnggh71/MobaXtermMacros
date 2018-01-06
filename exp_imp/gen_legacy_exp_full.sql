clear screen

set long 32767

COLUMN db_name NEW_VALUE db_name

SELECT LOWER (VALUE) db_name
  FROM v$parameter
 WHERE name = 'db_name';

SET SQLBLANKLINES ON

var export_legacy_sysdba_var varchar2(4000);
DECLARE
    v_files   VARCHAR2 (4000) :='000.DMP';
    v_exp   VARCHAR2 (4000)
                := 'set NLS_LANG, find big dir
nohup exp parfile=export_legacy_full.par > exp_&db_name.log 2>~1 ~                
export_legacy_full.par
USERID="SYSdbaUSRpwd as sysdba"
FILE=f01.dmp
LOG=exp_full.log
FILESIZE=10G
feedback=1000000
FULL=Y
DIRECT=Y
';
BEGIN
    FOR Lcntr IN 1..100
    LOOP
      v_files := v_files || ',' ||TRIM(TO_CHAR(Lcntr,'009'))|| '.DMP';
    END LOOP;
    v_exp :=  replace(v_exp, 'f01.dmp', v_files);
    :export_legacy_sysdba_var :=  replace(replace(v_exp, 'SYSdbaUSRpwd', '&SYSDBA'), '~', chr(38));
END;
/

print export_legacy_sysdba_var 
