set linesize 150
col username format a30
alter session set nls_date_format='dd-Mon-yyyy hh:mi:ss AM';
select * from all_users;

col sal format $999,99,999.99
set numformat "999,99,999.99"
set numwidth 15
col empno format 9999999
col mgr format 9999999

select * from scott.emp;
