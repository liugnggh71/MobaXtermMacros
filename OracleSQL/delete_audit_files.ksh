cd /u01/app/oracle/admin
find . -type f -name \*.aud -mtime +3 | xargs rm
