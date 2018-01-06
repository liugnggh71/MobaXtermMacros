#!/bin/sh
# /u01/app/oracle/admin/general/scripts/shut_all_db_loop.sh
# Sample code variable escaped by back slash in code
#export PATH=/usr/local/bin:$PATH
#set -A InstanceArray cpo cpoemr CSCPSFT dbadmin dwparch hpdev IARC IPRO pharmarc
#
#for i in "${InstanceArray[@]}"
#do
#
#export ORACLE_SID=$i
#export ORAENV_ASK=NO
#. oraenv
#sqlplus / as sysdba << EOF
#set echo on
#ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
#set sqlprompt "_date _user '@' _connect_identifier > "
#shutdown immediate;
#exit
#EOF
#
#done
#
#lsnrctl stop

#!/bin/sh
# /u01/app/oracle/admin/general/scripts/start_all_db_loop.sh
#
#export PATH=/usr/local/bin:$PATH
#
#set -A InstanceArray cpo cpoemr CSCPSFT dbadmin dwparch hpdev IARC IPRO pharmarc
#
#for i in "${InstanceArray[@]}"
#do
#
#export ORACLE_SID=$i
#export ORAENV_ASK=NO
#. oraenv
#sqlplus / as sysdba << EOF
#set echo on
#set sqlprompt "_date _user '@' _connect_identifier > "
#startup
#ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
#exit
#EOF
#
#done
#
#lsnrctl start
