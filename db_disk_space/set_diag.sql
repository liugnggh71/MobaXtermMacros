host mkdir /u01/app/oracle 
alter system set diagnostic_dest='/u01/app/oracle' scope=both;
select value from v$parameter where name='diagnostic_dest';
