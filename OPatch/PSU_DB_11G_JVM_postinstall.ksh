# cd $ORACLE_HOME/sqlpatch/${PATCH_ID}
# sqlplus / as sysdba
# startup upgrade
# @postinstall.sql
# @?/rdbms/admin/utlrp.sql
# shutdown
# startup
