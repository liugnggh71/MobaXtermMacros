clear screen

column host_name new_value host_name
column instance_name new_value instance_name
select host_name, instance_name from v$instance;

column service_name new_value service_name
select value service_name from v$parameter where name='service_names';

set long 4000
var TNS_SID clob;
var TNS_SERVICE clob;
DECLARE
    v_service   VARCHAR2 (4000)
                := q'#&host_name._&instance_name. =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = &host_name.)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVICE_NAME = &service_name.)
    )
  )#';

    v_sid  VARCHAR2 (4000)
                := q'#&host_name._&instance_name. =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = &host_name.)(PORT = 1521))
    )
    (CONNECT_DATA =
        (SERVER = DEDICATED)
        (SID = &instance_name.)
    )
  )#';
BEGIN
    :TNS_SID :=  v_sid;
    :TNS_SERVICE :=  v_service;
END;
/

print TNS_SID
print TNS_SERVICE
