--VER LOS TABLESPACES DELA BASE
select tablespace_name from dba_tablespaces;

--VER EN QUE MODO ENTRASTE A LA BASE
select sid, username, status, server, osuser, process from v$session where username='SYS';

--VER DATAFILE
select * from v$datafile;

--VER CONTROLFILES DE LA BASE
select name from v$controlfile;

--VER GRUPO DE REDO LOGS
select group#, type, status, member from v$logfile;

--VER QUE GRUPO DE REDO LOGS SE STA USANDO
select group#,sequence#, bytes/(1024*1024) size_mb, blocksize, members, status from v$log;

--VER MODOD ARCHIVELOG
select name, log_mode from v$database;

--VER LOS ARCHIVEDLOGS
select name, sequence#, dest_id from v$archived_log;

--VER BACKUPS
select session_key, bs_key, set_count, handle, tag from v$backup_piece_details;

--VER USO DEL AREA DE REOVERY
select * from v$recovery_area_usage;

--VER DATOS DEL SEGMENTO 
select owner, segment_name, segment_type, tablespace_name, bytes/(1024*1024) MB
from dba_segments where owner in ('ADMIN_CIUDADANOS','ADMIN_TRAMITES') order by bytes desc;

--VER DATOS DE LOS BACKUPS
select session_key, bs_key, status,
  to_char(start_time, 'dd/mm/yyyy hh24:mi:ss') start_time, 
  to_char(completion_time, 'dd/mm/yyyy hh24:mi:ss') completion_time, 
  cast(elapsed_seconds as decimal (10,3)) elapsed_seconds,
  deleted, size_bytes_display
from v$backup_piece_details;
