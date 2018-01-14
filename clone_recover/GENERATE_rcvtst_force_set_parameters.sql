COLUMN set_code FORMAT A132
SET LINESIZE 132
SELECT 'alter system set ' || name || '=''' || VALUE || ''' scope=spfile;' set_code
    FROM v$parameter
   WHERE name IN ('undo_tablespace', 'db_name', 'compatible')
union all
SELECT 'alter system set ' || name || '=''' || NVL(DISPLAY_VALUE, '1000G') || ''' scope=spfile;' set_code
    FROM v$parameter
   WHERE name IN ('db_recovery_file_dest_size')
union all
SELECT 'alter system set ' || name || '=''' || NVL(DISPLAY_VALUE, '/find/a/place') || ''' scope=spfile;' set_code
    FROM v$parameter
   WHERE name IN ('db_recovery_file_dest');
