select force_logging from v$database; 
           
PROMPT ALTER DATABASE NO FORCE LOGGING;;
PROMPT ALTER DATABASE FORCE LOGGING;;

SELECT name, VALUE
  FROM v$parameter
 WHERE name IN
           ('db_block_checking', 'db_block_checksum', 'db_lost_write_protect');

PROMPT ALTER SYSTEM SET db_block_checking='OFF' SCOPE=BOTH;;
PROMPT ALTER SYSTEM SET db_block_checking='LOW' SCOPE=BOTH;;
PROMPT ALTER SYSTEM SET db_block_checking='MEDIUM' SCOPE=BOTH;;
PROMPT ALTER SYSTEM SET db_block_checking='FULL' SCOPE=BOTH;;

PROMPT ALTER SYSTEM SET db_block_checksum='OFF' SCOPE=BOTH;;
PROMPT ALTER SYSTEM SET db_block_checksum='TYPICAL' SCOPE=BOTH;;
PROMPT ALTER SYSTEM SET db_block_checksum='FULL' SCOPE=BOTH;;

PROMPT ALTER SYSTEM SET db_lost_write_protect='NONE' SCOPE=BOTH;;
PROMPT ALTER SYSTEM SET db_lost_write_protect='TYPICAL' SCOPE=BOTH;;
PROMPT ALTER SYSTEM SET db_lost_write_protect='FULL' SCOPE=BOTH;;
