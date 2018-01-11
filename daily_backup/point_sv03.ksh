rman <<EOR
connect target
sql 'begin DBMS_BACKUP_RESTORE.resetconfig; end;';
CONFIGURE RETENTION POLICY TO RECOVERY WINDOW OF 35 DAYS;
CONFIGURE DEFAULT DEVICE TYPE TO 'SBT_TAPE';
CONFIGURE CONTROLFILE AUTOBACKUP ON;
CONFIGURE ARCHIVELOG DELETION POLICY TO BACKED UP 2 TIMES TO 'SBT_TAPE';
CONFIGURE DEVICE TYPE 'SBT_TAPE' PARALLELISM 1 BACKUP TYPE TO BACKUPSET;
exit
EOR
# /u01/app/oracle/general/ddb2_sv.sh
rman << EOF
connect target
CONFIGURE CHANNEL DEVICE TYPE 'SBT_TAPE'  PARMS 'BLKSIZE=1048576, SBT_LIBRARY=${ORACLE_HOME}/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_sv03_lsu1, BACKUP_HOST=BSWSVDD03.BHCS.PVT, ORACLE_HOME=${ORACLE_HOME})';
EOF
rman << EOC
connect target
backup current controlfile;
exit
EOC
sqlplus /nolog << EOS
connect / as sysdba
alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';
set sqlprompt "_user '@' _connect_identifier > "
SELECT DISTINCT start_time, completion_time, media, comments
  FROM v\$backup_piece
   WHERE start_time IN (SELECT MAX (start_time)
                           FROM v\$backup_piece
                     WHERE SYSDATE - completion_time < 3);
EXIT
EOS
