clear screen

SET LONG 20000 LONGCHUNKSIZE 20000 PAGESIZE 0 LINESIZE 1000 FEEDBACK OFF VERIFY OFF TRIMSPOOL ON

column outfile new_value outfile noprint
SELECT    SUBSTR (host_name,
                  1,
                  INSTR (host_name || '.',
                         '.',
                         1,
                         1))
       || '_'
       || instance_name
       || '_'
       || '&username'
       || '_'
       || TO_CHAR (SYSDATE, 'yyyymmddhh24miss')
           outfile
  FROM v$instance;

define outfile

host mkdir user_definition

spool user_definition/&&outfile..gen
 
BEGIN
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);
END;
/
 
SELECT dbms_metadata.get_ddl('USER',upper('&&username')) FROM dual;
SELECT DBMS_METADATA.GET_GRANTED_DDL('SYSTEM_GRANT',upper('&&username')) from dual;
SELECT DBMS_METADATA.GET_GRANTED_DDL('ROLE_GRANT','upper('&&username')) from dual;
SELECT DBMS_METADATA.GET_GRANTED_DDL('OBJECT_GRANT',upper('&&username')) from dual;

spool off
