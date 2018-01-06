set pagesize 100

SELECT a.TABLESPACE_NAME, b.user_count
    FROM (  SELECT tablespace_name
              FROM dba_tablespaces
          ORDER BY tablespace_name) a,
         (  SELECT default_tablespace, COUNT (1) user_count
              FROM dba_users
          GROUP BY default_tablespace) b
   WHERE a.tablespace_name = b.default_tablespace(+)
  ORDER BY user_count DESC, tablespace_name;

UNDEFINE default_tablespace

accept default_tablespace char prompt 'Enter Default Tablespace: '
