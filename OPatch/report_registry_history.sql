set linesize 150
set numwidth 10
COLUMN action_time format A30
COLUMN action format A15
COLUMN namespace format A12
COLUMN version format A15
COLUMN comments format A35
COLUMN bundle_series format A12
select * from sys.registry$history order by action_time;
SELECT comp_id, version, status, modified FROM dba_registry;
