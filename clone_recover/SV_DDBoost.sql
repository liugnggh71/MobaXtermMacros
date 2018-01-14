var v_replace clob;

BEGIN
 :v_replace := q'[
CONFIGURE CHANNEL DEVICE TYPE 'SBT_TAPE'  PARMS 'BLKSIZE=1048576, SBT_LIBRARY=XXXX/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_sv02_lsu1, BACKUP_HOST=BHDASVDD02.BHCS.PVT, ORACLE_HOME=XXXX)';
allocate channel c1 TYPE 'SBT_TAPE' PARMS 'BLKSIZE=1048576, SBT_LIBRARY=XXXX/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_sv02_lsu1, BACKUP_HOST=BHDASVDD02.BHCS.PVT, ORACLE_HOME=XXXX)';
allocate auxiliary channel a1 TYPE 'SBT_TAPE'  PARMS 'BLKSIZE=1048576, SBT_LIBRARY=XXXX/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_sv02_lsu1, BACKUP_HOST=BHDASVDD02.BHCS.PVT, ORACLE_HOME=XXXX)';
     ]';
	 
  :v_replace :=replace(:v_replace, 'XXXX', '&ORACLE_HOME');
END;
/

set long 2000

print v_replace

column v_replace new_value v_replace
column v_replace format A2000
set linesize 2000
select :v_replace v_replace from dual;
define v_replace
