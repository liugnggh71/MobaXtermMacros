SET LINESIZE 300

SELECT    'alter tablespace '
       || t.tablespace_name
       || ' add datafile '''
       || '&NEW_FILE_DIR'
       || t.tablespace_name
       || '_'
       || TRIM (TO_CHAR (d.l, '009'))
       || '.dbf'' SIZE 100M AUTOEXTEND ON NEXT 1M MAXSIZE UNLIMITED;'
           statement
  FROM (    SELECT LEVEL - 1 l
              FROM DUAL
        CONNECT BY LEVEL <= 1000) d,
       (  SELECT tablespace_name,
                 CEIL (SUM (bytes) / 1024 / 1024 / 1024 / 30) FILES
            FROM dba_data_files
        GROUP BY tablespace_name
          HAVING CEIL (SUM (bytes) / 1024 / 1024 / 1024 / 30) > 1) t
 WHERE d.l BETWEEN 2 AND t.FILES

SELECT 'alter tablespace ' || t.tablespace_name || ' add datafile;' statement
  FROM (    SELECT LEVEL - 1 l
              FROM DUAL
        CONNECT BY LEVEL <= 1000) d,
       (  SELECT tablespace_name,
                 CEIL (SUM (bytes) / 1024 / 1024 / 1024 / 30) FILES
            FROM dba_data_files@irvrad_prddb1_v500
        GROUP BY tablespace_name
          HAVING CEIL (SUM (bytes) / 1024 / 1024 / 1024 / 30) > 1) t
 WHERE d.l BETWEEN 2 AND t.FILES;
