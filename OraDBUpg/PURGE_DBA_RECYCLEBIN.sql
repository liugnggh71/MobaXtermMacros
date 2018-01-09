select count(1) row_count_before_purge from dba_recyclebin;
purge dba_recyclebin;
select count(1) row_count_after_purge from dba_recyclebin;

