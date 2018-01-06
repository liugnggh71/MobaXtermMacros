SELECT owner, COUNT (1) table_count
    FROM dba_tables
   WHERE owner IN ('HR',
                   'OE',
                   'PM',
                   'IX',
                   'SH')
  GROUP BY owner
 ORDER BY owner;
