set linesize 2000 

column OWNER_NAME format A15
column job_name format A25
column OPERATION FORMAT A20
column JOB_MODE FORMAT A15

SELECT * FROM dba_datapump_jobs;

SELECT * FROM v$datapump_job;

SELECT b.username,
         a.sid,
         b.opname,
         b.target,
         ROUND (b.SOFAR * 100 / b.TOTALWORK, 0) || '%' AS "%DONE",
         TO_CHAR (b.start_time, 'YYYY/MM/DD HH24:MI:SS') start_time,
         b.TIME_REMAINING
    FROM v$session_longops b, v$session a
   WHERE a.sid = b.sid and TIME_REMAINING>0
  ORDER BY 6;

SELECT sl.sid,
       sl.serial#,
       sl.sofar,
       sl.totalwork,
       dp.owner_name,
       dp.state,
       dp.job_mode
  FROM v$session_longops sl, v$datapump_job dp
 WHERE sl.opname = dp.job_name AND sl.sofar != sl.totalwork;
 
COLUMN SQL_TEXT FORMAT A150
 
SELECT x.job_name,
       b.state,
       b.job_mode,
       b.degree,
       x.owner_name,
       z.sql_text,
       p.MESSAGE,
       p.totalwork,
       p.sofar,
       ROUND ( (p.sofar / p.totalwork) * 100, 2) done,
       p.time_remaining,
	   y.sid,
	   y.serial#
  FROM dba_datapump_jobs  b
       LEFT JOIN dba_datapump_sessions x ON (x.job_name = b.job_name)
       LEFT JOIN v$session y ON (y.saddr = x.saddr)
       LEFT JOIN v$sql z ON (y.sql_id = z.sql_id)
       LEFT JOIN v$session_longops p ON (p.sql_id = y.sql_id)
 WHERE y.module = 'Data Pump Worker' AND p.time_remaining > 0;
 