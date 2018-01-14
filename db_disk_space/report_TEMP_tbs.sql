SELECT NAME FROM v$tempfile;

SET NUMFORMAT "999,999,999.00"

SELECT tablespace_name,
         SUM (bytes) / 1024 / 1024 / 1024  FILE_GB,
         SUM (MAXBYTES) / 1024 / 1024 / 1024 ALLOCATED_GB
    FROM dba_temp_files
 GROUP BY tablespace_name;
SET NUMFORMAT ""
