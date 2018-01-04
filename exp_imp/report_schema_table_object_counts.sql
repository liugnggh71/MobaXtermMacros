select owner, count(1) table_count from dba_tables group by owner;
select owner, count(1) object_count from dba_objects group by owner;
