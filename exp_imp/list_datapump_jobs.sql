clear screen

set linesize 200
column OWNER_NAME format A15
column job_name format A25
column OPERATION FORMAT A20
column JOB_MODE FORMAT A15
SELECT * FROM dba_datapump_jobs;

set linesize 200

column OWNER_NAME format A15
column job_name format A25
column OPERATION FORMAT A20
column JOB_MODE FORMAT A15
column STATE FORMAT A15

SELECT * FROM v$datapump_job;
