rman << EOF
connect target
CONFIGURE CHANNEL DEVICE TYPE 'SBT_TAPE'  PARMS 'BLKSIZE=1048576, SBT_LIBRARY=${ORACLE_HOME}/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_sv03_lsu1, BACKUP_HOST=BSWSVDD03.BHCS.PVT, ORACLE_HOME=${ORACLE_HOME})';
EOF
