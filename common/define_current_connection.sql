column host_name new_value host_name
column instance_name new_value instance_name

select host_name, instance_name from v$instance;

conn dbinv/Ora_cle1@cmparch:1521/dbadmin

define host_name
define instance_name
column ora_instance_id new_value picked_instance
select ora_instance_id from ora_host_instance where upper(dns_host_name)=upper('&host_name') and upper(instance_name)=upper('&instance_name');

define picked_instance
define ora_instance_id
@@define_connections.sql
