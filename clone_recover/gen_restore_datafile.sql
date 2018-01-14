prompt run
prompt {
prompt    set until scn  2309242958785;
prompt    sql clone 'alter database flashback off';
prompt    set newname for datafile  1 to "/u02/oradata/idmdev/system01.dbf";
prompt    set newname for datafile  2 to "/u02/oradata/idmdev/sysaux01.dbf";
prompt    set newname for datafile  3 to "/u02/oradata/idmdev/undotbs01.dbf";
prompt    set newname for datafile  4 to "/u02/oradata/idmdev/users01.dbf";
prompt    set newname for datafile  5 to "/u04/oradata/idmdev/identityiq_ts.dbf";
prompt    set newname for datafile  6 to "/u02/oradata/idmdev/undotbs02.dbf";
prompt    restore clone database
prompt    ;
prompt }

prompt ####################################################
prompt ### Formal code
prompt ####################################################
prompt run
prompt {
prompt    #set until scn  2309242958785;;
prompt # allocate channel c1 TYPE 'SBT_TAPE'  PARMS 'BLKSIZE=1048576, SBT_LIBRARY=/u01/app/oracle/product/11.2.0.4/dbhome_2/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_ms02_lsu1, BACKUP_HOST=BHDAMSDD02.BHCS.PVT, ORACLE_HOME=/u01/app/oracle/product/11.2.0.4/dbhome_2)';
set heading off feedback off echo off verify off
select 'set newname for datafile ' || file# || ' to "' || replace (name, '&CONVERT_FROM', '&CONVERT_TO') || '";' from v$datafile;
prompt restore database from tag="&restore_backupset_tag";;
prompt }