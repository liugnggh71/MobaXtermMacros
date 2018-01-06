clear screen

alter user &username. password expire;

SELECT u.USERNAME,
       u.ACCOUNT_STATUS,
       u.EXPIRY_DATE
  FROM dba_users u
 WHERE username = upper('&username');

DEFINE username
