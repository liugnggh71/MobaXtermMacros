prompt Sample command:
prompt alter database rename file '/u02/oradata/idmprd/temp02.dbf' to '/u02/oradata/idmdev/temp02.dbf';

prompt ####################################################
prompt ### Formal code
prompt ####################################################
set heading off feedback off echo off verify off
SELECT    'alter database rename file '''
       || name
       || ''' to '''
       || REPLACE (name, '&CONVERT_FROM', '&CONVERT_TO')
       || ''';'
  FROM (SELECT name FROM v$tempfile
        UNION ALL
        SELECT MEMBER FROM v$logfile);
		