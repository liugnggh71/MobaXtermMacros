set linesize 132

column FILE_PATH format a75

WITH db_files
     AS (SELECT name FROM v$datafile
         UNION ALL
         SELECT MEMBER name FROM v$logfile
         UNION ALL
         SELECT name FROM v$tempfile)
SELECT DISTINCT SUBSTR (name,
                        1,
                          LENGTH (name)
                        - REGEXP_INSTR (reverse (name),
                                        '[/\]',
                                        1,
                                        1)
                        + 1) file_path
  FROM db_files;
  
WITH db_files
     AS (SELECT name FROM v$controlfile
         )
SELECT DISTINCT SUBSTR (name,
                        1,
                          LENGTH (name)
                        - REGEXP_INSTR (reverse (name),
                                        '[/\]',
                                        1,
                                        1)
                        + 1) control_file_path
  FROM db_files;
  
SELECT SUBSTR (name,
                 1,
                 INSTR (name,
                        '/',
                        -1,
                        1))
            file_path,
         ROUND (SUM (bytes) / 1024 / 1024) MB
    FROM (SELECT name, bytes FROM v$datafile
          UNION ALL
          SELECT name, bytes FROM v$tempfile
          UNION ALL
          SELECT F.MEMBER name, l.bytes
            FROM v$logfile f, v$log l
           WHERE F.GROUP# = L.GROUP#)
GROUP BY SUBSTR (name,
                 1,
                 INSTR (name,
                        '/',
                        -1,
                        1));
                        