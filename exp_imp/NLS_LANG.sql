clear screen

column NLS_LANG_DEFINE new_value NLS_LANG_DEFINE
SELECT    'NLS_LANG='
       || A.NLS_LANGUAGE
       || '_'
       || B.NLS_TERRITORY
       || '.'
       || C.NLS_CHARACTERSET
           NLS_LANG_DEFINE
  FROM (SELECT VALUE NLS_LANGUAGE
          FROM V$NLS_PARAMETERS
         WHERE parameter = 'NLS_LANGUAGE') a,
       (SELECT VALUE NLS_TERRITORY
          FROM V$NLS_PARAMETERS
         WHERE parameter = 'NLS_TERRITORY') b,
       (SELECT VALUE NLS_CHARACTERSET
          FROM V$NLS_PARAMETERS
         WHERE parameter = 'NLS_CHARACTERSET') c;

prompt export &NLS_LANG_DEFINE
prompt set &NLS_LANG_DEFINE
