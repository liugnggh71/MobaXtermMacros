SET LINESIZE 400
COLUMN ADDITIONAL_INFO FORMAT A70

SELECT l.log_id,
         l.log_date,
         L.operation,
         L.STATUS,
         R.REQ_START_DATE "Required_Start_Date",
         R.ACTUAL_START_DATE,
         R.RUN_DURATION,
         TO_CHAR (R.CPU_USED),
         R.ADDITIONAL_INFO
    FROM DBA_SCHEDULER_JOB_LOG L, DBA_SCHEDULER_JOB_RUN_DETAILS R
   WHERE     l.Owner = 'SYSTEM'
         AND l.job_name = 'DB_BCK'
         AND l.log_id = r.log_id(+)
         AND SYSDATE < L.log_date + 10
ORDER BY 1 DESC;
