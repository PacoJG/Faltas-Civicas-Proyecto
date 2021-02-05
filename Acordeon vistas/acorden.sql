--VER LOS TABLESPACES DELA BASE
select tablespace_name from dba_tablespace;

--VER EN QUE MODO ENTRASTE A LA BASE
select sid, username, status, server, osuser, process from v$session where username='SYS';