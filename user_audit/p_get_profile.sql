COLUMN PROFILE NEW_VALUE PROFILE

SELECT PROFILE
  FROM (  SELECT profile, COUNT (1) user_count
            FROM dba_users
        GROUP BY profile
        ORDER BY user_count DESC)
 WHERE ROWNUM < 2;
