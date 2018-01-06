#!/bin/sh
# startup_all_db_loop.ksh

export PATH=/usr/local/bin:$PATH

set -A InstanceArray cpo cpoemr CSCPSFT dbadmin dwparch hpdev IARC IPRO pharmarc

for i in "${InstanceArray[@]}"
do

export ORACLE_SID=$i
export ORAENV_ASK=NO
. oraenv
sqlplus / as sysdba << EOF
set echo on
set sqlprompt "_date _user '@' _connect_identifier > "
startup
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
exit
EOF

done

lsnrctl start
