/* Formatted on 11/29/2017 2:23:06 PM (QP5 v5.300) */
SET LINESIZE 1000

SELECT l.opname,
       l.START_TIME,
       l.LAST_UPDATE_TIME,
       l.time_remaining,
       l.ELAPSED_SECONDS,
       l.sofar,
       l.totalwork,
       l.units,
       l.MESSAGE
  FROM v$session_longops l
 WHERE time_remaining > 0 AND OPNAME LIKE 'RMAN%';
