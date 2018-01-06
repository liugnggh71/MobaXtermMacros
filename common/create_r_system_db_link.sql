DROP DATABASE LINK R_SYSTEM;
CREATE DATABASE LINK R_SYSTEM CONNECT TO &&r_system_username IDENTIFIED BY &&r_system_password USING '&&r_connect_string';
select host_name, instance_name from v$instance@r_system;
