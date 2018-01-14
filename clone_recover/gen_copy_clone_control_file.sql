prompt connect target sys/asdf@target_host:1521:sid
prompt connect auxiliary sys/asdf@aux_host:1521:sid
prompt run
prompt {
prompt #   set until scn 2309242958785;
prompt    sql clone "alter system set  db_name = ''IDMPRD'' comment= ''Modified by RMAN duplicate'' scope=spfile";
prompt    sql clone "alter system set  db_unique_name = ''IDMDEV'' comment= ''Modified by RMAN duplicate'' scope=spfile";
prompt    shutdown clone immediate;
prompt    startup clone force nomount
prompt    allocate channel c1 TYPE 'SBT_TAPE' PARMS 'BLKSIZE=1048576, SBT_LIBRARY=/u01/app/oracle/product/11.2.0.3/prod/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_ms02_lsu1, BACKUP_HOST=BHDAMSDD02.BHCS.PVT, ORACLE_HOME=/u01/app/oracle/product/11.2.0.3/prod)';
prompt    allocate auxiliary channel a1 TYPE 'SBT_TAPE'  PARMS 'BLKSIZE=1048576, SBT_LIBRARY=/u01/app/oracle/product/11.2.0.3/lib/libddobk.so, SBT_PARMS=(STORAGE_UNIT=oracle_ms02_lsu1, BACKUP_HOST=BHDAMSDD02.BHCS.PVT, ORACLE_HOME=/u01/app/oracle/product/11.2.0.3)';
prompt    backup current controlfile;
prompt    restore clone primary controlfile;
prompt    alter clone database mount;
prompt }
