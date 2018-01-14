-- run {
-- allocate channel c1 TYPE 'SBT_TAPE'  PARMS 'BLKSIZE=1048576, SBT_LIBRARY=/u01/app/oracle/product/11.2.0.3/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_ms02_lsu1, BACKUP_HOST=BHDAMSDD02.BHCS.PVT, ORACLE_HOME=/u01/app/oracle/product/11.2.0.3)';
-- restore archivelog  from time="to_date('2017-11-19 02:08:49','YYYY-MM-DD HH24:MI:SS')"; 
-- }

COLUMN ARCHIVE_START_TIME NEW_VALUE ARCHIVE_START_TIME

SELECT TO_CHAR (MIN (start_time), 'YYYY-MM-DD HH24:MI:SS') ARCHIVE_START_TIME
  FROM v$backup_piece
 WHERE tag = '&restore_backupset_tag';
 
DEFINE ARCHIVE_START_TIME 

set heading off feedback off echo off verify off

-- ####################################################
-- ### Formal code
-- ####################################################
-- run {
-- # allocate channel c1 TYPE 'SBT_TAPE'  PARMS 'BLKSIZE=1048576, SBT_LIBRARY=/u01/app/oracle/product/11.2.0.4/dbhome_2/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_ms02_lsu1, BACKUP_HOST=BHDAMSDD02.BHCS.PVT, ORACLE_HOME=/u01/app/oracle/product/11.2.0.4/dbhome_2)';
-- restore archivelog  from time="to_date('&ARCHIVE_START_TIME','YYYY-MM-DD HH24:MI:SS')"; 
-- }
