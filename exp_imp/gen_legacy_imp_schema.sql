clear screen

set long 32767

COLUMN db_name NEW_VALUE db_name

SELECT LOWER (VALUE) db_name
  FROM v$parameter
 WHERE name = 'db_name';

SET SQLBLANKLINES ON

var imp_schema_legacy_sysdba_var varchar2(4000);
DECLARE
    v_files   VARCHAR2 (4000) :='000.DMP;1';
    v_exp   VARCHAR2 (4000)
                := 'set NLS_LANG, find big dir
nohup imp parfile=import_legacy_full.par > exp_&db_name.log 2>~1 ~                
import_legacy_full.par
USERID="SYSdbaUSRpwd as sysdba"
FILE=f01.dmp
LOG=imp_full.log
commit=y
COMPILE=Y
CONSTRAINTS=Y
feedback=1000000
ignore=y
FULL=Y
GRANTS=Y
INDEXES=Y
RESUMABLE=y
RESUMABLE_NAME=schema_imp
RESUMABLE_TIMEOUT=1000000
STATISTICS=ALWAYS
fromuser=FIN
touser=FINCONV
';
BEGIN
    FOR Lcntr IN 1..100
    LOOP
      v_files := v_files || ',' ||TRIM(TO_CHAR(Lcntr,'009'))|| '.DMP;1';
    END LOOP;
    v_exp :=  replace(v_exp, 'f01.dmp', v_files);
    :imp_schema_legacy_sysdba_var :=  replace(replace(v_exp, 'SYSdbaUSRpwd', '&SYSDBA'), '~', chr(38));
END;
/

print imp_schema_legacy_sysdba_var 
