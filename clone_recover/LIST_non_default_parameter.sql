COLUMN NAME FORMAT A25
COLUMN VALUE FORMAT A60
SET LINESIZE 132
select name, value from v$parameter where ISDEFAULT='FALSE' ORDER BY NAME;