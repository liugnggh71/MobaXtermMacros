rman << EOF
connect target
RUN {
  allocate channel C1 device type SBT_TAPE parms
     'SBT_LIBRARY=${ORACLE_HOME}/lib/libddobk.so,
      SBT_PARMS=(ORACLE_HOME=${ORACLE_HOME})';
  send 'set username ddboostninja password baylor01 servername BHDAMSDD02.BHCS.PVT';
  send 'set username ddboostninja password baylor01 servername BHDASVDD02.BHCS.PVT';
  RELEASE CHANNEL C1;
  backup current controlfile;
}
EOF
