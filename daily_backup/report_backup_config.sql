CLEAR SCREEN

PROMPT ########### Backup report #############

ARCHIVE LOG LIST

SET NUMWIDTH 20

set linesize 252
column name format a30
column value format a40
column display_value format a40
column description format a50
column update_comment format a25

SELECT name,
         VALUE,
         DISPLAY_VALUE,
         description,
         update_comment
    FROM v$parameter
   WHERE name IN ('log_archive_dest',
                  'log_archive_dest_1',
                  'db_recovery_file_dest',
                  'db_recovery_file_dest_size',
                  'control_file_record_keep_time',
                  'db_create_file_dest',
                  'db_flashback_retention_target',
                  'undo_retention')
ORDER BY name;

SELECT b.STATUS, b.FILENAME, b.BYTES
  FROM V$BLOCK_CHANGE_TRACKING b;

set linesize 132
column name format a30
column value format a20
column description format a50

SELECT NAME, VALUE,description
    FROM v$parameter
   WHERE name IN
             ('db_block_checking', 'db_block_checksum', 'db_lost_write_protect')
ORDER BY NAME;

SELECT DBID, NAME, LOG_MODE, FORCE_LOGGING, FLASHBACK_ON FROM v$database;
