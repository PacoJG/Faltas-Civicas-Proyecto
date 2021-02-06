--VER LOS TABLESPACES DELA BASE
select tablespace_name from dba_tablespace;

--VER EN QUE MODO ENTRASTE A LA BASE
select sid, username, status, server, osuser, process from v$session where username='SYS';

--VER CONTROLFILES DE LA BASE
select name from v$controlfile;

--VER GRUPO DE REDO LOGS
select group#, type, member from v$logfile;

--VER QUE GRUPO DE REDO LOGS SE STA USANDO
select group#,sequence#, bytes/(1024*1024) size_mb, blocksize, members, status from v$log;

--VER MODOD ARCHIVELOG
select name, log_mode from v$database;

