host mkdir /u01/app/oracle/tmp_diag 
alter system set diagnostic_dest='/u01/app/oracle/tmp_diag' scope=both;
select value from v$parameter where name='diagnostic_dest';
