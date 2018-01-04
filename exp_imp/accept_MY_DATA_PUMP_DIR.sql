column db_name new_value db_name
select value  db_name from v$parameter where name='db_name';
set verify on

accept MY_DATA_PUMP_DIR char default '/archivelog/dpdump/&&db_name/' prompt 'Enter New dump dir: '
