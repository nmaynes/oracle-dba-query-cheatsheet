/*
    Query the database to find the number of concurrent sessions currently allowed.
*/

SELECT name, value
  FROM v$parameter
WHERE name = 'sessions';
 
 /*
     View database tables owned by a user.
 */
 
SELECT owner, table_name, tablespace_name, status, num_rows, avg_row_len
  FROM all_tables 
WHERE upper(owner) = upper('owner_name');

/*
    View active sessions. This is helpful if attempting to located a session that is causing problems. 
    The ALTER SYSTEM KILL SESSION syntax can then be used to terminate problematic sessions.
*/

SELECT s.sid, s.serial#, s.schemaname, s.osuser, s.process, s.module
  FROM v$session s;
  
ALTER SYSTEM KILL SESSION 'sid,serial#';
