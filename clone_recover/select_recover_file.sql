set numwidth 18
SET linesize 132
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

column ERROR format A40

select * from v$recover_file;

select distinct change# from v$recover_file;
