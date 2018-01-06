select username from v$session;

select username, count(1) session_count from v$session where username is not null group by username;
