conn dbinv/Ora_cle1@cmparch:1521/dbadmin
UNDEFINE instance_list_filter
UNDEFINE picked_instance
accept instance_list_filter CHAR prompt 'Enter Instanct list filter: '
column host_instance format A50
set pagesize 50 linesize 100
SELECT h.ORA_INSTANCE_ID || '----' || h.host_instance_name host_instance
  FROM ora_host_instance h
 WHERE UPPER (host_instance_name) LIKE UPPER ('%&instance_list_filter%');
accept picked_instance CHAR prompt 'Enter instance id: '
@@define_connections.sql
