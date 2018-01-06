clear screen

alter user &username. account lock;

SELECT u.USERNAME, u.ACCOUNT_STATUS, u.LOCK_DATE
  FROM dba_users u
 WHERE username = upper('&username');

DEFINE username
