column owner new_value v_owner
column segment_name new_value v_segment_name

SELECT owner, segment_name, segment_type, block_id, blocks
   FROM   dba_extents
   WHERE
          file_id = &&v_file_no
   AND
          ( &&v_block_id BETWEEN block_id AND ( block_id + blocks ) );

select OWNER,TABLE_NAME, COLUMN_NAME, tablespace_name from dba_lobs where SEGMENT_NAME='&&v_segment_name';
