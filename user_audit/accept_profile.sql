SELECT b.profile, a.USER_COUNT
    FROM (  SELECT profile, COUNT (1) user_count
              FROM dba_users
          GROUP BY profile) a,
         (  SELECT DISTINCT profile
              FROM dba_profiles
          ORDER BY profile) b
   WHERE a.profile(+) = b.PROFILE
  ORDER BY a.USER_COUNT desc, profile;

UNDEFINE profile
accept profile char prompt 'Enter PROFILE: '
