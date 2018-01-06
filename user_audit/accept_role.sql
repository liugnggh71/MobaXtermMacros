set pagesize 100

SELECT * FROM dba_roles ORDER BY role;

UNDEFINE ROLE

accept ROLE char prompt 'Enter Role: '
