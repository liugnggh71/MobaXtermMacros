COMPUTE SUM LABEL 'TOTAL' OF mb on report
BREAK ON REPORT

column MB format 999,999,999,999.99

select name, bytes/1024/1024 mb from v$datafile
union all
select name , bytes/1024/1024 mb from v$tempfile
union all
select member, l.bytes/1024/1024 mb from v$logfile f, v$log l where f.group#=l.group#;
