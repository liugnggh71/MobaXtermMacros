var oracle_home varchar2(4000);
exec SYS.dbms_system.get_env('ORACLE_HOME', :oracle_home);
print oracle_home
column oracle_home new_value oracle_home
select :oracle_home oracle_home from dual;
define oracle_home
