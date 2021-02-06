--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion:  Activar modo archivelog

connect sys/systemproy as sysdba

create pfile from spfile;

alter system set log_archive_max_processes=5 scope=spfile;

alter system set log_archive_dest_1='LOCATION=/disk_2/app/oracle/oradata/jamoproy/archivelogs/disk_a MANDATORY' scope=spfile;

alter system set log_archive_dest_2='LOCATION=/u01/app/oracle/oradata/jamoproy/respaldo_fra/archivelog/disk_b' scope=spfile;

alter system set log_archive_format='arch_jamoproy_%t_%s_%r.arc' scope=spfile;

alter system set log_archive_min_succeed_dest=1;

shutdown;

startup mount;

alter database archivelog;

alter database open;

create pfile from spfile;
