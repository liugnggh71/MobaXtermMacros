rman << EOF
connect target
RUN {
  allocate channel C1 device type SBT_TAPE parms
     'SBT_LIBRARY=${ORACLE_HOME}/lib/libddobk.so,
      SBT_PARMS=(ORACLE_HOME=${ORACLE_HOME})';
  send 'set username USERNAME password PASSWORD servername BSWMSDD03.BHCS.PVT';
  send 'set username USERNAME password PASSWORD servername BSWSVDD03.BHCS.PVT';
  RELEASE CHANNEL C1;
}
EOF
