set numwidth 18
SET linesize 200
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

SELECT dh.FILE#,
       recover,
       fuzzy,
       creation_change#,
       creation_time,
       tablespace_name,
       dh.CHECKPOINT_TIME,
       dh.CHECKPOINT_CHANGE#,
       BYTES
  FROM V$DATAFILE_HEADER dh;

select * from v$temp_space_header;