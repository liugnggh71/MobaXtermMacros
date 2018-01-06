cd /u01/app/oracle/admin
find . -type f -name \*.html -mtime +30 | xargs ls
