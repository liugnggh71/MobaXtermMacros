set pagesize 25
set linesize 100
column UNXPSTEALCNT heading "# Unexpired|Stolen"
column EXPSTEALCNT heading "# Expired|Reused"
column SSOLDERRCNT heading "ORA-1555|Error"
column NOSPACEERRCNT heading "Out-Of-space|Error"
column MAXQUERYLEN heading "Max Query|Length"
select inst_id, to_char(begin_time,'MM/DD/YYYY HH24:MI') begin_time,
UNXPSTEALCNT, EXPSTEALCNT , SSOLDERRCNT, NOSPACEERRCNT, MAXQUERYLEN, TUNED_UNDORETENTION
from gv$undostat
order by inst_id, begin_time;
