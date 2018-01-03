prompt ######################################################################
prompt Define connection information for Oracle database using DBINV
prompt ######################################################################

set sqlprompt "_user '@' _connect_identifier > "

UNDEFINE hostname
UNDEFINE service_name
UNDEFINE syscc
UNDEFINE rocc
UNDEFINE dbsnmp
UNDEFINE sysdba
UNDEFINE system
column hostname new_value hostname
column service_name new_value service_name
column hostname format A15
column service_name format A30
column connect_ports format A6
column sys_password format A30
column system_password format A30
column sys_username format A15
column system_username format A30

column system_username new_value system_username
column system_password new_value system_password

SELECT h.DNS_HOST_NAME hostname,
       h.SERVICE_NAME service_name,
       connect_ports,
       H.sys_password,
       h.SYS_USERNAME,
       h.SYSTEM_PASSWORD,
       H.SYSTEM_USERNAME
  FROM ora_host_instance h
 WHERE ORA_INSTANCE_ID=&picked_instance;

column first_port new_value first_port

select trim(nvl(substr(connect_ports,1, instr(connect_ports,',')-1), connect_ports)) first_port 
 FROM ora_host_instance h
 WHERE ORA_INSTANCE_ID=&picked_instance;

column connect_string new_value connect_string
select '&hostname:&first_port/&service_name' connect_string from dual;

column syscc new_value syscc
column rocc new_value rocc
column dbsnmp new_value dbsnmp
select 'sys_cc/M2ryhadal2mb**@&connect_string' syscc from dual;
select 'ro_cc/H0tsummerd2y**@&connect_string' rocc from dual;
select 'dbsnmp/uC52tdnsSFG6H!@&connect_string' dbsnmp from dual;

column sysdba new_value sysdba
column system new_value system
select  SYS_USERNAME || '/' || sys_password || '@&connect_string'   sysdba 
  from ora_host_instance where ORA_INSTANCE_ID=&picked_instance;
select  SYSTEM_USERNAME || '/' || system_password || '@&connect_string'  system 
  from ora_host_instance where ORA_INSTANCE_ID=&picked_instance;

define instance_list_filter
define hostname
define service_name
define dbsnmp
define syscc
define rocc
define sysdba
define system
